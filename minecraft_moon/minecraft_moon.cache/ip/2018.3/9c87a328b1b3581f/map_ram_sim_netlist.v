// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Sat Aug 17 12:08:13 2024
// Host        : DESKTOP-0TSH46O running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ map_ram_sim_netlist.v
// Design      : map_ram
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010iclg225-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "map_ram,blk_mem_gen_v8_4_2,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    ena,
    wea,
    addra,
    dina,
    clkb,
    enb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [16:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [4:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [16:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [4:0]doutb;

  wire [16:0]addra;
  wire [16:0]addrb;
  wire clka;
  wire clkb;
  wire [4:0]dina;
  wire [4:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [4:0]NLW_U0_douta_UNCONNECTED;
  wire [16:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [16:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [4:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "17" *) 
  (* C_ADDRB_WIDTH = "17" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "20" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     21.236774 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "map_ram.mem" *) 
  (* C_INIT_FILE_NAME = "map_ram.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "131072" *) 
  (* C_READ_DEPTH_B = "131072" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "5" *) 
  (* C_READ_WIDTH_B = "5" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "131072" *) 
  (* C_WRITE_DEPTH_B = "131072" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "5" *) 
  (* C_WRITE_WIDTH_B = "5" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_2 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[4:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[16:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[16:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[4:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_generic_cstr
   (doutb,
    clka,
    clkb,
    enb,
    addra,
    addrb,
    dina,
    wea,
    ena);
  output [4:0]doutb;
  input clka;
  input clkb;
  input enb;
  input [16:0]addra;
  input [16:0]addrb;
  input [4:0]dina;
  input [0:0]wea;
  input ena;

  wire [16:0]addra;
  wire [16:0]addrb;
  wire clka;
  wire clkb;
  wire [4:0]dina;
  wire [4:0]doutb;
  wire ena;
  wire enb;
  wire ram_doutb;
  wire ram_ena__0;
  wire ram_ena_n_0;
  wire ram_enb__0;
  wire ram_enb_n_0;
  wire \ramloop[1].ram.r_n_0 ;
  wire \ramloop[2].ram.r_n_0 ;
  wire \ramloop[3].ram.r_n_0 ;
  wire \ramloop[4].ram.r_n_0 ;
  wire \ramloop[5].ram.r_n_0 ;
  wire \ramloop[6].ram.r_n_0 ;
  wire \ramloop[7].ram.r_n_0 ;
  wire \ramloop[8].ram.r_n_0 ;
  wire \ramloop[9].ram.r_n_0 ;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_mux__parameterized0 \has_mux_b.B 
       (.DOUTB(\ramloop[1].ram.r_n_0 ),
        .addrb(addrb[16]),
        .clkb(clkb),
        .doutb(doutb),
        .\doutb[0] (ram_doutb),
        .\doutb[1] (\ramloop[3].ram.r_n_0 ),
        .\doutb[1]_0 (\ramloop[2].ram.r_n_0 ),
        .\doutb[2] (\ramloop[5].ram.r_n_0 ),
        .\doutb[2]_0 (\ramloop[4].ram.r_n_0 ),
        .\doutb[3] (\ramloop[7].ram.r_n_0 ),
        .\doutb[3]_0 (\ramloop[6].ram.r_n_0 ),
        .\doutb[4] (\ramloop[9].ram.r_n_0 ),
        .\doutb[4]_0 (\ramloop[8].ram.r_n_0 ),
        .enb(enb));
  LUT2 #(
    .INIT(4'h4)) 
    ram_ena
       (.I0(addra[16]),
        .I1(ena),
        .O(ram_ena_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    \ram_ena_inferred__0/i_ 
       (.I0(addra[16]),
        .I1(ena),
        .O(ram_ena__0));
  LUT2 #(
    .INIT(4'h4)) 
    ram_enb
       (.I0(addrb[16]),
        .I1(enb),
        .O(ram_enb_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    \ram_enb_inferred__0/i_ 
       (.I0(addrb[16]),
        .I1(enb),
        .O(ram_enb__0));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.DOUTB(ram_doutb),
        .ENA(ram_ena_n_0),
        .ENB(ram_enb_n_0),
        .addra(addra[15:0]),
        .addrb(addrb[15:0]),
        .clka(clka),
        .clkb(clkb),
        .dina(dina[0]),
        .enb(enb),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized0 \ramloop[1].ram.r 
       (.DOUTB(\ramloop[1].ram.r_n_0 ),
        .ENA(ram_ena__0),
        .ENB(ram_enb__0),
        .addra(addra[15:0]),
        .addrb(addrb[15:0]),
        .clka(clka),
        .clkb(clkb),
        .dina(dina[0]),
        .enb(enb),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized1 \ramloop[2].ram.r 
       (.DOUTB(\ramloop[2].ram.r_n_0 ),
        .ENA(ram_ena_n_0),
        .ENB(ram_enb_n_0),
        .addra(addra[15:0]),
        .addrb(addrb[15:0]),
        .clka(clka),
        .clkb(clkb),
        .dina(dina[1]),
        .enb(enb),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized2 \ramloop[3].ram.r 
       (.DOUTB(\ramloop[3].ram.r_n_0 ),
        .ENA(ram_ena__0),
        .ENB(ram_enb__0),
        .addra(addra[15:0]),
        .addrb(addrb[15:0]),
        .clka(clka),
        .clkb(clkb),
        .dina(dina[1]),
        .enb(enb),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized3 \ramloop[4].ram.r 
       (.DOUTB(\ramloop[4].ram.r_n_0 ),
        .ENA(ram_ena_n_0),
        .ENB(ram_enb_n_0),
        .addra(addra[15:0]),
        .addrb(addrb[15:0]),
        .clka(clka),
        .clkb(clkb),
        .dina(dina[2]),
        .enb(enb),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized4 \ramloop[5].ram.r 
       (.DOUTB(\ramloop[5].ram.r_n_0 ),
        .ENA(ram_ena__0),
        .ENB(ram_enb__0),
        .addra(addra[15:0]),
        .addrb(addrb[15:0]),
        .clka(clka),
        .clkb(clkb),
        .dina(dina[2]),
        .enb(enb),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized5 \ramloop[6].ram.r 
       (.DOUTB(\ramloop[6].ram.r_n_0 ),
        .ENA(ram_ena_n_0),
        .ENB(ram_enb_n_0),
        .addra(addra[15:0]),
        .addrb(addrb[15:0]),
        .clka(clka),
        .clkb(clkb),
        .dina(dina[3]),
        .enb(enb),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized6 \ramloop[7].ram.r 
       (.DOUTB(\ramloop[7].ram.r_n_0 ),
        .ENA(ram_ena__0),
        .ENB(ram_enb__0),
        .addra(addra[15:0]),
        .addrb(addrb[15:0]),
        .clka(clka),
        .clkb(clkb),
        .dina(dina[3]),
        .enb(enb),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized7 \ramloop[8].ram.r 
       (.DOUTB(\ramloop[8].ram.r_n_0 ),
        .ENA(ram_ena_n_0),
        .ENB(ram_enb_n_0),
        .addra(addra[15:0]),
        .addrb(addrb[15:0]),
        .clka(clka),
        .clkb(clkb),
        .dina(dina[4]),
        .enb(enb),
        .wea(wea));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized8 \ramloop[9].ram.r 
       (.DOUTB(\ramloop[9].ram.r_n_0 ),
        .ENA(ram_ena__0),
        .ENB(ram_enb__0),
        .addra(addra[15:0]),
        .addrb(addrb[15:0]),
        .clka(clka),
        .clkb(clkb),
        .dina(dina[4]),
        .enb(enb),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_mux" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_mux__parameterized0
   (doutb,
    enb,
    addrb,
    clkb,
    DOUTB,
    \doutb[0] ,
    \doutb[1] ,
    \doutb[1]_0 ,
    \doutb[2] ,
    \doutb[2]_0 ,
    \doutb[3] ,
    \doutb[3]_0 ,
    \doutb[4] ,
    \doutb[4]_0 );
  output [4:0]doutb;
  input enb;
  input [0:0]addrb;
  input clkb;
  input [0:0]DOUTB;
  input [0:0]\doutb[0] ;
  input [0:0]\doutb[1] ;
  input [0:0]\doutb[1]_0 ;
  input [0:0]\doutb[2] ;
  input [0:0]\doutb[2]_0 ;
  input [0:0]\doutb[3] ;
  input [0:0]\doutb[3]_0 ;
  input [0:0]\doutb[4] ;
  input [0:0]\doutb[4]_0 ;

  wire [0:0]DOUTB;
  wire [0:0]addrb;
  wire clkb;
  wire [4:0]doutb;
  wire [0:0]\doutb[0] ;
  wire [0:0]\doutb[1] ;
  wire [0:0]\doutb[1]_0 ;
  wire [0:0]\doutb[2] ;
  wire [0:0]\doutb[2]_0 ;
  wire [0:0]\doutb[3] ;
  wire [0:0]\doutb[3]_0 ;
  wire [0:0]\doutb[4] ;
  wire [0:0]\doutb[4]_0 ;
  wire enb;
  wire [2:2]sel_pipe;
  wire [2:2]sel_pipe_d1;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \doutb[0]_INST_0 
       (.I0(DOUTB),
        .I1(sel_pipe_d1),
        .I2(\doutb[0] ),
        .O(doutb[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \doutb[1]_INST_0 
       (.I0(\doutb[1] ),
        .I1(sel_pipe_d1),
        .I2(\doutb[1]_0 ),
        .O(doutb[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \doutb[2]_INST_0 
       (.I0(\doutb[2] ),
        .I1(sel_pipe_d1),
        .I2(\doutb[2]_0 ),
        .O(doutb[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \doutb[3]_INST_0 
       (.I0(\doutb[3] ),
        .I1(sel_pipe_d1),
        .I2(\doutb[3]_0 ),
        .O(doutb[3]));
  LUT3 #(
    .INIT(8'hB8)) 
    \doutb[4]_INST_0 
       (.I0(\doutb[4] ),
        .I1(sel_pipe_d1),
        .I2(\doutb[4]_0 ),
        .O(doutb[4]));
  FDRE #(
    .INIT(1'b0)) 
    \no_softecc_norm_sel2.has_mem_regs.WITHOUT_ECC_PIPE.ce_pri.sel_pipe_d1_reg[2] 
       (.C(clkb),
        .CE(enb),
        .D(sel_pipe),
        .Q(sel_pipe_d1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[2] 
       (.C(clkb),
        .CE(enb),
        .D(addrb),
        .Q(sel_pipe),
        .R(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width
   (DOUTB,
    clka,
    clkb,
    ENA,
    ENB,
    enb,
    addra,
    addrb,
    dina,
    wea);
  output [0:0]DOUTB;
  input clka;
  input clkb;
  input ENA;
  input ENB;
  input enb;
  input [15:0]addra;
  input [15:0]addrb;
  input [0:0]dina;
  input [0:0]wea;

  wire [0:0]DOUTB;
  wire ENA;
  wire ENB;
  wire [15:0]addra;
  wire [15:0]addrb;
  wire clka;
  wire clkb;
  wire [0:0]dina;
  wire enb;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init \prim_init.ram 
       (.DOUTB(DOUTB),
        .ENA(ENA),
        .ENB(ENB),
        .addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dina(dina),
        .enb(enb),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized0
   (DOUTB,
    clka,
    clkb,
    ENA,
    ENB,
    enb,
    addra,
    addrb,
    dina,
    wea);
  output [0:0]DOUTB;
  input clka;
  input clkb;
  input ENA;
  input ENB;
  input enb;
  input [15:0]addra;
  input [15:0]addrb;
  input [0:0]dina;
  input [0:0]wea;

  wire [0:0]DOUTB;
  wire ENA;
  wire ENB;
  wire [15:0]addra;
  wire [15:0]addrb;
  wire clka;
  wire clkb;
  wire [0:0]dina;
  wire enb;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized0 \prim_init.ram 
       (.DOUTB(DOUTB),
        .ENA(ENA),
        .ENB(ENB),
        .addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dina(dina),
        .enb(enb),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized1
   (DOUTB,
    clka,
    clkb,
    ENA,
    ENB,
    enb,
    addra,
    addrb,
    dina,
    wea);
  output [0:0]DOUTB;
  input clka;
  input clkb;
  input ENA;
  input ENB;
  input enb;
  input [15:0]addra;
  input [15:0]addrb;
  input [0:0]dina;
  input [0:0]wea;

  wire [0:0]DOUTB;
  wire ENA;
  wire ENB;
  wire [15:0]addra;
  wire [15:0]addrb;
  wire clka;
  wire clkb;
  wire [0:0]dina;
  wire enb;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized1 \prim_init.ram 
       (.DOUTB(DOUTB),
        .ENA(ENA),
        .ENB(ENB),
        .addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dina(dina),
        .enb(enb),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized2
   (DOUTB,
    clka,
    clkb,
    ENA,
    ENB,
    enb,
    addra,
    addrb,
    dina,
    wea);
  output [0:0]DOUTB;
  input clka;
  input clkb;
  input ENA;
  input ENB;
  input enb;
  input [15:0]addra;
  input [15:0]addrb;
  input [0:0]dina;
  input [0:0]wea;

  wire [0:0]DOUTB;
  wire ENA;
  wire ENB;
  wire [15:0]addra;
  wire [15:0]addrb;
  wire clka;
  wire clkb;
  wire [0:0]dina;
  wire enb;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized2 \prim_init.ram 
       (.DOUTB(DOUTB),
        .ENA(ENA),
        .ENB(ENB),
        .addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dina(dina),
        .enb(enb),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized3
   (DOUTB,
    clka,
    clkb,
    ENA,
    ENB,
    enb,
    addra,
    addrb,
    dina,
    wea);
  output [0:0]DOUTB;
  input clka;
  input clkb;
  input ENA;
  input ENB;
  input enb;
  input [15:0]addra;
  input [15:0]addrb;
  input [0:0]dina;
  input [0:0]wea;

  wire [0:0]DOUTB;
  wire ENA;
  wire ENB;
  wire [15:0]addra;
  wire [15:0]addrb;
  wire clka;
  wire clkb;
  wire [0:0]dina;
  wire enb;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized3 \prim_init.ram 
       (.DOUTB(DOUTB),
        .ENA(ENA),
        .ENB(ENB),
        .addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dina(dina),
        .enb(enb),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized4
   (DOUTB,
    clka,
    clkb,
    ENA,
    ENB,
    enb,
    addra,
    addrb,
    dina,
    wea);
  output [0:0]DOUTB;
  input clka;
  input clkb;
  input ENA;
  input ENB;
  input enb;
  input [15:0]addra;
  input [15:0]addrb;
  input [0:0]dina;
  input [0:0]wea;

  wire [0:0]DOUTB;
  wire ENA;
  wire ENB;
  wire [15:0]addra;
  wire [15:0]addrb;
  wire clka;
  wire clkb;
  wire [0:0]dina;
  wire enb;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized4 \prim_init.ram 
       (.DOUTB(DOUTB),
        .ENA(ENA),
        .ENB(ENB),
        .addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dina(dina),
        .enb(enb),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized5
   (DOUTB,
    clka,
    clkb,
    ENA,
    ENB,
    enb,
    addra,
    addrb,
    dina,
    wea);
  output [0:0]DOUTB;
  input clka;
  input clkb;
  input ENA;
  input ENB;
  input enb;
  input [15:0]addra;
  input [15:0]addrb;
  input [0:0]dina;
  input [0:0]wea;

  wire [0:0]DOUTB;
  wire ENA;
  wire ENB;
  wire [15:0]addra;
  wire [15:0]addrb;
  wire clka;
  wire clkb;
  wire [0:0]dina;
  wire enb;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized5 \prim_init.ram 
       (.DOUTB(DOUTB),
        .ENA(ENA),
        .ENB(ENB),
        .addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dina(dina),
        .enb(enb),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized6
   (DOUTB,
    clka,
    clkb,
    ENA,
    ENB,
    enb,
    addra,
    addrb,
    dina,
    wea);
  output [0:0]DOUTB;
  input clka;
  input clkb;
  input ENA;
  input ENB;
  input enb;
  input [15:0]addra;
  input [15:0]addrb;
  input [0:0]dina;
  input [0:0]wea;

  wire [0:0]DOUTB;
  wire ENA;
  wire ENB;
  wire [15:0]addra;
  wire [15:0]addrb;
  wire clka;
  wire clkb;
  wire [0:0]dina;
  wire enb;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized6 \prim_init.ram 
       (.DOUTB(DOUTB),
        .ENA(ENA),
        .ENB(ENB),
        .addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dina(dina),
        .enb(enb),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized7
   (DOUTB,
    clka,
    clkb,
    ENA,
    ENB,
    enb,
    addra,
    addrb,
    dina,
    wea);
  output [0:0]DOUTB;
  input clka;
  input clkb;
  input ENA;
  input ENB;
  input enb;
  input [15:0]addra;
  input [15:0]addrb;
  input [0:0]dina;
  input [0:0]wea;

  wire [0:0]DOUTB;
  wire ENA;
  wire ENB;
  wire [15:0]addra;
  wire [15:0]addrb;
  wire clka;
  wire clkb;
  wire [0:0]dina;
  wire enb;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized7 \prim_init.ram 
       (.DOUTB(DOUTB),
        .ENA(ENA),
        .ENB(ENB),
        .addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dina(dina),
        .enb(enb),
        .wea(wea));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized8
   (DOUTB,
    clka,
    clkb,
    ENA,
    ENB,
    enb,
    addra,
    addrb,
    dina,
    wea);
  output [0:0]DOUTB;
  input clka;
  input clkb;
  input ENA;
  input ENB;
  input enb;
  input [15:0]addra;
  input [15:0]addrb;
  input [0:0]dina;
  input [0:0]wea;

  wire [0:0]DOUTB;
  wire ENA;
  wire ENB;
  wire [15:0]addra;
  wire [15:0]addrb;
  wire clka;
  wire clkb;
  wire [0:0]dina;
  wire enb;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized8 \prim_init.ram 
       (.DOUTB(DOUTB),
        .ENA(ENA),
        .ENB(ENB),
        .addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dina(dina),
        .enb(enb),
        .wea(wea));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init
   (DOUTB,
    clka,
    clkb,
    ENA,
    ENB,
    enb,
    addra,
    addrb,
    dina,
    wea);
  output [0:0]DOUTB;
  input clka;
  input clkb;
  input ENA;
  input ENB;
  input enb;
  input [15:0]addra;
  input [15:0]addrb;
  input [0:0]dina;
  input [0:0]wea;

  wire CASCADEINA;
  wire CASCADEINB;
  wire [0:0]DOUTB;
  wire ENA;
  wire ENB;
  wire [15:0]addra;
  wire [15:0]addrb;
  wire clka;
  wire clkb;
  wire [0:0]dina;
  wire enb;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_RDADDRECC_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOADO_UNCONNECTED ;
  wire [31:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(1),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_01(256'h00000FFF00000FFF00000FFF00001FFF00001FFF00003FFF00003FFF00003FFF),
    .INIT_02(256'h000007FF000007FF000007FF000007FF000007FF000007FF000007FF000007FF),
    .INIT_03(256'h00003FFF00003FFF00001FFF00001FFF00000FFF00000FFF000007FF000007FF),
    .INIT_04(256'h00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF00003FFF),
    .INIT_05(256'h00000FFF00000FFF00000FFF00001FFF00001FFF00003FFF00003FFF00007FFF),
    .INIT_06(256'h000003FF000003FF000003FF000003FF000007FF000007FF000007FF000007FF),
    .INIT_07(256'h000003FF000003FF000003FF000003FF000003FF000003FF000003FF000003FF),
    .INIT_08(256'h00003FFF00003FFF00003FFF00003FFF00003FFF00001FFF00001FFF00001FFF),
    .INIT_09(256'h000007FF00000FFF00000FFF00001FFF00001FFF00001FFF00001FFF00003FFF),
    .INIT_0A(256'h000007FF000007FF000007FF000003FF000007FF000007FF000007FF000007FF),
    .INIT_0B(256'h00003FFF00003FFF00001FFF00001FFF00000FFF00000FFF00000FFF000007FF),
    .INIT_0C(256'h00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF),
    .INIT_0D(256'h000007FF00000FFF00000FFF00001FFF00001FFF00003FFF00003FFF00007FFF),
    .INIT_0E(256'h000007FF000003FF000003FF000003FF000007FF000007FF000007FF000007FF),
    .INIT_0F(256'h000007FF000007FF000007FF000007FF000007FF000007FF000007FF000007FF),
    .INIT_10(256'h00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00000FFF),
    .INIT_11(256'h000007FF00000FFF00000FFF00000FFF00001FFF00001FFF00001FFF00001FFF),
    .INIT_12(256'h000007FF000007FF000007FF000003FF000003FF000007FF000007FF000007FF),
    .INIT_13(256'h00003FFF00003FFF00001FFF00001FFF00000FFF00000FFF00000FFF000007FF),
    .INIT_14(256'h00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF),
    .INIT_15(256'h000007FF00000FFF00000FFF00001FFF00001FFF00003FFF00003FFF00007FFF),
    .INIT_16(256'h000007FF000007FF000007FF000007FF000007FF000007FF000007FF000007FF),
    .INIT_17(256'h000007FF000007FF000007FF000007FF000007FF000007FF000007FF000007FF),
    .INIT_18(256'h00001FFF00001FFF00001FFF00001FFF00001FFF00000FFF00000FFF00000FFF),
    .INIT_19(256'h000007FF000007FF00000FFF00000FFF00000FFF00001FFF00001FFF00001FFF),
    .INIT_1A(256'h000007FF000007FF000007FF000003FF000003FF000003FF000007FF000007FF),
    .INIT_1B(256'h00003FFF00003FFF00003FFF00001FFF00001FFF00000FFF00000FFF000007FF),
    .INIT_1C(256'h00007FFF00007FFF00007FFF0000FFFF0000FFFF00007FFF00007FFF00007FFF),
    .INIT_1D(256'h000007FF00000FFF00000FFF00001FFF00001FFF00003FFF00003FFF00007FFF),
    .INIT_1E(256'h000007FF000007FF000007FF000007FF000007FF000007FF000007FF000007FF),
    .INIT_1F(256'h000007FF00000FFF00000FFF000007FF000007FF000007FF000007FF000007FF),
    .INIT_20(256'h00001FFF00001FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_21(256'h000007FF000007FF000007FF00000FFF00000FFF00000FFF00000FFF00001FFF),
    .INIT_22(256'h000007FF000007FF000007FF000003FF000003FF000003FF000007FF000007FF),
    .INIT_23(256'h00007FFF00003FFF00003FFF00001FFF00001FFF00000FFF00000FFF000007FF),
    .INIT_24(256'h00007FFF00007FFF0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF),
    .INIT_25(256'h000007FF00000FFF00000FFF00001FFF00001FFF00003FFF00003FFF00007FFF),
    .INIT_26(256'h000007FF000007FF000007FF000007FF000007FF000007FF000007FF000007FF),
    .INIT_27(256'h00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF000007FF),
    .INIT_28(256'h00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF000007FF000007FF),
    .INIT_29(256'h000007FF000007FF000007FF00000FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_2A(256'h000007FF000007FF000007FF000003FF000003FF000003FF000007FF000007FF),
    .INIT_2B(256'h00007FFF00003FFF00003FFF00001FFF00001FFF00000FFF00000FFF00000FFF),
    .INIT_2C(256'h00007FFF00007FFF0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF),
    .INIT_2D(256'h000007FF000007FF00000FFF00000FFF00001FFF00001FFF00003FFF00007FFF),
    .INIT_2E(256'h00000FFF000007FF000007FF000007FF000007FF000007FF000007FF000007FF),
    .INIT_2F(256'h00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_30(256'h00000FFF00000FFF00000FFF00000FFF00000FFF000007FF000007FF000007FF),
    .INIT_31(256'h000007FF000007FF000007FF000007FF00000FFF00000FFF00000FFF00000FFF),
    .INIT_32(256'h000007FF000007FF000007FF000007FF000003FF000003FF000007FF000007FF),
    .INIT_33(256'h00007FFF00007FFF00003FFF00003FFF00001FFF00001FFF00000FFF00000FFF),
    .INIT_34(256'h00007FFF00007FFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007FFF),
    .INIT_35(256'h000007FF000007FF00000FFF00000FFF00001FFF00001FFF00003FFF00003FFF),
    .INIT_36(256'h00000FFF000007FF000007FF000007FF000007FF000007FF000007FF000007FF),
    .INIT_37(256'h00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00000FFF00000FFF),
    .INIT_38(256'h00000FFF00000FFF00000FFF00000FFF000007FF000007FF000007FF000007FF),
    .INIT_39(256'h000007FF000007FF000007FF000007FF00000FFF00000FFF00000FFF00000FFF),
    .INIT_3A(256'h000007FF000007FF000007FF000007FF000007FF000007FF000007FF000007FF),
    .INIT_3B(256'h00007FFF00007FFF00003FFF00003FFF00001FFF00001FFF00000FFF00000FFF),
    .INIT_3C(256'h00007FFF00007FFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007FFF),
    .INIT_3D(256'h000007FF000007FF00000FFF00000FFF00001FFF00001FFF00003FFF00003FFF),
    .INIT_3E(256'h00000FFF00000FFF000007FF000007FF000007FF000007FF000007FF000007FF),
    .INIT_3F(256'h00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00000FFF),
    .INIT_40(256'h00000FFF00000FFF00000FFF000007FF000007FF000007FF000007FF000007FF),
    .INIT_41(256'h000007FF000007FF000007FF00000FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_42(256'h00000FFF000007FF000007FF000007FF000007FF000007FF000007FF000007FF),
    .INIT_43(256'h00007FFF00007FFF00003FFF00003FFF00001FFF00001FFF00000FFF00000FFF),
    .INIT_44(256'h00007FFF00007FFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF),
    .INIT_45(256'h000007FF000007FF00000FFF00000FFF00001FFF00001FFF00003FFF00003FFF),
    .INIT_46(256'h00000FFF00000FFF00000FFF000007FF000007FF000007FF000007FF000007FF),
    .INIT_47(256'h00003FFF00003FFF00003FFF00003FFF00003FFF00001FFF00001FFF00001FFF),
    .INIT_48(256'h00000FFF00000FFF00000FFF000007FF000007FF000007FF000007FF000003FF),
    .INIT_49(256'h000007FF000007FF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_4A(256'h00000FFF00000FFF000007FF000007FF000007FF000007FF000007FF000007FF),
    .INIT_4B(256'h00007FFF00007FFF00007FFF00003FFF00003FFF00001FFF00001FFF00000FFF),
    .INIT_4C(256'h00007FFF00007FFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF),
    .INIT_4D(256'h000007FF000007FF00000FFF00000FFF00001FFF00001FFF00003FFF00003FFF),
    .INIT_4E(256'h00001FFF00000FFF00000FFF000007FF000007FF000007FF000007FF000007FF),
    .INIT_4F(256'h00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00001FFF00001FFF),
    .INIT_50(256'h00000FFF00000FFF00000FFF000007FF000007FF000007FF000007FF000003FF),
    .INIT_51(256'h00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_52(256'h00000FFF00000FFF00000FFF000007FF000007FF000007FF000007FF000007FF),
    .INIT_53(256'h0000FFFF00007FFF00007FFF00003FFF00003FFF00001FFF00001FFF00001FFF),
    .INIT_54(256'h00007FFF00007FFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF),
    .INIT_55(256'h000007FF000007FF00000FFF00000FFF00000FFF00001FFF00003FFF00003FFF),
    .INIT_56(256'h00001FFF00000FFF00000FFF000007FF000007FF000007FF000007FF000007FF),
    .INIT_57(256'h00007FFF00007FFF00007FFF00003FFF00003FFF00003FFF00003FFF00001FFF),
    .INIT_58(256'h00000FFF00000FFF00000FFF000007FF000007FF000007FF000007FF000007FF),
    .INIT_59(256'h00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_5A(256'h00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_5B(256'h0000FFFF00007FFF00007FFF00003FFF00003FFF00003FFF00001FFF00001FFF),
    .INIT_5C(256'h00007FFF00007FFF00007FFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF),
    .INIT_5D(256'h000007FF000007FF000007FF00000FFF00000FFF00001FFF00001FFF00003FFF),
    .INIT_5E(256'h00001FFF00000FFF00000FFF00000FFF000007FF000007FF000007FF000007FF),
    .INIT_5F(256'h00007FFF00007FFF00007FFF00007FFF00007FFF00003FFF00003FFF00001FFF),
    .INIT_60(256'h00000FFF00000FFF00000FFF00000FFF000007FF000007FF000007FF000007FF),
    .INIT_61(256'h00000FFF00000FFF00001FFF00001FFF00001FFF00001FFF00001FFF00000FFF),
    .INIT_62(256'h00001FFF00001FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_63(256'h0000FFFF00007FFF00007FFF00007FFF00003FFF00003FFF00001FFF00001FFF),
    .INIT_64(256'h00003FFF00007FFF00007FFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF),
    .INIT_65(256'h000007FF000007FF000007FF00000FFF00000FFF00001FFF00001FFF00003FFF),
    .INIT_66(256'h00001FFF00001FFF00000FFF00000FFF000007FF000007FF000007FF000007FF),
    .INIT_67(256'h0000FFFF0000FFFF00007FFF00007FFF00007FFF00007FFF00003FFF00003FFF),
    .INIT_68(256'h00001FFF00000FFF00000FFF00000FFF000007FF000007FF000007FF000007FF),
    .INIT_69(256'h00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF),
    .INIT_6A(256'h00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF),
    .INIT_6B(256'h0000FFFF00007FFF00007FFF00007FFF00003FFF00003FFF00003FFF00001FFF),
    .INIT_6C(256'h00003FFF00007FFF00007FFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF),
    .INIT_6D(256'h000007FF000007FF000007FF00000FFF00000FFF00001FFF00001FFF00003FFF),
    .INIT_6E(256'h00001FFF00001FFF00000FFF00000FFF00000FFF000007FF000007FF000007FF),
    .INIT_6F(256'h0000FFFF0000FFFF0000FFFF00007FFF00007FFF00007FFF00003FFF00003FFF),
    .INIT_70(256'h00001FFF00001FFF00000FFF00000FFF00000FFF000007FF000007FF000007FF),
    .INIT_71(256'h00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF),
    .INIT_72(256'h00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF),
    .INIT_73(256'h0000FFFF00007FFF00007FFF00007FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_74(256'h00003FFF00007FFF00007FFF00007FFF0000FFFF0000FFFF0000FFFF0000FFFF),
    .INIT_75(256'h000007FF000007FF000007FF00000FFF00000FFF00001FFF00001FFF00003FFF),
    .INIT_76(256'h00003FFF00001FFF00001FFF00000FFF00000FFF000007FF000007FF000007FF),
    .INIT_77(256'h0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF00007FFF00003FFF),
    .INIT_78(256'h00001FFF00001FFF00000FFF00000FFF00000FFF00000FFF000007FF000007FF),
    .INIT_79(256'h00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00001FFF),
    .INIT_7A(256'h00003FFF00003FFF00001FFF00003FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_7B(256'h00007FFF00007FFF00007FFF00007FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_7C(256'h00003FFF00003FFF00007FFF00007FFF00007FFF0000FFFF0000FFFF0000FFFF),
    .INIT_7D(256'h000007FF000007FF000007FF00000FFF00000FFF00001FFF00001FFF00003FFF),
    .INIT_7E(256'h00003FFF00001FFF00001FFF00000FFF00000FFF00000FFF000007FF000007FF),
    .INIT_7F(256'h0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF00003FFF),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("LOWER"),
    .RAM_EXTENSION_B("LOWER"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(1),
    .READ_WIDTH_B(1),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(1),
    .WRITE_WIDTH_B(1)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B 
       (.ADDRARDADDR(addra),
        .ADDRBWRADDR(addrb),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(CASCADEINA),
        .CASCADEOUTB(CASCADEINB),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clkb),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOADO_UNCONNECTED [31:0]),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ENA),
        .ENBWREN(ENB),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(enb),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(1),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h00001FFF00001FFF00001FFF00000FFF00000FFF00000FFF00000FFF000007FF),
    .INIT_01(256'h00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_02(256'h00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_03(256'h00007FFF00007FFF00007FFF00007FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_04(256'h00003FFF00003FFF00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF),
    .INIT_05(256'h000007FF000007FF00000FFF00000FFF00000FFF00001FFF00001FFF00001FFF),
    .INIT_06(256'h00003FFF00001FFF00001FFF00000FFF00000FFF00000FFF000007FF000007FF),
    .INIT_07(256'h0001FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF00003FFF),
    .INIT_08(256'h00003FFF00001FFF00001FFF00001FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_09(256'h00007FFF00007FFF00007FFF00007FFF00007FFF00003FFF00003FFF00003FFF),
    .INIT_0A(256'h00003FFF00003FFF00003FFF00003FFF00003FFF00007FFF00007FFF00007FFF),
    .INIT_0B(256'h00007FFF00007FFF00007FFF00003FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_0C(256'h00003FFF00003FFF00003FFF00007FFF00007FFF00007FFF00007FFF00007FFF),
    .INIT_0D(256'h000007FF000007FF00000FFF00000FFF00000FFF00000FFF00001FFF00001FFF),
    .INIT_0E(256'h00003FFF00003FFF00001FFF00001FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_0F(256'h0001FFFF0001FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF),
    .INIT_10(256'h00003FFF00001FFF00001FFF00001FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_11(256'h00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF00003FFF),
    .INIT_12(256'h00003FFF00003FFF00003FFF00007FFF00007FFF00007FFF00007FFF00007FFF),
    .INIT_13(256'h00007FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_14(256'h00003FFF00003FFF00003FFF00003FFF00007FFF00007FFF00007FFF00007FFF),
    .INIT_15(256'h00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00001FFF00001FFF),
    .INIT_16(256'h00003FFF00003FFF00001FFF00001FFF00001FFF00000FFF00000FFF00000FFF),
    .INIT_17(256'h0001FFFF0001FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF),
    .INIT_18(256'h00003FFF00003FFF00001FFF00001FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_19(256'h0000FFFF0000FFFF0000FFFF00007FFF00007FFF00007FFF00007FFF00003FFF),
    .INIT_1A(256'h00003FFF00003FFF00007FFF00007FFF00007FFF00007FFF00007FFF0000FFFF),
    .INIT_1B(256'h00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_1C(256'h00001FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_1D(256'h00000FFF00000FFF00000FFF00000FFF00000FFF00001FFF00001FFF00001FFF),
    .INIT_1E(256'h00003FFF00003FFF00003FFF00001FFF00001FFF00000FFF00000FFF00000FFF),
    .INIT_1F(256'h0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF),
    .INIT_20(256'h00003FFF00003FFF00001FFF00001FFF00001FFF00000FFF00000FFF00000FFF),
    .INIT_21(256'h0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF00007FFF00007FFF),
    .INIT_22(256'h00003FFF00003FFF00007FFF00007FFF00007FFF00007FFF0000FFFF0000FFFF),
    .INIT_23(256'h00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_24(256'h00001FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_25(256'h00000FFF00000FFF00000FFF00000FFF00000FFF00001FFF00001FFF00001FFF),
    .INIT_26(256'h00007FFF00003FFF00003FFF00001FFF00001FFF00001FFF00000FFF00000FFF),
    .INIT_27(256'h0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF),
    .INIT_28(256'h00003FFF00003FFF00001FFF00001FFF00001FFF00000FFF00000FFF00000FFF),
    .INIT_29(256'h0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF00007FFF),
    .INIT_2A(256'h00003FFF00003FFF00007FFF00007FFF00007FFF0000FFFF0000FFFF0000FFFF),
    .INIT_2B(256'h00003FFF00001FFF00001FFF00001FFF00001FFF00001FFF00003FFF00003FFF),
    .INIT_2C(256'h00001FFF00001FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_2D(256'h00000FFF00000FFF00000FFF00000FFF00001FFF00001FFF00001FFF00001FFF),
    .INIT_2E(256'h00007FFF00003FFF00003FFF00003FFF00001FFF00001FFF00001FFF00001FFF),
    .INIT_2F(256'h0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF),
    .INIT_30(256'h00003FFF00003FFF00001FFF00001FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_31(256'h0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF00007FFF),
    .INIT_32(256'h00003FFF00003FFF00007FFF00007FFF00007FFF0000FFFF0000FFFF0000FFFF),
    .INIT_33(256'h00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00003FFF),
    .INIT_34(256'h00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF),
    .INIT_35(256'h00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF),
    .INIT_36(256'h00007FFF00003FFF00003FFF00003FFF00003FFF00001FFF00001FFF00001FFF),
    .INIT_37(256'h0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF),
    .INIT_38(256'h00003FFF00003FFF00001FFF00001FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_39(256'h0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF00007FFF),
    .INIT_3A(256'h00003FFF00003FFF00007FFF00007FFF00007FFF0000FFFF0000FFFF0000FFFF),
    .INIT_3B(256'h00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00003FFF),
    .INIT_3C(256'h00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF),
    .INIT_3D(256'h00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF),
    .INIT_3E(256'h00007FFF00007FFF00003FFF00003FFF00003FFF00003FFF00001FFF00001FFF),
    .INIT_3F(256'h00007FFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF),
    .INIT_40(256'h00003FFF00001FFF00001FFF00001FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_41(256'h0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF00003FFF),
    .INIT_42(256'h00003FFF00003FFF00007FFF00007FFF00007FFF0000FFFF0000FFFF0000FFFF),
    .INIT_43(256'h00000FFF00000FFF00000FFF00000FFF00000FFF00001FFF00001FFF00001FFF),
    .INIT_44(256'h00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF),
    .INIT_45(256'h00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF),
    .INIT_46(256'h00007FFF00007FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_47(256'h00007FFF00007FFF00007FFF0000FFFF0000FFFF00007FFF00007FFF00007FFF),
    .INIT_48(256'h00003FFF00001FFF00001FFF00000FFF00000FFF00000FFF000007FF000007FF),
    .INIT_49(256'h0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF00003FFF),
    .INIT_4A(256'h00001FFF00003FFF00003FFF00007FFF00007FFF0000FFFF0000FFFF0000FFFF),
    .INIT_4B(256'h00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00001FFF00001FFF),
    .INIT_4C(256'h00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00000FFF00000FFF),
    .INIT_4D(256'h00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00001FFF),
    .INIT_4E(256'h00007FFF00007FFF00007FFF00003FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_4F(256'h00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF),
    .INIT_50(256'h00003FFF00001FFF00001FFF00000FFF00000FFF00000FFF000007FF000007FF),
    .INIT_51(256'h0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF00007FFF00003FFF),
    .INIT_52(256'h00001FFF00003FFF00003FFF00007FFF00007FFF0000FFFF0000FFFF0000FFFF),
    .INIT_53(256'h00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00001FFF),
    .INIT_54(256'h00003FFF00001FFF00001FFF00001FFF00001FFF00001FFF00000FFF00000FFF),
    .INIT_55(256'h00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_56(256'h00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF00003FFF00003FFF),
    .INIT_57(256'h00003FFF00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF),
    .INIT_58(256'h00001FFF00001FFF00000FFF00000FFF00000FFF000007FF000007FF000007FF),
    .INIT_59(256'h0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF00003FFF00003FFF),
    .INIT_5A(256'h00001FFF00001FFF00003FFF00003FFF00007FFF00007FFF0000FFFF0000FFFF),
    .INIT_5B(256'h00000FFF000007FF000007FF000007FF00000FFF00000FFF00000FFF00001FFF),
    .INIT_5C(256'h00003FFF00003FFF00001FFF00001FFF00001FFF00000FFF00000FFF00000FFF),
    .INIT_5D(256'h00007FFF00007FFF00007FFF00003FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_5E(256'h00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF),
    .INIT_5F(256'h00003FFF00003FFF00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF),
    .INIT_60(256'h00001FFF00001FFF00000FFF00000FFF000007FF000007FF000007FF000007FF),
    .INIT_61(256'h0000FFFF0000FFFF0000FFFF00007FFF00007FFF00007FFF00003FFF00003FFF),
    .INIT_62(256'h00001FFF00001FFF00003FFF00003FFF00007FFF00007FFF00007FFF0000FFFF),
    .INIT_63(256'h000007FF000007FF000007FF000007FF000007FF00000FFF00000FFF00000FFF),
    .INIT_64(256'h00003FFF00003FFF00001FFF00001FFF00001FFF00000FFF00000FFF00000FFF),
    .INIT_65(256'h00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF00003FFF00003FFF),
    .INIT_66(256'h00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF),
    .INIT_67(256'h00003FFF00003FFF00003FFF00003FFF00007FFF00007FFF00007FFF00007FFF),
    .INIT_68(256'h00001FFF00001FFF00000FFF00000FFF000007FF000007FF000007FF000007FF),
    .INIT_69(256'h0000FFFF0000FFFF00007FFF00007FFF00007FFF00003FFF00003FFF00003FFF),
    .INIT_6A(256'h00001FFF00001FFF00001FFF00003FFF00003FFF00007FFF00007FFF00007FFF),
    .INIT_6B(256'h000007FF000007FF000007FF000007FF000007FF000007FF00000FFF00000FFF),
    .INIT_6C(256'h00003FFF00003FFF00003FFF00001FFF00001FFF00000FFF00000FFF00000FFF),
    .INIT_6D(256'h00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF00003FFF),
    .INIT_6E(256'h00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF),
    .INIT_6F(256'h00001FFF00003FFF00003FFF00003FFF00003FFF00007FFF00007FFF00007FFF),
    .INIT_70(256'h00001FFF00000FFF00000FFF000007FF000007FF000007FF000007FF000003FF),
    .INIT_71(256'h00007FFF00007FFF00007FFF00007FFF00007FFF00003FFF00003FFF00001FFF),
    .INIT_72(256'h00000FFF00001FFF00001FFF00003FFF00003FFF00007FFF00007FFF00007FFF),
    .INIT_73(256'h000007FF000007FF000007FF000007FF000007FF000007FF000007FF00000FFF),
    .INIT_74(256'h00003FFF00003FFF00003FFF00001FFF00001FFF00000FFF00000FFF00000FFF),
    .INIT_75(256'h0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF00007FFF00007FFF),
    .INIT_76(256'h00007FFF00007FFF00007FFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF),
    .INIT_77(256'h00001FFF00001FFF00003FFF00003FFF00003FFF00003FFF00007FFF00007FFF),
    .INIT_78(256'h00001FFF00000FFF00000FFF000007FF000007FF000007FF000003FF000003FF),
    .INIT_79(256'h00007FFF00007FFF00007FFF00007FFF00003FFF00003FFF00003FFF00001FFF),
    .INIT_7A(256'h00000FFF00001FFF00001FFF00003FFF00003FFF00003FFF00007FFF00007FFF),
    .INIT_7B(256'h000007FF000007FF000007FF000007FF000007FF000007FF000007FF00000FFF),
    .INIT_7C(256'h00007FFF00003FFF00003FFF00001FFF00001FFF00001FFF00000FFF00000FFF),
    .INIT_7D(256'h0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF),
    .INIT_7E(256'h00007FFF00007FFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF),
    .INIT_7F(256'h00001FFF00001FFF00001FFF00003FFF00003FFF00003FFF00007FFF00007FFF),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("UPPER"),
    .RAM_EXTENSION_B("UPPER"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(1),
    .READ_WIDTH_B(1),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(1),
    .WRITE_WIDTH_B(1)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T 
       (.ADDRARDADDR(addra),
        .ADDRBWRADDR(addrb),
        .CASCADEINA(CASCADEINA),
        .CASCADEINB(CASCADEINB),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clkb),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOADO_UNCONNECTED [31:0]),
        .DOBDO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOBDO_UNCONNECTED [31:1],DOUTB}),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ENA),
        .ENBWREN(ENB),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(enb),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized0
   (DOUTB,
    clka,
    clkb,
    ENA,
    ENB,
    enb,
    addra,
    addrb,
    dina,
    wea);
  output [0:0]DOUTB;
  input clka;
  input clkb;
  input ENA;
  input ENB;
  input enb;
  input [15:0]addra;
  input [15:0]addrb;
  input [0:0]dina;
  input [0:0]wea;

  wire CASCADEINA;
  wire CASCADEINB;
  wire [0:0]DOUTB;
  wire ENA;
  wire ENB;
  wire [15:0]addra;
  wire [15:0]addrb;
  wire clka;
  wire clkb;
  wire [0:0]dina;
  wire enb;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_RDADDRECC_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOADO_UNCONNECTED ;
  wire [31:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(1),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h00001FFF00000FFF00000FFF000007FF000007FF000007FF000003FF000003FF),
    .INIT_01(256'h00007FFF00007FFF00007FFF00007FFF00003FFF00003FFF00003FFF00001FFF),
    .INIT_02(256'h00000FFF00000FFF00001FFF00001FFF00003FFF00003FFF00007FFF00007FFF),
    .INIT_03(256'h000007FF000007FF000007FF000007FF000007FF000007FF000007FF00000FFF),
    .INIT_04(256'h00007FFF00007FFF00003FFF00003FFF00001FFF00001FFF00000FFF00000FFF),
    .INIT_05(256'h0001FFFF0001FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007FFF),
    .INIT_06(256'h00007FFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0001FFFF),
    .INIT_07(256'h00000FFF00001FFF00001FFF00003FFF00003FFF00003FFF00007FFF00007FFF),
    .INIT_08(256'h00000FFF00000FFF00000FFF000007FF000007FF000003FF000003FF000003FF),
    .INIT_09(256'h00007FFF00007FFF00007FFF00007FFF00003FFF00003FFF00001FFF00001FFF),
    .INIT_0A(256'h00000FFF00000FFF00001FFF00001FFF00003FFF00003FFF00003FFF00007FFF),
    .INIT_0B(256'h00000FFF000007FF000007FF000007FF000007FF000007FF000007FF00000FFF),
    .INIT_0C(256'h00007FFF00007FFF00003FFF00003FFF00001FFF00001FFF00000FFF00000FFF),
    .INIT_0D(256'h0001FFFF0001FFFF0001FFFF0001FFFF0000FFFF0000FFFF0000FFFF0000FFFF),
    .INIT_0E(256'h00007FFF0000FFFF0000FFFF0000FFFF0000FFFF0001FFFF0001FFFF0001FFFF),
    .INIT_0F(256'h00000FFF00001FFF00001FFF00003FFF00003FFF00003FFF00007FFF00007FFF),
    .INIT_10(256'h00000FFF00000FFF00000FFF000007FF000007FF000007FF000003FF000003FF),
    .INIT_11(256'h00007FFF00007FFF00007FFF00003FFF00003FFF00003FFF00001FFF00001FFF),
    .INIT_12(256'h00000FFF00000FFF00001FFF00001FFF00003FFF00003FFF00003FFF00007FFF),
    .INIT_13(256'h00000FFF000007FF000007FF000007FF000007FF000007FF000007FF00000FFF),
    .INIT_14(256'h00007FFF00007FFF00007FFF00003FFF00003FFF00001FFF00001FFF00000FFF),
    .INIT_15(256'h0001FFFF0001FFFF0001FFFF0001FFFF0001FFFF0000FFFF0000FFFF0000FFFF),
    .INIT_16(256'h00007FFF0000FFFF0000FFFF0000FFFF0001FFFF0001FFFF0001FFFF0001FFFF),
    .INIT_17(256'h00000FFF00001FFF00001FFF00001FFF00003FFF00003FFF00007FFF00007FFF),
    .INIT_18(256'h00001FFF00000FFF00000FFF000007FF000007FF000007FF000003FF000003FF),
    .INIT_19(256'h00007FFF00007FFF00007FFF00003FFF00003FFF00003FFF00001FFF00001FFF),
    .INIT_1A(256'h00000FFF00000FFF00001FFF00001FFF00003FFF00003FFF00003FFF00007FFF),
    .INIT_1B(256'h00000FFF00000FFF000007FF000007FF000007FF000007FF000007FF00000FFF),
    .INIT_1C(256'h0000FFFF00007FFF00007FFF00003FFF00003FFF00001FFF00001FFF00000FFF),
    .INIT_1D(256'h0001FFFF0001FFFF0001FFFF0001FFFF0001FFFF0001FFFF0000FFFF0000FFFF),
    .INIT_1E(256'h0000FFFF0000FFFF0000FFFF0001FFFF0001FFFF0001FFFF0001FFFF0001FFFF),
    .INIT_1F(256'h00000FFF00001FFF00001FFF00001FFF00003FFF00003FFF00007FFF00007FFF),
    .INIT_20(256'h00001FFF00000FFF00000FFF000007FF000007FF000007FF000007FF000003FF),
    .INIT_21(256'h00007FFF00007FFF00007FFF00007FFF00003FFF00003FFF00003FFF00001FFF),
    .INIT_22(256'h00000FFF00001FFF00001FFF00001FFF00003FFF00003FFF00007FFF00007FFF),
    .INIT_23(256'h00000FFF00000FFF00000FFF000007FF000007FF000007FF00000FFF00000FFF),
    .INIT_24(256'h0000FFFF00007FFF00007FFF00003FFF00003FFF00001FFF00001FFF00000FFF),
    .INIT_25(256'h0003FFFF0003FFFF0003FFFF0001FFFF0001FFFF0001FFFF0001FFFF0000FFFF),
    .INIT_26(256'h0000FFFF0000FFFF0000FFFF0001FFFF0001FFFF0001FFFF0001FFFF0003FFFF),
    .INIT_27(256'h00000FFF00001FFF00001FFF00003FFF00003FFF00003FFF00007FFF00007FFF),
    .INIT_28(256'h00001FFF00000FFF00000FFF00000FFF000007FF000007FF000007FF000007FF),
    .INIT_29(256'h00007FFF00007FFF00007FFF00007FFF00003FFF00003FFF00003FFF00001FFF),
    .INIT_2A(256'h00000FFF00001FFF00001FFF00003FFF00003FFF00003FFF00007FFF00007FFF),
    .INIT_2B(256'h00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_2C(256'h0000FFFF0000FFFF00007FFF00007FFF00003FFF00003FFF00001FFF00001FFF),
    .INIT_2D(256'h0003FFFF0003FFFF0003FFFF0003FFFF0001FFFF0001FFFF0001FFFF0000FFFF),
    .INIT_2E(256'h0000FFFF0000FFFF0001FFFF0001FFFF0001FFFF0001FFFF0003FFFF0003FFFF),
    .INIT_2F(256'h00000FFF00001FFF00001FFF00003FFF00003FFF00007FFF00007FFF00007FFF),
    .INIT_30(256'h00001FFF00001FFF00000FFF00000FFF00000FFF000007FF000007FF000007FF),
    .INIT_31(256'h00007FFF00007FFF00007FFF00007FFF00007FFF00003FFF00003FFF00001FFF),
    .INIT_32(256'h00001FFF00001FFF00003FFF00003FFF00003FFF00007FFF00007FFF00007FFF),
    .INIT_33(256'h00001FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_34(256'h0000FFFF0000FFFF00007FFF00007FFF00003FFF00003FFF00001FFF00001FFF),
    .INIT_35(256'h0003FFFF0003FFFF0003FFFF0003FFFF0001FFFF0001FFFF0001FFFF0000FFFF),
    .INIT_36(256'h0000FFFF0000FFFF0001FFFF0001FFFF0001FFFF0003FFFF0003FFFF0003FFFF),
    .INIT_37(256'h00000FFF00001FFF00001FFF00003FFF00003FFF00007FFF00007FFF0000FFFF),
    .INIT_38(256'h00001FFF00001FFF00000FFF00000FFF00000FFF00000FFF000007FF000007FF),
    .INIT_39(256'h00007FFF00007FFF00007FFF00007FFF00007FFF00003FFF00003FFF00003FFF),
    .INIT_3A(256'h00001FFF00001FFF00003FFF00003FFF00007FFF00007FFF00007FFF00007FFF),
    .INIT_3B(256'h00001FFF00001FFF00000FFF00000FFF00000FFF00000FFF00001FFF00001FFF),
    .INIT_3C(256'h0000FFFF0000FFFF00007FFF00007FFF00003FFF00003FFF00003FFF00001FFF),
    .INIT_3D(256'h0003FFFF0003FFFF0003FFFF0003FFFF0001FFFF0001FFFF0001FFFF0000FFFF),
    .INIT_3E(256'h0000FFFF0001FFFF0001FFFF0001FFFF0003FFFF0003FFFF0003FFFF0003FFFF),
    .INIT_3F(256'h00000FFF00001FFF00001FFF00003FFF00003FFF00007FFF00007FFF0000FFFF),
    .INIT_40(256'h00003FFF00001FFF00001FFF00000FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_41(256'h0000FFFF0000FFFF00007FFF00007FFF00007FFF00007FFF00003FFF00003FFF),
    .INIT_42(256'h00001FFF00003FFF00003FFF00007FFF00007FFF00007FFF00007FFF00007FFF),
    .INIT_43(256'h00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF),
    .INIT_44(256'h0000FFFF0000FFFF00007FFF00007FFF00003FFF00003FFF00003FFF00001FFF),
    .INIT_45(256'h0003FFFF0003FFFF0003FFFF0001FFFF0001FFFF0001FFFF0001FFFF0000FFFF),
    .INIT_46(256'h0000FFFF0001FFFF0001FFFF0001FFFF0003FFFF0003FFFF0003FFFF0003FFFF),
    .INIT_47(256'h00001FFF00001FFF00003FFF00003FFF00007FFF00007FFF0000FFFF0000FFFF),
    .INIT_48(256'h00003FFF00001FFF00001FFF00001FFF00001FFF00000FFF00000FFF00000FFF),
    .INIT_49(256'h0000FFFF0000FFFF0000FFFF00007FFF00007FFF00007FFF00003FFF00003FFF),
    .INIT_4A(256'h00003FFF00003FFF00007FFF00007FFF00007FFF00007FFF0000FFFF0000FFFF),
    .INIT_4B(256'h00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00003FFF),
    .INIT_4C(256'h0000FFFF00007FFF00007FFF00007FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_4D(256'h0003FFFF0003FFFF0001FFFF0001FFFF0001FFFF0001FFFF0000FFFF0000FFFF),
    .INIT_4E(256'h0000FFFF0001FFFF0001FFFF0001FFFF0003FFFF0003FFFF0003FFFF0003FFFF),
    .INIT_4F(256'h00001FFF00001FFF00003FFF00003FFF00007FFF00007FFF0000FFFF0000FFFF),
    .INIT_50(256'h00003FFF00003FFF00001FFF00001FFF00001FFF00001FFF00001FFF00000FFF),
    .INIT_51(256'h0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF00007FFF00003FFF),
    .INIT_52(256'h00003FFF00007FFF00007FFF00007FFF00007FFF0000FFFF0000FFFF0000FFFF),
    .INIT_53(256'h00003FFF00001FFF00001FFF00001FFF00001FFF00003FFF00003FFF00003FFF),
    .INIT_54(256'h0000FFFF00007FFF00007FFF00007FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_55(256'h0001FFFF0001FFFF0001FFFF0001FFFF0001FFFF0000FFFF0000FFFF0000FFFF),
    .INIT_56(256'h0001FFFF0001FFFF0001FFFF0001FFFF0001FFFF0003FFFF0003FFFF0003FFFF),
    .INIT_57(256'h00001FFF00001FFF00003FFF00003FFF00007FFF00007FFF0000FFFF0000FFFF),
    .INIT_58(256'h00003FFF00003FFF00003FFF00001FFF00001FFF00001FFF00001FFF00001FFF),
    .INIT_59(256'h0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF00007FFF),
    .INIT_5A(256'h00007FFF00007FFF00007FFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF),
    .INIT_5B(256'h00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_5C(256'h00007FFF00007FFF00007FFF00003FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_5D(256'h0001FFFF0001FFFF0001FFFF0001FFFF0000FFFF0000FFFF0000FFFF0000FFFF),
    .INIT_5E(256'h0001FFFF0001FFFF0001FFFF0001FFFF0001FFFF0001FFFF0001FFFF0001FFFF),
    .INIT_5F(256'h00001FFF00003FFF00003FFF00007FFF00007FFF0000FFFF0000FFFF0000FFFF),
    .INIT_60(256'h00003FFF00003FFF00003FFF00003FFF00003FFF00001FFF00001FFF00001FFF),
    .INIT_61(256'h0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF00007FFF),
    .INIT_62(256'h00007FFF00007FFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF),
    .INIT_63(256'h00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00007FFF),
    .INIT_64(256'h00007FFF00007FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_65(256'h0001FFFF0001FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF),
    .INIT_66(256'h0001FFFF0001FFFF0001FFFF0001FFFF0001FFFF0001FFFF0001FFFF0001FFFF),
    .INIT_67(256'h00001FFF00003FFF00003FFF00007FFF00007FFF0000FFFF0000FFFF0000FFFF),
    .INIT_68(256'h00007FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_69(256'h0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF00007FFF),
    .INIT_6A(256'h00007FFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF),
    .INIT_6B(256'h00003FFF00003FFF00003FFF00003FFF00003FFF00007FFF00007FFF00007FFF),
    .INIT_6C(256'h00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_6D(256'h0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF00007FFF00007FFF),
    .INIT_6E(256'h0001FFFF0001FFFF0001FFFF0001FFFF0001FFFF0001FFFF0001FFFF0000FFFF),
    .INIT_6F(256'h00003FFF00003FFF00007FFF00007FFF00007FFF0000FFFF0000FFFF0000FFFF),
    .INIT_70(256'h00007FFF00007FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_71(256'h0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF00007FFF),
    .INIT_72(256'h0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF),
    .INIT_73(256'h00003FFF00003FFF00003FFF00003FFF00003FFF00007FFF00007FFF00007FFF),
    .INIT_74(256'h00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_75(256'h0000FFFF0000FFFF00007FFF00007FFF00007FFF00003FFF00003FFF00003FFF),
    .INIT_76(256'h0000FFFF0001FFFF0001FFFF0001FFFF0001FFFF0000FFFF0000FFFF0000FFFF),
    .INIT_77(256'h00003FFF00003FFF00007FFF00007FFF00007FFF0000FFFF0000FFFF0000FFFF),
    .INIT_78(256'h00007FFF00007FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_79(256'h0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF00007FFF),
    .INIT_7A(256'h0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF),
    .INIT_7B(256'h00003FFF00003FFF00003FFF00003FFF00007FFF00007FFF00007FFF00007FFF),
    .INIT_7C(256'h00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF),
    .INIT_7D(256'h00007FFF00007FFF00007FFF00003FFF00003FFF00003FFF00003FFF00001FFF),
    .INIT_7E(256'h0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF),
    .INIT_7F(256'h00003FFF00003FFF00007FFF00007FFF0000FFFF0000FFFF0000FFFF0000FFFF),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("LOWER"),
    .RAM_EXTENSION_B("LOWER"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(1),
    .READ_WIDTH_B(1),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(1),
    .WRITE_WIDTH_B(1)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B 
       (.ADDRARDADDR(addra),
        .ADDRBWRADDR(addrb),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(CASCADEINA),
        .CASCADEOUTB(CASCADEINB),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clkb),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOADO_UNCONNECTED [31:0]),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ENA),
        .ENBWREN(ENB),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(enb),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(1),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h00007FFF00007FFF00003FFF00003FFF00003FFF00003FFF00007FFF00007FFF),
    .INIT_01(256'h0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF00007FFF00007FFF),
    .INIT_02(256'h0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF),
    .INIT_03(256'h00001FFF00003FFF00003FFF00003FFF00007FFF00007FFF00007FFF00007FFF),
    .INIT_04(256'h00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF),
    .INIT_05(256'h00007FFF00003FFF00003FFF00003FFF00003FFF00001FFF00001FFF00001FFF),
    .INIT_06(256'h0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF),
    .INIT_07(256'h00003FFF00003FFF00007FFF00007FFF0000FFFF0000FFFF0000FFFF0000FFFF),
    .INIT_08(256'h00007FFF00003FFF00003FFF00003FFF00003FFF00007FFF00007FFF00007FFF),
    .INIT_09(256'h0000FFFF0000FFFF0000FFFF00007FFF00007FFF00007FFF00007FFF00007FFF),
    .INIT_0A(256'h0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF),
    .INIT_0B(256'h00001FFF00003FFF00003FFF00003FFF00007FFF00007FFF00007FFF00007FFF),
    .INIT_0C(256'h00000FFF00000FFF00000FFF00000FFF00000FFF00001FFF00001FFF00001FFF),
    .INIT_0D(256'h00003FFF00003FFF00003FFF00001FFF00001FFF00001FFF00001FFF00000FFF),
    .INIT_0E(256'h0000FFFF0000FFFF0000FFFF0000FFFF00007FFF00007FFF00007FFF00007FFF),
    .INIT_0F(256'h00003FFF00003FFF00007FFF00007FFF00007FFF0000FFFF0000FFFF0000FFFF),
    .INIT_10(256'h00003FFF00003FFF00003FFF00003FFF00003FFF00007FFF00007FFF00007FFF),
    .INIT_11(256'h0000FFFF00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF00003FFF),
    .INIT_12(256'h0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF),
    .INIT_13(256'h00001FFF00001FFF00003FFF00003FFF00003FFF00007FFF00007FFF00007FFF),
    .INIT_14(256'h00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00001FFF),
    .INIT_15(256'h00003FFF00001FFF00001FFF00001FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_16(256'h0000FFFF0000FFFF0000FFFF00007FFF00007FFF00007FFF00003FFF00003FFF),
    .INIT_17(256'h00003FFF00003FFF00007FFF00007FFF00007FFF0000FFFF0000FFFF0000FFFF),
    .INIT_18(256'h00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00007FFF00007FFF),
    .INIT_19(256'h00007FFF00007FFF00007FFF00007FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_1A(256'h00007FFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00007FFF),
    .INIT_1B(256'h00001FFF00001FFF00003FFF00003FFF00003FFF00007FFF00007FFF00007FFF),
    .INIT_1C(256'h000007FF000007FF000007FF00000FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_1D(256'h00001FFF00001FFF00001FFF00000FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_1E(256'h0000FFFF00007FFF00007FFF00007FFF00007FFF00003FFF00003FFF00003FFF),
    .INIT_1F(256'h00003FFF00003FFF00003FFF00007FFF00007FFF00007FFF00007FFF0000FFFF),
    .INIT_20(256'h00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00007FFF00007FFF),
    .INIT_21(256'h00007FFF00007FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_22(256'h00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF),
    .INIT_23(256'h00001FFF00001FFF00001FFF00003FFF00003FFF00003FFF00007FFF00007FFF),
    .INIT_24(256'h000007FF000007FF000007FF000007FF000007FF00000FFF00000FFF00000FFF),
    .INIT_25(256'h00001FFF00001FFF00000FFF00000FFF00000FFF000007FF000007FF000007FF),
    .INIT_26(256'h00007FFF00007FFF00007FFF00007FFF00003FFF00003FFF00003FFF00001FFF),
    .INIT_27(256'h00003FFF00003FFF00003FFF00007FFF00007FFF00007FFF00007FFF00007FFF),
    .INIT_28(256'h00001FFF00001FFF00001FFF00003FFF00003FFF00003FFF00003FFF00007FFF),
    .INIT_29(256'h00003FFF00003FFF00003FFF00003FFF00003FFF00001FFF00001FFF00001FFF),
    .INIT_2A(256'h00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF00007FFF),
    .INIT_2B(256'h00000FFF00001FFF00001FFF00001FFF00003FFF00003FFF00003FFF00007FFF),
    .INIT_2C(256'h000007FF000007FF000007FF000007FF000007FF000007FF00000FFF00000FFF),
    .INIT_2D(256'h00001FFF00000FFF00000FFF00000FFF000007FF000007FF000007FF000007FF),
    .INIT_2E(256'h00007FFF00007FFF00007FFF00007FFF00003FFF00003FFF00003FFF00001FFF),
    .INIT_2F(256'h00001FFF00003FFF00003FFF00003FFF00007FFF00007FFF00007FFF00007FFF),
    .INIT_30(256'h00001FFF00001FFF00001FFF00001FFF00003FFF00003FFF00003FFF00007FFF),
    .INIT_31(256'h00003FFF00003FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF),
    .INIT_32(256'h00003FFF00007FFF00007FFF00007FFF00007FFF00003FFF00003FFF00003FFF),
    .INIT_33(256'h00000FFF00000FFF00001FFF00001FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_34(256'h000007FF000007FF000007FF000007FF000007FF000007FF00000FFF00000FFF),
    .INIT_35(256'h00001FFF00000FFF00000FFF00000FFF000007FF000007FF000007FF000007FF),
    .INIT_36(256'h00007FFF00007FFF00007FFF00003FFF00003FFF00003FFF00001FFF00001FFF),
    .INIT_37(256'h00001FFF00001FFF00003FFF00003FFF00003FFF00003FFF00007FFF00007FFF),
    .INIT_38(256'h00000FFF00001FFF00001FFF00001FFF00001FFF00003FFF00003FFF00003FFF),
    .INIT_39(256'h00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00000FFF00000FFF),
    .INIT_3A(256'h00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_3B(256'h00000FFF00000FFF00001FFF00001FFF00001FFF00003FFF00003FFF00003FFF),
    .INIT_3C(256'h000007FF000007FF000007FF000007FF000007FF000007FF000007FF00000FFF),
    .INIT_3D(256'h00001FFF00000FFF00000FFF00000FFF000007FF000007FF000007FF000007FF),
    .INIT_3E(256'h00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00001FFF00001FFF),
    .INIT_3F(256'h00001FFF00001FFF00001FFF00003FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_40(256'h00000FFF00000FFF00000FFF00001FFF00001FFF00001FFF00003FFF00003FFF),
    .INIT_41(256'h00001FFF00001FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_42(256'h00003FFF00003FFF00003FFF00003FFF00003FFF00001FFF00001FFF00001FFF),
    .INIT_43(256'h00000FFF00000FFF00000FFF00001FFF00001FFF00001FFF00001FFF00003FFF),
    .INIT_44(256'h000007FF000007FF000007FF000007FF000007FF000007FF000007FF00000FFF),
    .INIT_45(256'h00001FFF00000FFF00000FFF00000FFF000007FF000007FF000007FF000007FF),
    .INIT_46(256'h00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00001FFF00001FFF),
    .INIT_47(256'h00001FFF00001FFF00001FFF00001FFF00001FFF00003FFF00003FFF00003FFF),
    .INIT_48(256'h00000FFF00000FFF00000FFF00000FFF00001FFF00001FFF00003FFF00003FFF),
    .INIT_49(256'h00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_4A(256'h00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF),
    .INIT_4B(256'h00000FFF00000FFF00000FFF00001FFF00001FFF00001FFF00001FFF00001FFF),
    .INIT_4C(256'h000007FF000007FF000007FF000007FF000007FF000007FF000007FF00000FFF),
    .INIT_4D(256'h00001FFF00000FFF00000FFF00000FFF00000FFF000007FF000007FF000007FF),
    .INIT_4E(256'h00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00001FFF00001FFF),
    .INIT_4F(256'h00000FFF00000FFF00001FFF00001FFF00001FFF00001FFF00003FFF00003FFF),
    .INIT_50(256'h000007FF000007FF00000FFF00000FFF00000FFF00001FFF00001FFF00003FFF),
    .INIT_51(256'h00000FFF00000FFF00000FFF000007FF000007FF000007FF000007FF000007FF),
    .INIT_52(256'h00001FFF00001FFF00001FFF00001FFF00001FFF00000FFF00000FFF00000FFF),
    .INIT_53(256'h00000FFF00000FFF00000FFF00000FFF00001FFF00001FFF00001FFF00001FFF),
    .INIT_54(256'h000007FF000007FF000007FF000007FF000007FF000007FF000007FF00000FFF),
    .INIT_55(256'h00001FFF00001FFF00000FFF00000FFF00000FFF00000FFF00000FFF000007FF),
    .INIT_56(256'h00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00001FFF00001FFF),
    .INIT_57(256'h00000FFF00000FFF00000FFF00001FFF00001FFF00001FFF00001FFF00001FFF),
    .INIT_58(256'h000007FF000007FF000007FF00000FFF00000FFF00001FFF00001FFF00003FFF),
    .INIT_59(256'h000007FF000007FF000007FF000007FF000007FF000007FF000007FF000007FF),
    .INIT_5A(256'h00001FFF00001FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_5B(256'h00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00001FFF00001FFF),
    .INIT_5C(256'h00000FFF000007FF000007FF000007FF000007FF000007FF00000FFF00000FFF),
    .INIT_5D(256'h00001FFF00001FFF00001FFF00001FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_5E(256'h00001FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00001FFF),
    .INIT_5F(256'h00000FFF00000FFF00000FFF00000FFF00000FFF00001FFF00001FFF00001FFF),
    .INIT_60(256'h000007FF000007FF000007FF000007FF00000FFF00000FFF00001FFF00001FFF),
    .INIT_61(256'h000007FF000007FF000007FF000007FF000007FF000003FF000003FF000003FF),
    .INIT_62(256'h00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF000007FF000007FF),
    .INIT_63(256'h00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_64(256'h00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_65(256'h00003FFF00001FFF00001FFF00001FFF00001FFF00001FFF00000FFF00000FFF),
    .INIT_66(256'h00001FFF00001FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_67(256'h000007FF00000FFF00000FFF00000FFF00000FFF00000FFF00001FFF00001FFF),
    .INIT_68(256'h000003FF000007FF000007FF000007FF00000FFF00000FFF00001FFF00001FFF),
    .INIT_69(256'h000007FF000003FF000003FF000003FF000003FF000003FF000003FF000003FF),
    .INIT_6A(256'h00000FFF00000FFF00000FFF000007FF000007FF000007FF000007FF000007FF),
    .INIT_6B(256'h00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_6C(256'h00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_6D(256'h00003FFF00003FFF00003FFF00001FFF00001FFF00001FFF00001FFF00001FFF),
    .INIT_6E(256'h00001FFF00001FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_6F(256'h000007FF000007FF000007FF00000FFF00000FFF00000FFF00000FFF00001FFF),
    .INIT_70(256'h000003FF000003FF000007FF000007FF000007FF00000FFF00000FFF00001FFF),
    .INIT_71(256'h000003FF000003FF000003FF000003FF000003FF000003FF000003FF000003FF),
    .INIT_72(256'h000007FF000007FF000007FF000007FF000007FF000007FF000007FF000003FF),
    .INIT_73(256'h00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_74(256'h00001FFF00001FFF00001FFF00000FFF00000FFF00000FFF00000FFF00000FFF),
    .INIT_75(256'h00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF00001FFF00001FFF),
    .INIT_76(256'h00001FFF00001FFF00003FFF00003FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_77(256'h000007FF000007FF000007FF000007FF00000FFF00000FFF00000FFF00001FFF),
    .INIT_78(256'h000003FF000003FF000003FF000007FF000007FF00000FFF00000FFF00001FFF),
    .INIT_79(256'h000003FF000003FF000003FF000003FF000003FF000003FF000003FF000003FF),
    .INIT_7A(256'h000007FF000007FF000007FF000007FF000003FF000003FF000003FF000003FF),
    .INIT_7B(256'h00000FFF00000FFF00000FFF00000FFF00000FFF00000FFF000007FF000007FF),
    .INIT_7C(256'h00001FFF00001FFF00001FFF00001FFF00001FFF00001FFF00000FFF00000FFF),
    .INIT_7D(256'h00007FFF00007FFF00007FFF00003FFF00003FFF00003FFF00003FFF00003FFF),
    .INIT_7E(256'h00001FFF00001FFF00003FFF00003FFF00003FFF00003FFF00007FFF00007FFF),
    .INIT_7F(256'h000007FF000007FF000007FF000007FF000007FF00000FFF00000FFF00000FFF),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("UPPER"),
    .RAM_EXTENSION_B("UPPER"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(1),
    .READ_WIDTH_B(1),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(1),
    .WRITE_WIDTH_B(1)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T 
       (.ADDRARDADDR(addra),
        .ADDRBWRADDR(addrb),
        .CASCADEINA(CASCADEINA),
        .CASCADEINB(CASCADEINB),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clkb),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOADO_UNCONNECTED [31:0]),
        .DOBDO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOBDO_UNCONNECTED [31:1],DOUTB}),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ENA),
        .ENBWREN(ENB),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(enb),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized1
   (DOUTB,
    clka,
    clkb,
    ENA,
    ENB,
    enb,
    addra,
    addrb,
    dina,
    wea);
  output [0:0]DOUTB;
  input clka;
  input clkb;
  input ENA;
  input ENB;
  input enb;
  input [15:0]addra;
  input [15:0]addrb;
  input [0:0]dina;
  input [0:0]wea;

  wire CASCADEINA;
  wire CASCADEINB;
  wire [0:0]DOUTB;
  wire ENA;
  wire ENB;
  wire [15:0]addra;
  wire [15:0]addrb;
  wire clka;
  wire clkb;
  wire [0:0]dina;
  wire enb;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_RDADDRECC_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOADO_UNCONNECTED ;
  wire [31:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(1),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_01(256'h00003FFC00003FFC00003FFC00007FFC00007FFC0000FFFC0000FFFC0000FFFC),
    .INIT_02(256'h00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC),
    .INIT_03(256'h0000FFFC0000FFFC00007FFC00007FFC00003FFC00003FFC00001FFC00001FFC),
    .INIT_04(256'h0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0000FFFC),
    .INIT_05(256'h00003FFC00003FFC00003FFC00007FFC00007FFC0000FFFC0000FFFC0001FFFC),
    .INIT_06(256'h00000FFC00000FFC00000FFC00000FFC00001FFC000C1FFC000C1FFC000C1FFC),
    .INIT_07(256'h00000FFC00000FFC00000FFC00000FFC00000FFC00000FFC00000FFC00000FFC),
    .INIT_08(256'h0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC00007FFC00007FFC00007FFC),
    .INIT_09(256'h00001FFC00003FFC00003FFC00007FFC00007FFC00007FFC00007FFC0000FFFC),
    .INIT_0A(256'h00001FFC00001FFC00001FFC00000FFC00001FFC00001FFC000C1FFC00001FFC),
    .INIT_0B(256'h0000FFFC0000FFFC00007FFC00007FFC00003FFC00003FFC00003FFC00001FFC),
    .INIT_0C(256'h0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_0D(256'h000C1FFC00003FFC00003FFC00007FFC00007FFC0000FFFC0000FFFC0001FFFC),
    .INIT_0E(256'h00001FFC00000FFC00000FFC00000FFC000C1FFC000C1FFC000C1FFC000C1FFC),
    .INIT_0F(256'h00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC),
    .INIT_10(256'h00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC00003FFC),
    .INIT_11(256'h00001FFC00003FFC00003FFC00003FFC00007FFC00007FFC00007FFC00007FFC),
    .INIT_12(256'h00001FFC00001FFC00001FFC00000FFC00000FFC000C1FFC000C1FFC000C1FFC),
    .INIT_13(256'h0000FFFC0000FFFC00007FFC00007FFC00003FFC00003FFC00003FFC00001FFC),
    .INIT_14(256'h0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_15(256'h00001FFC00003FFC00003FFC00007FFC00007FFC0000FFFC0000FFFC0001FFFC),
    .INIT_16(256'h00001FFC00001FFC00001FFC00001FFC00001FFC000C1FFC000C1FFC000C1FFC),
    .INIT_17(256'h00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC),
    .INIT_18(256'h00007FFC00007FFC00007FFC00007FFC00007FFC00003FFC00003FFC00003FFC),
    .INIT_19(256'h000C1FFC00001FFC00003FFC00003FFC00003FFC00007FFC00007FFC00007FFC),
    .INIT_1A(256'h00001FFC00001FFC00001FFC00000FFC000C0FFC000C0FFC000C1FFC000C1FFC),
    .INIT_1B(256'h0000FFFC0000FFFC0000FFFC00007FFC00007FFC00003FFC00003FFC00001FFC),
    .INIT_1C(256'h0001FFFC0001FFFC0001FFFC0003FFFC0003FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_1D(256'h00001FFC00003FFC00003FFC00007FFC00007FFC0000FFFC0000FFFC0001FFFC),
    .INIT_1E(256'h00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC000C1FFC00001FFC),
    .INIT_1F(256'h00001FFC00003FFC00003FFC00001FFC00001FFC00001FFC00001FFC00001FFC),
    .INIT_20(256'h00007FFC00007FFC00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC),
    .INIT_21(256'h00001FFC00001FFC00001FFC00003FFC00003FFC00003FFC00003FFC00007FFC),
    .INIT_22(256'h00001FFC00001FFC00001FFC00000FFC00000FFC000C0FFC000C1FFC000C1FFC),
    .INIT_23(256'h0001FFFC0000FFFC0000FFFC00007FFC00007FFC00003FFC00003FFC00001FFC),
    .INIT_24(256'h0001FFFC0001FFFC0003FFFC0003FFFC0003FFFC0003FFFC0001FFFC0001FFFC),
    .INIT_25(256'h00001FFC00003FFC00003FFC00007FFC00007FFC0000FFFC0000FFFC0001FFFC),
    .INIT_26(256'h00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC),
    .INIT_27(256'h00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC00001FFC),
    .INIT_28(256'h00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC00001FFC00001FFC),
    .INIT_29(256'h00001FFC00001FFC00001FFC00003FFC00003FFC00003FFC00003FFC00003FFC),
    .INIT_2A(256'h00001FFC00001FFC00001FFC00000FFC00000FFC00000FFC000C1FFC00001FFC),
    .INIT_2B(256'h0001FFFC0000FFFC0000FFFC00007FFC00007FFC00003FFC00003FFC00003FFC),
    .INIT_2C(256'h0001FFFC0001FFFC0003FFFC0003FFFC0003FFFC0183FFFC0001FFFC0001FFFC),
    .INIT_2D(256'h00001FFC00001FFC00003FFC00003FFC00007FFC00007FFC0000FFFC0001FFFC),
    .INIT_2E(256'h00003FFC00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC),
    .INIT_2F(256'h00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC),
    .INIT_30(256'h00003FFC00003FFC00003FFC00003FFC00003FFC00001FFC00001FFC00001FFC),
    .INIT_31(256'h00001FFC00001FFC00001FFC00001FFC00003FFC00003FFC00003FFC00003FFC),
    .INIT_32(256'h00001FFC00001FFC00001FFC00001FFC00000FFC00000FFC00001FFC00001FFC),
    .INIT_33(256'h0001FFFC0001FFFC0000FFFC0000FFFC00007FFC00007FFC00003FFC00003FFC),
    .INIT_34(256'h0001FFFC0001FFFC0003FFFC0003FFFC0183FFFC0183FFFC0183FFFC0001FFFC),
    .INIT_35(256'h00001FFC00001FFC00003FFC00003FFC00007FFC00007FFC0000FFFC0000FFFC),
    .INIT_36(256'h00003FFC00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC),
    .INIT_37(256'h00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC00003FFC00003FFC),
    .INIT_38(256'h00003FFC00003FFC00003FFC00003FFC00001FFC00001FFC00001FFC00001FFC),
    .INIT_39(256'h00001FFC00001FFC00001FFC00001FFC00003FFC00003FFC00003FFC00003FFC),
    .INIT_3A(256'h00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC),
    .INIT_3B(256'h0001FFFC0001FFFC0000FFFC0000FFFC00007FFC00007FFC00003FFC00003FFC),
    .INIT_3C(256'h0001FFFC0001FFFC0003FFFC0183FFFC0183FFFC0183FFFC0183FFFC0181FFFC),
    .INIT_3D(256'h00001FFC00001FFC00003FFC00003FFC00007FFC00007FFC0000FFFC0000FFFC),
    .INIT_3E(256'h00003FFC00003FFC00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC),
    .INIT_3F(256'h00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC00003FFC),
    .INIT_40(256'h00003FFC00003FFC00003FFC00001FFC00001FFC00001FFC00001FFC00001FFC),
    .INIT_41(256'h00001FFC00001FFC00001FFC00003FFC00003FFC00003FFC00003FFC00003FFC),
    .INIT_42(256'h00003FFC00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC),
    .INIT_43(256'h0001FFFC0001FFFC0000FFFC0000FFFC00007FFC00007FFC00003FFC00003FFC),
    .INIT_44(256'h0001FFFC0001FFFC0003FFFC0003FFFC0183FFFC0183FFFC0183FFFC0003FFFC),
    .INIT_45(256'h00001FFC00001FFC00003FFC00183FFC00007FFC00007FFC0000FFFC0000FFFC),
    .INIT_46(256'h00003FFC00003FFC00003FFC00001FFC00001FFC00001FFC00001FFC00001FFC),
    .INIT_47(256'h0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC00007FFC00007FFC00007FFC),
    .INIT_48(256'h00003FFC00003FFC00003FFC00001FFC00001FFC00001FFC00001FFC00000FFC),
    .INIT_49(256'h00001FFC00001FFC00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC),
    .INIT_4A(256'h00003FFC00003FFC00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC),
    .INIT_4B(256'h0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC00007FFC00007FFC00003FFC),
    .INIT_4C(256'h0001FFFC0001FFFC0003FFFC0003FFFC0003FFFC0183FFFC0003FFFC0003FFFC),
    .INIT_4D(256'h00001FFC00001FFC00183FFC00183FFC00187FFC00007FFC0000FFFC0000FFFC),
    .INIT_4E(256'h00007FFC00003FFC00003FFC00001FFC00001FFC00001FFC00001FFC00001FFC),
    .INIT_4F(256'h0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC00007FFC00007FFC),
    .INIT_50(256'h00003FFC00003FFC00003FFC00001FFC00001FFC00001FFC00001FFC00000FFC),
    .INIT_51(256'h00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC),
    .INIT_52(256'h00003FFC00003FFC00003FFC00001FFC00001FFC00001FFC00001FFC00001FFC),
    .INIT_53(256'h0003FFFC0001FFFC0001FFFC0000FFFC0000FFFC00007FFC00007FFC00007FFC),
    .INIT_54(256'h0001FFFC0001FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_55(256'h00001FFC00181FFC00183FFC00183FFC00183FFC00187FFC0000FFFC0000FFFC),
    .INIT_56(256'h00007FFC00003FFC00003FFC00001FFC00001FFC00001FFC00001FFC00001FFC),
    .INIT_57(256'h0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC0000FFFC00007FFC),
    .INIT_58(256'h00003FFC00003FFC00003FFC00001FFC00001FFC00001FFC00001FFC00001FFC),
    .INIT_59(256'h00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC),
    .INIT_5A(256'h00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC),
    .INIT_5B(256'h0003FFFC0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC00007FFC00007FFC),
    .INIT_5C(256'h0001FFFC0001FFFC0001FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_5D(256'h00001FFC00001FFC00181FFC00183FFC00183FFC00007FFC00007FFC0000FFFC),
    .INIT_5E(256'h00007FFC00003FFC00003FFC00003FFC00001FFC00001FFC00001FFC00001FFC),
    .INIT_5F(256'h0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC00007FFC),
    .INIT_60(256'h00003FFC00003FFC00003FFC00003FFC00001FFC00001FFC00001FFC00001FFC),
    .INIT_61(256'h00003FFC00003FFC00007FFC00007FFC00007FFC00007FFC00007FFC00003FFC),
    .INIT_62(256'h00007FFC00007FFC00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC),
    .INIT_63(256'h0003FFFC0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC00007FFC00007FFC),
    .INIT_64(256'h0000FFFC0001FFFC0001FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_65(256'h00001FFC00001FFC00001FFC00183FFC00003FFC00007FFC00007FFC0000FFFC),
    .INIT_66(256'h00007FFC00007FFC00003FFC00003FFC00001FFC00001FFC00001FFC00001FFC),
    .INIT_67(256'h0003FFFC0003FFFC0181FFFC0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC),
    .INIT_68(256'h00007FFC00003FFC00003FFC00003FFC00001FFC00001FFC00001FFC00001FFC),
    .INIT_69(256'h00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC),
    .INIT_6A(256'h00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC),
    .INIT_6B(256'h0003FFFC0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC00007FFC),
    .INIT_6C(256'h0000FFFC0001FFFC0001FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_6D(256'h00001FFC00001FFC00001FFC00003FFC00003FFC00007FFC00007FFC0000FFFC),
    .INIT_6E(256'h00007FFC00007FFC00003FFC00003FFC00003FFC00001FFC00001FFC00001FFC),
    .INIT_6F(256'h0003FFFC0183FFFC0183FFFC0181FFFC0001FFFC0001FFFC0000FFFC0000FFFC),
    .INIT_70(256'h00007FFC00007FFC00003FFC00003FFC00003FFC00001FFC00001FFC00001FFC),
    .INIT_71(256'h00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC),
    .INIT_72(256'h00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC),
    .INIT_73(256'h0003FFFC0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_74(256'h0000FFFC0001FFFC0001FFFC0001FFFC0003FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_75(256'h00001FFC00001FFC00001FFC00003FFC00003FFC00007FFC00007FFC0000FFFC),
    .INIT_76(256'h0000FFFC00007FFC00007FFC00003FFC00003FFC00001FFC00001FFC00001FFC),
    .INIT_77(256'h0183FFFC0183FFFC0183FFFC0183FFFC0181FFFC0001FFFC0001FFFC0000FFFC),
    .INIT_78(256'h00007FFC00007FFC00003FFC00003FFC00003FFC00003FFC00001FFC00001FFC),
    .INIT_79(256'h0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC00007FFC),
    .INIT_7A(256'h0000FFFC0000FFFC00007FFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_7B(256'h0001FFFC0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_7C(256'h0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_7D(256'h00001FFC00001FFC00001FFC00003FFC00003FFC00007FFC00007FFC0000FFFC),
    .INIT_7E(256'h0000FFFC00007FFC00007FFC00003FFC00003FFC00003FFC00001FFC00001FFC),
    .INIT_7F(256'h0003FFFC0183FFFC0183FFFC0183FFFC0003FFFC0001FFFC0001FFFC0000FFFC),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("LOWER"),
    .RAM_EXTENSION_B("LOWER"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(1),
    .READ_WIDTH_B(1),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(1),
    .WRITE_WIDTH_B(1)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B 
       (.ADDRARDADDR(addra),
        .ADDRBWRADDR(addrb),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(CASCADEINA),
        .CASCADEOUTB(CASCADEINB),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clkb),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOADO_UNCONNECTED [31:0]),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ENA),
        .ENBWREN(ENB),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(enb),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(1),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h00007FFC00007FFC00007FFC00003FFC00003FFC00003FFC00003FFC00001FFC),
    .INIT_01(256'h0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_02(256'h0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_03(256'h0001FFFC0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_04(256'h0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_05(256'h00001FFC00001FFC00003FFC00003FFC00003FFC00007FFC00007FFC00007FFC),
    .INIT_06(256'h0000FFFC00007FFC00007FFC00003FFC00003FFC00003FFC00001FFC00001FFC),
    .INIT_07(256'h0007FFFC0003FFFC0183FFFC0003FFFC0003FFFC0001FFFC0001FFFC0000FFFC),
    .INIT_08(256'h0000FFFC00007FFC00007FFC00007FFC00003FFC00003FFC00003FFC00003FFC),
    .INIT_09(256'h0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_0A(256'h0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_0B(256'h0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_0C(256'h0000FFFC0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_0D(256'h00001FFC00001FFC00003FFC00003FFC00003FFC00003FFC00007FFC00007FFC),
    .INIT_0E(256'h0000FFFC0000FFFC00007FFC00007FFC00003FFC00003FFC00003FFC00003FFC),
    .INIT_0F(256'h0007FFFC0007FFFC0003FFFC0003FFFC0003FFFC0003FFFC0001FFFC0001FFFC),
    .INIT_10(256'h0000FFFC00007FFC00007FFC00007FFC00003FFC00003FFC00003FFC00003FFC),
    .INIT_11(256'h0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0000FFFC),
    .INIT_12(256'h0000FFFC0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_13(256'h0001FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_14(256'h0000FFFC0000FFFC0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_15(256'h00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC00007FFC00007FFC),
    .INIT_16(256'h0000FFFC0000FFFC00007FFC00007FFC00007FFC00003FFC00003FFC00003FFC),
    .INIT_17(256'h0007FFFC0007FFFC0003FFFC0003FFFC0003FFFC0003FFFC0001FFFC0001FFFC),
    .INIT_18(256'h0000FFFC0000FFFC00007FFC00007FFC00003FFC00003FFC00003FFC00003FFC),
    .INIT_19(256'h0003FFFC0003FFFC0003FFFC0001FFFC0001FFFC0001FFFC0001FFFC0000FFFC),
    .INIT_1A(256'h0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0003FFFC),
    .INIT_1B(256'h0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_1C(256'h00007FFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_1D(256'h00003FFC00003FFC00003FFC00003FFC00003FFC00007FFC00007FFC00307FFC),
    .INIT_1E(256'h0000FFFC0000FFFC0000FFFC00007FFC00007FFC00003FFC00003FFC00003FFC),
    .INIT_1F(256'h0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0001FFFC0001FFFC),
    .INIT_20(256'h0000FFFC0000FFFC00007FFC00007FFC00007FFC00003FFC00003FFC00003FFC),
    .INIT_21(256'h0003FFFC0003FFFC0003FFFC0003FFFC0001FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_22(256'h0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC0001FFFC0003FFFC0003FFFC),
    .INIT_23(256'h0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_24(256'h00307FFC0030FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_25(256'h00003FFC00003FFC00003FFC00003FFC00003FFC00007FFC00307FFC00307FFC),
    .INIT_26(256'h0001FFFC0000FFFC0000FFFC00007FFC00007FFC00007FFC00003FFC00003FFC),
    .INIT_27(256'h0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0001FFFC0001FFFC),
    .INIT_28(256'h0000FFFC0000FFFC00007FFC00007FFC00007FFC00003FFC00003FFC00003FFC),
    .INIT_29(256'h0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0001FFFC0001FFFC00C1FFFC),
    .INIT_2A(256'h0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_2B(256'h0000FFFC00007FFC00007FFC00307FFC00007FFC00007FFC0000FFFC0000FFFC),
    .INIT_2C(256'h00307FFC00307FFC0030FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_2D(256'h00003FFC00003FFC00003FFC00003FFC00007FFC00307FFC00307FFC00307FFC),
    .INIT_2E(256'h0001FFFC0000FFFC0000FFFC0000FFFC00007FFC00007FFC00007FFC00007FFC),
    .INIT_2F(256'h0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0001FFFC0001FFFC),
    .INIT_30(256'h00C0FFFC0000FFFC00007FFC00007FFC00003FFC00003FFC00003FFC00003FFC),
    .INIT_31(256'h0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0001FFFC00C1FFFC00C1FFFC),
    .INIT_32(256'h0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_33(256'h00007FFC00007FFC00307FFC00307FFC00307FFC00007FFC00007FFC0000FFFC),
    .INIT_34(256'h00307FFC00307FFC00307FFC00307FFC00007FFC00307FFC00007FFC00007FFC),
    .INIT_35(256'h00007FFC00007FFC00007FFC00007FFC00007FFC00307FFC00307FFC00307FFC),
    .INIT_36(256'h0001FFFC0000FFFC0000FFFC0000FFFC0000FFFC00007FFC00007FFC00007FFC),
    .INIT_37(256'h0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0001FFFC0001FFFC),
    .INIT_38(256'h00C0FFFC00C0FFFC00007FFC00007FFC00003FFC00003FFC00003FFC000C3FFC),
    .INIT_39(256'h0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC00C1FFFC00C1FFFC00C1FFFC),
    .INIT_3A(256'h0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_3B(256'h00007FFC00307FFC00307FFC00307FFC00307FFC00307FFC00007FFC0000FFFC),
    .INIT_3C(256'h00307FFC00307FFC00307FFC00007FFC00307FFC00307FFC00307FFC00007FFC),
    .INIT_3D(256'h00007FFC00007FFC00007FFC00007FFC00307FFC00307FFC00307FFC00307FFC),
    .INIT_3E(256'h0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC0000FFFC00007FFC00007FFC),
    .INIT_3F(256'h0001FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0001FFFC0001FFFC),
    .INIT_40(256'h00C0FFFC00007FFC00007FFC00007FFC00003FFC00003FFC000C3FFC000C3FFC),
    .INIT_41(256'h0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0001FFFC00C1FFFC00C0FFFC),
    .INIT_42(256'h0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_43(256'h00003FFC00003FFC00303FFC00303FFC00303FFC00007FFC00007FFC00007FFC),
    .INIT_44(256'h00007FFC00307FFC00007FFC00307FFC00307FFC00307FFC00307FFC00307FFC),
    .INIT_45(256'h00007FFC00007FFC00007FFC00007FFC00007FFC00307FFC00307FFC00307FFC),
    .INIT_46(256'h0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_47(256'h0001FFFC0001FFFC0001FFFC0003FFFC0003FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_48(256'h0000FFFC00007FFC00007FFC00003FFC00003FFC000C3FFC000C1FFC000C1FFC),
    .INIT_49(256'h0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0001FFFC0001FFFC00C0FFFC),
    .INIT_4A(256'h00007FFC0000FFFC0000FFFC0001FFFC0001FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_4B(256'h00003FFC00003FFC00003FFC00303FFC00003FFC00003FFC00007FFC00007FFC),
    .INIT_4C(256'h00007FFC00007FFC00007FFC00007FFC00307FFC00307FFC00303FFC00003FFC),
    .INIT_4D(256'h0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0030FFFC00007FFC),
    .INIT_4E(256'h0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_4F(256'h0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_50(256'h0000FFFC00007FFC00007FFC00003FFC00003FFC00003FFC000C1FFC000C1FFC),
    .INIT_51(256'h0003FFFC0003FFFC0003FFFC0003FFFC0001FFFC0001FFFC0001FFFC0000FFFC),
    .INIT_52(256'h00007FFC0000FFFC0000FFFC0001FFFC0001FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_53(256'h00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC00007FFC),
    .INIT_54(256'h0000FFFC00007FFC00007FFC00007FFC00007FFC00307FFC00003FFC00003FFC),
    .INIT_55(256'h0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_56(256'h0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC),
    .INIT_57(256'h0000FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_58(256'h00007FFC00007FFC00003FFC00003FFC00003FFC00001FFC00001FFC000C1FFC),
    .INIT_59(256'h0003FFFC0003FFFC0003FFFC0003FFFC0001FFFC0001FFFC0000FFFC0000FFFC),
    .INIT_5A(256'h00007FFC00007FFC0000FFFC0000FFFC0001FFFC0001FFFC0003FFFC0003FFFC),
    .INIT_5B(256'h00003FFC00001FFC00001FFC00001FFC00003FFC00003FFC00003FFC00007FFC),
    .INIT_5C(256'h0000FFFC0000FFFC00007FFC00007FFC00007FFC00003FFC00003FFC00003FFC),
    .INIT_5D(256'h0001FFFC0001FFFC00C1FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_5E(256'h0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_5F(256'h0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_60(256'h00007FFC00007FFC00003FFC00003FFC00001FFC00001FFC00001FFC00001FFC),
    .INIT_61(256'h0003FFFC0003FFFC0003FFFC0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC),
    .INIT_62(256'h00007FFC00007FFC0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC0003FFFC),
    .INIT_63(256'h00001FFC00001FFC00001FFC00001FFC00001FFC00003FFC00003FFC00003FFC),
    .INIT_64(256'h0000FFFC0000FFFC00007FFC00007FFC00007FFC00003FFC00003FFC00003FFC),
    .INIT_65(256'h0001FFFC00C1FFFC00C1FFFC00C1FFFC0001FFFC0001FFFC0000FFFC0000FFFC),
    .INIT_66(256'h0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_67(256'h0000FFFC0000FFFC0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_68(256'h00007FFC00007FFC00003FFC00003FFC00001FFC00001FFC00001FFC00001FFC),
    .INIT_69(256'h0003FFFC0003FFFC0001FFFC0001FFFC0061FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_6A(256'h00007FFC00007FFC00007FFC0000FFFC0060FFFC0061FFFC0001FFFC0001FFFC),
    .INIT_6B(256'h00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00003FFC00003FFC),
    .INIT_6C(256'h0000FFFC0000FFFC0000FFFC00007FFC00007FFC00003FFC00003FFC00003FFC),
    .INIT_6D(256'h00C1FFFC00C1FFFC00C1FFFC00C1FFFC00C1FFFC0001FFFC0001FFFC0000FFFC),
    .INIT_6E(256'h0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_6F(256'h00007FFC0000FFFC0000FFFC0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_70(256'h00007FFC00003FFC00003FFC00001FFC00001FFC00001FFC00001FFC00000FFC),
    .INIT_71(256'h0001FFFC0001FFFC0001FFFC0061FFFC0061FFFC0060FFFC0000FFFC00007FFC),
    .INIT_72(256'h00003FFC00007FFC00007FFC0060FFFC0060FFFC0061FFFC0061FFFC0001FFFC),
    .INIT_73(256'h00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00003FFC),
    .INIT_74(256'h0000FFFC0000FFFC0000FFFC00007FFC00007FFC00003FFC00003FFC00003FFC),
    .INIT_75(256'h0003FFFC00C3FFFC00C3FFFC00C3FFFC0001FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_76(256'h0001FFFC0001FFFC0001FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_77(256'h00007FFC00007FFC0000FFFC0000FFFC0000FFFC0000FFFC0001FFFC0001FFFC),
    .INIT_78(256'h00007FFC00003FFC00003FFC00001FFC00001FFC00001FFC00000FFC00000FFC),
    .INIT_79(256'h0001FFFC0001FFFC0061FFFC0061FFFC0060FFFC0060FFFC0060FFFC00007FFC),
    .INIT_7A(256'h00003FFC00007FFC00607FFC0060FFFC0060FFFC0060FFFC0061FFFC0061FFFC),
    .INIT_7B(256'h00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00003FFC),
    .INIT_7C(256'h0001FFFC0000FFFC0000FFFC00007FFC00007FFC00007FFC00003FFC00003FFC),
    .INIT_7D(256'h0003FFFC0003FFFC00C3FFFC0003FFFC0003FFFC0003FFFC0001FFFC0001FFFC),
    .INIT_7E(256'h0001FFFC0001FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_7F(256'h00007FFC00007FFC00007FFC0000FFFC0000FFFC0000FFFC0001FFFC0001FFFC),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("UPPER"),
    .RAM_EXTENSION_B("UPPER"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(1),
    .READ_WIDTH_B(1),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(1),
    .WRITE_WIDTH_B(1)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T 
       (.ADDRARDADDR(addra),
        .ADDRBWRADDR(addrb),
        .CASCADEINA(CASCADEINA),
        .CASCADEINB(CASCADEINB),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clkb),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOADO_UNCONNECTED [31:0]),
        .DOBDO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOBDO_UNCONNECTED [31:1],DOUTB}),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ENA),
        .ENBWREN(ENB),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(enb),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized2
   (DOUTB,
    clka,
    clkb,
    ENA,
    ENB,
    enb,
    addra,
    addrb,
    dina,
    wea);
  output [0:0]DOUTB;
  input clka;
  input clkb;
  input ENA;
  input ENB;
  input enb;
  input [15:0]addra;
  input [15:0]addrb;
  input [0:0]dina;
  input [0:0]wea;

  wire CASCADEINA;
  wire CASCADEINB;
  wire [0:0]DOUTB;
  wire ENA;
  wire ENB;
  wire [15:0]addra;
  wire [15:0]addrb;
  wire clka;
  wire clkb;
  wire [0:0]dina;
  wire enb;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_RDADDRECC_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOADO_UNCONNECTED ;
  wire [31:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(1),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h00007FFC00003FFC00003FFC00001FFC00001FFC00001FFC00000FFC00000FFC),
    .INIT_01(256'h0001FFFC0001FFFC0001FFFC0061FFFC0060FFFC0060FFFC0000FFFC00007FFC),
    .INIT_02(256'h00003FFC00003FFC00007FFC00607FFC0060FFFC0060FFFC0061FFFC0001FFFC),
    .INIT_03(256'h00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00003FFC),
    .INIT_04(256'h0001FFFC0001FFFC0000FFFC0000FFFC00007FFC00007FFC00003FFC00003FFC),
    .INIT_05(256'h0007FFFC0007FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0001FFFC),
    .INIT_06(256'h0001FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0007FFFC),
    .INIT_07(256'h00003FFC00007FFC00007FFC0000FFFC0000FFFC0000FFFC0001FFFC0001FFFC),
    .INIT_08(256'h00003FFC00003FFC00003FFC00001FFC00001FFC00000FFC00000FFC00000FFC),
    .INIT_09(256'h0001FFFC0001FFFC0001FFFC0001FFFC0060FFFC0000FFFC00007FFC00007FFC),
    .INIT_0A(256'h00003FFC00003FFC00007FFC00007FFC0060FFFC0060FFFC0000FFFC0001FFFC),
    .INIT_0B(256'h00003FFC00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00003FFC),
    .INIT_0C(256'h0001FFFC0001FFFC0000FFFC0000FFFC00007FFC00007FFC00003FFC00003FFC),
    .INIT_0D(256'h0007FFFC0007FFFC0007FFFC0007FFFC0003FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_0E(256'h0001FFFC0003FFFC0003FFFC0003FFFC0003FFFC0007FFFC0007FFFC0007FFFC),
    .INIT_0F(256'h00003FFC00007FFC00007FFC0000FFFC0000FFFC0000FFFC0001FFFC0001FFFC),
    .INIT_10(256'h00003FFC00003FFC00003FFC00001FFC00001FFC00001FFC00000FFC00000FFC),
    .INIT_11(256'h0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC00007FFC00007FFC),
    .INIT_12(256'h00003FFC00003FFC00007FFC00007FFC0000FFFC0000FFFC0000FFFC0001FFFC),
    .INIT_13(256'h00003FFC00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00003FFC),
    .INIT_14(256'h0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC00007FFC00007FFC00003FFC),
    .INIT_15(256'h0007FFFC0007FFFC0007FFFC0007FFFC0007FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_16(256'h0001FFFC0003FFFC0003FFFC0003FFFC0007FFFC0007FFFC0007FFFC0007FFFC),
    .INIT_17(256'h00003FFC00007FFC00007FFC00007FFC0000FFFC0000FFFC0001FFFC0001FFFC),
    .INIT_18(256'h00007FFC00003FFC00003FFC00001FFC00001FFC00001FFC00000FFC00000FFC),
    .INIT_19(256'h0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC00007FFC00007FFC),
    .INIT_1A(256'h00003FFC00003FFC00007FFC00007FFC0000FFFC0000FFFC0000FFFC0001FFFC),
    .INIT_1B(256'h00003FFC00003FFC00001FFC00001FFC00001FFC00001FFC00001FFC00003FFC),
    .INIT_1C(256'h0003FFFC0001FFFC0001FFFC0000FFFC0000FFFC00007FFC00007FFC00003FFC),
    .INIT_1D(256'h0007FFFC0007FFFC0007FFFC0007FFFC0007FFFC0007FFFC0003FFFC0003FFFC),
    .INIT_1E(256'h0003FFFC0003FFFC0003FFFC0007FFFC0007FFFC0007FFFC0007FFFC0007FFFC),
    .INIT_1F(256'h00003FFC00007FFC00007FFC00007FFC0000FFFC0000FFFC0001FFFC0001FFFC),
    .INIT_20(256'h00007FFC00003FFC00003FFC00001FFC00001FFC00001FFC00001FFC00000FFC),
    .INIT_21(256'h0001FFFC0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC00007FFC),
    .INIT_22(256'h00003FFC00007FFC00007FFC00007FFC0000FFFC0000FFFC0001FFFC0001FFFC),
    .INIT_23(256'h00003FFC00003FFC00003FFC00001FFC00001FFC00001FFC00003FFC00003FFC),
    .INIT_24(256'h0003FFFC0001FFFC0001FFFC0000FFFC0000FFFC00007FFC00007FFC00003FFC),
    .INIT_25(256'h000FFFFC000FFFFC000FFFFC0007FFFC0007FFFC0007FFFC0007FFFC0003FFFC),
    .INIT_26(256'h0003FFFC0003FFFC0003FFFC0007FFFC0007FFFC0007FFFC0007FFFC000FFFFC),
    .INIT_27(256'h00003FFC00007FFC00007FFC0000FFFC0000FFFC0000FFFC0001FFFC0001FFFC),
    .INIT_28(256'h00007FFC00003FFC00003FFC00003FFC00001FFC00001FFC00001FFC00001FFC),
    .INIT_29(256'h0001FFFC0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC00007FFC),
    .INIT_2A(256'h00003FFC00007FFC00007FFC0000FFFC0000FFFC0000FFFC0001FFFC0001FFFC),
    .INIT_2B(256'h00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC),
    .INIT_2C(256'h0003FFFC0003FFFC0001FFFC0001FFFC0000FFFC0000FFFC00007FFC00007FFC),
    .INIT_2D(256'h000FFFFC000FFFFC000FFFFC000FFFFC0007FFFC0007FFFC0007FFFC0003FFFC),
    .INIT_2E(256'h0003FFFC0003FFFC0007FFFC0007FFFC0007FFFC0007FFFC000FFFFC000FFFFC),
    .INIT_2F(256'h00003FFC00007FFC00007FFC0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_30(256'h00007FFC00007FFC00303FFC00003FFC00003FFC00001FFC00001FFC00001FFC),
    .INIT_31(256'h0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC00007FFC),
    .INIT_32(256'h00007FFC00007FFC0000FFFC0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_33(256'h00007FFC00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC),
    .INIT_34(256'h0003FFFC0003FFFC0001FFFC0001FFFC0000FFFC0000FFFC00007FFC00007FFC),
    .INIT_35(256'h000FFFFC000FFFFC000FFFFC000FFFFC0007FFFC0007FFFC0007FFFC0003FFFC),
    .INIT_36(256'h0003FFFC0003FFFC0007FFFC0007FFFC0007FFFC000FFFFC000FFFFC000FFFFC),
    .INIT_37(256'h00003FFC00007FFC00007FFC0000FFFC0000FFFC0001FFFC0001FFFC0003FFFC),
    .INIT_38(256'h00007FFC00307FFC00303FFC00303FFC00003FFC00003FFC00001FFC00001FFC),
    .INIT_39(256'h0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_3A(256'h00007FFC00007FFC0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_3B(256'h00007FFC00007FFC00003FFC00003FFC00003FFC00003FFC00007FFC00007FFC),
    .INIT_3C(256'h0003FFFC0003FFFC0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC00007FFC),
    .INIT_3D(256'h000FFFFC000FFFFC000FFFFC000FFFFC0007FFFC0007FFFC0007FFFC0003FFFC),
    .INIT_3E(256'h0003FFFC0007FFFC0007FFFC0007FFFC000FFFFC000FFFFC000FFFFC000FFFFC),
    .INIT_3F(256'h00003FFC00007FFC00007FFC0000FFFC0000FFFC00C1FFFC0001FFFC0003FFFC),
    .INIT_40(256'h0030FFFC00307FFC00307FFC00303FFC00303FFC00003FFC00003FFC00003FFC),
    .INIT_41(256'h0003FFFC0003FFFC0001FFFC0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC),
    .INIT_42(256'h00007FFC0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_43(256'h00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC),
    .INIT_44(256'h0003FFFC0003FFFC0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC00007FFC),
    .INIT_45(256'h000FFFFC000FFFFC000FFFFC0007FFFC0007FFFC0007FFFC0007FFFC0003FFFC),
    .INIT_46(256'h0003FFFC0007FFFC0007FFFC0007FFFC000FFFFC000FFFFC000FFFFC000FFFFC),
    .INIT_47(256'h00007FFC00007FFC0000FFFC0000FFFC00C1FFFC00C1FFFC00C3FFFC0003FFFC),
    .INIT_48(256'h0000FFFC00307FFC00307FFC00307FFC00007FFC00003FFC00003FFC00003FFC),
    .INIT_49(256'h0003FFFC0003FFFC0003FFFC0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC),
    .INIT_4A(256'h0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC0001FFFC0003FFFC0003FFFC),
    .INIT_4B(256'h00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC0000FFFC),
    .INIT_4C(256'h0003FFFC0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_4D(256'h000FFFFC000FFFFC0007FFFC0007FFFC0007FFFC0007FFFC0003FFFC0003FFFC),
    .INIT_4E(256'h0003FFFC0007FFFC0007FFFC0007FFFC000FFFFC000FFFFC000FFFFC000FFFFC),
    .INIT_4F(256'h00007FFC00007FFC0000FFFC00C0FFFC00C1FFFC00C1FFFC00C3FFFC00C3FFFC),
    .INIT_50(256'h0030FFFC0030FFFC00307FFC00307FFC00307FFC00007FFC00007FFC00003FFC),
    .INIT_51(256'h0003FFFC0003FFFC0003FFFC0003FFFC0001FFFC0001FFFC0001FFFC0000FFFC),
    .INIT_52(256'h0000FFFC0001FFFC0001FFFC0001FFFC0001FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_53(256'h0000FFFC00007FFC00007FFC00007FFC00007FFC0000FFFC0000FFFC0000FFFC),
    .INIT_54(256'h0003FFFC0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_55(256'h0007FFFC0007FFFC0007FFFC0007FFFC0007FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_56(256'h0007FFFC0007FFFC0007FFFC0007FFFC0007FFFC000FFFFC000FFFFC000FFFFC),
    .INIT_57(256'h00007FFC00007FFC0000FFFC0000FFFC00C1FFFC00C1FFFC00C3FFFC0003FFFC),
    .INIT_58(256'h0000FFFC0030FFFC0030FFFC00307FFC00007FFC00007FFC00007FFC00007FFC),
    .INIT_59(256'h0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_5A(256'h0001FFFC0001FFFC0001FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_5B(256'h0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_5C(256'h0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_5D(256'h0007FFFC0007FFFC0007FFFC0007FFFC0003FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_5E(256'h0007FFFC0007FFFC0007FFFC0007FFFC0007FFFC0007FFFC0007FFFC0007FFFC),
    .INIT_5F(256'h00007FFC0000FFFC0000FFFC0001FFFC0001FFFC00C3FFFC0003FFFC0003FFFC),
    .INIT_60(256'h0000FFFC0000FFFC0030FFFC0000FFFC0000FFFC00007FFC00007FFC00007FFC),
    .INIT_61(256'h0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_62(256'h0001FFFC0001FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_63(256'h0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0001FFFC),
    .INIT_64(256'h0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_65(256'h0007FFFC0007FFFC0003FFFC0003FFFC0003FFFC0003FFFC0001FFFC0001FFFC),
    .INIT_66(256'h0007FFFC0007FFFC0007FFFC0007FFFC0007FFFC0007FFFC0007FFFC0007FFFC),
    .INIT_67(256'h00007FFC0000FFFC0000FFFC0001FFFC0001FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_68(256'h0001FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_69(256'h0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_6A(256'h0001FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_6B(256'h0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_6C(256'h0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_6D(256'h0003FFFC0003FFFC0003FFFC0003FFFC0001FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_6E(256'h0007FFFC0007FFFC0007FFFC0007FFFC0007FFFC0007FFFC0007FFFC0003FFFC),
    .INIT_6F(256'h0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_70(256'h0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_71(256'h0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_72(256'h0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_73(256'h0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_74(256'h0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_75(256'h0003FFFC0003FFFC0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_76(256'h0003FFFC0007FFFC0007FFFC0007FFFC0007FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_77(256'h0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_78(256'h0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_79(256'h0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_7A(256'h0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_7B(256'h0000FFFC0000FFFC0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_7C(256'h00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC),
    .INIT_7D(256'h0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC0000FFFC00007FFC),
    .INIT_7E(256'h0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_7F(256'h0000FFFC0000FFFC0001FFFC0001FFFC0003FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("LOWER"),
    .RAM_EXTENSION_B("LOWER"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(1),
    .READ_WIDTH_B(1),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(1),
    .WRITE_WIDTH_B(1)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B 
       (.ADDRARDADDR(addra),
        .ADDRBWRADDR(addrb),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(CASCADEINA),
        .CASCADEOUTB(CASCADEINB),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clkb),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOADO_UNCONNECTED [31:0]),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ENA),
        .ENBWREN(ENB),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(enb),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(1),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC0000FFFC0001FFFC0001FFFC),
    .INIT_01(256'h0003FFFC0003FFFC0003FFFC0003FFFC0001FFFC0001FFFC0001FFFC0061FFFC),
    .INIT_02(256'h0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_03(256'h00007FFC0000FFFC0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_04(256'h00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC),
    .INIT_05(256'h0001FFFC0000FFFC0000FFFC0000FFFC0000FFFC00007FFC00007FFC00007FFC),
    .INIT_06(256'h0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0001FFFC0001FFFC),
    .INIT_07(256'h0000FFFC0000FFFC0001FFFC0001FFFC0003FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_08(256'h0061FFFC0000FFFC0000FFFC0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_09(256'h0003FFFC0003FFFC0003FFFC0001FFFC0001FFFC0001FFFC0061FFFC0061FFFC),
    .INIT_0A(256'h0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_0B(256'h00307FFC0000FFFC0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_0C(256'h00003FFC00003FFC00003FFC00003FFC00003FFC00007FFC00007FFC00007FFC),
    .INIT_0D(256'h0000FFFC0000FFFC0000FFFC00007FFC00007FFC00007FFC00007FFC00003FFC),
    .INIT_0E(256'h0003FFFC0003FFFC0003FFFC0003FFFC0001FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_0F(256'h0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_10(256'h0060FFFC0060FFFC0000FFFC0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_11(256'h0003FFFC0001FFFC0001FFFC0001FFFC0001FFFC0061FFFC0061FFFC0060FFFC),
    .INIT_12(256'h0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_13(256'h00307FFC00307FFC0000FFFC0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_14(256'h00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC00307FFC),
    .INIT_15(256'h0000FFFC00007FFC00007FFC00007FFC00003FFC00003FFC000C3FFC00003FFC),
    .INIT_16(256'h0003FFFC0003FFFC0003FFFC0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC),
    .INIT_17(256'h0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC0003FFFC0003FFFC0003FFFC),
    .INIT_18(256'h0060FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0001FFFC0001FFFC),
    .INIT_19(256'h0001FFFC0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC0060FFFC0060FFFC),
    .INIT_1A(256'h0001FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0003FFFC0001FFFC),
    .INIT_1B(256'h00307FFC00307FFC0030FFFC0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_1C(256'h00001FFC00001FFC00001FFC00003FFC00003FFC00003FFC00303FFC00303FFC),
    .INIT_1D(256'h00007FFC00007FFC00007FFC00003FFC00003FFC000C3FFC000C3FFC000C3FFC),
    .INIT_1E(256'h0003FFFC0001FFFC0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_1F(256'h0000FFFC0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC0001FFFC0003FFFC),
    .INIT_20(256'h0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0001FFFC0001FFFC),
    .INIT_21(256'h0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0060FFFC),
    .INIT_22(256'h0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_23(256'h00307FFC00307FFC00007FFC0000FFFC0000FFFC0000FFFC0001FFFC0001FFFC),
    .INIT_24(256'h000C1FFC00001FFC00001FFC00001FFC00001FFC00003FFC00003FFC00303FFC),
    .INIT_25(256'h00007FFC00007FFC00003FFC00003FFC000C3FFC000C1FFC000C1FFC000C1FFC),
    .INIT_26(256'h0001FFFC0001FFFC00C1FFFC0001FFFC0000FFFC0000FFFC0000FFFC00007FFC),
    .INIT_27(256'h0000FFFC0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_28(256'h00007FFC00007FFC00007FFC0000FFFC0000FFFC0000FFFC0000FFFC0001FFFC),
    .INIT_29(256'h0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC00007FFC00007FFC00007FFC),
    .INIT_2A(256'h0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_2B(256'h00303FFC00007FFC00007FFC00007FFC0000FFFC0000FFFC0000FFFC0001FFFC),
    .INIT_2C(256'h00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00003FFC00003FFC),
    .INIT_2D(256'h00007FFC00003FFC00003FFC00003FFC00001FFC000C1FFC000C1FFC000C1FFC),
    .INIT_2E(256'h0001FFFC00C1FFFC00C1FFFC00E1FFFC0000FFFC0000FFFC0000FFFC00007FFC),
    .INIT_2F(256'h00007FFC0000FFFC0000FFFC0000FFFC0001FFFC0001FFFC0001FFFC0001FFFC),
    .INIT_30(256'h00007FFC00007FFC00007FFC00007FFC0000FFFC0000FFFC0000FFFC0001FFFC),
    .INIT_31(256'h0000FFFC0000FFFC00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC),
    .INIT_32(256'h0000FFFC0001FFFC0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_33(256'h00003FFC00003FFC00007FFC00007FFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_34(256'h00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00003FFC00003FFC),
    .INIT_35(256'h00007FFC00003FFC00003FFC00003FFC00001FFC00001FFC000C1FFC00001FFC),
    .INIT_36(256'h00C1FFFC00C1FFFC00E1FFFC00E0FFFC00E0FFFC0000FFFC00007FFC00007FFC),
    .INIT_37(256'h00007FFC00007FFC0000FFFC0000FFFC0000FFFC0000FFFC0001FFFC0001FFFC),
    .INIT_38(256'h00003FFC00007FFC00007FFC00007FFC00007FFC0000FFFC0000FFFC0000FFFC),
    .INIT_39(256'h00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC00003FFC00003FFC),
    .INIT_3A(256'h0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_3B(256'h00003FFC00003FFC00007FFC00007FFC00007FFC0000FFFC0000FFFC0000FFFC),
    .INIT_3C(256'h00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00003FFC),
    .INIT_3D(256'h00007FFC00003FFC00003FFC00003FFC00001FFC00001FFC00001FFC00001FFC),
    .INIT_3E(256'h0000FFFC00E0FFFC00E0FFFC00E0FFFC0060FFFC0060FFFC00007FFC00007FFC),
    .INIT_3F(256'h00007FFC00007FFC00007FFC0000FFFC0000FFFC0000FFFC0060FFFC0000FFFC),
    .INIT_40(256'h00003FFC00003FFC00003FFC00007FFC00007FFC00007FFC0000FFFC0000FFFC),
    .INIT_41(256'h00007FFC00007FFC00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC),
    .INIT_42(256'h0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC00007FFC00007FFC00007FFC),
    .INIT_43(256'h00003FFC00003FFC00003FFC00007FFC00007FFC00007FFC00007FFC0000FFFC),
    .INIT_44(256'h00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00003FFC),
    .INIT_45(256'h00007FFC00003FFC00003FFC00003FFC00001FFC00001FFC00001FFC00001FFC),
    .INIT_46(256'h0000FFFC0000FFFC00E0FFFC0060FFFC0060FFFC0000FFFC00007FFC00007FFC),
    .INIT_47(256'h00007FFC00007FFC00007FFC00007FFC00007FFC0060FFFC0060FFFC0060FFFC),
    .INIT_48(256'h00003FFC00003FFC00003FFC00003FFC00007FFC00007FFC0000FFFC0000FFFC),
    .INIT_49(256'h00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC),
    .INIT_4A(256'h00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC00007FFC),
    .INIT_4B(256'h00003FFC00003FFC00003FFC00007FFC00007FFC00007FFC00007FFC00007FFC),
    .INIT_4C(256'h00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00003FFC),
    .INIT_4D(256'h00007FFC00003FFC00003FFC00003FFC00003FFC00001FFC00001FFC00001FFC),
    .INIT_4E(256'h0060FFFC0000FFFC0000FFFC0060FFFC0000FFFC0000FFFC00007FFC00007FFC),
    .INIT_4F(256'h00003FFC00003FFC00007FFC00007FFC00607FFC00607FFC0060FFFC0060FFFC),
    .INIT_50(256'h00001FFC00001FFC000C3FFC00003FFC00003FFC00007FFC00007FFC0000FFFC),
    .INIT_51(256'h00003FFC00003FFC00003FFC00001FFC00001FFC00001FFC00001FFC00001FFC),
    .INIT_52(256'h00007FFC00007FFC00007FFC00007FFC00007FFC00003FFC00003FFC00003FFC),
    .INIT_53(256'h00003FFC00003FFC00003FFC00003FFC00007FFC00007FFC00007FFC00007FFC),
    .INIT_54(256'h00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00003FFC),
    .INIT_55(256'h00007FFC00007FFC00003FFC00003FFC00003FFC00003FFC00003FFC00001FFC),
    .INIT_56(256'h0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC00007FFC00007FFC),
    .INIT_57(256'h00003FFC00003FFC00003FFC00007FFC00007FFC00607FFC00607FFC00607FFC),
    .INIT_58(256'h00001FFC000C1FFC000C1FFC000C3FFC00003FFC00007FFC00007FFC0000FFFC),
    .INIT_59(256'h00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC),
    .INIT_5A(256'h00007FFC00007FFC00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC),
    .INIT_5B(256'h00003FFC00003FFC00183FFC00003FFC00003FFC00003FFC00007FFC00007FFC),
    .INIT_5C(256'h00003FFC00001FFC00001FFC00001FFC00001FFC00001FFC00003FFC00003FFC),
    .INIT_5D(256'h00007FFC00007FFC00007FFC00007FFC00003FFC00003FFC00003FFC00003FFC),
    .INIT_5E(256'h00007FFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC00007FFC),
    .INIT_5F(256'h00003FFC00003FFC00003FFC00003FFC00003FFC00007FFC00607FFC00007FFC),
    .INIT_60(256'h000C1FFC000C1FFC000C1FFC000C1FFC000C3FFC00003FFC00007FFC00007FFC),
    .INIT_61(256'h00001FFC00001FFC00001FFC00001FFC00001FFC00000FFC00000FFC00000FFC),
    .INIT_62(256'h00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC00001FFC00001FFC),
    .INIT_63(256'h00003FFC00183FFC00183FFC00183FFC00003FFC00003FFC00003FFC00003FFC),
    .INIT_64(256'h00003FFC00003FFC00003FFC00003FFC00183FFC00003FFC00003FFC00003FFC),
    .INIT_65(256'h0000FFFC00007FFC00007FFC00007FFC00007FFC00007FFC00003FFC00003FFC),
    .INIT_66(256'h00007FFC00007FFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_67(256'h00001FFC00003FFC00003FFC00003FFC00003FFC00003FFC00007FFC00007FFC),
    .INIT_68(256'h00000FFC000C1FFC000C1FFC000C1FFC00003FFC00003FFC00007FFC00007FFC),
    .INIT_69(256'h00001FFC00000FFC00000FFC00000FFC00000FFC00000FFC00000FFC00000FFC),
    .INIT_6A(256'h00003FFC00003FFC00003FFC00001FFC00001FFC00001FFC00001FFC00001FFC),
    .INIT_6B(256'h00183FFC00183FFC00183FFC00183FFC00183FFC00003FFC00003FFC00003FFC),
    .INIT_6C(256'h00003FFC00003FFC00003FFC00183FFC00183FFC00183FFC00003FFC00003FFC),
    .INIT_6D(256'h0000FFFC0000FFFC0000FFFC00007FFC00007FFC00007FFC00007FFC00007FFC),
    .INIT_6E(256'h00007FFC00007FFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_6F(256'h00001FFC00001FFC00001FFC00003FFC00003FFC00003FFC00003FFC00007FFC),
    .INIT_70(256'h00000FFC00000FFC000C1FFC00001FFC00001FFC00003FFC00003FFC00007FFC),
    .INIT_71(256'h00000FFC00000FFC00000FFC00000FFC00000FFC00000FFC00000FFC00000FFC),
    .INIT_72(256'h00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00001FFC00000FFC),
    .INIT_73(256'h00003FFC00183FFC00183FFC00183FFC00003FFC00003FFC00003FFC00003FFC),
    .INIT_74(256'h00007FFC00007FFC00187FFC00183FFC00183FFC00183FFC00183FFC00003FFC),
    .INIT_75(256'h0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC00007FFC00007FFC),
    .INIT_76(256'h00007FFC00007FFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_77(256'h00001FFC00001FFC00001FFC00001FFC00003FFC00003FFC00003FFC00007FFC),
    .INIT_78(256'h00000FFC00000FFC00000FFC00001FFC00001FFC00003FFC00003FFC00007FFC),
    .INIT_79(256'h00000FFC00000FFC00000FFC00000FFC00000FFC00000FFC00000FFC00000FFC),
    .INIT_7A(256'h00001FFC00001FFC00001FFC00001FFC00000FFC00000FFC00000FFC00000FFC),
    .INIT_7B(256'h00003FFC00003FFC00183FFC00003FFC00003FFC00003FFC00001FFC00001FFC),
    .INIT_7C(256'h00007FFC00007FFC00007FFC00187FFC00187FFC00187FFC00003FFC00003FFC),
    .INIT_7D(256'h0001FFFC0001FFFC0001FFFC0000FFFC0000FFFC0000FFFC0000FFFC0000FFFC),
    .INIT_7E(256'h00007FFC00007FFC0000FFFC0000FFFC0000FFFC0000FFFC0001FFFC0001FFFC),
    .INIT_7F(256'h00001FFC00001FFC00001FFC00001FFC00001FFC00003FFC00003FFC00003FFC),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("UPPER"),
    .RAM_EXTENSION_B("UPPER"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(1),
    .READ_WIDTH_B(1),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(1),
    .WRITE_WIDTH_B(1)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T 
       (.ADDRARDADDR(addra),
        .ADDRBWRADDR(addrb),
        .CASCADEINA(CASCADEINA),
        .CASCADEINB(CASCADEINB),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clkb),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOADO_UNCONNECTED [31:0]),
        .DOBDO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOBDO_UNCONNECTED [31:1],DOUTB}),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ENA),
        .ENBWREN(ENB),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(enb),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized3
   (DOUTB,
    clka,
    clkb,
    ENA,
    ENB,
    enb,
    addra,
    addrb,
    dina,
    wea);
  output [0:0]DOUTB;
  input clka;
  input clkb;
  input ENA;
  input ENB;
  input enb;
  input [15:0]addra;
  input [15:0]addrb;
  input [0:0]dina;
  input [0:0]wea;

  wire CASCADEINA;
  wire CASCADEINB;
  wire [0:0]DOUTB;
  wire ENA;
  wire ENB;
  wire [15:0]addra;
  wire [15:0]addrb;
  wire clka;
  wire clkb;
  wire [0:0]dina;
  wire enb;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_RDADDRECC_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOADO_UNCONNECTED ;
  wire [31:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(1),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_01(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_02(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_03(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_04(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_05(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_06(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_07(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_08(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_09(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_0A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_0B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_0C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_0D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_0E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_0F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_10(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_11(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_12(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_13(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_14(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_15(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_16(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_17(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_18(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_19(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_1A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_1B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_1C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_1D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_1E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_1F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_20(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_21(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_22(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_23(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_24(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_25(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_26(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_27(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_28(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_29(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_2A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_2B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_2C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_2D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_2E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_2F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_30(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_31(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_32(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_33(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_34(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_35(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_36(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_37(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_38(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_39(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_3A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_3B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_3C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_3D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_3E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_3F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_40(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_41(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_42(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_43(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_44(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_45(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_46(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_47(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_48(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_49(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_4A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_4B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_4C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_4D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_4E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_4F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_50(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_51(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_52(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_53(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_54(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_55(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_56(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_57(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_58(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_59(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_5A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_5B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_5C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_5D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_5E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_5F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_60(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_61(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_62(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_63(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_64(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_65(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_66(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_67(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_68(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_69(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_6A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_6B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_6C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_6D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_6E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_6F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_70(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_71(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_72(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_73(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_74(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_75(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_76(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_77(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_78(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_79(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_7A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_7B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_7C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_7D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_7E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_7F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("LOWER"),
    .RAM_EXTENSION_B("LOWER"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(1),
    .READ_WIDTH_B(1),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(1),
    .WRITE_WIDTH_B(1)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B 
       (.ADDRARDADDR(addra),
        .ADDRBWRADDR(addrb),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(CASCADEINA),
        .CASCADEOUTB(CASCADEINB),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clkb),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOADO_UNCONNECTED [31:0]),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ENA),
        .ENBWREN(ENB),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(enb),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(1),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_01(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_02(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_03(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_04(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_05(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_06(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_07(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_08(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_09(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_0A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_0B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_0C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_0D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_0E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_0F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_10(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_11(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_12(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_13(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_14(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_15(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_16(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_17(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_18(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_19(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_1A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_1B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_1C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_1D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_1E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_1F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_20(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_21(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_22(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_23(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_24(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_25(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_26(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_27(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_28(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_29(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_2A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_2B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_2C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_2D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_2E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_2F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_30(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_31(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_32(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_33(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_34(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_35(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_36(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_37(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_38(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_39(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_3A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_3B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_3C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_3D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_3E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_3F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_40(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_41(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_42(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_43(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_44(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_45(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_46(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_47(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_48(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_49(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_4A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_4B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_4C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_4D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_4E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_4F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_50(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_51(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_52(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_53(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_54(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_55(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_56(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_57(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_58(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_59(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_5A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_5B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_5C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_5D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_5E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_5F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_60(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_61(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_62(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_63(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_64(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_65(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_66(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_67(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_68(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_69(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_6A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_6B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_6C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_6D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_6E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_6F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_70(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_71(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_72(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_73(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_74(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_75(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_76(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_77(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_78(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_79(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_7A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_7B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_7C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_7D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_7E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_7F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("UPPER"),
    .RAM_EXTENSION_B("UPPER"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(1),
    .READ_WIDTH_B(1),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(1),
    .WRITE_WIDTH_B(1)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T 
       (.ADDRARDADDR(addra),
        .ADDRBWRADDR(addrb),
        .CASCADEINA(CASCADEINA),
        .CASCADEINB(CASCADEINB),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clkb),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOADO_UNCONNECTED [31:0]),
        .DOBDO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOBDO_UNCONNECTED [31:1],DOUTB}),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ENA),
        .ENBWREN(ENB),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(enb),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized4
   (DOUTB,
    clka,
    clkb,
    ENA,
    ENB,
    enb,
    addra,
    addrb,
    dina,
    wea);
  output [0:0]DOUTB;
  input clka;
  input clkb;
  input ENA;
  input ENB;
  input enb;
  input [15:0]addra;
  input [15:0]addrb;
  input [0:0]dina;
  input [0:0]wea;

  wire CASCADEINA;
  wire CASCADEINB;
  wire [0:0]DOUTB;
  wire ENA;
  wire ENB;
  wire [15:0]addra;
  wire [15:0]addrb;
  wire clka;
  wire clkb;
  wire [0:0]dina;
  wire enb;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_RDADDRECC_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOADO_UNCONNECTED ;
  wire [31:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(1),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_01(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_02(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_03(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_04(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_05(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_06(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_07(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_08(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_09(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_0A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_0B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_0C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_0D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_0E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_0F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_10(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_11(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_12(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_13(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_14(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_15(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_16(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_17(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_18(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_19(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_1A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_1B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_1C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_1D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_1E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_1F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_20(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_21(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_22(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_23(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_24(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_25(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_26(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_27(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_28(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_29(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_2A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_2B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_2C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_2D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_2E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_2F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_30(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_31(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_32(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_33(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_34(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_35(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_36(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_37(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_38(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_39(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_3A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_3B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_3C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_3D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_3E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_3F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_40(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_41(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_42(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_43(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_44(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_45(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_46(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_47(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_48(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_49(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_4A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_4B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_4C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_4D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_4E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_4F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_50(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_51(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_52(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_53(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_54(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_55(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_56(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_57(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_58(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_59(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_5A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_5B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_5C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_5D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_5E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_5F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_60(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_61(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_62(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_63(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_64(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_65(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_66(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_67(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_68(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_69(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_6A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_6B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_6C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_6D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_6E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_6F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_70(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_71(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_72(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_73(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_74(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_75(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_76(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_77(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_78(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_79(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_7A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_7B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_7C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_7D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_7E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_7F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("LOWER"),
    .RAM_EXTENSION_B("LOWER"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(1),
    .READ_WIDTH_B(1),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(1),
    .WRITE_WIDTH_B(1)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B 
       (.ADDRARDADDR(addra),
        .ADDRBWRADDR(addrb),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(CASCADEINA),
        .CASCADEOUTB(CASCADEINB),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clkb),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOADO_UNCONNECTED [31:0]),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ENA),
        .ENBWREN(ENB),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(enb),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(1),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_01(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_02(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_03(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_04(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_05(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_06(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_07(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_08(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_09(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_0A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_0B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_0C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_0D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_0E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_0F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_10(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_11(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_12(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_13(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_14(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_15(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_16(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_17(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_18(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_19(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_1A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_1B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_1C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_1D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_1E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_1F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_20(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_21(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_22(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_23(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_24(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_25(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_26(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_27(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_28(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_29(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_2A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_2B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_2C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_2D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_2E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_2F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_30(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_31(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_32(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_33(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_34(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_35(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_36(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_37(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_38(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_39(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_3A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_3B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_3C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_3D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_3E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_3F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_40(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_41(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_42(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_43(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_44(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_45(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_46(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_47(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_48(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_49(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_4A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_4B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_4C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_4D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_4E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_4F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_50(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_51(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_52(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_53(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_54(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_55(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_56(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_57(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_58(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_59(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_5A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_5B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_5C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_5D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_5E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_5F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_60(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_61(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_62(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_63(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_64(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_65(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_66(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_67(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_68(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_69(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_6A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_6B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_6C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_6D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_6E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_6F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_70(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_71(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_72(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_73(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_74(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_75(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_76(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_77(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_78(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_79(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_7A(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_7B(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_7C(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_7D(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_7E(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_7F(256'h0000000300000003000000030000000300000003000000030000000300000003),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("UPPER"),
    .RAM_EXTENSION_B("UPPER"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(1),
    .READ_WIDTH_B(1),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(1),
    .WRITE_WIDTH_B(1)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T 
       (.ADDRARDADDR(addra),
        .ADDRBWRADDR(addrb),
        .CASCADEINA(CASCADEINA),
        .CASCADEINB(CASCADEINB),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clkb),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOADO_UNCONNECTED [31:0]),
        .DOBDO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOBDO_UNCONNECTED [31:1],DOUTB}),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ENA),
        .ENBWREN(ENB),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(enb),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized5
   (DOUTB,
    clka,
    clkb,
    ENA,
    ENB,
    enb,
    addra,
    addrb,
    dina,
    wea);
  output [0:0]DOUTB;
  input clka;
  input clkb;
  input ENA;
  input ENB;
  input enb;
  input [15:0]addra;
  input [15:0]addrb;
  input [0:0]dina;
  input [0:0]wea;

  wire CASCADEINA;
  wire CASCADEINB;
  wire [0:0]DOUTB;
  wire ENA;
  wire ENB;
  wire [15:0]addra;
  wire [15:0]addrb;
  wire clka;
  wire clkb;
  wire [0:0]dina;
  wire enb;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_RDADDRECC_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOADO_UNCONNECTED ;
  wire [31:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(1),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000C0000000C0000000C0000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h000000000000000000000000000000000000000000000000000C000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h000C000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h00000000000000000000000000000000000C0000000C0000000FE000000C0000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000C0000000C0000000C0000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000C0000000C0000000C0000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h000C000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h00000000000000000000000000000000000C0000000C0000000FE000000C0000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h000000000000000000000000000000000000000000000000000C000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000C0000000C0000000C0000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h000000000000000000000000000000000000000000000000000C000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000018000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000001800000018000000180000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h000000000000000000000000018000000180000001FC00000180000001800000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000001800000018000000180000000000000),
    .INIT_45(256'h0000000000000000000000000018000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000018000000000000000000000),
    .INIT_4D(256'h0000000000000000001800000018000000180000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h000000000018000000180000001FC00000180000001800000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000001800000018000000180000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000018000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000018000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000001800000018000000180000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h018000000180000001FC00000180000001800000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000001800000018000000180000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("LOWER"),
    .RAM_EXTENSION_B("LOWER"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(1),
    .READ_WIDTH_B(1),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(1),
    .WRITE_WIDTH_B(1)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B 
       (.ADDRARDADDR(addra),
        .ADDRBWRADDR(addrb),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(CASCADEINA),
        .CASCADEOUTB(CASCADEINB),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clkb),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOADO_UNCONNECTED [31:0]),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ENA),
        .ENBWREN(ENB),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(enb),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(1),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000018000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000300000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0030000000300000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000030000000300000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000C00000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000030000000000000000000000000000000000000),
    .INIT_2C(256'h0030000000300000003000000000000000000000000000000000000000000000),
    .INIT_2D(256'h00000000000000000000000000000000000000000030000000300000003F8000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h00C0000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h00000000000000000000000000000000000000000000000000C0000000C00000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000003000000030000000300000000000000000000000000000),
    .INIT_34(256'h00300000003F8000003000000030000000000000003000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000003000000030000000300000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h00C0000000C000000000000000000000000000000000000000000000000C0000),
    .INIT_39(256'h000000000000000000000000000000000000000000C0000000C0000000FE0000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h000000000030000000300000003F800000300000003000000000000000000000),
    .INIT_3C(256'h0030000000300000003000000000000000300000003000000030000000000000),
    .INIT_3D(256'h000000000000000000000000000000000030000000300000003F800000300000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h00C000000000000000000000000000000000000000000000000C0000000C0000),
    .INIT_41(256'h00000000000000000000000000000000000000000000000000C0000000C00000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000003000000030000000300000000000000000000000000000),
    .INIT_44(256'h0000000000300000000000000030000000300000003F80000030000000300000),
    .INIT_45(256'h0000000000000000000000000000000000000000003000000030000000300000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000C0000000C0000000FE000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000C00000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000030000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000300000003000000030000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000030000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h000000000000000000000000000000000000000000000000000C0000000C0000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000003000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h00000000000000000000000000000000000000000000000000000000000C0000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h000000000000000000C000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000C0000000C0000000C0000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000600000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000600000006000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h00C0000000C0000000FE000000C0000000C00000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000060000000600000006000000000000000000000),
    .INIT_72(256'h0000000000000000000000000060000000600000006000000060000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000C0000000C0000000C0000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h00000000000000000060000000600000007F0000006000000060000000000000),
    .INIT_7A(256'h00000000000000000060000000600000007F0000007F00000060000000600000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h000000000000000000C000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("UPPER"),
    .RAM_EXTENSION_B("UPPER"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(1),
    .READ_WIDTH_B(1),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(1),
    .WRITE_WIDTH_B(1)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T 
       (.ADDRARDADDR(addra),
        .ADDRBWRADDR(addrb),
        .CASCADEINA(CASCADEINA),
        .CASCADEINB(CASCADEINB),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clkb),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOADO_UNCONNECTED [31:0]),
        .DOBDO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOBDO_UNCONNECTED [31:1],DOUTB}),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ENA),
        .ENBWREN(ENB),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(enb),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized6
   (DOUTB,
    clka,
    clkb,
    ENA,
    ENB,
    enb,
    addra,
    addrb,
    dina,
    wea);
  output [0:0]DOUTB;
  input clka;
  input clkb;
  input ENA;
  input ENB;
  input enb;
  input [15:0]addra;
  input [15:0]addrb;
  input [0:0]dina;
  input [0:0]wea;

  wire CASCADEINA;
  wire CASCADEINB;
  wire [0:0]DOUTB;
  wire ENA;
  wire ENB;
  wire [15:0]addra;
  wire [15:0]addrb;
  wire clka;
  wire clkb;
  wire [0:0]dina;
  wire enb;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_RDADDRECC_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOADO_UNCONNECTED ;
  wire [31:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(1),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000060000000600000006000000000000000000000),
    .INIT_02(256'h0000000000000000000000000060000000600000006000000060000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000600000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000600000006000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000003000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000300000003000000030000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h000000000000000000000000000000000000000000C000000000000000000000),
    .INIT_40(256'h0030000000300000003F80000030000000300000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000C0000000C0000000C0000000000000),
    .INIT_48(256'h0000000000300000003000000030000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h00000000000000000000000000C0000000C0000000FE000000C0000000C00000),
    .INIT_50(256'h0030000000300000003F80000030000000300000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000C0000000C0000000C0000000000000),
    .INIT_58(256'h0000000000300000003000000030000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h000000000000000000000000000000000000000000C000000000000000000000),
    .INIT_60(256'h0000000000000000003000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("LOWER"),
    .RAM_EXTENSION_B("LOWER"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(1),
    .READ_WIDTH_B(1),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(1),
    .WRITE_WIDTH_B(1)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B 
       (.ADDRARDADDR(addra),
        .ADDRBWRADDR(addrb),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(CASCADEINA),
        .CASCADEOUTB(CASCADEINB),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clkb),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOADO_UNCONNECTED [31:0]),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ENA),
        .ENBWREN(ENB),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(enb),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(1),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000600000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0060000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000060000000600000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0030000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0060000000600000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h00000000000000000000000000000000000000000060000000600000007F0000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0030000000300000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000300000),
    .INIT_15(256'h000000000000000000000000000000000000000000000000000C000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0060000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000060000000600000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h003F800000300000003000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000030000000300000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000C0000000C0000000C0000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000600000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0030000000300000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h000C000000000000000000000000000000000000000000000000000000300000),
    .INIT_25(256'h00000000000000000000000000000000000C0000000C0000000FE000000C0000),
    .INIT_26(256'h000000000000000000C000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0030000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000C0000000C0000000C0000),
    .INIT_2E(256'h0000000000C0000000C0000000E0000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h000000000000000000000000000000000000000000000000000C000000000000),
    .INIT_36(256'h00C0000000C0000000FE000000E0000000E00000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000E0000000E0000000FF000000600000006000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000060000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h000000000000000000E000000060000000600000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000006000000060000000600000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0060000000000000000000000060000000000000000000000000000000000000),
    .INIT_4F(256'h000000000000000000000000000000000060000000600000007F000000600000),
    .INIT_50(256'h0000000000000000000C00000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000006000000060000000600000),
    .INIT_58(256'h00000000000C0000000C0000000C000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000001800000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000060000000000000),
    .INIT_60(256'h000C0000000C0000000FE000000C0000000C0000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000180000001800000018000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000180000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h00000000000C0000000C0000000C000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0018000000180000001FC0000018000000180000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000018000000180000001800000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000C00000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000180000001800000018000000000000000000000000000000000000),
    .INIT_74(256'h00000000000000000018000000180000001FC000001800000018000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000001800000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000018000000180000001800000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("UPPER"),
    .RAM_EXTENSION_B("UPPER"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(1),
    .READ_WIDTH_B(1),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(1),
    .WRITE_WIDTH_B(1)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T 
       (.ADDRARDADDR(addra),
        .ADDRBWRADDR(addrb),
        .CASCADEINA(CASCADEINA),
        .CASCADEINB(CASCADEINB),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clkb),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOADO_UNCONNECTED [31:0]),
        .DOBDO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOBDO_UNCONNECTED [31:1],DOUTB}),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ENA),
        .ENBWREN(ENB),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(enb),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized7
   (DOUTB,
    clka,
    clkb,
    ENA,
    ENB,
    enb,
    addra,
    addrb,
    dina,
    wea);
  output [0:0]DOUTB;
  input clka;
  input clkb;
  input ENA;
  input ENB;
  input enb;
  input [15:0]addra;
  input [15:0]addrb;
  input [0:0]dina;
  input [0:0]wea;

  wire CASCADEINA;
  wire CASCADEINB;
  wire [0:0]DOUTB;
  wire ENA;
  wire ENB;
  wire [15:0]addra;
  wire [15:0]addrb;
  wire clka;
  wire clkb;
  wire [0:0]dina;
  wire enb;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_RDADDRECC_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOADO_UNCONNECTED ;
  wire [31:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(1),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("LOWER"),
    .RAM_EXTENSION_B("LOWER"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(1),
    .READ_WIDTH_B(1),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(1),
    .WRITE_WIDTH_B(1)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B 
       (.ADDRARDADDR(addra),
        .ADDRBWRADDR(addrb),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(CASCADEINA),
        .CASCADEOUTB(CASCADEINB),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clkb),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOADO_UNCONNECTED [31:0]),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ENA),
        .ENBWREN(ENB),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(enb),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(1),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("UPPER"),
    .RAM_EXTENSION_B("UPPER"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(1),
    .READ_WIDTH_B(1),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(1),
    .WRITE_WIDTH_B(1)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T 
       (.ADDRARDADDR(addra),
        .ADDRBWRADDR(addrb),
        .CASCADEINA(CASCADEINA),
        .CASCADEINB(CASCADEINB),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clkb),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOADO_UNCONNECTED [31:0]),
        .DOBDO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOBDO_UNCONNECTED [31:1],DOUTB}),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ENA),
        .ENBWREN(ENB),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(enb),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized8
   (DOUTB,
    clka,
    clkb,
    ENA,
    ENB,
    enb,
    addra,
    addrb,
    dina,
    wea);
  output [0:0]DOUTB;
  input clka;
  input clkb;
  input ENA;
  input ENB;
  input enb;
  input [15:0]addra;
  input [15:0]addrb;
  input [0:0]dina;
  input [0:0]wea;

  wire CASCADEINA;
  wire CASCADEINB;
  wire [0:0]DOUTB;
  wire ENA;
  wire ENB;
  wire [15:0]addra;
  wire [15:0]addrb;
  wire clka;
  wire clkb;
  wire [0:0]dina;
  wire enb;
  wire [0:0]wea;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_RDADDRECC_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOADO_UNCONNECTED ;
  wire [31:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(1),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("LOWER"),
    .RAM_EXTENSION_B("LOWER"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(1),
    .READ_WIDTH_B(1),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(1),
    .WRITE_WIDTH_B(1)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B 
       (.ADDRARDADDR(addra),
        .ADDRBWRADDR(addrb),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(CASCADEINA),
        .CASCADEOUTB(CASCADEINB),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clkb),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOADO_UNCONNECTED [31:0]),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ENA),
        .ENBWREN(ENB),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(enb),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_B_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(1),
    .DOB_REG(1),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_EXTENSION_A("UPPER"),
    .RAM_EXTENSION_B("UPPER"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(1),
    .READ_WIDTH_B(1),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(1),
    .WRITE_WIDTH_B(1)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T 
       (.ADDRARDADDR(addra),
        .ADDRBWRADDR(addrb),
        .CASCADEINA(CASCADEINA),
        .CASCADEINB(CASCADEINB),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clkb),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOADO_UNCONNECTED [31:0]),
        .DOBDO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOBDO_UNCONNECTED [31:1],DOUTB}),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ENA),
        .ENBWREN(ENB),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(enb),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SDP.CASCADED_PRIM36.ram_T_SBITERR_UNCONNECTED ),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_top
   (doutb,
    clka,
    clkb,
    enb,
    addra,
    addrb,
    dina,
    wea,
    ena);
  output [4:0]doutb;
  input clka;
  input clkb;
  input enb;
  input [16:0]addra;
  input [16:0]addrb;
  input [4:0]dina;
  input [0:0]wea;
  input ena;

  wire [16:0]addra;
  wire [16:0]addrb;
  wire clka;
  wire clkb;
  wire [4:0]dina;
  wire [4:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_generic_cstr \valid.cstr 
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dina(dina),
        .doutb(doutb),
        .ena(ena),
        .enb(enb),
        .wea(wea));
endmodule

(* C_ADDRA_WIDTH = "17" *) (* C_ADDRB_WIDTH = "17" *) (* C_ALGORITHM = "1" *) 
(* C_AXI_ID_WIDTH = "4" *) (* C_AXI_SLAVE_TYPE = "0" *) (* C_AXI_TYPE = "1" *) 
(* C_BYTE_SIZE = "9" *) (* C_COMMON_CLK = "0" *) (* C_COUNT_18K_BRAM = "0" *) 
(* C_COUNT_36K_BRAM = "20" *) (* C_CTRL_ECC_ALGO = "NONE" *) (* C_DEFAULT_DATA = "0" *) 
(* C_DISABLE_WARN_BHV_COLL = "0" *) (* C_DISABLE_WARN_BHV_RANGE = "0" *) (* C_ELABORATION_DIR = "./" *) 
(* C_ENABLE_32BIT_ADDRESS = "0" *) (* C_EN_DEEPSLEEP_PIN = "0" *) (* C_EN_ECC_PIPE = "0" *) 
(* C_EN_RDADDRA_CHG = "0" *) (* C_EN_RDADDRB_CHG = "0" *) (* C_EN_SAFETY_CKT = "0" *) 
(* C_EN_SHUTDOWN_PIN = "0" *) (* C_EN_SLEEP_PIN = "0" *) (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     21.236774 mW" *) 
(* C_FAMILY = "zynq" *) (* C_HAS_AXI_ID = "0" *) (* C_HAS_ENA = "1" *) 
(* C_HAS_ENB = "1" *) (* C_HAS_INJECTERR = "0" *) (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
(* C_HAS_MEM_OUTPUT_REGS_B = "1" *) (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
(* C_HAS_REGCEA = "0" *) (* C_HAS_REGCEB = "0" *) (* C_HAS_RSTA = "0" *) 
(* C_HAS_RSTB = "0" *) (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
(* C_INITA_VAL = "0" *) (* C_INITB_VAL = "0" *) (* C_INIT_FILE = "map_ram.mem" *) 
(* C_INIT_FILE_NAME = "map_ram.mif" *) (* C_INTERFACE_TYPE = "0" *) (* C_LOAD_INIT_FILE = "1" *) 
(* C_MEM_TYPE = "1" *) (* C_MUX_PIPELINE_STAGES = "0" *) (* C_PRIM_TYPE = "1" *) 
(* C_READ_DEPTH_A = "131072" *) (* C_READ_DEPTH_B = "131072" *) (* C_READ_LATENCY_A = "1" *) 
(* C_READ_LATENCY_B = "1" *) (* C_READ_WIDTH_A = "5" *) (* C_READ_WIDTH_B = "5" *) 
(* C_RSTRAM_A = "0" *) (* C_RSTRAM_B = "0" *) (* C_RST_PRIORITY_A = "CE" *) 
(* C_RST_PRIORITY_B = "CE" *) (* C_SIM_COLLISION_CHECK = "ALL" *) (* C_USE_BRAM_BLOCK = "0" *) 
(* C_USE_BYTE_WEA = "0" *) (* C_USE_BYTE_WEB = "0" *) (* C_USE_DEFAULT_DATA = "0" *) 
(* C_USE_ECC = "0" *) (* C_USE_SOFTECC = "0" *) (* C_USE_URAM = "0" *) 
(* C_WEA_WIDTH = "1" *) (* C_WEB_WIDTH = "1" *) (* C_WRITE_DEPTH_A = "131072" *) 
(* C_WRITE_DEPTH_B = "131072" *) (* C_WRITE_MODE_A = "WRITE_FIRST" *) (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
(* C_WRITE_WIDTH_A = "5" *) (* C_WRITE_WIDTH_B = "5" *) (* C_XDEVICEFAMILY = "zynq" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_2
   (clka,
    rsta,
    ena,
    regcea,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    regceb,
    web,
    addrb,
    dinb,
    doutb,
    injectsbiterr,
    injectdbiterr,
    eccpipece,
    sbiterr,
    dbiterr,
    rdaddrecc,
    sleep,
    deepsleep,
    shutdown,
    rsta_busy,
    rstb_busy,
    s_aclk,
    s_aresetn,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_bvalid,
    s_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_rvalid,
    s_axi_rready,
    s_axi_injectsbiterr,
    s_axi_injectdbiterr,
    s_axi_sbiterr,
    s_axi_dbiterr,
    s_axi_rdaddrecc);
  input clka;
  input rsta;
  input ena;
  input regcea;
  input [0:0]wea;
  input [16:0]addra;
  input [4:0]dina;
  output [4:0]douta;
  input clkb;
  input rstb;
  input enb;
  input regceb;
  input [0:0]web;
  input [16:0]addrb;
  input [4:0]dinb;
  output [4:0]doutb;
  input injectsbiterr;
  input injectdbiterr;
  input eccpipece;
  output sbiterr;
  output dbiterr;
  output [16:0]rdaddrecc;
  input sleep;
  input deepsleep;
  input shutdown;
  output rsta_busy;
  output rstb_busy;
  input s_aclk;
  input s_aresetn;
  input [3:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input s_axi_awvalid;
  output s_axi_awready;
  input [4:0]s_axi_wdata;
  input [0:0]s_axi_wstrb;
  input s_axi_wlast;
  input s_axi_wvalid;
  output s_axi_wready;
  output [3:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [3:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input s_axi_arvalid;
  output s_axi_arready;
  output [3:0]s_axi_rid;
  output [4:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  input s_axi_injectsbiterr;
  input s_axi_injectdbiterr;
  output s_axi_sbiterr;
  output s_axi_dbiterr;
  output [16:0]s_axi_rdaddrecc;

  wire \<const0> ;
  wire [16:0]addra;
  wire [16:0]addrb;
  wire clka;
  wire clkb;
  wire [4:0]dina;
  wire [4:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;

  assign dbiterr = \<const0> ;
  assign douta[4] = \<const0> ;
  assign douta[3] = \<const0> ;
  assign douta[2] = \<const0> ;
  assign douta[1] = \<const0> ;
  assign douta[0] = \<const0> ;
  assign rdaddrecc[16] = \<const0> ;
  assign rdaddrecc[15] = \<const0> ;
  assign rdaddrecc[14] = \<const0> ;
  assign rdaddrecc[13] = \<const0> ;
  assign rdaddrecc[12] = \<const0> ;
  assign rdaddrecc[11] = \<const0> ;
  assign rdaddrecc[10] = \<const0> ;
  assign rdaddrecc[9] = \<const0> ;
  assign rdaddrecc[8] = \<const0> ;
  assign rdaddrecc[7] = \<const0> ;
  assign rdaddrecc[6] = \<const0> ;
  assign rdaddrecc[5] = \<const0> ;
  assign rdaddrecc[4] = \<const0> ;
  assign rdaddrecc[3] = \<const0> ;
  assign rdaddrecc[2] = \<const0> ;
  assign rdaddrecc[1] = \<const0> ;
  assign rdaddrecc[0] = \<const0> ;
  assign rsta_busy = \<const0> ;
  assign rstb_busy = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[3] = \<const0> ;
  assign s_axi_bid[2] = \<const0> ;
  assign s_axi_bid[1] = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_dbiterr = \<const0> ;
  assign s_axi_rdaddrecc[16] = \<const0> ;
  assign s_axi_rdaddrecc[15] = \<const0> ;
  assign s_axi_rdaddrecc[14] = \<const0> ;
  assign s_axi_rdaddrecc[13] = \<const0> ;
  assign s_axi_rdaddrecc[12] = \<const0> ;
  assign s_axi_rdaddrecc[11] = \<const0> ;
  assign s_axi_rdaddrecc[10] = \<const0> ;
  assign s_axi_rdaddrecc[9] = \<const0> ;
  assign s_axi_rdaddrecc[8] = \<const0> ;
  assign s_axi_rdaddrecc[7] = \<const0> ;
  assign s_axi_rdaddrecc[6] = \<const0> ;
  assign s_axi_rdaddrecc[5] = \<const0> ;
  assign s_axi_rdaddrecc[4] = \<const0> ;
  assign s_axi_rdaddrecc[3] = \<const0> ;
  assign s_axi_rdaddrecc[2] = \<const0> ;
  assign s_axi_rdaddrecc[1] = \<const0> ;
  assign s_axi_rdaddrecc[0] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[3] = \<const0> ;
  assign s_axi_rid[2] = \<const0> ;
  assign s_axi_rid[1] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_sbiterr = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign sbiterr = \<const0> ;
  GND GND
       (.G(\<const0> ));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_2_synth inst_blk_mem_gen
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dina(dina),
        .doutb(doutb),
        .ena(ena),
        .enb(enb),
        .wea(wea));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_2_synth
   (doutb,
    clka,
    clkb,
    enb,
    addra,
    addrb,
    dina,
    wea,
    ena);
  output [4:0]doutb;
  input clka;
  input clkb;
  input enb;
  input [16:0]addra;
  input [16:0]addrb;
  input [4:0]dina;
  input [0:0]wea;
  input ena;

  wire [16:0]addra;
  wire [16:0]addrb;
  wire clka;
  wire clkb;
  wire [4:0]dina;
  wire [4:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_top \gnbram.gnativebmg.native_blk_mem_gen 
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dina(dina),
        .doutb(doutb),
        .ena(ena),
        .enb(enb),
        .wea(wea));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
