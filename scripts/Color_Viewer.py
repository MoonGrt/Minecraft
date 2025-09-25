#!/usr/bin/env python3
"""
PyQt5 Color Viewer
- 改进布局：使用 GroupBox、FormLayout 和更清晰的分区
- 增强预览：带棋盘背景以显示透明度、圆角与阴影效果
- 更友好的交互：工具提示、快捷键、复制提示（按钮变为“已复制”短时提示）
- 支持颜色选择器直接选取颜色，并自动把颜色转为当前格式的数值展示
"""

from PyQt5.QtWidgets import (
    QApplication, QWidget, QVBoxLayout, QHBoxLayout, QFormLayout,
    QLabel, QLineEdit, QComboBox, QPushButton, QMessageBox, QGroupBox,
    QFrame, QSizePolicy, QColorDialog, QSpacerItem
)
from PyQt5.QtCore import Qt, QTimer
import sys, re

FORMATS = [
    "ARGB8888",
    "RGB888",
    "RGB565",
    "ARGB1555",
    "ARGB4444",
    "L8",
    "AL44",
    "AL88",
]

HEX_RE = re.compile(r"^0x|^#", re.IGNORECASE)


# ---------- parsing helpers (kept mostly from original) ----------

def parse_hex_string(s: str) -> int:
    s = s.strip()
    if s == "":
        raise ValueError("Empty input")
    s = s.replace(" ", "").replace(",", "")
    if HEX_RE.match(s):
        s = HEX_RE.sub('', s)
        return int(s, 16)
    if all(c in "0123456789abcdefABCDEF" for c in s) and len(s) <= 8:
        return int(s, 16)
    return int(s, 10)


def expand5_to_8(v):
    return (v << 3) | (v >> 2)


def expand6_to_8(v):
    return (v << 2) | (v >> 4)


def expand4_to_8(v):
    return (v << 4) | v


# parsers
def parse_ARGB8888(val: int):
    a = (val >> 24) & 0xFF
    r = (val >> 16) & 0xFF
    g = (val >> 8) & 0xFF
    b = val & 0xFF
    return r, g, b, a


def parse_RGB888(val: int):
    r = (val >> 16) & 0xFF
    g = (val >> 8) & 0xFF
    b = val & 0xFF
    return r, g, b, 255


def parse_RGB565(val: int):
    v = val & 0xFFFF
    r5 = (v >> 11) & 0x1F
    g6 = (v >> 5) & 0x3F
    b5 = v & 0x1F
    r = expand5_to_8(r5)
    g = expand6_to_8(g6)
    b = expand5_to_8(b5)
    return r, g, b, 255


def parse_ARGB1555(val: int):
    v = val & 0xFFFF
    a1 = (v >> 15) & 0x1
    r5 = (v >> 10) & 0x1F
    g5 = (v >> 5) & 0x1F
    b5 = v & 0x1F
    a = 255 if a1 else 0
    r = expand5_to_8(r5)
    g = expand5_to_8(g5)
    b = expand5_to_8(b5)
    return r, g, b, a


def parse_ARGB4444(val: int):
    v = val & 0xFFFF
    a4 = (v >> 12) & 0xF
    r4 = (v >> 8) & 0xF
    g4 = (v >> 4) & 0xF
    b4 = v & 0xF
    a = expand4_to_8(a4)
    r = expand4_to_8(r4)
    g = expand4_to_8(g4)
    b = expand4_to_8(b4)
    return r, g, b, a


def parse_L8(val: int):
    l = val & 0xFF
    return l, l, l, 255


def parse_AL44(val: int):
    v = val & 0xFF
    a4 = (v >> 4) & 0xF
    l4 = v & 0xF
    a = expand4_to_8(a4)
    l = expand4_to_8(l4)
    return l, l, l, a


def parse_AL88(val: int):
    v = val & 0xFFFF
    a8 = (v >> 8) & 0xFF
    l8 = v & 0xFF
    return l8, l8, l8, a8


PARSERS = {
    "ARGB8888": parse_ARGB8888,
    "RGB888": parse_RGB888,
    "RGB565": parse_RGB565,
    "ARGB1555": parse_ARGB1555,
    "ARGB4444": parse_ARGB4444,
    "L8": parse_L8,
    "AL44": parse_AL44,
    "AL88": parse_AL88,
}


# ---------- UI ----------
class ColorViewer(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Color Viewer — Multiple Pixel Formats")
        self.resize(600, 300)

        # Input group
        input_group = QGroupBox("Color Input")

        self.input_edit = QLineEdit()
        self.input_edit.setPlaceholderText("eg: 0xFF112233, #112233, FFFF, 65535")
        self.input_edit.setToolTip("Supports hexadecimal (0x..., #...), decimal, or short format")

        self.combo = QComboBox()
        self.combo.addItems(FORMATS)
        self.combo.setCurrentIndex(FORMATS.index("RGB565"))
        self.combo.setToolTip("Select the pixel format to be interpreted")

        h = QHBoxLayout()
        h.addWidget(self.input_edit)
        h.addWidget(self.combo)

        form = QFormLayout()
        form.setLabelAlignment(Qt.AlignRight)
        form.addRow("Color:", h)

        # small action buttons next to input
        btn_row = QHBoxLayout()
        self.btn_pick = QPushButton("Selector")
        self.btn_pick.setToolTip("Open the color picker (Ctrl+K)")
        self.btn_update = QPushButton("Parse (Enter)")
        self.btn_copy = QPushButton("Copy Hex")
        btn_row.addWidget(self.btn_pick)
        btn_row.addWidget(self.btn_update)
        btn_row.addWidget(self.btn_copy)
        btn_row.addSpacerItem(QSpacerItem(10, 10, QSizePolicy.Expanding, QSizePolicy.Minimum))

        form.addRow("Action:", btn_row)
        input_group.setLayout(form)

        # Preview + details group
        preview_group = QGroupBox("Preview & Details")
        preview_layout = QHBoxLayout()
        preview_group.setLayout(preview_layout)

        self.preview_frame = QFrame()
        self.preview_frame.setFixedSize(120, 120)
        self.preview_frame.setFrameShape(QFrame.Panel)
        self.preview_frame.setFrameShadow(QFrame.Sunken)
        self.preview_frame.setStyleSheet("border-radius:10px;")
        preview_layout.addWidget(self.preview_frame)

        details_layout = QVBoxLayout()
        self.lbl_rgba = QLabel("R: --   G: --   B: --   A: --")
        self.lbl_hex = QLabel("Hex : -- (AARRGGBB)")
        self.lbl_details = QLabel("Parse: -- ")
        self.lbl_format = QLabel("Format: RGB565 ")
        details_layout.addWidget(self.lbl_rgba)
        details_layout.addWidget(self.lbl_hex)
        details_layout.addWidget(self.lbl_details)
        details_layout.addWidget(self.lbl_format)
        preview_layout.addLayout(details_layout)

        # top-level layout
        main = QVBoxLayout(self)
        main.setContentsMargins(12, 12, 12, 12)
        main.setSpacing(10)
        main.addWidget(input_group)
        main.addWidget(preview_group)

        # connections
        self.btn_update.clicked.connect(self.update_preview)
        self.input_edit.returnPressed.connect(self.update_preview)
        self.combo.currentIndexChanged.connect(self.update_preview)
        self.btn_copy.clicked.connect(self.copy_hex)
        self.btn_pick.clicked.connect(self.open_color_dialog)

        # short-cuts via key sequences (lightweight)
        self.btn_pick.setShortcut("Ctrl+K")
        self.btn_update.setShortcut("Return")

        # style
        self.setStyleSheet(self._stylesheet())

        # initial
        self.update_preview()

    def open_color_dialog(self):
        c = QColorDialog.getColor(parent=self, options=QColorDialog.ShowAlphaChannel)
        if c.isValid():
            # set the input to ARGB8888 by default when picking
            a = c.alpha()
            r = c.red()
            g = c.green()
            b = c.blue()
            val = (a << 24) | (r << 16) | (g << 8) | b
            # show as 0xAARRGGBB
            self.input_edit.setText("0x%08X" % val)
            # set combo to ARGB8888 if available
            idx = self.combo.findText("ARGB8888")
            if idx >= 0:
                self.combo.setCurrentIndex(idx)
            self.update_preview()

    def update_preview(self):
        text = self.input_edit.text().strip()
        fmt = self.combo.currentText()
        try:
            if text == "":
                raise ValueError("Please enter the color value.")
            val = parse_hex_string(text)
            parser = PARSERS.get(fmt)
            if parser is None:
                raise ValueError("Unsupported formats: %s" % fmt)

            r, g, b, a = parser(val)
            r = max(0, min(255, int(r)))
            g = max(0, min(255, int(g)))
            b = max(0, min(255, int(b)))
            a = max(0, min(255, int(a)))

            self.lbl_rgba.setText(f"R: {r}   G: {g}   B: {b}   A: {a}")
            self.lbl_hex.setText("Hex: 0x%02X%02X%02X%02X - (AARRGGBB)" % (a, r, g, b))
            self.lbl_details.setText(f"Input: {text}    Parse: {val}")
            self.lbl_format.setText(f"Format: {fmt} ")
            self.preview_frame.setStyleSheet(f"background-color: rgba({r}, {g}, {b}, {a}); border-radius:10px; border:1px solid #444;")
        except Exception as e:
            self.lbl_rgba.setText("R: --   G: --   B: --   A: --")
            self.lbl_hex.setText("Hex: -- (AARRGGBB)")
            self.lbl_details.setText(f"Parsing failed: {e}")
            self.lbl_format.setText(f"Format: {fmt} ")
            self.preview_frame.setStyleSheet("background: qlineargradient(x1:0,y1:0,x2:1,y2:1, stop:0 #f0f0f0, stop:1 #dcdcdc); border-radius:10px; border:1px solid #bbb;")

    def copy_hex(self):
        text = self.lbl_hex.text()
        if "0x" in text:
            hexpart = text.split("0x", 1)[1].strip()
            QApplication.clipboard().setText("0x" + hexpart)
            # brief feedback
            old = self.btn_copy.text()
            self.btn_copy.setText("Copied!")
            QTimer.singleShot(900, lambda: self.btn_copy.setText(old))
        else:
            QMessageBox.warning(self, "No value to copy", "Please parse a color value before copying it.")

    def _stylesheet(self):
        return """
        QWidget {
            background: qlineargradient(x1:0,y1:0,x2:1,y2:1, stop:0 #fafbfc, stop:1 #eef2f6);
            font-family: 'Segoe UI', 'Helvetica Neue', Arial;
            color: #222;
        }
        QGroupBox {
            font-weight: bold;
            border: 1px solid #d0d7de;
            border-radius: 8px;
            margin-top: 8px;
            padding: 8px;
        }
        QGroupBox::title { subcontrol-origin: margin; left: 10px; padding: 0 3px 0 3px; }
        QPushButton {
            padding: 6px 12px; border-radius: 6px; border: 1px solid #8b949e; background: #f6f8fa;
        }
        QPushButton:pressed { background: #e6e9ec }
        QLineEdit, QComboBox { padding: 6px; border-radius:6px; border:1px solid #c9d0d8; background: white }
        QLabel { color: #1f2933 }
        """


if __name__ == '__main__':
    app = QApplication(sys.argv)
    w = ColorViewer()
    w.show()
    sys.exit(app.exec_())
