<div id="top"></div>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]


<!-- PROJECT LOGO -->
<br />
<div align="center">
	<a href="https://github.com/MoonGrt/FPGA-Minecraft">
	<img src="images/logo.png" alt="Logo" width="80" height="80">
	</a>
<h3 align="center">FPGA-Minecraft</h3>
	<p align="center">
	This FPGA project involves the development of a Minecraft game entirely in hardware. The game enables players to place and break blocks, move, and fly. It utilizes a rendering pipeline to calculate the color of each pixel, ultimately displaying the generated frames on an HDMI screen. This hardware-based approach ensures efficient real-time rendering and interaction within the game environment.
	<br />
	<a href="https://github.com/MoonGrt/FPGA-Minecraft"><strong>Explore the docs »</strong></a>
	<br />
	<br />
	<a href="https://github.com/MoonGrt/FPGA-Minecraft">View Demo</a>
	·
	<a href="https://github.com/MoonGrt/FPGA-Minecraft/issues">Report Bug</a>
	·
	<a href="https://github.com/MoonGrt/FPGA-Minecraft/issues">Request Feature</a>
	</p>
</div>


<!-- CONTENTS -->
<details open>
  <summary>Contents</summary>
  <ol>
    <li><a href="#file-tree">File Tree</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>


<!-- FILE TREE -->
## File Tree

```
└─ Project
  ├─ LICENSE
  ├─ README.md
  ├─ /images/
  ├─ /Matlab/
  ├─ /minecraft/
  │ └─ /src/
  │   ├─ align.v
  │   ├─ align_ctrl.v
  │   ├─ FIFO.v
  │   ├─ map.v
  │   ├─ sort.v
  │   ├─ testpattern.v
  │   ├─ top.v
  │   ├─ vga_timing.v
  │   ├─ /gowin_lib/
  │   │ ├─ modelsim.ini
  │   │ ├─ /gowin_lib/
  │   │ │ ├─ _info
  │   │ │ ├─ _lib.qdb
  │   │ │ ├─ _lib1_0.qdb
  │   │ │ ├─ _lib1_0.qpg
  │   │ │ ├─ _lib1_0.qtl
  │   │ │ └─ _vmake
  │   │ ├─ /gowin_work/
  │   │ │ └─ _info
  │   │ ├─ /gw1n/
  │   │ │ ├─ prim_sim.v
  │   │ │ ├─ prim_sim.vhd
  │   │ │ ├─ prim_syn.vhd
  │   │ │ └─ prim_tsim.v
  │   │ ├─ /gw2a/
  │   │ │ ├─ prim_sim.v
  │   │ │ ├─ prim_sim.vhd
  │   │ │ ├─ prim_syn.vhd
  │   │ │ └─ prim_tsim.v
  │   │ └─ /gw5a/
  │   │   ├─ prim_sim.v
  │   │   ├─ prim_sim.vhd
  │   │   └─ prim_syn.vhd
  │   ├─ /gowin_workfile/
  │   │ ├─ minecraft.cr.mti
  │   │ ├─ minecraft.mpf
  │   │ ├─ tb_top.v
  │   │ ├─ top.v
  │   │ ├─ vsim.dbg
  │   │ ├─ vsim.wlf
  │   │ └─ /gowin_work/
  │   │   ├─ _temp
  │   │   ├─ _tempmsg
  │   │   ├─ _info
  │   │   ├─ _lib.qdb
  │   │   ├─ _lib1_59.qdb
  │   │   ├─ _lib1_59.qpg
  │   │   ├─ _lib1_59.qtl
  │   │   ├─ _vmake
  │   │   ├─ /@_opt/
  │   │   │ ├─ _lib.qdb
  │   │   │ ├─ _lib1_0.qdb
  │   │   │ ├─ _lib1_0.qpg
  │   │   │ ├─ _lib1_0.qtl
  │   │   │ ├─ _lib2_0.qdb
  │   │   │ ├─ _lib2_0.qpg
  │   │   │ ├─ _lib2_0.qtl
  │   │   │ ├─ _lib3_0.qdb
  │   │   │ ├─ _lib3_0.qpg
  │   │   │ ├─ _lib3_0.qtl
  │   │   │ ├─ _lib4_0.qdb
  │   │   │ ├─ _lib4_0.qpg
  │   │   │ └─ _lib4_0.qtl
  │   │   ├─ /@_opt1/
  │   │   │ ├─ _lib.qdb
  │   │   │ ├─ _lib1_0.qdb
  │   │   │ ├─ _lib1_0.qpg
  │   │   │ ├─ _lib1_0.qtl
  │   │   │ ├─ _lib2_0.qdb
  │   │   │ ├─ _lib2_0.qpg
  │   │   │ ├─ _lib2_0.qtl
  │   │   │ ├─ _lib3_0.qdb
  │   │   │ ├─ _lib3_0.qpg
  │   │   │ ├─ _lib3_0.qtl
  │   │   │ ├─ _lib4_0.qdb
  │   │   │ ├─ _lib4_0.qpg
  │   │   │ ├─ _lib4_0.qtl
  │   │   │ ├─ _lib5_0.qdb
  │   │   │ ├─ _lib5_0.qpg
  │   │   │ ├─ _lib5_0.qtl
  │   │   │ ├─ _lib6_0.qdb
  │   │   │ ├─ _lib6_0.qpg
  │   │   │ ├─ _lib6_0.qtl
  │   │   │ ├─ _lib7_0.qdb
  │   │   │ ├─ _lib7_0.qpg
  │   │   │ └─ _lib7_0.qtl
  │   │   ├─ /@_opt2/
  │   │   │ ├─ _lib.qdb
  │   │   │ ├─ _lib1_0.qdb
  │   │   │ ├─ _lib1_0.qpg
  │   │   │ ├─ _lib1_0.qtl
  │   │   │ ├─ _lib2_0.qdb
  │   │   │ ├─ _lib2_0.qpg
  │   │   │ ├─ _lib2_0.qtl
  │   │   │ ├─ _lib3_0.qdb
  │   │   │ ├─ _lib3_0.qpg
  │   │   │ ├─ _lib3_0.qtl
  │   │   │ ├─ _lib4_0.qdb
  │   │   │ ├─ _lib4_0.qpg
  │   │   │ └─ _lib4_0.qtl
  │   │   └─ /_dbcontainer/
  │   │     └─ /#64_opt/
  │   │       ├─ gowin_work_angle_relative_fast_0.dbg
  │   │       ├─ gowin_work_angle_to_coord_fast_0.dbg
  │   │       ├─ gowin_work_ctrl_fast_0.dbg
  │   │       ├─ gowin_work_DFFE_fast_0.dbg
  │   │       ├─ gowin_work_GSR_fast_0.dbg
  │   │       ├─ gowin_work_LUT3_fast_0.dbg
  │   │       ├─ gowin_work_LUT3_fast__1_0.dbg
  │   │       ├─ gowin_work_LUT3_fast__2_0.dbg
  │   │       ├─ gowin_work_LUT3_fast__3_0.dbg
  │   │       ├─ gowin_work_map_fast_0.dbg
  │   │       ├─ gowin_work_map_ram_fast_0.dbg
  │   │       ├─ gowin_work_MUX2_fast_0.dbg
  │   │       ├─ gowin_work_MUX4_fast_0.dbg
  │   │       ├─ gowin_work_MUX8_fast_0.dbg
  │   │       ├─ gowin_work_ppl_entry_fast_0.dbg
  │   │       ├─ gowin_work_ppl_fast_0.dbg
  │   │       ├─ gowin_work_ppl_proc_fast_0.dbg
  │   │       ├─ gowin_work_projection_fast_0.dbg
  │   │       ├─ gowin_work_pROMX9_fast_0.dbg
  │   │       ├─ gowin_work_pROMX9_fast__1_0.dbg
  │   │       ├─ gowin_work_pROMX9_fast__2_0.dbg
  │   │       ├─ gowin_work_pROMX9_fast__3_0.dbg
  │   │       ├─ gowin_work_pROMX9_fast__4_0.dbg
  │   │       ├─ gowin_work_pROMX9_fast__5_0.dbg
  │   │       ├─ gowin_work_pROMX9_fast__6_0.dbg
  │   │       ├─ gowin_work_pROMX9_fast__7_0.dbg
  │   │       ├─ gowin_work_pROM_fast_0.dbg
  │   │       ├─ gowin_work_pROM_fast__1_0.dbg
  │   │       ├─ gowin_work_pROM_fast__2_0.dbg
  │   │       ├─ gowin_work_pROM_fast__3_0.dbg
  │   │       ├─ gowin_work_pROM_fast__4_0.dbg
  │   │       ├─ gowin_work_pROM_fast__5_0.dbg
  │   │       ├─ gowin_work_pROM_fast__6_0.dbg
  │   │       ├─ gowin_work_SDPB_fast_0.dbg
  │   │       ├─ gowin_work_SDPB_fast__1_0.dbg
  │   │       ├─ gowin_work_SDPB_fast__2_0.dbg
  │   │       ├─ gowin_work_SDPB_fast__3_0.dbg
  │   │       ├─ gowin_work_SDPB_fast__4_0.dbg
  │   │       ├─ gowin_work_SDPB_fast__5_0.dbg
  │   │       ├─ gowin_work_SDPB_fast__6_0.dbg
  │   │       ├─ gowin_work_SDPB_fast__7_0.dbg
  │   │       ├─ gowin_work_SDPB_fast__8_0.dbg
  │   │       ├─ gowin_work_SDPB_fast__9_0.dbg
  │   │       ├─ gowin_work_sort_fast_0.dbg
  │   │       ├─ gowin_work_tb_top_fast_0.dbg
  │   │       ├─ gowin_work_texture_rom_fast_0.dbg
  │   │       ├─ gowin_work_top_fast_0.dbg
  │   │       ├─ gowin_work_viewport_params_fast_0.dbg
  │   │       ├─ gowin_work_viewport_scanner_fast_0.dbg
  │   │       └─ __mti.dbg
  │   └─ /pipeline/
  │     ├─ angle_relative.v
  │     ├─ angle_to_coord.v
  │     ├─ ppl.v
  │     ├─ ppl_ctrl.v
  │     ├─ ppl_entry.v
  │     ├─ ppl_proc.v
  │     ├─ projection.v
  │     ├─ viewport_params.v
  │     └─ viewport_scanner.v
  ├─ /minecraft_moon/
  ├─ /Show-image/
  └─ /Tool/

```


<!-- CONTRIBUTING -->
## Contributing
Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.
If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!
1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request
<p align="right">(<a href="#top">top</a>)</p>


<!-- LICENSE -->
## License
Distributed under the MIT License. See `LICENSE` for more information.
<p align="right">(<a href="#top">top</a>)</p>


<!-- CONTACT -->
## Contact
MoonGrt - 1561145394@qq.com
Project Link: [MoonGrt/](https://github.com/MoonGrt/)
<p align="right">(<a href="#top">top</a>)</p>


<!-- ACKNOWLEDGMENTS -->
## Acknowledgments
* [Choose an Open Source License](https://choosealicense.com)
* [GitHub Emoji Cheat Sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet)
* [Malven's Flexbox Cheatsheet](https://flexbox.malven.co/)
* [Malven's Grid Cheatsheet](https://grid.malven.co/)
* [Img Shields](https://shields.io)
* [GitHub Pages](https://pages.github.com)
* [Font Awesome](https://fontawesome.com)
* [React Icons](https://react-icons.github.io/react-icons/search)   
<p align="right">(<a href="#top">top</a>)</p>


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/MoonGrt/FPGA-Minecraft.svg?style=for-the-badge
[contributors-url]: https://github.com/MoonGrt/FPGA-Minecraft/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/MoonGrt/FPGA-Minecraft.svg?style=for-the-badge
[forks-url]: https://github.com/MoonGrt/FPGA-Minecraft/network/members
[stars-shield]: https://img.shields.io/github/stars/MoonGrt/FPGA-Minecraft.svg?style=for-the-badge
[stars-url]: https://github.com/MoonGrt/FPGA-Minecraft/stargazers
[issues-shield]: https://img.shields.io/github/issues/MoonGrt/FPGA-Minecraft.svg?style=for-the-badge
[issues-url]: https://github.com/MoonGrt/FPGA-Minecraft/issues
[license-shield]: https://img.shields.io/github/license/MoonGrt/FPGA-Minecraft.svg?style=for-the-badge
[license-url]: https://github.com/MoonGrt/FPGA-Minecraft/blob/master/LICENSE

