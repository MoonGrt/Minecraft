# =====================================================
# User configurable parameters
# =====================================================
VERSION     := 2
TOP         := reciprocal$(VERSION)

# Source directories
VSRCS 		:= $(shell find $(abspath ./vsrc) -name "*.v")
CSRCS 		:= $(abspath ./csrc/sim_main$(VERSION).cpp) $(SRC_AUTO_BIND)
PY_LUT_GEN  := recip_lut_gen$(VERSION).py

# LUT parameters
ADDR_BITS   := 8
X_FRAC      := 13
Y_FRAC      := 16
WIDTH       := 16
LUT_NAME    := recip_lut

# Build directories
BUILD_DIR   := build
OBJ_DIR     := $(BUILD_DIR)/obj_dir
LUT_FILE    := $(BUILD_DIR)/$(LUT_NAME).mem
EXE         := $(BUILD_DIR)/$(TOP)
WAVE_FILE   := $(BUILD_DIR)/wave.vcd

PYTHON      := python3
CXX         := g++
CXXFLAGS    := -O2 -Wall
GTKWAVE     := gtkwave
VERILATOR   := verilator
VERILATOR_CFLAGS := -MMD --build -cc -O3 --x-assign fast --x-initial fast --noassert --trace
# VERILATOR_CFLAGS += -Wno-WIDTH -Wno-UNOPTFLAT -Wno-UNUSED

# =====================================================
# Default target
# =====================================================

all: run

# =====================================================
# Ensure build directory exists
# =====================================================

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# =====================================================
# Step 1: generate LUT (.mem)
# =====================================================

$(LUT_FILE): $(PY_LUT_GEN) | $(BUILD_DIR)
	@echo "==> Generating reciprocal LUT (.mem)"
	$(PYTHON) $(PY_LUT_GEN)

# =====================================================
# Step 2: build Verilator model
# =====================================================

$(EXE): $(VSRCS) $(CSRCS) $(LUT_FILE)
	@echo "==> Building Verilator model"
	$(VERILATOR) $(VERILATOR_CFLAGS) $(VSRCS) $(CSRCS) \
		--top-module $(TOP) \
		--Mdir $(OBJ_DIR) --exe -o $(abspath $(EXE))

# =====================================================
# Step 3: run simulation
# =====================================================

run: $(EXE)
	@echo "==> Running simulation"
	@$^

# =====================================================
# Optional: waveform build
# =====================================================

wave: run
	$(GTKWAVE) $(WAVE_FILE)

# =====================================================
# Clean
# =====================================================

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all run clean wave
