// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Sun Aug 18 14:44:18 2024
// Host        : DESKTOP-0TSH46O running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ texture_rom_sim_netlist.v
// Design      : texture_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010iclg225-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "texture_rom,blk_mem_gen_v8_4_2,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [12:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [12:0]addra;
  wire clka;
  wire [31:0]douta;
  wire ena;
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
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [12:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [12:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "13" *) 
  (* C_ADDRB_WIDTH = "13" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "7" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     9.984642 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
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
  (* C_INIT_FILE = "texture_rom.mem" *) 
  (* C_INIT_FILE_NAME = "texture_rom.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "8192" *) 
  (* C_READ_DEPTH_B = "8192" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
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
  (* C_WRITE_DEPTH_A = "8192" *) 
  (* C_WRITE_DEPTH_B = "8192" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_2 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[12:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[12:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bindec
   (ena_array,
    addra,
    ena);
  output [1:0]ena_array;
  input [0:0]addra;
  input ena;

  wire [0:0]addra;
  wire ena;
  wire [1:0]ena_array;

  LUT2 #(
    .INIT(4'h8)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1 
       (.I0(addra),
        .I1(ena),
        .O(ena_array[1]));
  LUT2 #(
    .INIT(4'h2)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_i_1__0 
       (.I0(ena),
        .I1(addra),
        .O(ena_array[0]));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_generic_cstr
   (douta,
    clka,
    ena,
    addra);
  output [31:0]douta;
  input clka;
  input ena;
  input [12:0]addra;

  wire [12:0]addra;
  wire clka;
  wire [31:0]douta;
  wire ena;
  wire [1:0]ena_array;
  wire \ramloop[2].ram.r_n_0 ;
  wire \ramloop[2].ram.r_n_1 ;
  wire \ramloop[2].ram.r_n_2 ;
  wire \ramloop[2].ram.r_n_3 ;
  wire \ramloop[2].ram.r_n_4 ;
  wire \ramloop[2].ram.r_n_5 ;
  wire \ramloop[2].ram.r_n_6 ;
  wire \ramloop[2].ram.r_n_7 ;
  wire \ramloop[2].ram.r_n_8 ;
  wire \ramloop[3].ram.r_n_0 ;
  wire \ramloop[3].ram.r_n_1 ;
  wire \ramloop[3].ram.r_n_2 ;
  wire \ramloop[3].ram.r_n_3 ;
  wire \ramloop[3].ram.r_n_4 ;
  wire \ramloop[3].ram.r_n_5 ;
  wire \ramloop[3].ram.r_n_6 ;
  wire \ramloop[3].ram.r_n_7 ;
  wire \ramloop[3].ram.r_n_8 ;
  wire \ramloop[4].ram.r_n_0 ;
  wire \ramloop[4].ram.r_n_1 ;
  wire \ramloop[4].ram.r_n_2 ;
  wire \ramloop[4].ram.r_n_3 ;
  wire \ramloop[4].ram.r_n_4 ;
  wire \ramloop[4].ram.r_n_5 ;
  wire \ramloop[4].ram.r_n_6 ;
  wire \ramloop[4].ram.r_n_7 ;
  wire \ramloop[4].ram.r_n_8 ;
  wire \ramloop[5].ram.r_n_0 ;
  wire \ramloop[5].ram.r_n_1 ;
  wire \ramloop[5].ram.r_n_2 ;
  wire \ramloop[5].ram.r_n_3 ;
  wire \ramloop[5].ram.r_n_4 ;
  wire \ramloop[5].ram.r_n_5 ;
  wire \ramloop[5].ram.r_n_6 ;
  wire \ramloop[5].ram.r_n_7 ;
  wire \ramloop[5].ram.r_n_8 ;
  wire \ramloop[6].ram.r_n_0 ;
  wire \ramloop[6].ram.r_n_1 ;
  wire \ramloop[6].ram.r_n_2 ;
  wire \ramloop[6].ram.r_n_3 ;
  wire \ramloop[6].ram.r_n_4 ;
  wire \ramloop[6].ram.r_n_5 ;
  wire \ramloop[6].ram.r_n_6 ;
  wire \ramloop[6].ram.r_n_7 ;
  wire \ramloop[7].ram.r_n_0 ;
  wire \ramloop[7].ram.r_n_1 ;
  wire \ramloop[7].ram.r_n_2 ;
  wire \ramloop[7].ram.r_n_3 ;
  wire \ramloop[7].ram.r_n_4 ;
  wire \ramloop[7].ram.r_n_5 ;
  wire \ramloop[7].ram.r_n_6 ;
  wire \ramloop[7].ram.r_n_7 ;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_bindec \bindec_a.bindec_inst_a 
       (.addra(addra[12]),
        .ena(ena),
        .ena_array(ena_array));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_mux \has_mux_a.A 
       (.DOADO({\ramloop[3].ram.r_n_0 ,\ramloop[3].ram.r_n_1 ,\ramloop[3].ram.r_n_2 ,\ramloop[3].ram.r_n_3 ,\ramloop[3].ram.r_n_4 ,\ramloop[3].ram.r_n_5 ,\ramloop[3].ram.r_n_6 ,\ramloop[3].ram.r_n_7 }),
        .DOPADOP(\ramloop[3].ram.r_n_8 ),
        .addra(addra[12]),
        .clka(clka),
        .douta(douta[31:6]),
        .\douta[13] ({\ramloop[2].ram.r_n_0 ,\ramloop[2].ram.r_n_1 ,\ramloop[2].ram.r_n_2 ,\ramloop[2].ram.r_n_3 ,\ramloop[2].ram.r_n_4 ,\ramloop[2].ram.r_n_5 ,\ramloop[2].ram.r_n_6 ,\ramloop[2].ram.r_n_7 }),
        .\douta[14] (\ramloop[2].ram.r_n_8 ),
        .\douta[22] ({\ramloop[5].ram.r_n_0 ,\ramloop[5].ram.r_n_1 ,\ramloop[5].ram.r_n_2 ,\ramloop[5].ram.r_n_3 ,\ramloop[5].ram.r_n_4 ,\ramloop[5].ram.r_n_5 ,\ramloop[5].ram.r_n_6 ,\ramloop[5].ram.r_n_7 }),
        .\douta[22]_0 ({\ramloop[4].ram.r_n_0 ,\ramloop[4].ram.r_n_1 ,\ramloop[4].ram.r_n_2 ,\ramloop[4].ram.r_n_3 ,\ramloop[4].ram.r_n_4 ,\ramloop[4].ram.r_n_5 ,\ramloop[4].ram.r_n_6 ,\ramloop[4].ram.r_n_7 }),
        .\douta[23] (\ramloop[5].ram.r_n_8 ),
        .\douta[23]_0 (\ramloop[4].ram.r_n_8 ),
        .\douta[31] ({\ramloop[7].ram.r_n_0 ,\ramloop[7].ram.r_n_1 ,\ramloop[7].ram.r_n_2 ,\ramloop[7].ram.r_n_3 ,\ramloop[7].ram.r_n_4 ,\ramloop[7].ram.r_n_5 ,\ramloop[7].ram.r_n_6 ,\ramloop[7].ram.r_n_7 }),
        .\douta[31]_0 ({\ramloop[6].ram.r_n_0 ,\ramloop[6].ram.r_n_1 ,\ramloop[6].ram.r_n_2 ,\ramloop[6].ram.r_n_3 ,\ramloop[6].ram.r_n_4 ,\ramloop[6].ram.r_n_5 ,\ramloop[6].ram.r_n_6 ,\ramloop[6].ram.r_n_7 }),
        .ena(ena));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width \ramloop[0].ram.r 
       (.addra(addra),
        .clka(clka),
        .douta(douta[1:0]),
        .ena(ena));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized0 \ramloop[1].ram.r 
       (.addra(addra),
        .clka(clka),
        .douta(douta[5:2]),
        .ena(ena));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized1 \ramloop[2].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ({\ramloop[2].ram.r_n_0 ,\ramloop[2].ram.r_n_1 ,\ramloop[2].ram.r_n_2 ,\ramloop[2].ram.r_n_3 ,\ramloop[2].ram.r_n_4 ,\ramloop[2].ram.r_n_5 ,\ramloop[2].ram.r_n_6 ,\ramloop[2].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\ramloop[2].ram.r_n_8 ),
        .addra(addra[11:0]),
        .clka(clka),
        .ena_array(ena_array[0]));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized2 \ramloop[3].ram.r 
       (.DOADO({\ramloop[3].ram.r_n_0 ,\ramloop[3].ram.r_n_1 ,\ramloop[3].ram.r_n_2 ,\ramloop[3].ram.r_n_3 ,\ramloop[3].ram.r_n_4 ,\ramloop[3].ram.r_n_5 ,\ramloop[3].ram.r_n_6 ,\ramloop[3].ram.r_n_7 }),
        .DOPADOP(\ramloop[3].ram.r_n_8 ),
        .addra(addra[11:0]),
        .clka(clka),
        .ena_array(ena_array[1]));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized3 \ramloop[4].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ({\ramloop[4].ram.r_n_0 ,\ramloop[4].ram.r_n_1 ,\ramloop[4].ram.r_n_2 ,\ramloop[4].ram.r_n_3 ,\ramloop[4].ram.r_n_4 ,\ramloop[4].ram.r_n_5 ,\ramloop[4].ram.r_n_6 ,\ramloop[4].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\ramloop[4].ram.r_n_8 ),
        .addra(addra[11:0]),
        .clka(clka),
        .ena_array(ena_array[0]));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized4 \ramloop[5].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ({\ramloop[5].ram.r_n_0 ,\ramloop[5].ram.r_n_1 ,\ramloop[5].ram.r_n_2 ,\ramloop[5].ram.r_n_3 ,\ramloop[5].ram.r_n_4 ,\ramloop[5].ram.r_n_5 ,\ramloop[5].ram.r_n_6 ,\ramloop[5].ram.r_n_7 }),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\ramloop[5].ram.r_n_8 ),
        .addra(addra[11:0]),
        .clka(clka),
        .ena_array(ena_array[1]));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized5 \ramloop[6].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ({\ramloop[6].ram.r_n_0 ,\ramloop[6].ram.r_n_1 ,\ramloop[6].ram.r_n_2 ,\ramloop[6].ram.r_n_3 ,\ramloop[6].ram.r_n_4 ,\ramloop[6].ram.r_n_5 ,\ramloop[6].ram.r_n_6 ,\ramloop[6].ram.r_n_7 }),
        .addra(addra[11:0]),
        .clka(clka),
        .ena_array(ena_array[0]));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized6 \ramloop[7].ram.r 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ({\ramloop[7].ram.r_n_0 ,\ramloop[7].ram.r_n_1 ,\ramloop[7].ram.r_n_2 ,\ramloop[7].ram.r_n_3 ,\ramloop[7].ram.r_n_4 ,\ramloop[7].ram.r_n_5 ,\ramloop[7].ram.r_n_6 ,\ramloop[7].ram.r_n_7 }),
        .addra(addra[11:0]),
        .clka(clka),
        .ena_array(ena_array[1]));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_mux
   (douta,
    clka,
    addra,
    ena,
    DOADO,
    \douta[13] ,
    DOPADOP,
    \douta[14] ,
    \douta[22] ,
    \douta[22]_0 ,
    \douta[23] ,
    \douta[23]_0 ,
    \douta[31] ,
    \douta[31]_0 );
  output [25:0]douta;
  input clka;
  input [0:0]addra;
  input ena;
  input [7:0]DOADO;
  input [7:0]\douta[13] ;
  input [0:0]DOPADOP;
  input [0:0]\douta[14] ;
  input [7:0]\douta[22] ;
  input [7:0]\douta[22]_0 ;
  input [0:0]\douta[23] ;
  input [0:0]\douta[23]_0 ;
  input [7:0]\douta[31] ;
  input [7:0]\douta[31]_0 ;

  wire [7:0]DOADO;
  wire [0:0]DOPADOP;
  wire [0:0]addra;
  wire clka;
  wire [25:0]douta;
  wire [7:0]\douta[13] ;
  wire [0:0]\douta[14] ;
  wire [7:0]\douta[22] ;
  wire [7:0]\douta[22]_0 ;
  wire [0:0]\douta[23] ;
  wire [0:0]\douta[23]_0 ;
  wire [7:0]\douta[31] ;
  wire [7:0]\douta[31]_0 ;
  wire ena;
  wire \no_softecc_sel_reg.ce_pri.sel_pipe[0]_i_1_n_0 ;
  wire sel_pipe;

  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \douta[10]_INST_0 
       (.I0(DOADO[4]),
        .I1(sel_pipe),
        .I2(\douta[13] [4]),
        .O(douta[4]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \douta[11]_INST_0 
       (.I0(DOADO[5]),
        .I1(sel_pipe),
        .I2(\douta[13] [5]),
        .O(douta[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \douta[12]_INST_0 
       (.I0(DOADO[6]),
        .I1(sel_pipe),
        .I2(\douta[13] [6]),
        .O(douta[6]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \douta[13]_INST_0 
       (.I0(DOADO[7]),
        .I1(sel_pipe),
        .I2(\douta[13] [7]),
        .O(douta[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \douta[14]_INST_0 
       (.I0(DOPADOP),
        .I1(sel_pipe),
        .I2(\douta[14] ),
        .O(douta[8]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \douta[15]_INST_0 
       (.I0(\douta[22] [0]),
        .I1(sel_pipe),
        .I2(\douta[22]_0 [0]),
        .O(douta[9]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \douta[16]_INST_0 
       (.I0(\douta[22] [1]),
        .I1(sel_pipe),
        .I2(\douta[22]_0 [1]),
        .O(douta[10]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \douta[17]_INST_0 
       (.I0(\douta[22] [2]),
        .I1(sel_pipe),
        .I2(\douta[22]_0 [2]),
        .O(douta[11]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \douta[18]_INST_0 
       (.I0(\douta[22] [3]),
        .I1(sel_pipe),
        .I2(\douta[22]_0 [3]),
        .O(douta[12]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \douta[19]_INST_0 
       (.I0(\douta[22] [4]),
        .I1(sel_pipe),
        .I2(\douta[22]_0 [4]),
        .O(douta[13]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \douta[20]_INST_0 
       (.I0(\douta[22] [5]),
        .I1(sel_pipe),
        .I2(\douta[22]_0 [5]),
        .O(douta[14]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \douta[21]_INST_0 
       (.I0(\douta[22] [6]),
        .I1(sel_pipe),
        .I2(\douta[22]_0 [6]),
        .O(douta[15]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \douta[22]_INST_0 
       (.I0(\douta[22] [7]),
        .I1(sel_pipe),
        .I2(\douta[22]_0 [7]),
        .O(douta[16]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \douta[23]_INST_0 
       (.I0(\douta[23] ),
        .I1(sel_pipe),
        .I2(\douta[23]_0 ),
        .O(douta[17]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \douta[24]_INST_0 
       (.I0(\douta[31] [0]),
        .I1(sel_pipe),
        .I2(\douta[31]_0 [0]),
        .O(douta[18]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \douta[25]_INST_0 
       (.I0(\douta[31] [1]),
        .I1(sel_pipe),
        .I2(\douta[31]_0 [1]),
        .O(douta[19]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \douta[26]_INST_0 
       (.I0(\douta[31] [2]),
        .I1(sel_pipe),
        .I2(\douta[31]_0 [2]),
        .O(douta[20]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \douta[27]_INST_0 
       (.I0(\douta[31] [3]),
        .I1(sel_pipe),
        .I2(\douta[31]_0 [3]),
        .O(douta[21]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \douta[28]_INST_0 
       (.I0(\douta[31] [4]),
        .I1(sel_pipe),
        .I2(\douta[31]_0 [4]),
        .O(douta[22]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \douta[29]_INST_0 
       (.I0(\douta[31] [5]),
        .I1(sel_pipe),
        .I2(\douta[31]_0 [5]),
        .O(douta[23]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \douta[30]_INST_0 
       (.I0(\douta[31] [6]),
        .I1(sel_pipe),
        .I2(\douta[31]_0 [6]),
        .O(douta[24]));
  LUT3 #(
    .INIT(8'hB8)) 
    \douta[31]_INST_0 
       (.I0(\douta[31] [7]),
        .I1(sel_pipe),
        .I2(\douta[31]_0 [7]),
        .O(douta[25]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \douta[6]_INST_0 
       (.I0(DOADO[0]),
        .I1(sel_pipe),
        .I2(\douta[13] [0]),
        .O(douta[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \douta[7]_INST_0 
       (.I0(DOADO[1]),
        .I1(sel_pipe),
        .I2(\douta[13] [1]),
        .O(douta[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \douta[8]_INST_0 
       (.I0(DOADO[2]),
        .I1(sel_pipe),
        .I2(\douta[13] [2]),
        .O(douta[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \douta[9]_INST_0 
       (.I0(DOADO[3]),
        .I1(sel_pipe),
        .I2(\douta[13] [3]),
        .O(douta[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \no_softecc_sel_reg.ce_pri.sel_pipe[0]_i_1 
       (.I0(addra),
        .I1(ena),
        .I2(sel_pipe),
        .O(\no_softecc_sel_reg.ce_pri.sel_pipe[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \no_softecc_sel_reg.ce_pri.sel_pipe_reg[0] 
       (.C(clka),
        .CE(1'b1),
        .D(\no_softecc_sel_reg.ce_pri.sel_pipe[0]_i_1_n_0 ),
        .Q(sel_pipe),
        .R(1'b0));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width
   (douta,
    clka,
    ena,
    addra);
  output [1:0]douta;
  input clka;
  input ena;
  input [12:0]addra;

  wire [12:0]addra;
  wire clka;
  wire [1:0]douta;
  wire ena;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized0
   (douta,
    clka,
    ena,
    addra);
  output [3:0]douta;
  input clka;
  input ena;
  input [12:0]addra;

  wire [12:0]addra;
  wire clka;
  wire [3:0]douta;
  wire ena;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized0 \prim_init.ram 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized1
   (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ,
    clka,
    ena_array,
    addra);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ;
  output [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  input clka;
  input [0:0]ena_array;
  input [11:0]addra;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  wire [11:0]addra;
  wire clka;
  wire [0:0]ena_array;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized1 \prim_init.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ),
        .addra(addra),
        .clka(clka),
        .ena_array(ena_array));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized2
   (DOADO,
    DOPADOP,
    clka,
    ena_array,
    addra);
  output [7:0]DOADO;
  output [0:0]DOPADOP;
  input clka;
  input [0:0]ena_array;
  input [11:0]addra;

  wire [7:0]DOADO;
  wire [0:0]DOPADOP;
  wire [11:0]addra;
  wire clka;
  wire [0:0]ena_array;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized2 \prim_init.ram 
       (.DOADO(DOADO),
        .DOPADOP(DOPADOP),
        .addra(addra),
        .clka(clka),
        .ena_array(ena_array));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized3
   (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ,
    clka,
    ena_array,
    addra);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ;
  output [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  input clka;
  input [0:0]ena_array;
  input [11:0]addra;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  wire [11:0]addra;
  wire clka;
  wire [0:0]ena_array;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized3 \prim_init.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ),
        .addra(addra),
        .clka(clka),
        .ena_array(ena_array));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized4
   (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ,
    clka,
    ena_array,
    addra);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ;
  output [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  input clka;
  input [0:0]ena_array;
  input [11:0]addra;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  wire [11:0]addra;
  wire clka;
  wire [0:0]ena_array;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized4 \prim_init.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ),
        .\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ),
        .addra(addra),
        .clka(clka),
        .ena_array(ena_array));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized5
   (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ,
    clka,
    ena_array,
    addra);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ;
  input clka;
  input [0:0]ena_array;
  input [11:0]addra;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ;
  wire [11:0]addra;
  wire clka;
  wire [0:0]ena_array;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized5 \prim_init.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ),
        .addra(addra),
        .clka(clka),
        .ena_array(ena_array));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_width" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_width__parameterized6
   (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ,
    clka,
    ena_array,
    addra);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ;
  input clka;
  input [0:0]ena_array;
  input [11:0]addra;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ;
  wire [11:0]addra;
  wire clka;
  wire [0:0]ena_array;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized6 \prim_init.ram 
       (.\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram ),
        .addra(addra),
        .clka(clka),
        .ena_array(ena_array));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init
   (douta,
    clka,
    ena,
    addra);
  output [1:0]douta;
  input clka;
  input ena;
  input [12:0]addra;

  wire [12:0]addra;
  wire clka;
  wire [1:0]douta;
  wire ena;
  wire [15:2]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOADO_UNCONNECTED ;
  wire [15:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED ;
  wire [1:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_01(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_02(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_03(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_04(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_05(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_06(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_07(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_08(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_09(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_0A(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_0B(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_0C(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_0D(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_0E(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_0F(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_10(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_11(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_12(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_13(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_14(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_15(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_16(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_17(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_18(256'hCCFCFFCFFC30F3CFCCCF3F3CF30F3C3CF3FF3C00F3FF3F30CFCF0CF3CC0303F3),
    .INIT_19(256'hFC3FCC03FCFC0FC33FCC3CF3F3CC3CF3F3CF00F30F0F3C033F3333CFFC3CFFCF),
    .INIT_1A(256'hCCFCFFCFFC30F3CFCCCF3F3CF30F3C3CF3FF3C00F3FF3F30CFCF0CF3CC0303F3),
    .INIT_1B(256'hFC3FCC03FCFC0FC33FCC3CF3F3CC3CF3F3CF00F30F0F3C033F3333CFFC3CFFCF),
    .INIT_1C(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_1D(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_1E(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_1F(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_20(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_21(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_22(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_23(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_24(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_25(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_26(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_27(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_28(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_29(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_2A(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_2B(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_2C(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_2D(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_2E(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_2F(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_30(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_31(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_32(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_33(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_34(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_35(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_36(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_37(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_38(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_39(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_3A(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_3B(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_3C(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_3D(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_3E(256'hC0003033C000C00003030003CC0C000FF0000033000030C3C000C003FFFFFF3F),
    .INIT_3F(256'hFFCF0FFFC0000003C0300003C0C0000CC30030030C00C00000030003C000000F),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .IS_CLKARDCLK_INVERTED(1'b0),
    .IS_CLKBWRCLK_INVERTED(1'b0),
    .IS_ENARDEN_INVERTED(1'b0),
    .IS_ENBWREN_INVERTED(1'b0),
    .IS_RSTRAMARSTRAM_INVERTED(1'b0),
    .IS_RSTRAMB_INVERTED(1'b0),
    .IS_RSTREGARSTREG_INVERTED(1'b0),
    .IS_RSTREGB_INVERTED(1'b0),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(2),
    .READ_WIDTH_B(2),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(2),
    .WRITE_WIDTH_B(2)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram 
       (.ADDRARDADDR({addra,1'b0}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOADO_UNCONNECTED [15:2],douta}),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOBDO_UNCONNECTED [15:0]),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPADOP_UNCONNECTED [1:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM18.ram_DOPBDOP_UNCONNECTED [1:0]),
        .ENARDEN(ena),
        .ENBWREN(1'b0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized0
   (douta,
    clka,
    ena,
    addra);
  output [3:0]douta;
  input clka;
  input ena;
  input [12:0]addra;

  wire [12:0]addra;
  wire clka;
  wire [3:0]douta;
  wire ena;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:4]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
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
    .INIT_00(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_01(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_02(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_03(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_04(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_05(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_06(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_07(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_08(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_09(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_0A(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_0B(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_0C(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_0D(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_0E(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_0F(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_10(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_11(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_12(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_13(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_14(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_15(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_16(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_17(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_18(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_19(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_1A(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_1B(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_1C(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_1D(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_1E(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_1F(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_20(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_21(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_22(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_23(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_24(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_25(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_26(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_27(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_28(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_29(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_2A(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_2B(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_2C(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_2D(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_2E(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_2F(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_30(256'hFF0FFFFF0FF00000FF0FFFFF0FFF0F00F0FFF0FF00F0FF0FF0F0000F000FFF0F),
    .INIT_31(256'hF0F0FFF0FFFFF0FFFFF00F00FF0FF0FFF0F0F0FF0FFF0FF0FF0F00FF0FF00FF0),
    .INIT_32(256'hFF0FF0FF0000FF0F00FF00FF0FF0000F0FFF0F0F0F0FF0FFFFF00FF0FFFFF0FF),
    .INIT_33(256'hFFF00FFFF0F0000FFFF0FFF000FFF00F0FFFF0F00FF0FF0FFF0FF0F00FF0FF0F),
    .INIT_34(256'hFF0FFFFF0FF00000FF0FFFFF0FFF0F00F0FFF0FF00F0FF0FF0F0000F000FFF0F),
    .INIT_35(256'hF0F0FFF0FFFFF0FFFFF00F00FF0FF0FFF0F0F0FF0FFF0FF0FF0F00FF0FF00FF0),
    .INIT_36(256'hFF0FF0FF0000FF0F00FF00FF0FF0000F0FFF0F0F0F0FF0FFFFF00FF0FFFFF0FF),
    .INIT_37(256'hFFF00FFFF0F0000FFFF0FFF000FFF00F0FFFF0F00FF0FF0FFF0FF0F00FF0FF0F),
    .INIT_38(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_39(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_3A(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_3B(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_3C(256'hCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC),
    .INIT_3D(256'hCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC),
    .INIT_3E(256'hCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC),
    .INIT_3F(256'hCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC),
    .INIT_40(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_41(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_42(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_43(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_44(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_45(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_46(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_47(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_48(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_49(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_4A(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_4B(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_4C(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_4D(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_4E(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_4F(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_50(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_51(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_52(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_53(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_54(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_55(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_56(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_57(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_58(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_59(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_5A(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_5B(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_5C(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_5D(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_5E(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_5F(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_60(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_61(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_62(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_63(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_64(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_65(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_66(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_67(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_68(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_69(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_6A(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_6B(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_6C(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_6D(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_6E(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_6F(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_70(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_71(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_72(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_73(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_74(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_75(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_76(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_77(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_78(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_79(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_7A(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_7B(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_7C(256'hFF00000000000F0F000000000F00F00FF0000000F000000FFFFFFFFFFFFF0FFF),
    .INIT_7D(256'hF00000000F000F0FF0000000F0000000000F000F0000000FF0F000F0000000FF),
    .INIT_7E(256'hF00F00000F00000F00F00000F00000000000000F0000000FF0000000000000FF),
    .INIT_7F(256'hFFFFF0FF00FFFFFFF00000000000000FF0000F000000000FF000F000000000F0),
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
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(4),
    .READ_WIDTH_B(4),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(4),
    .WRITE_WIDTH_B(4)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:4],douta}),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:0]),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ena),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized1
   (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ,
    clka,
    ena_array,
    addra);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  output [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ;
  input clka;
  input [0:0]ena_array;
  input [11:0]addra;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ;
  wire [11:0]addra;
  wire clka;
  wire [0:0]ena_array;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'hFF9FF3FF3FC1FCFF9CFFE39BBFFF01E9FFFF8F34FFFF83F9FF7DDEFFF1C3FD3F),
    .INITP_01(256'h3E063C0FAF0E81008F3805000191C0C4281C04103046D74F08BC45C5828E5801),
    .INITP_02(256'h331DCB09E4D2C07427B936DAB0020629CD3CAD81802C282D04120F45AE1F87A7),
    .INITP_03(256'h331DCB09E4D2C07427B936DAB0020629CD3CAD81802C292D6B9741113622A0E7),
    .INITP_04(256'h4F76FFF9DDF08C318F1F1FFB3CEBC821FC7FC7E5A9C6F3FCEE7B3B3DD8223E67),
    .INITP_05(256'hC7809307306180011CEEE003868101C1C0070F1C8D1C0001835DDC0160038421),
    .INITP_06(256'hFFFF049C78860FA0FFFF83C0EF1F8060FFFF0780F0870E9EFFFF813C97C8811E),
    .INITP_07(256'h0000FFFFFFFBFDFF0000FFFFF7FFFFDF0000FBFFFFFBF7FF0000FEFFFFF7FFFF),
    .INITP_08(256'hFC38FFFEFFFEFFEFFFFFFFFEFFFFFDFF7DFF7FFF7FFEFFFEFCFEFFFFCFFF63DE),
    .INITP_09(256'hFFF723F82F7E3FFFCF1FFFDEFEBFFFFFFDFDEFDE1FFCBE13FF07F7FFFFFF7FDE),
    .INITP_0A(256'h00007FFE7FFE7FFE7FFE7FFE7FFE7FFE7FFE7FFE7FFE7FFE7FFE7FFE7FFE0000),
    .INITP_0B(256'h0000050460008422A4A0A4202422041201520110081028002900812089208048),
    .INITP_0C(256'h448086191204400040001061110A8020A820E4192950004004000410A3202110),
    .INITP_0D(256'h448086191204400040001061110A8020A820E4192950004004000410A3202110),
    .INITP_0E(256'h0010040000080080880020040000020040000801000800000100800404002000),
    .INITP_0F(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INIT_00(256'hD3FFFFA33F3F3FD3D3D33F3F3F3FFFFFFFD3D3D3D3FF3FA33F3FFFD3D3D3D3FF),
    .INIT_01(256'hFFD3D3D3D3D3FFFF3FFFA3FFFFFF3FFFFFFF3FFFFFFFD33FD3D3D3A3D3D3A3FF),
    .INIT_02(256'hFFA3D3D3FFFFA3FFD3D3D3FFFFFFD3D3A33F3F3F3F3FD3D3D3D3D3D3D33F3FFF),
    .INIT_03(256'hFFFFD3D3D3D3A3D3D3D3D3D3D3FFFFFFA33F3F3FFFFFFFFF3F3FD3FF03FF3F3F),
    .INIT_04(256'hFF3FD3D3D3FFFFA3FFD3D3D3D3D3D3FF3F3F3F3F3F3F3FFFFFFFD33FA33F3FFF),
    .INIT_05(256'hA33F3FFFFFFF3F3FFFFFFFD3FFFFFFA3FFFFFF3F3F3FD3A3D33F3FD3D33FFFFF),
    .INIT_06(256'h3F3FFFFFD3A3D3D3D3FF3F3F3F3F3FFFFFD3D3D3D3D33F3FD3D3D3D3D3D3D3FF),
    .INIT_07(256'hFFFFD3D3D3FFFFFFFF3F3FA3D3D3D3D3FFD3D3FF3F3FFFFFD3D3D3D3D3FFFFFF),
    .INIT_08(256'h4FEFFBE7D7C76BBF07DBC7972F1B13CF8B4FBB372FD3C39FA7DFC3C38F87C7AF),
    .INIT_09(256'hD7B3A7BB4FE7D3972FBB1F33734FBFD7BF07C7E78B4BF3830727ABB38737CB33),
    .INIT_0A(256'hA3BB4353B3E7DBE7B303E773BF1303B76F4FFB5BF33F634FFF27A75F372B1F13),
    .INIT_0B(256'hEFBF43C73BE7EF3F87A79B474707B7EFDBE7D3E37F9FE7C3B3EB9B278B77BFF7),
    .INIT_0C(256'hDBE3C397938FC74BB3939773EF93DB0B0367DFB397CFE3DF1F8BEFF3FB07B7B7),
    .INIT_0D(256'h0BCB978F2B27170BBFEBE39B17E7ABC3AFBF9BA3F713DB3BF3F7FFCFE7BFB7A3),
    .INIT_0E(256'h4FA38BB74B3B130BA7A7B7C34F4307EF0FB3BF8773BFC33FA79B8BDBEF9FA3DB),
    .INIT_0F(256'hA3A33B675F1B1BC3C7A3B3A7E34B3BC3B3FF8373532BCFEFDFB7BFBB2F331B1F),
    .INIT_10(256'h07F70BDF27838FD7E3FBA74F476B0B2F0F9BDFFFF70333530BD717F3F327332B),
    .INIT_11(256'hEBA7A7EBA70FA7D7A7A7A71FA7A7B3A7A7DBB7A79F8B572BA71BA7FFEBB3A777),
    .INIT_12(256'h73EBEBEBA7EBEBA7A7A72BEB2B2BA7EBEBA72BEBB3A7A7A7EBEB2BA7732BEB2B),
    .INIT_13(256'h2B2BEBEB2B2BA72BEBEB2B2B7373EBEB2BEB2BEB7373EB7373EBEB1FEBEBEB73),
    .INIT_14(256'h2BEB7373EBEBEBEBEBA7A7EBEBA72BEBEBA7EBEBEB2B2BEBA7EB2BEB2BEBEB2B),
    .INIT_15(256'hA7EB2BA7EB2B2BB32BEB732B2BEBEB2BEB1F2B2BA77373A72B73EB7373EB2BEB),
    .INIT_16(256'h2B2B73EBA773A7EB2B2BEB13EBEB2BEB7373EBEBEBEBEBEBEB732B2BEB2BA7EB),
    .INIT_17(256'hA7EB2B2BEBEB2B2BEB1FEB2B2B73EB2B2B2BEBEB2BEB7373A7EBA7EB73A7EB2B),
    .INIT_18(256'hA7A72B73EB2B73EBA71F2BEBEBA72BEB73EB73EBEBA7EBEB2B2B73EBEB2B2B73),
    .INIT_19(256'hEB2B73EB2BEB2B2B73EBA72BEB73B32BEB73A7A7EBEBEB73EBEBEB73A7EBEB73),
    .INIT_1A(256'h73EBEBEBA7EBEBA7A7A72BEB2B2BA7EBEBA72BEBB3EBA72BEBEB2BA7732BEB2B),
    .INIT_1B(256'h2B2BEBEB2B2BA72BEBEB2B2B7373EBEB2BEB2BEB7373EB7373EBEB1FEBEBEB73),
    .INIT_1C(256'h2BEB7373EBEBEBEBEBA7A7EBEBA72BEBEBA7EBEBEB2B2BEBA7EB2BEB2BEBEB2B),
    .INIT_1D(256'hA7EB2BA7EB2B2BB32BEB732B2BEBEB2BEB1F2B2BA77373A72B73EB7373EB2BEB),
    .INIT_1E(256'h2B2B73EBA773A7EB2B2BEB13EBEB2BEB7373EBEBEBEBEBEBEB732B2BEB2BA7EB),
    .INIT_1F(256'hA7EB2B2BEBEB2B2BEB1FEB2B2B73EB2B2B2BEBEB2BEB7373A7EBA7EB73A7EB2B),
    .INIT_20(256'hFFFF8F8F8B3B37C31BA79F1FB3A78B27C39BB76B4B93FB8BA7C3FFA7C38B93F7),
    .INIT_21(256'h4F8B8B97635BFF3F07FF5BC7F76F8B8B0F5F8B935B17FFFF4BA74BFFFFEB838B),
    .INIT_22(256'hA31FFF3FFF7BFFA35B8BB78BBBCBF3BFBF8BFFFF6BA75743FFA35B5B5B5BA767),
    .INIT_23(256'h9F774FCB8F77079F275B33375BD3DFE76B7B472337FF8B8B8BFBEB0B737B1FDF),
    .INIT_24(256'hA7A78B3BFFB3A7A7CB9B4337FF1FFF8B8B97336FB343A7A75BB37707A7A7A78B),
    .INIT_25(256'hFF4717BF8B8B47CF0BBB8B8B6B5B875B0BA7A78743FFFF6BA78B8B43FF276F4B),
    .INIT_26(256'h5BFF23EB8BF713D39B4387A31F3B9B8B6B1313A78B8BA7AF3F8FF7675F677B8B),
    .INIT_27(256'h078BA78FA743FFFF8F9F5BFF1FDF531B975B5BB38BFF737F77FBFFD3FF8B339B),
    .INIT_28(256'hCF5F5F1F5F5F5FCF5F5F5F5F5F5F5F5F5FCFCFCFCF5F5F1F5F5F5FCFCFCFCF5F),
    .INIT_29(256'h5FCFCFCFCFCF5F5F5F5F1F5F5F5F5F5F5F5F5F5F5F5FCF5FCFCFCF1FCFCF1F5F),
    .INIT_2A(256'h5F1FCFCF5F5F1F5FCFCFCF5F5F5FCFCF1F5F5F5F5F5FCFCFCFCFCFCFCF5F5F5F),
    .INIT_2B(256'h5F5FCFCFCFCF1FCFCFCFCFCFCF5F5F5F1F5F5F5F5F5F5F5F5F5FCF5F8F5F5F5F),
    .INIT_2C(256'h5F5FCFCFCF5F5F1F5FCFCFCFCFCFCF5F5F5F5F5F5F5F5F5F5F5FCF5F1F5F5F5F),
    .INIT_2D(256'h1F5F5F5F5F5F5F5F5F5F5FCF5F5F5F1F5F5F5F5F5F5FCF1FCF5F5FCFCF5F5F5F),
    .INIT_2E(256'h5F5F5F5FCF1FCFCFCF5F5F1F5FCF5F5F5FCFCFCFCFCF5F5FCFCFCFCFCFCFCF5F),
    .INIT_2F(256'h5F5FCFCFCF5F5F5F5F5F5F1FCFCFCFCF5FCFCF5F5F5F5F5FCFCFCFCFCF5F5F5F),
    .INIT_30(256'hCF3717EB17EBEBEBEBEB1717D7173737CF373737373737EB173737EBEBEBEB37),
    .INIT_31(256'h9F9F878787879F9F9F9F9F9F9F878787CF373737173737D71717EBEBEBEB3737),
    .INIT_32(256'hEBEBEBEB17171717CF37171717D7EBEB37171717D7EBEB37CF3737EBEBEBEB37),
    .INIT_33(256'h9F9F878787879F9F9F87878787879F9F3737373737D7EBEBCF37373717373737),
    .INIT_34(256'hCFEBEB37D7EBEBEB171737EBEBEBEBEBCF3737371717173737EBD73737373737),
    .INIT_35(256'h9F8787879F9F9F9F9F8787879F9F879FCF1717171717EBEBEBEB373717171737),
    .INIT_36(256'h17EBEBEBEB171737CF37373737D7EB1737373717EBEBD7EBCF37EB3737373737),
    .INIT_37(256'h9F87877B879F9F9F87A78787A79F9F9F3737373717EB3737CF3737EBEBEB3737),
    .INIT_38(256'h378B6B376B37373737376B6BE76B8B8B378B8B8B8B8B8B376B8B8B373737378B),
    .INIT_39(256'hE7E7CFCFCFCFE7E7E7E7E7E7E7CFCFCF378B8B8B6B8B8BE76B6B373737378B8B),
    .INIT_3A(256'h373737376B6B6B6B378B6B6B6BE737378B6B6B6BE737378B378B8B373737378B),
    .INIT_3B(256'hE7E7CFCFCFCFE7E7E7CFCFCFCFCFE7E78B8B8B8B8BE73737378B8B8B6B8B8B8B),
    .INIT_3C(256'h3737378BE73737376B6B8B3737373737378B8B8B6B6B6B8B8B37E78B8B8B8B8B),
    .INIT_3D(256'hE7CFCFCFE7E7E7E7E7CFCFCFE7E7CFE7376B6B6B6B6B373737378B8B6B6B6B8B),
    .INIT_3E(256'h6B373737376B6B8B378B8B8B8BE7376B8B8B8B6B3737E737378B378B8B8B8B8B),
    .INIT_3F(256'hE7CFCF9BCFE7E7E7CFFBCFCFFBE7E7E78B8B8B8B6B378B8B378B8B3737378B8B),
    .INIT_40(256'h8FCB030BCBCBD7D7DFCBCBCBEFC7D393AF939FEBEB8B935B4F97D38B9B8F7BC3),
    .INIT_41(256'h97CB5BDBE7DB0307DBDBDBDBCF67CBEB47EF635B5B5B5B734B5B3F5B5753CB67),
    .INIT_42(256'hEBDF4BD3CB5B5B5B6B675BDFEB4FEF8B7BCB5BDBE7DFE3CBCBCBD3EBDB53CBEB),
    .INIT_43(256'h8BD75BF7BF5F03CBCBF75BCBFB5BDF838BD75BF3EF5BDBDBEFD753CBE75BF723),
    .INIT_44(256'h8BCB53DBCB5BF7DBDBDB4BEFF74FD37357E74FDBCB5707CBCBF35BEFDB83DF53),
    .INIT_45(256'h73CB6BEBE7CBDFDFDFDFCBCBDB5BCB8FA3CB5BF3D35B5B5B5B5B5BCBCF5BC7C3),
    .INIT_46(256'h9BCB6B73675B5B4B5B5B5B6B5B47DFEB73CB5BD7EBDBDBDBEFE7FF07DB5BDFA3),
    .INIT_47(256'h8FFFFF5F574F8B8BEBEB57573BEB8B8B73CBDFDFCBE7F3D3CFD7E3DFCBCBCBEB),
    .INIT_48(256'h8F7B937F939B7B8F8F938F5B5B438F93AF939FFFFFFF935B4F97D38B9B8F7BC3),
    .INIT_49(256'h975F878397938F93EB8B5FE7C787FF8F475F8B97C38F63534397538397939F67),
    .INIT_4A(256'h536BF793FFFF9BFFFF9B87FFFF83FBEB43E74F53435B8FEF8BEBD75BC3C3878F),
    .INIT_4B(256'h63534FFF9F8FC3FF8F57538B7BFFC38797938FCF8B87534F4F73C38F833B3BEB),
    .INIT_4C(256'h8BA37BA3935B27C353CB57578B8F9373575393979F9B8F7FFF9F9BFFFF574B53),
    .INIT_4D(256'h734FCBC74F538F93C7C7CF8B838F8F8FA3FF8787FFFF7B9F9F9FC3534F3F93C3),
    .INIT_4E(256'h4F6303E78B879353BBA36F977F4B47EBE7FB938B83A37F8B8F535753A3FFFFA3),
    .INIT_4F(256'h8FFFFF5F574FA7979B635757E7979B976F636BC3E7FB5397FFFFFF839BEBEB73),
    .INIT_50(256'hBB6B837F6B6B5F536B6B6B6B6B5F6BCFDFDBCFE373D3CF737373C7CFCF73CFD3),
    .INIT_51(256'h736B378F7F8B7B8B8B8B8B8B77476BCFCF6F43373737375727371737332F7373),
    .INIT_52(256'hCF6B277F6B3737374B47376B8B2B6B73CF6B378B7B6B776B6B6B7F6B8B2F679B),
    .INIT_53(256'hFB6B378B4F3F876B6B8B376BBF376F73736B377B6B378B9787832F7383376B73),
    .INIT_54(256'hCF6B2F8F6B37938B8B8B23678B2B77CFCF7B2B8B6B338B6B6B83376B8B6B6BCF),
    .INIT_55(256'hBF6B4B8B7F6B6B6B676B73678B376773CB6B378F7F3737373737376B77375FC3),
    .INIT_56(256'h73634B5747373B233737374B371F6B73736F37838B978B8B8B87778F97376B73),
    .INIT_57(256'hCF737373CFCFCFCFD373CBCFDB73E7CFCF6B6B6B6B476B6B534F776B6B6B6B9B),
    .INIT_58(256'h1B9BFB9B2FCB772BC387277F63E7BF7F37CFFBDFFBC7CBC3871BDF7733DBCF9B),
    .INIT_59(256'hFB8B377727CB7327CB7BFBFB83B797DF2B9BFB9BFBC77327C77B2BCB87BBBF6B),
    .INIT_5A(256'hC783FB7B03CF77D7D3C3CB2FC3DBBFDBFB732F772FD38BE3C7DBFBFBC7DB87D3),
    .INIT_5B(256'hE37FFBC39BFB6B2B872F7733D77B2FD7E37BFB5FB3FB730B73CBB323DB9BFBCB),
    .INIT_5C(256'hFB871BD78B1B67D3D38B17DFC79B37CFFB7FD7DB73138BCF83CF8717EB7F2BCF),
    .INIT_5D(256'h337323DB773BBF632F8B2FE7C77FFB7B1B8F33D38343BF7BBB6B1FC7D383FB97),
    .INIT_5E(256'h6B3717D377C7B7DFE39BFBCBDBBFDF872783B3D37323BF7FD3632FD7C3672F6F),
    .INIT_5F(256'hFBBFCFC75FC7DBCF83CBCFBB7BFBCBBFC777FBBF6F27CB0F7B9BFBD78323C76B),
    .INIT_60(256'h530043D3CF003B5B0000530067EF001FAF005B00000000FF0000006B7FB7005F),
    .INIT_61(256'h6BB7002FBF3F6BAF002BB70000000000AFC30053C77FAB7B008BBF47003F0000),
    .INIT_62(256'h13006F005F006B4B0077373F001BC3002B4F003700003767004B970000838700),
    .INIT_63(256'h8B004B004FEFA30047BF63D79B00DB8B73674B00009700009F8B00634300534F),
    .INIT_64(256'h004BB35B0057005B006B003767003B375B7BEF0000475300475F53536F003FE3),
    .INIT_65(256'hA747001FAF0067B700000000D3B700B7000067630000AFA700632F000000007F),
    .INIT_66(256'h00AFBB3F53004700002F97004B6B004F933B00435300270000CFB30067CB002B),
    .INIT_67(256'hBF5F3F00004BBFAF4F006B000000008F634BCB005743930000001B736B00009B),
    .INIT_68(256'h530043D3CF003B5B0000530067EF001FAF005B00000000FF0000006B7FB7005F),
    .INIT_69(256'h6BB7002FBF3F6BAF002BB70000000000AFC30053C77FAB7B008BBF47003F0000),
    .INIT_6A(256'h13006F005F006B4B0077373F001BC3002B4F003700003767004B970000838700),
    .INIT_6B(256'h8B004B004FEFA30047BF63D79B00DB8B73674B00009700009F8B00634300534F),
    .INIT_6C(256'h004BB35B0057005B006B003767003B375B7BEF0000475300475F53536F003FE3),
    .INIT_6D(256'hA747001FAF0067B700000000D3B700B7000067630000AFA700632F000000007F),
    .INIT_6E(256'h00AFBB3F53004700002F97004B6B004F933B00435300270000CFB30067CB002B),
    .INIT_6F(256'hBF5F3F00004BBFAF4F006B000000008F634BCB005743930000001B736B00009B),
    .INIT_70(256'hAF936B8F7B7FBFFB574B5323C7AB6B876F374B87936F83976B5373B3739FA337),
    .INIT_71(256'h0773B7BB976F5FCB8F4F874F836F633F0753437BC7BF977B77776367630BDBAB),
    .INIT_72(256'h13734F4B1B7BD3639F87B357C74B833F2FDB137FBF534357C7BBC7C75FC75F9F),
    .INIT_73(256'hBF33AB8757636783F7A34F776BBB63738B83BF7F33C76363536F8F0B7753A7FB),
    .INIT_74(256'hB377A773C77F7F7353579B6B6FB76F13778F93637F0F4B6BA7C757A7BFDBA78B),
    .INIT_75(256'hFB4F53530B6B7F83677F6383479BBB43735FAB735FA7CBEB9367DB27BBB3A38B),
    .INIT_76(256'h7BBF63938BBFFBABF757534FDB3FBF9B6347BBA74F6F7F27FF935787CB5783DB),
    .INIT_77(256'h276377938F4FEB73DB27834713639B63AB474FBF63FB8B338F7B779F47638BAB),
    .INIT_78(256'hD2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2),
    .INIT_79(256'hD2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2),
    .INIT_7A(256'hD2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2),
    .INIT_7B(256'hD2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2),
    .INIT_7C(256'hD2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2),
    .INIT_7D(256'hD2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2),
    .INIT_7E(256'hD2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2),
    .INIT_7F(256'hD2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2),
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
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:8],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ena_array),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized2
   (DOADO,
    DOPADOP,
    clka,
    ena_array,
    addra);
  output [7:0]DOADO;
  output [0:0]DOPADOP;
  input clka;
  input [0:0]ena_array;
  input [11:0]addra;

  wire [7:0]DOADO;
  wire [0:0]DOPADOP;
  wire [11:0]addra;
  wire clka;
  wire [0:0]ena_array;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h00007FFF7FFF7FFE7FFF7FFF7FFE7FFF7FFF7FFE7FFF7FFF7FFE7FFF7FFF07E0),
    .INITP_01(256'h000007FF07FF0FFF7FFF7FFF7FFF1FFF3FFE7FFF7FFF7FFF7FFF3FFF7FFF7C00),
    .INITP_02(256'h02000FFE7FFE3FFE7FFE7FFE7FFE7FFE7FFE7FFE7FFE7FFE7FFE7FFE7FFE7000),
    .INITP_03(256'h0010000000000000800100000000000000008000000080000000000000000100),
    .INITP_04(256'h0000010101017F3F00041010101077F70000010101057F5E000000101010F3B5),
    .INITP_05(256'h000000002204194812000400200C1A0004101A8C0D0011501148224400000000),
    .INITP_06(256'h0000000000000000000012248D91ECB7ED37C5A3FFFF00000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000E001E001E0016000A001A001F7FF0000E029E0698069602880218001FBFF),
    .INITP_09(256'h00006FF65812000069A24802400249924992400240124982000441026FF60000),
    .INITP_0A(256'h00007E761E722E7600001E42164A164618001A760272027600006E6E7C367A5E),
    .INITP_0B(256'h00007E767E724E7600006E7E76067E2E00107A067A52727600006E6E7C367A5E),
    .INITP_0C(256'h00007FFE69C633FE6EFA7F3E58B27C666FCE49FE34FE51EE5F2E7B9E7FFE0000),
    .INITP_0D(256'h4002400340035007500B46E33FFD7FF6681640062006500E581E7B9E7FFE0000),
    .INITP_0E(256'h00007FFF40034003400340033FFD7C666FCE49FE34FE51EE5F2E7B9E7FFE0000),
    .INITP_0F(256'hFB3F8001840188029041208001018003804580801101A203C00500498081FFF7),
    .INIT_00(256'hF79B9B9B9B9B9B9BB7B7BBB7ABA3A32BEBE7E7E7E3130F0F0F130FFFEBD7D3FB),
    .INIT_01(256'hC75B5B63678383838373737373737BDFF79B9B9B9B9B9B9B9B9B9B9B9B9B9B13),
    .INIT_02(256'hFB9B9B9B9B9B9B9B9B9B9B9B9B9B9B13FB9B9B9B9B9B9BBFBFBFC3BBBFBBC313),
    .INIT_03(256'hF79B9B9B9B9B9B9BA7A7A7A7B7BBC713C76763676767838383836F73737373E7),
    .INIT_04(256'hC7735B5B676783777783838373737BDFF79B9B9B9B9B9B9B9B9B9B9B9B9B9B17),
    .INIT_05(256'hEF9B9B9B9B9B9B9B9B9B9B9B9B9B9B1BF39B9B9B9BB3B3B3B3CBCBCBCFCFCB17),
    .INIT_06(256'hEB9B9B9B9B9B9BBBC7CBCBCBBFC3CB1BC7675B636363838387877373737373DF),
    .INIT_07(256'hD7D3D3D3F3F3F7F3DFE3E7E7E7EBEBFFE79B9B9B9B9B9B9B9B9B9B9B9B9B9B17),
    .INIT_08(256'hE73B47575F676B63635F676B6F7F9317E74B3B271303E3DFE7EBE7CFBFB7B7B7),
    .INIT_09(256'hCB0F171F233B6363574F47BBBBBBBB17BFEF0B273F5767635B5753BBBBBBBB17),
    .INIT_0A(256'hEB272B33373F4743332B2713134F6B0FE717171B1F3B635B4B3B3B334BBB5F17),
    .INIT_0B(256'hD3EF030F07071713131313132B6B8BFBDB0B1B2323273B332B271B2B2B536B03),
    .INIT_0C(256'hEB3F4F5B5F63676F6F7783932BB3A727BFD7EB1313131313131313AF2B978F07),
    .INIT_0D(256'hBF031F3F678BA7AFBBC7CFD7DFE3E34BCF335B7B7B7B8F979FA7AFBBCBD3CF3F),
    .INIT_0E(256'hB3DFE3EBFB1F677F8B9397938787932FBBDFE7F72B5F97A7B3BFCBCBC3C3CF47),
    .INIT_0F(256'hC3C7CFD7D7DBEBDFD7E3EBEBEFF3F3F7A3B3B7C3DB03475357534F4B474F5B13),
    .INIT_10(256'hD7737B7F83837F7F838387836F6767CFCF1F1B0BFBEBCBCFD7E3CB8383838383),
    .INIT_11(256'hD77F7F7F83838793979B938F8F9393F3D75B6B7B878F87878F8F8F938F8F8FE7),
    .INIT_12(256'hE77F7F87878787878783836B6B939BEBE773737B7F83939393939787938F97EB),
    .INIT_13(256'hD75F73837F736F6B6B6B6B6B838F9BEBDF6F7F878783878783837383838793EB),
    .INIT_14(256'hDF838F979B9B97979793979783A797F7C33F576B6B6B6B6B6B6B6BA383A397F3),
    .INIT_15(256'h9B233F5F879B9BA3A7ABABABABABABFBB767879BA39BA3A3A7A7A3A7ABABA7F7),
    .INIT_16(256'h970F0F1F2F477B8F9BA3A3A39397A7FB9BFF071B537B8F97A3ABABA7A3A3ABFB),
    .INIT_17(256'hC3D3E3F3F7F707E3DFFBDFDFDFDFDFDF7FDFE3F30F336F7B7F8387837F8F97F7),
    .INIT_18(256'h03A3A377C3C3C38FC3C3C3C3C3C3A31F1F030303031F4BE34B4B1F030303031F),
    .INIT_19(256'h1F8F8F8F8F8FA3A3C3A377A3A3A3C31F1FA3C3A3A3A38FC38F8F8F778F8F771F),
    .INIT_1A(256'h1F778F8FA3A377A38F8F8FA3A3A38F03E3C3C3C3C3C38F8F8F8F8F8F8FC3C31F),
    .INIT_1B(256'h1FA38F8F8F8F778F8F8F8F8F8FA3A31FE3C3C3C3A3A3A3A3C3C38FA3A3A3C34B),
    .INIT_1C(256'h1FC38F8F8FA3A377A38F8F8F8F8F8F1F4BC3C3C3C3C3C3A3A3A38FC377C3C31F),
    .INIT_1D(256'hE3C3C3A3A3A3C3C3A3A3A38FA3A3A3E31FA3A3C3C3C38F778FC3C38F8FC3A31F),
    .INIT_1E(256'h4BC3A3A38F778F8F8FA3A377C38FC31F1F8F8F8F8F8FC3C38F8F8F8F8F8F8F1F),
    .INIT_1F(256'h1F1F0303031F1F1F1F4B4BE3030303031F8F8FA3C3C3A3A38F8F8F8F8FA3A31F),
    .INIT_20(256'hDBDBDF0F5FE7CBDBB7C3DB377FEBDBDB0F0F1F0F5FF72B0F1FFF170F530FFB0F),
    .INIT_21(256'h2F0F131377131B130F13131367131F23F7DBFFE35FDBDBDBC7DBDF0F5FBFF3DB),
    .INIT_22(256'h67DBDBBFDBC7DB0F5FD7DBBBDB0BDB0F5B0F0F0F0F171F1F5F0FFB0F0F0F0FEF),
    .INIT_23(256'h67131313130F131367131B17131313135BDBDBDBCBE7C31F6FDBAFDBC3EBAB0F),
    .INIT_24(256'hDBDBEB0F4FD7EFEBDBDBDB0357DBDBDBDB3B0F0F5F0F0F173B1F0F075F0F0F17),
    .INIT_25(256'h130F23176B1313131313131367FF1313DBEBDB0F5BDBE3BFDBA7DB0F7BEBDBEF),
    .INIT_26(256'h5FE3DBDBDBDBD70F4FBBDBDBDBD7DB0F7B170F070F0F3B034FFB0F0F0F2B1717),
    .INIT_27(256'h5313131B130F131B67131B131B0317135FE3DBE3DBDBDB0F63DBDBDBDBEBBB0F),
    .INIT_28(256'h473B3B6B473B3B6B473B3B6B473B3B6B536B6B6B536B6B6B536B6B6B536B6B6B),
    .INIT_29(256'h4747475B4747035B475B47535B474753473B5B6B473B5B03035B3B6B475B3B6B),
    .INIT_2A(256'h473B3B035B5B3B5B4703036B473B3B6B536B6B5B03036B5B535B6B5B536B6B6B),
    .INIT_2B(256'h47470353475B03030303035B47474753473B035B5B035B035B033B6B5B5B3B6B),
    .INIT_2C(256'h473B5B03473B0303030303035B5B3B6B536B035B5B6B5B0303036B6B536B6B6B),
    .INIT_2D(256'h4747475B03475B034703470347474753473B3B03475B3B030303036B473B3B6B),
    .INIT_2E(256'h473B5B6B473B5B6B473B3B6B475B3B6B536B6B5B5B03035B535B6B6B5B6B6B6B),
    .INIT_2F(256'h47474753474747534747475347474753473B3B6B473B3B6B473B3B6B473B3B6B),
    .INIT_30(256'h47535F6B47535F6B47535F6B47535F6B4F575F6B4F575F6B4F575F6B4F575F6B),
    .INIT_31(256'h47535F6B47535F6B47535F6B47535F6B47535F6B47535F6B47535F6B47535F6B),
    .INIT_32(256'h3B6F6F3B3B6F6F3B6F6F6F6F3B6F6F6F47535F6B47535F6B47535F6B47535F6B),
    .INIT_33(256'h3B3B3B033B3B033B03033B3B033B3B3B3B6F0303033B036F3B033B0303036F3B),
    .INIT_34(256'h3BBFBF033B3B033B3B03BF3B03BFBF3B3B3B3B033B3B03033B033B3B033B3B3B),
    .INIT_35(256'h3B434F573B434F573B434F573B434F57BFBFBF3BBFBF3BBFBFBF3BBFBF3BBFBF),
    .INIT_36(256'h47535F6B47535F6B47535F6B47535F6B47535F6B47535F6B47535F6B47535F6B),
    .INIT_37(256'h474F575F474F575F474F575F474F575F47535F6B47535F6B47535F6B47535F6B),
    .INIT_38(256'h473B3B6B473B3B6B473B3B6B473B3B6B536B6B6B536B6B6B536B6B6B536B6B6B),
    .INIT_39(256'h47474753474747534747475347474753473B3B6B473B3B6B473B3B6B473B3B6B),
    .INIT_3A(256'h473B3B6B473B3B6B473B3B6B473B3B6B536B6B6B536B6B6B536B6B6B536B6B6B),
    .INIT_3B(256'h47474753474747534747475347474753473B3B6B473B3B6B473B3B6B473B3B6B),
    .INIT_3C(256'h473B3B6B473B3B6B473B3B6B473B3B6B536B6B6B536B6B6B536B6B6B536B6B6B),
    .INIT_3D(256'h47474753474747534747475347474753473B3B6B473B3B6B473B3B6B473B3B6B),
    .INIT_3E(256'h473B3B6B473B3B6B473B3B6B473B3B6B536B6B6B536B6B6B536B6B6B536B6B6B),
    .INIT_3F(256'h47474753474747534747475347474753473B3B6B473B3B6B473B3B6B473B3B6B),
    .INIT_40(256'h374F474747474F4F3747474747474F8B378B8B8B8BE73737378B8B8B6B8B8B8B),
    .INIT_41(256'hE743AF374757475B3747EB3BAF27D7CF376B6337475757573747EB3B4F475B8B),
    .INIT_42(256'h3743AF3747475B6BFF27EB3BAF475B378B27D7374763475BFF27EB3BAF475B8B),
    .INIT_43(256'hE7E7CFCFCFCFE7E7E7CFCFCFCFCFE7E78B43AF3747475B633747EB3BAF475B8B),
    .INIT_44(256'h374FEB3B47474F4F4F474747474747373737378BE73737376B6B8B373737378B),
    .INIT_45(256'hE7AFEB3B4727D7376B57475B171F23E73757EB3B4F232B576363475B5757478B),
    .INIT_46(256'h6BAFEB3B47232B57373B475B171F236B8BAFEB3B4727D737573B475B171F238B),
    .INIT_47(256'hE7CFCF9BCFE7E7E7CFFBCFCFFBE7E7E78BAFEB3B47232B6B373B475B171F238B),
    .INIT_48(256'h2F6B835F1B1B130B1B1B1B1B575F6B33373733371B33331B1B1B2F33331B3333),
    .INIT_49(256'h1B57FB8F8B8F63678F8F8F678B075733336F4FFBFBFBFB0FF3FBE7FBFB4B731B),
    .INIT_4A(256'h331BF38BCFB777FBBF5BFB1B8FF31B1B331BFB8F27CF631B1B87D3CF8FF71727),
    .INIT_4B(256'h3F1BFB8F0BFF8F1B1B8FFB1B9FFB1F1B1B1BFB8B63778F6B8F8F73878FFB1B1B),
    .INIT_4C(256'h331BF78F87778F678F8F738367B323333327F38F1BFB8F1B1B8FFB1B8FCF1B33),
    .INIT_4D(256'h2F1B078F27CF871B17871FCB8FFB171B331BFB8F27FB57B7FB77FBCF63FB132F),
    .INIT_4E(256'h1B634F0F07FBFFEFFBFBFB07FB476B1B1B5BFB8F8F938F8F8F8F638F93FB571B),
    .INIT_4F(256'h331B1B1B335B5B5B5B4F5B33371B3733336B6B571B071B1B0B0B231B576B6B27),
    .INIT_50(256'h338B6B376B374B6B6B4B6B6BE76B8B33338B8B8B8B5F2F6B732F5F3737373733),
    .INIT_51(256'h33E72F2F2F87E73737E7E79393CFCF33338B8BE76B8B8B5F576B37C737378B33),
    .INIT_52(256'h33C32F2F2FEB6B574B8B6B6B2FE7373333E32FE32FC7375F4B8B8B37C7373733),
    .INIT_53(256'h338FD763FFCFE73737CFCFCF2FCFE73333F7D7636393374B4B8B8B8B2F8B8B33),
    .INIT_54(256'h33C3D7FFE737374B576BF7D763D7373333F7D763E36B6B5F5F37E7D72F8B8B33),
    .INIT_55(256'h337FD753E7E7E73723CF7F7FE7E7CF3333E3D7636B6B374B2F37F7D7E3E36B33),
    .INIT_56(256'h33C3C337376B6B5F4B8B8B8BFFE7373333F7FFEB3737374B2F8B378BFF8B8B33),
    .INIT_57(256'h37CFCF9BCFE7E73733FBCFCFFBE7E737338B8B8B6B378B5F4B8B8B37C7378B33),
    .INIT_58(256'h338B6B376B374B6B6B4B6B6BE76B8B33338B8B8B8B5F2F6B732F5F3737373733),
    .INIT_59(256'h33E7CFCFCF87E73737E7E79393CFCF33338B8BE76B8B8B5F576B37C737378B33),
    .INIT_5A(256'h333737376BEB6B574B8B2F6B2FE73733336B6B6BE7C7375F4B8B8B37C7373733),
    .INIT_5B(256'h33E7CFCF87CFE73737CFCF63CFCFE733338B8B8B8B93374B4BF72FF72F8B8B33),
    .INIT_5C(256'h3337378BE737374B57E3D7C3D7373733338B8B8B6B6B6B5F5FC363F7638B8B33),
    .INIT_5D(256'h33CFCF87E7E7E73723CFCFCFE7E7CF33336B6BEB6B6B374B2F378B8B6B6B6B33),
    .INIT_5E(256'h33373737376B6B5F4B8B8B8BFFE73733338BE7EB3737374B2F8B378BFF8B8B33),
    .INIT_5F(256'h37CFCF9BCFE7E73733FBCFCFFBE7E737338B8B8B6B378B5F4B8B8B37C7378B33),
    .INIT_60(256'hCB5B175F87938733CBCB5F1F876BB3E3CBDB9FB7D7E3EF93B7B7BFC3CFD7D7E3),
    .INIT_61(256'hA7A72FA76F67BB7F1F239F63BF7343B7C343E37FFF134797EB3F3F8B57E34BA7),
    .INIT_62(256'h93E3A3EF0FF3474763E3F7F3BFFB67AF93C31BCF535727A76FEFEF3FA7E3CBE3),
    .INIT_63(256'hEB4B671FF3636FAB93A73F33976F73BF8F871F0BFF3F17C7E7A367D3BFFF87CB),
    .INIT_64(256'hC3435FAFAB070353C3436FFB4B434BA7EFE32F7793CB134B5FBBC38F2FC313BF),
    .INIT_65(256'h93C3AB3B9367EB07EBEB67CFEB23CBE3A7A7ABAF67F7EBEB0F435BEBEBDF43B7),
    .INIT_66(256'h8F87EB07EB2777BB67AB4F334FCF87CB93E3EBEB23436383EBBB6767676767AF),
    .INIT_67(256'hCBDB9FB7D7E3EF93B7B7BFC3CFD7D7E3CB5B175F87938733CBCB5F1F876BB3E3),
    .INIT_68(256'hCB5B175F87938733CBCB5F1F876BB3E3CBDB9FB7D7E3EF93B7B7BFC3CFD7D7E3),
    .INIT_69(256'hA7A72FA70B87A78FCBCF9BBBBF7343B7C343E37FFF134797EB3F3F8B57E34BA7),
    .INIT_6A(256'h93E3A38F0303030303030303A7FB67AF93C31B4FDF030303030303D733E3CBE3),
    .INIT_6B(256'hEB4B67A3AF979BABA7ABDBC79B6F73BF8F871F9B03574F434B3F3703A7FF87CB),
    .INIT_6C(256'hFF3B1717172337073737231717173B2FEFE377DF334357676F3F437B0FE313BF),
    .INIT_6D(256'hCBDB8FDBF7F703030303EFFFE7A3FF2FC3E7A377C3FF0BF70B0BFFC3C3C3E72F),
    .INIT_6E(256'hCBC7CB0347675F676363634703FFDB2BB7FFC30B0303030303030303F7FFFF2F),
    .INIT_6F(256'hCB8797A7A7A79BA7A7A7A7A7A7CB87FFB7FFDF4BA3A3A3A3ABAB9BA347FFFF37),
    .INIT_70(256'hCB5B175F87938733CBCB5F1F876BB3E3CBDB9FB7D7E3EF93B7B7BFC3CFD7D7E3),
    .INIT_71(256'hA7A72FA76F67BB7F1F239F63BF7343B7C343E37FFF134797EB3F3F8B57E34BA7),
    .INIT_72(256'h93E3A3EF0FF3474763E3F7F3BFFB67AF93C31BCF535727A76FEFEF3FA7E3CBE3),
    .INIT_73(256'hEB4B671FF3636FAB93A73F33976F73BF8F871F0BFF3F17C7E7A367D3BFFF87CB),
    .INIT_74(256'hFF3B1717172337073737231717173B2FEFE377ABBFE71F4757DBE37B33E313BF),
    .INIT_75(256'hCBDB8F8F8F8FA3A3C3A377A3A3A3FF2FC3E7A377C3C3C38FC3C3C3C3C3C3E72F),
    .INIT_76(256'hCBC78F8FA3A377A38F8F8FA3A3A3DB2BB7FFC3C3C3C38F8F8F8F8F8F8FC3FF2F),
    .INIT_77(256'hCBCBC3C3C3C3B7C3C3C3C3C3C3CBCBFFB7FFFFFFE7E7E7E7FFFFDBE7E7E7FF37),
    .INIT_78(256'h6F00000000000000FB000000000000FBFBFBFBFBFBFBFBFBFBFBFBFB00FBFBFB),
    .INIT_79(256'h6FFB0000000000000000000000FB00FB000000000000000000FB0000FB0000FB),
    .INIT_7A(256'h000000FB000000FB00000000000000FB6F00FB000000FB00000000000000FBFB),
    .INIT_7B(256'h6F0000000000000000FB000000FB00FB6F00000000000000FB00000000000000),
    .INIT_7C(256'h00000000000000FB00000000000000FB6F00000000000000000000000000FBFB),
    .INIT_7D(256'h6F0000FB0000000000FB0000000000FB0000FB0000000000FB00000000000000),
    .INIT_7E(256'h6F00000000FB000000000000000000FB6F000000FB000000000000000000FB00),
    .INIT_7F(256'hFB6F6F6F6F006F6F00006F6F6F6F6FFBFB0000000000000000000000000000FB),
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
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:8],DOADO}),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:1],DOPADOP}),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ena_array),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized3
   (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ,
    clka,
    ena_array,
    addra);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  output [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ;
  input clka;
  input [0:0]ena_array;
  input [11:0]addra;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ;
  wire [11:0]addra;
  wire clka;
  wire [0:0]ena_array;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h00600C00C03E030063001C644000FE16000070CB00007C06008221000E3C02C0),
    .INITP_01(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFEFFFFFFFFFFFFFFFFF),
    .INITP_02(256'h004403082400C0400020465830000000000C0D918000000805106F5DFFDFFFFF),
    .INITP_03(256'h004403082400C0400020465830000000000C0D9180000008208441111240A021),
    .INITP_04(256'hB0890006220F73CE70E0E004C31437DE0380381A56390C031184C4C227DDC198),
    .INITP_05(256'h00600C00C00A030063001C644000FE16000070C300007C06008221000EFC02C0),
    .INITP_06(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INITP_07(256'h0000FFFFFFFBFDFF0000FFFFF7FFFFDF0000FBFFFFFBF7FF0000FEFFFFF7FFFF),
    .INITP_08(256'hFC38FFFEFFFEFFFFFFFFFFFFFFFFFFFF7FFF7FFF7FFEFFFEFFFEFFFFFFFFE3FF),
    .INITP_09(256'hFFF733F80FFE3FFFFFFFFFFFFFFFFFFFFFFFFFFE1FFCBE1FFF0FFFFFFFFFFFFF),
    .INITP_0A(256'h00007FFE7EFA7FFE7FFE7FFE7FDE7FFE7FFE7FFE7FFE7FFE7FFE7FDE7FFE0000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'hA321682068699A6D9B0D2300645166DB06DB00C28226D326DB60DB64180D800D),
    .INITP_0D(256'hA321682068699A6D9B0D2300645166DB06DB00C28226D326DB60DB64180D800D),
    .INITP_0E(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'hE8FEFED01F1F1FE8E8E81F1F1F1FFEFEFEE8E8E8E8FE1FD01F1FFEE8E8E8E8FE),
    .INIT_01(256'hFEE8E8E8E8E8FEFE1FFED0FEFEFE1FFEFEFE1FFEFEFEE81FE8E8E8D0E8E8D0FE),
    .INIT_02(256'hFED0E8E8FEFED0FEE8E8E8FEFEFEE8E8D01F1F1F1F1FE8E8E8E8E8E8E81F1FFE),
    .INIT_03(256'hFEFEE8E8E8E8D0E8E8E8E8E8E8FEFEFED01F1F1FFEFEFEFE1F1FE8FE01FE1F1F),
    .INIT_04(256'hFE1FE8E8E8FEFED0FEE8E8E8E8E8E8FE1F1F1F1F1F1F1FFEFEFEE81FD01F1FFE),
    .INIT_05(256'hD01F1FFEFEFE1F1FFEFEFEE8FEFEFED0FEFEFE1F1F1FE8D0E81F1FE8E81FFEFE),
    .INIT_06(256'h1F1FFEFEE8D0E8E8E8FE1F1F1F1F1FFEFEE8E8E8E8E81F1FE8E8E8E8E8E8E8FE),
    .INIT_07(256'hFEFEE8E8E8FEFEFEFE1F1FD0E8E8E8E8FEE8E8FE1F1FFEFEE8E8E8E8E8FEFEFE),
    .INIT_08(256'h6E424A423A2A7A26523A2E1860545836126C26605E2C2C1E203C2C2E1414309A),
    .INIT_09(256'h382620286E3A3214602A5C64806C2E3C2C4A3040126A42884C581E241062305E),
    .INIT_0A(256'h1C2C647026383440265042082A504C2A7E6E42723E62786E4C5A22FA625A545A),
    .INIT_0B(256'h3E2C6E306A4244EC101E1A6A6A5028463C42363E0C943C2E26421A5E12082A4A),
    .INIT_0C(256'h3C3830181614306C9E12188044163848467A3E2618343E3C548A42484A4E2824),
    .INIT_0D(256'h52321A145A5A5C542E42B8965840222E222A1A1C44523C66424A4A323C2A261C),
    .INIT_0E(256'h6C1E8E2A6A62524A20202A306E664E4450262E12022E2E641E1A143C4A1A1C38),
    .INIT_0F(256'h1E2062787452542E301C2824466E622C224C867E6E5C36463E282C2A5E5E5A5C),
    .INIT_10(256'h564E5842667E843E44507A646072586A5A2042524E546C7C583E5E4C4C666C68),
    .INIT_11(256'hAA7A7AAA7A5A7A3E7A7A7A627A7AD87A7A402E7A8C827E687A607A5248967A78),
    .INIT_12(256'h0AAAAAAA7AAAAA7A7A7AD8AAD8D87AAAAA7AD8AAD87A7A7AAAAAD87A0AD8AAD8),
    .INIT_13(256'hD8D8AAAAD8D87AD8AAAAD8D80A0AAAAAD8AAD8AA0A0AAA0A0AAAAA0FAAAAAA0A),
    .INIT_14(256'hD8AA0A0AAAAAAAAAAA7A7AAAAA7AD8AAAA7AAAAAAAD8D8AA7AAAD8AAD8AAAAD8),
    .INIT_15(256'h7AAAD87AAAD8D8D8D8AA0AD8D8AAAAD8AA0FD8D87A0A0A7AD80AAA0A0AAAD8AA),
    .INIT_16(256'hD8D80AAA7A0A7AAAD8D8AAB0AAAAD8AA0A0AAAAAAAAAAAAAAA0AD8D8AAD87AAA),
    .INIT_17(256'h7AAAD8D8AAAAD8D8AA0FAAD8D80AAAD8D8D8AAAAD8AA0A0A7AAA7AAA0A7AAAD8),
    .INIT_18(256'h7A7AD80AAAD80AAA7A0FD8AAAA7AD8AA0AAA0AAAAA7AAAAAD8D80AAAAAD8D80A),
    .INIT_19(256'hAAD80AAAD8AAD8D80AAA7AD8AA0AD8D8AA0A7A7AAAAAAA0AAAAAAA0A7AAAAA0A),
    .INIT_1A(256'h0AAAAAAA7AAAAA7A7A7AD8AAD8D87AAAAA7AD8AAD8AA7AD8AAAAD87A0AD8AAD8),
    .INIT_1B(256'hD8D8AAAAD8D87AD8AAAAD8D80A0AAAAAD8AAD8AA0A0AAA0A0AAAAA0FAAAAAA0A),
    .INIT_1C(256'hD8AA0A0AAAAAAAAAAA7A7AAAAA7AD8AAAA7AAAAAAAD8D8AA7AAAD8AAD8AAAAD8),
    .INIT_1D(256'h7AAAD87AAAD8D8D8D8AA0AD8D8AAAAD8AA0FD8D87A0A0A7AD80AAA0A0AAAD8AA),
    .INIT_1E(256'hD8D80AAA7A0A7AAAD8D8AAB0AAAAD8AA0A0AAAAAAAAAAAAAAA0AD8D8AAD87AAA),
    .INIT_1F(256'h7AAAD8D8AAAAD8D8AA0FAAD8D80AAAD8D8D8AAAAD8AA0A0A7AAA7AAA0A7AAAD8),
    .INIT_20(256'hFEFE47C6C41D1B610D53CE0F5953C413614DDAB4A4C8FC4553E0FE5361C4C8FA),
    .INIT_21(256'hA6C4C44BB0ACFE1F03FEACE2FA37C4C4072FC4C8AC0BFEFE2553A4FEFEF441C4),
    .INIT_22(256'hD00FFE1FFE3D7FD0ACC45B455DE4F85FDEC4FEFE3553AAA0FED0ACACACAC5333),
    .INIT_23(256'hCEBAA6E4C6BA034F13AC989AACE8EEF2B4BC23111BFEC4C4C4FCF40539BC0FEE),
    .INIT_24(256'h5353C49CFED85353E4CCA01BFE0FFEC4C4CA1937D82153532D59BA03535353C4),
    .INIT_25(256'hFE230B5FC4C4A2E6055D45C4B4ACC2AC055353C2A0FEFEB4D2C4C4A0FE13B6A4),
    .INIT_26(256'hACFE11F4C4FA09E8CCA0C2D00F1D4D45B4090953C4C453571F47FAB22F333DC4),
    .INIT_27(256'h03C45347D2A0FEFE47CEACFE0FEEA80DCAACACD8C4FEB8BEBAFCFEE8FE4519CC),
    .INIT_28(256'h66AEAE0E2F2F2F662F2F2F2F2F2FAEAEAE66666666AE2F0E2F2FAE66666666AE),
    .INIT_29(256'hAE6666666666AEAE2FAE0EAEAEAE2FAEAEAE2FAEAEAE662F6666660E66660EAE),
    .INIT_2A(256'hAE0E6666AEAE0EAE666666AEAEAE66660E2F2F2F2F2F666666666666662F2FAE),
    .INIT_2B(256'hAEAE666666660E666666666666AEAEAE0E2F2F2FAEAEAEAE2F2F66AEC6AE2F2F),
    .INIT_2C(256'hAE2F666666AEAE0EAE666666666666AE2F2F2F2F2F2F2FAEAEAE662F0E2F2FAE),
    .INIT_2D(256'h0E2F2FAEAEAE2F2FAEAEAE66AEAEAE0EAEAEAE2F2F2F660E662F2F66662FAEAE),
    .INIT_2E(256'h2F2FAEAE660E666666AEAE0E2F662FAEAE66666666662F2F66666666666666AE),
    .INIT_2F(256'hAEAE666666AEAEAEAE2F2F0E66666666AE6666AE2F2FAEAE6666666666AEAEAE),
    .INIT_30(256'h5297836E836E6E6E6E6E838350839797529797979797976E8397976E6E6E6E97),
    .INIT_31(256'h28281616161628282828282828161616529797978397975083836E6E6E6E9797),
    .INIT_32(256'h6E6E6E6E838383835297838383506E6E97838383506E6E975297976E6E6E6E97),
    .INIT_33(256'h282816161616282828161616161628289797979797506E6E5297979783979797),
    .INIT_34(256'h526E6E97506E6E6E8383976E6E6E6E6E5297979783838397976E509797979797),
    .INIT_35(256'h281616162828282828161616282816285283838383836E6E6E6E979783838397),
    .INIT_36(256'h836E6E6E6E8383975297979797506E83979797836E6E506E52976E9797979797),
    .INIT_37(256'h2816160216282828163016163028282897979797836E97975297976E6E6E9797),
    .INIT_38(256'h083020082008080808082020BC20303008303030303030082030300808080830),
    .INIT_39(256'hBCBCA8A8A8A8BCBCBCBCBCBCBCA8A8A808303030203030BC2020080808083030),
    .INIT_3A(256'h08080808202020200830202020BC080830202020BC0808300830300808080830),
    .INIT_3B(256'hBCBCA8A8A8A8BCBCBCA8A8A8A8A8BCBC3030303030BC08080830303020303030),
    .INIT_3C(256'h08080830BC080808202030080808080808303030202020303008BC3030303030),
    .INIT_3D(256'hBCA8A8A8BCBCBCBCBCA8A8A8BCBCA8BC08202020202008080808303020202030),
    .INIT_3E(256'h20080808082020300830303030BC0820303030200808BC080830083030303030),
    .INIT_3F(256'hBCA8A87AA8BCBCBCA8C4A8A8C4BCBCBC30303030200830300830300808083030),
    .INIT_40(256'hD558797D58585260645858586C5650D96DDBCF747432D5B7BBD577DBDDD5D969),
    .INIT_41(256'hD3581C606660797B606060605C225874B36C201C1C1C1C28161C0E1C1A185AB3),
    .INIT_42(256'h7464165C581C1C1C24221C646A166C32C5581C606664665858585C6460185874),
    .INIT_43(256'h32541C70541E795858701C58721C66D132541C6E6C1C6060645E185A681C729F),
    .INIT_44(256'hCD581860581C70606060146C701652D9BD661660581A7B58586E1C6C603064A3),
    .INIT_45(256'hBF58246A6658646464645A58601C58D5D1581C665C1C1C1C1C1C1C585C1C5677),
    .INIT_46(256'hD3562428221C1E141C1C1C241C126474C35A1C5E6A6060606468787B601C64D3),
    .INIT_47(256'hDFFFFFADBBA332327474B9BFAB743232C3586464586868505052666458585874),
    .INIT_48(256'hD5D1D7DFD9D5DBDDC1D7DFA5A9B7D7D96DDBCFFFFFFFD5B7BBD577DBDDD5D969),
    .INIT_49(256'hD3B7D9DBE1CBD5CB6C32327871DDFFD5B3ADD7D569D9ADB5ADD9B5D5DFCDE1B3),
    .INIT_4A(256'h383076D5FFFFD5FFFFD5D5FFFFDB8274AD78ADB5BBB1D17C327676C36969D5C9),
    .INIT_4B(256'hADBBB1FFDFD773FFD1B5B9CBD5FF67D3D5CFCF67CFD5B7BBADCB71D7CDABB57A),
    .INIT_4C(256'hCDD5DFE3D3B5B375B577B5B5D1D5CBD9BDB5E3D3C5DBD9BFFFD5DDFFFFA7B9A3),
    .INIT_4D(256'hBFB56573BDC3D7D773736DD3DBCFD1D5D1FFC7D1FFFFD5DFDFDF69B3B3AFE177),
    .INIT_4E(256'h343C7276C9C9D9B567DBD7D7E5B9B17A807CD3CBCDD5D3D7D5C7B5B5D5FFFFD3),
    .INIT_4F(256'hDFFFFFADBBA3DBD5D5B9B9BF78D7D5CD2E44BB677874B9CFFFFFFFD5D57E7830),
    .INIT_50(256'h9E202C2A20201A1420202020201A20A8B0AEA8B25EAAA85E5E5EA4A8A85EA8AA),
    .INIT_51(256'h5E2008322A30283030303030261020A8A8220E08080808180008F8080604245E),
    .INIT_52(256'hA820002A20080808121008203002205EA82008302820262020202A2030041E7A),
    .INIT_53(256'hBE200830120C2E20203008204A08225E5E200828200830362E2C04242C08205E),
    .INIT_54(256'hA8200432200834303030FE1E300226A8A828023020063020202C0820302220A8),
    .INIT_55(256'hA02012302A2020201E20241E30081E5EA62008322A0808080808082026081AA2),
    .INIT_56(256'h5E1C121810080AFE0808081208FC205E5E22082C30363030302E26323608205E),
    .INIT_57(256'hA85E5E5EA8A8A8A8AA5EA6A8AE5EB4A8A8202020200E2020141226202020207A),
    .INIT_58(256'hEA7AC47AF4A660F2A268F06456B4A064F8A8C4B0C4A4A6A268EAB060F6AEA872),
    .INIT_59(256'hC46AF860F0A65EF0A662C4C4669C70B0F27AC47AC4A45EF0A462F2A6689E965A),
    .INIT_5A(256'hA466C462DEA860ACAAA2A6F4A2AE96AEC45EF460F4AA6AB2A4AEC4C4A4AE68AA),
    .INIT_5B(256'hB264C4A27AC45AF268F460F6AC62F4ACB262C4548EC45EE25EA69AEEAE7AC4A6),
    .INIT_5C(256'hC468EAAC6AEA58AAAA6AE8B0A472F8A8C464ACAE5EE66AA866A868E8B664F2A8),
    .INIT_5D(256'hF65EEEAE60FA9656F46AF4B4A464C462EA6CF6AA66FE96629E5AECA4AA66C470),
    .INIT_5E(256'h5AF8E8AA60A49CB0B27AC4A6AE96B068F0669AAA5EEEA064AA56F4ACA258F45C),
    .INIT_5F(256'hC4A0A8A454A4AEA866A6A89E62C4A696A460C4A05CF0A6E4627AC4AC66EEA45A),
    .INIT_60(256'hA800A06967009CAC0000A8003377000F5700AC00000000FE000000B43F5B002F),
    .INIT_61(256'h355B00175F9E355700155B00000000005761002963BE553D00455FA2001F0000),
    .INIT_62(256'h0900B600AE0035A400BA1B9E000D61001527001B00001B3300A44B0000414300),
    .INIT_63(256'hC400A400A6775100235FB06B4D006D45B8B2A40000CA00004F4500B0A00029A6),
    .INIT_64(256'h002559AC002B00AC0035001BB2009C1BAC3D770000232900232FA82937001F71),
    .INIT_65(256'h53A2000F5700335B00000000695B005B000033B00000575300B09600000000BE),
    .INIT_66(256'h00575D9E2900A20000174B0025B40027499C0021290013000067590033650015),
    .INIT_67(256'h5FAE1F0000A45F57A600350000000047B02565002BA0C80000000DB8B40000CC),
    .INIT_68(256'hA800A06967009CAC0000A8003377000F5700AC00000000FE000000B43F5B002F),
    .INIT_69(256'h355B00175F9E355700155B00000000005761002963BE553D00455FA2001F0000),
    .INIT_6A(256'h0900B600AE0035A400BA1B9E000D61001527001B00001B3300A44B0000414300),
    .INIT_6B(256'hC400A400A6775100235FB06B4D006D45B8B2A40000CA00004F4500B0A00029A6),
    .INIT_6C(256'h002559AC002B00AC0035001BB2009C1BAC3D770000232900232FA82937001F71),
    .INIT_6D(256'h53A2000F5700335B00000000695B005B000033B00000575300B09600000000BE),
    .INIT_6E(256'h00575D9E2900A20000174B0025B40027499C0021290013000067590033650015),
    .INIT_6F(256'h5FAE1F0000A45F57A600350000000047B02565002BA0C80000000DB8B40000CC),
    .INIT_70(256'hC7ABA5A7ADFFB5BF99959969B7ABA5AFA589EBA3ABA1AFB9A599A9BBABAFB17D),
    .INIT_71(256'h71A9BDBFB9A59F54A995B393AFA19D8FD999919FB9B5B9ADABABA1A19FDDC5AD),
    .INIT_72(256'h79A997917DADD5A1A3AFC799FF91B18F85C97997B5998F8FB9B3B9B99FB99FBD),
    .INIT_73(256'hB5D5ABB399A189AFE9BD95ABA5B5A1A99BAFB5ABEFB9A19F99A1B771AB7FA76C),
    .INIT_74(256'hC79BABA9D1ABABA9998FA5A5A5B1A377ABA79F9DAB75FD99A7B999A9B7C3A7B3),
    .INIT_75(256'h66959999F5A5ABAFA1AB9FAF7BBFB38FA9A1F7A99FC1D5CD9FA3C381B346A9B3),
    .INIT_76(256'h93B5A1BBB3B5D3ABD19999955A8FB5B19D93B3AB95A1AB7F6EB597B3CF99AFC5),
    .INIT_77(256'h81A1ABA9A795CDA9C383B1FF77A1BB9DAB937FB5A168B183B7AD93A7939F9BAD),
    .INIT_78(256'h8787878787878787878787878787878787878787878787878787878787878787),
    .INIT_79(256'h8787878787878787878787878787878787878787878787878787878787878787),
    .INIT_7A(256'h8787878787878787878787878787878787878787878787878787878787878787),
    .INIT_7B(256'h8787878787878787878787878787878787878787878787878787878787878787),
    .INIT_7C(256'h8787878787878787878787878787878787878787878787878787878787878787),
    .INIT_7D(256'h8787878787878787878787878787878787878787878787878787878787878787),
    .INIT_7E(256'h8787878787878787878787878787878787878787878787878787878787878787),
    .INIT_7F(256'h8787878787878787878787878787878787878787878787878787878787878787),
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
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:8],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ena_array),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized4
   (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ,
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ,
    clka,
    ena_array,
    addra);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  output [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ;
  input clka;
  input [0:0]ena_array;
  input [11:0]addra;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  wire [0:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 ;
  wire [11:0]addra;
  wire clka;
  wire [0:0]ena_array;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INITP_01(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INITP_02(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
    .INITP_03(256'hFFEFFFFFFFFFFFFF7FFEFFFFFFFFFFFFFFFF7FFFFFFF7FFFFFFFFFFFFFFFFEFF),
    .INITP_04(256'hFFFF808080808080FFFF080808080808FFFF808080808080FFFF080808080808),
    .INITP_05(256'h0000666644620000000062064402000000004022620600000000442266660000),
    .INITP_06(256'h00000000000000000000FFFFEDB7ECB7ED37C5A3FFFF00000000000000000000),
    .INITP_07(256'h0000666666660000000066666666000000006666666600000000666666660000),
    .INITP_08(256'h0000C201C201C601460082018001F7FF0000A849A809E809284E88418041FBFF),
    .INITP_09(256'h0000600640020000000000000000000000000000000000000000400260060000),
    .INITP_0A(256'h00007E761E722E7620003E52365E365638003A760272027600006E6E7C36781E),
    .INITP_0B(256'h00007E767E724E7600006E7E762E7E2E00107A067A52727600006E6E7C36781E),
    .INITP_0C(256'h0000000016380C00110400C0274C0398103036000B002E1020D0046000000000),
    .INITP_0D(256'h20002000200020002004381C7FFE000817E03000100020002000046000000000),
    .INITP_0E(256'h000000003FFC3FFC3FFC3FFC7FFE0398103036000B002E1020D0046000000000),
    .INITP_0F(256'hFB3F8001840188029041208001018003804580801101A203C00500498081FFF7),
    .INIT_00(256'h7BCDCDCDCDCDCDCDDBDBDDDBD5D1D19575737373718987878789877F756B697D),
    .INIT_01(256'h63ADADB1B3C1C1C1C1B9B9B9B9B9BD6F7BCDCDCDCDCDCDCDCDCDCDCDCDCDCD89),
    .INIT_02(256'h7DCDCDCDCDCDCDCDCDCDCDCDCDCDCD897DCDCDCDCDCDCDDFDFDFE1DDDFDDE189),
    .INIT_03(256'h7BCDCDCDCDCDCDCDD3D3D3D3DBDDE38963B3B1B3B3B3C1C1C1C1B7B9B9B9B973),
    .INIT_04(256'h63B9ADADB3B3C1BBBBC1C1C1B9B9BD6F7BCDCDCDCDCDCDCDCDCDCDCDCDCDCD8B),
    .INIT_05(256'h77CDCDCDCDCDCDCDCDCDCDCDCDCDCD8D79CDCDCDCDD9D9D9D9E5E5E5E7E7E58B),
    .INIT_06(256'h75CDCDCDCDCDCDDDE3E5E5E5DFE1E58D63B3ADB1B1B1C1C1C3C3B9B9B9B9B96F),
    .INIT_07(256'h6B69696979797B796F7173737375757F73CDCDCDCDCDCDCDCDCDCDCDCDCDCD8B),
    .INIT_08(256'h98E6E6EAECECE6E8ECEEEEEADCD4D49098BAB8B2ACA48E929CA0988876625A5E),
    .INIT_09(256'h9EF0F0EEF0F0F2F6FAFEFAFCFCFCFCA49CE2E6ECF2F4F0F4F6F8F8FCFCFCFCA0),
    .INIT_0A(256'hA2F0F2F4F6F6F2F2F2F2F2E2E2FAFCA4A4EAEAECEEF0F4F6F8FAFCF6FAFCFAA2),
    .INIT_0B(256'h9CE2EEF6F6EEE6E2E2E2E2E2F2F4FAA89CE6F0F8FAF6F4F2F2F0EAF2F2F4F8A6),
    .INIT_0C(256'h9CEEF4FAFEFEFCFAF8F6F6F6F2FCF4A690D2DEE2E2E2E2E2E2E2E2FAF2FAF6A8),
    .INIT_0D(256'h78BCC8DAEEF8F6F8FCFEFCFCFCFAFAA686DEEEFAFCFCFCFEFEFCFAFAFCFCF8A6),
    .INIT_0E(256'h72ACB0B8C0CEE8F0F8FCFCFCF6F8FEAA76A8ACB8D0E4F0F4F8FEFEFAF8F8FCA8),
    .INIT_0F(256'h7E868E96989AA29A9AA0A2A4A8ACAEB0689498A0AEC0E2E6EAECF0EEEEF6FAAA),
    .INIT_10(256'h7FC3C5C7C9C9C7C7C9C9CBC9C1BDBD7B7B9F9D958F89797B7F85795B5B5B5B5B),
    .INIT_11(256'h7FC7C7C7C9C9CBD1D3D5D1CFCFD1D18B7FB9BFC5CBCFCBCBCFCFCFD1CFCFCF87),
    .INIT_12(256'h87C7C7CBCBCBCBCBCBC9C9BFBFD1D58987C3C3C5C7C9D1D1D1D1D3CBD1CFD389),
    .INIT_13(256'h7FBBC3C9C7C3C1BFBFBFBFBFC9CFD58983C1C7CBCBC9CBCBC9C9C3C9C9CBD189),
    .INIT_14(256'h83C9CFD3D5D5D3D3D3D1D3D3C9D9D38D77ABB7BFBFBFBFBFBFBFBFD7C9D7D38B),
    .INIT_15(256'h65A1ABBBCBD5D5D7D9DBDBDBDBDBDB8F71BDCBD5D7D5D7D7D9D9D7D9DBDBD98D),
    .INIT_16(256'h6397979FA5AFC5CFD5D7D7D7D1D3D98F6591939DB5C5CFD3D7DBDBD9D7D7DB8F),
    .INIT_17(256'h777D858B8D8D9385838F8383838383835983858B97A7C1C5C7C9CBC9C7CFD38D),
    .INIT_18(256'h0151513B61616147616161616161510F0F010101010F25F025250F010101010F),
    .INIT_19(256'h0F4747474747515161513B515151610F0F516151515147614747473B47473B0F),
    .INIT_1A(256'h0F3B474751513B514747475151514701F061616161614747474747474761610F),
    .INIT_1B(256'h0F51474747473B47474747474751510FF0616161515151516161475151516125),
    .INIT_1C(256'h0F6147474751513B514747474747470F2561616161616151515147613B61610F),
    .INIT_1D(256'hF06161515151616151515147515151F00F5151616161473B476161474761510F),
    .INIT_1E(256'h25615151473B47474751513B6147610F0F47474747476161474747474747470F),
    .INIT_1F(256'h0F0F0101010F0F0F0F2525F0010101010F47475161615151474747474751510F),
    .INIT_20(256'h8A8A8CAC3B92848A727A8AC44B948A8AACACB6AC3B9CBCACB6A0AEAC33ACA0AC),
    .INIT_21(256'h2311151547151915111515153F15191D9C8AA0923B8A8A8A7E8A8CAC3B789A8A),
    .INIT_22(256'h3F8A8A7A8A7E8AAC3B868A768AAA8AAC35ACACACACB0B6B63BACA0ACACACAC98),
    .INIT_23(256'h3F151515151115153F15191315151515378A8A8A84927ABC438A6E8A7A986EAC),
    .INIT_24(256'h8A8A98AC318698948A8A8AA4338A8A8A8AC6ACAC3BACACB0C6B6ACA63BACACB0),
    .INIT_25(256'h15111D1341151515151515153F0A15158A948AAC358A92788A6A8AAC47988A98),
    .INIT_26(256'h3B8E8A8A8A8A86AC2F768A8A8A868AAC49AEACA6ACACC6A42FA0ACACACBCB0AE),
    .INIT_27(256'h33151519151115193F151915190D13153B8E8A928A8A8AAC398A8A8A8A9476AC),
    .INIT_28(256'h5A1D1D885A1D1D885A1D1D885A1D1D8868888888688888886888888868888888),
    .INIT_29(256'h5A5A5AAC5A5A00AC5AAC5A68AC5A5A685A1DAC885A1DAC0000AC1D885AAC1D88),
    .INIT_2A(256'h5A1D1D00ACAC1DAC5A0000885A1D1D88688888AC000088AC68AC88AC68888888),
    .INIT_2B(256'h5A5A00685AAC0000000000AC5A5A5A685A1D00ACAC00AC00AC001D88ACAC1D88),
    .INIT_2C(256'h5A1DAC005A1D000000000000ACAC1D88688800ACAC88AC000000888868888888),
    .INIT_2D(256'h5A5A5AAC005AAC005A005A005A5A5A685A1D1D005AAC1D00000000885A1D1D88),
    .INIT_2E(256'h5A1DAC885A1DAC885A1D1D885AAC1D88688888ACAC0000AC68AC8888AC888888),
    .INIT_2F(256'h5A5A5A685A5A5A685A5A5A685A5A5A685A1D1D885A1D1D885A1D1D885A1D1D88),
    .INIT_30(256'h5A6878885A6878885A6878885A68788868707C8868707C8868707C8868707C88),
    .INIT_31(256'h5A6878885A6878885A6878885A6878885A6878885A6878885A6878885A687888),
    .INIT_32(256'h9DB7B79D9DB7B79DB7B7B7B79DB7B7B75A6878885A6878885A6878885A687888),
    .INIT_33(256'h9D9D9D009D9D009D00009D9D009D9D9D9DB70000009D00B79D009D000000B79D),
    .INIT_34(256'h9D5F5F009D9D009D9D005F9D005F5F9D9D9D9D009D9D00009D009D9D009D9D9D),
    .INIT_35(256'h4A5662704A5662704A5662704A5662705F5F5F9D5F5F9D5F5F5F9D5F5F9D5F5F),
    .INIT_36(256'h5A6878885A6878885A6878885A6878885A6878885A6878885A6878885A687888),
    .INIT_37(256'h5A626E785A626E785A626E785A626E785A6878885A6878885A6878885A687888),
    .INIT_38(256'h5A1D1D885A1D1D885A1D1D885A1D1D8868888888688888886888888868888888),
    .INIT_39(256'h5A5A5A685A5A5A685A5A5A685A5A5A685A1D1D885A1D1D885A1D1D885A1D1D88),
    .INIT_3A(256'h5A1D1D885A1D1D885A1D1D885A1D1D8868888888688888886888888868888888),
    .INIT_3B(256'h5A5A5A685A5A5A685A5A5A685A5A5A685A1D1D885A1D1D885A1D1D885A1D1D88),
    .INIT_3C(256'h5A1D1D885A1D1D885A1D1D885A1D1D8868888888688888886888888868888888),
    .INIT_3D(256'h5A5A5A685A5A5A685A5A5A685A5A5A685A1D1D885A1D1D885A1D1D885A1D1D88),
    .INIT_3E(256'h5A1D1D885A1D1D885A1D1D885A1D1D8868888888688888886888888868888888),
    .INIT_3F(256'h5A5A5A685A5A5A685A5A5A685A5A5A685A1D1D885A1D1D885A1D1D885A1D1D88),
    .INIT_40(256'h08443C3C3C3C4444E41C3C3C3C3C44300830303030BC08080830303020303030),
    .INIT_41(256'hBCD61CE41C54222CE41C9CB71C136BA808625CE41C545454E41C9CB744222C30),
    .INIT_42(256'h08D61CE41C222C627E929CB71C222C0830136BE41C5C222C7E929CB71C222C30),
    .INIT_43(256'hBCBCA8A8A8A8BCBCBCA8A8A8A8A8BCBC30D61CE41C222C5CE41C9CB71C222C30),
    .INIT_44(256'h08449CB73C3C4444443C3C3C3C3C3C0808080830BC0808082020300808080830),
    .INIT_45(256'hBC1C9CB722136BE46254222C50606CBC08549CB744FC36545C5C222C54543C30),
    .INIT_46(256'h201C9CB722FC3654E4B7222C50606C20301C9CB722136BE454B7222C50606C30),
    .INIT_47(256'hBCA8A87AA8BCBCBCA8C4A8A8C4BCBCBC301C9CB722FC3662E4B7222C50606C30),
    .INIT_48(256'h26202C48E4E4E0DCE4E4E4E4461A20282A2A282A162828161616262828162828),
    .INIT_49(256'h1646D6706E70565A7070705A6CDA4628282240D6D6D6D6E0D0D6CCD6D43E2416),
    .INIT_4A(256'h28E4D06EB4A064D6A84ED6E470D2E41628E4D670E8B456E4E46ABCB470D2E21C),
    .INIT_4B(256'h2EE4D670DCD86EE4E470D6E476D6E61616E4D66C5464705C6E6E626C6ED6E416),
    .INIT_4C(256'h28E4D2706A64705A7070626A5A9AE82828E8D270E4D470E4E46ED6E470B6E428),
    .INIT_4D(256'h26E4DC70EAB46AE4E26AE6B270D6E21628E4D670EAD64AA0D664D6B456D6E026),
    .INIT_4E(256'h161C42E0DAD6D6D0D6D6D6DCD63C20161646D66E70707070706E567070D64616),
    .INIT_4F(256'h28161616284C4C4C4C424C282A162A2828202046E4D8E4E4DCDCE8E44620201C),
    .INIT_50(256'h283020082008405A5A402020BC203028283030303048EE5A5EEE480808080828),
    .INIT_51(256'h28BC3C3C3C6CBC2C2CBCBC7878A8A828283030BC20303048462008B008083028),
    .INIT_52(256'h28A43C3C3CD02046403020203CBC082828B23CB23CB0084840303008B0080828),
    .INIT_53(256'h28746BB1FFA8BC2C2CA8A8A83CA8BC2828BC6BB1B1780840403030303C303028),
    .INIT_54(256'h28A46BFFBC0808404620BC6BB16B082828BC6BB1B22020484808BC6B3C303028),
    .INIT_55(256'h28686B42BCBCBC2C1CA86868BCBCA82828B26BB1202008402A08BC6BB2B22028),
    .INIT_56(256'h28A4A4080820204840303030E6BC082828BCFFD0080808402A300830E6303028),
    .INIT_57(256'h2CA8A87AA8BCBC2C28C4A8A8C4BCBC2C283030302008304840303008B0083028),
    .INIT_58(256'h283020082008405A5A402020BC203028283030303048EE5A5EEE480808080828),
    .INIT_59(256'h28BCA8A8A86CBC2C2CBCBC7878A8A828283030BC20303048462008B008083028),
    .INIT_5A(256'h2808080820D0204640303C203CBC082828202020BCB0084840303008B0080828),
    .INIT_5B(256'h28BCA8A86CA8BC2C2CA8A8B1A8A8BC28283030303078084040BC3CBC3C303028),
    .INIT_5C(256'h28080830BC08084046B26BA46B080828283030302020204848A4B1BCB1303028),
    .INIT_5D(256'h28A8A86CBCBCBC2C1CA8A8A8BCBCA828282020D0202008402A08303020202028),
    .INIT_5E(256'h280808080820204840303030E6BC08282830BCD0080808402A300830E6303028),
    .INIT_5F(256'h2CA8A87AA8BCBC2C28C4A8A8C4BCBC2C283030302008304840303008B0083028),
    .INIT_60(256'h64AC8AAEC2C8C298E4E4AE8EC2B4D870646C4E5A6A7076485A5A5E60666A6A70),
    .INIT_61(256'h52D217D2B6B2DCBE0F11CE31DEB8A05A60A0F0BEFE09A2CAF41F1FC4AAF0A452),
    .INIT_62(256'h4870D0F607F82323B0F0FAF8DEFCB25648E00DE6292B13D2B6F6F61FD2F0E470),
    .INIT_63(256'h74A4B20FF8B0B6D4C8D21F19CAB6B85E46C20F05FE1F0BE2F2D0B2E8DEFEC264),
    .INIT_64(256'h60A02FD6D4030129E021B6FC2521A45276F096BAC8E409252FDCE04717E0885E),
    .INIT_65(256'h48E0D41DC8B2F403F4F4B2E6F411E47052D2D4D6B2FAF4F40721ACF4F4EEA05A),
    .INIT_66(256'h46C2F403F4133BDCB2D4271927E6C2644870F4F41121B0C0F4DCB2B2B2B2B256),
    .INIT_67(256'h646C4E5A6A7076485A5A5E60666A6A7064AC8AAEC2C8C298E4E4AE8EC2B4D870),
    .INIT_68(256'h64AC8AAEC2C8C298E4E4AE8EC2B4D870646C4E5A6A7076485A5A5E60666A6A70),
    .INIT_69(256'h52D217D28442524664664CDCDEB8A05A60A0F0BEFE09A2CAF41F1FC4AAF0A452),
    .INIT_6A(256'h4870D047000000000000000052FCB25648E00DA66E0000000000006A98F0E470),
    .INIT_6B(256'h74A4B251D64B4D5553556DE24CB6B85E46C20F4D002A2620241E1A0052FEC264),
    .INIT_6C(256'h7E1D8B8B8B919B839B9B918B8B8B1D9676F0BAEE98A0AAB2B69EA0BC07F0885E),
    .INIT_6D(256'h64EC47EC7A7A00000000767EF251FE9660F2513B61FE847A8484FE616161F296),
    .INIT_6E(256'h64E2650022322E3230303022007EEC945AFE618400000000000000007AFEFE96),
    .INIT_6F(256'h64C24B5252524C52525252525264C27E5AFE6F245050505054544C50227EFE9A),
    .INIT_70(256'h64AC8AAEC2C8C298E4E4AE8EC2B4D870646C4E5A6A7076485A5A5E60666A6A70),
    .INIT_71(256'h52D217D2B6B2DCBE0F11CE31DEB8A05A60A0F0BEFE09A2CAF41F1FC4AAF0A452),
    .INIT_72(256'h4870D0F607F82323B0F0FAF8DEFCB25648E00DE6292B13D2B6F6F61FD2F0E470),
    .INIT_73(256'h74A4B20FF8B0B6D4C8D21F19CAB6B85E46C20F05FE1F0BE2F2D0B2E8DEFEC264),
    .INIT_74(256'h7E1D8B8B8B919B839B9B918B8B8B1D9676F0BAD4DEF20F232BECF03D19F0885E),
    .INIT_75(256'h64EC47474747515161513B515151FE9660F2513B61616147616161616161F296),
    .INIT_76(256'h64E2474751513B51474747515151EC945AFE616161614747474747474761FE96),
    .INIT_77(256'h6464606060605A60606060606064647E5AFEFEFEF2F2F2F2FEFEECF2F2F2FE9A),
    .INIT_78(256'hAD00000000000000EB000000000000FDEBFDFDFDFDFDFDFDFDFDFDFD00FDFDFD),
    .INIT_79(256'hADEB0000000000000000000000FD00FD000000000000000000EB0000FD0000FD),
    .INIT_7A(256'h000000EB000000FD00000000000000FDAD00EB000000FD00000000000000FDFD),
    .INIT_7B(256'hAD0000000000000000EB000000EB00FDAD00000000000000EB00000000000000),
    .INIT_7C(256'h00000000000000FD00000000000000FDAD00000000000000000000000000EBFD),
    .INIT_7D(256'hAD0000FD0000000000EB0000000000FD0000FD0000000000FD00000000000000),
    .INIT_7E(256'hAD00000000EB000000000000000000EBAD000000FD000000000000000000EB00),
    .INIT_7F(256'hEBADADADAD00ADAD0000ADADADADADEBEB0000000000000000000000000000FD),
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
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:8],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_1 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ena_array),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized5
   (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ,
    clka,
    ena_array,
    addra);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  input clka;
  input [0:0]ena_array;
  input [11:0]addra;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_71 ;
  wire [11:0]addra;
  wire clka;
  wire [0:0]ena_array;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
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
    .INIT_00(256'h747F7F688F8F8F7474748F8F8F8F7F7F7F747474747F8F688F8F7F747474747F),
    .INIT_01(256'h7F74747474747F7F8F7F687F7F7F8F7F7F7F8F7F7F7F748F747474687474687F),
    .INIT_02(256'h7F6874747F7F687F7474747F7F7F7474688F8F8F8F8F747474747474748F8F7F),
    .INIT_03(256'h7F7F74747474687474747474747F7F7F688F8F8F7F7F7F7F8F8F747F807F8F8F),
    .INIT_04(256'h7F8F7474747F7F687F7474747474747F8F8F8F8F8F8F8F7F7F7F748F688F8F7F),
    .INIT_05(256'h688F8F7F7F7F8F8F7F7F7F747F7F7F687F7F7F8F8F8F7468748F8F74748F7F7F),
    .INIT_06(256'h8F8F7F7F74687474747F8F8F8F8F8F7F7F74747474748F8F747474747474747F),
    .INIT_07(256'h7F7F7474747F7F7F7F8F8F68747474747F74747F8F8F7F7F74747474747F7F7F),
    .INIT_08(256'h836768625C618B5E69605C4F79766C5B4E855C7E7B615B4F54615B5A4D4B5C9E),
    .INIT_09(256'h5E56535A83686252795770788C865B6258715A634C846A8F6E7B57584B7C5E7E),
    .INIT_0A(256'h53568483566A6563566962455A746C568A836F886D838782687952427D7B766E),
    .INIT_0B(256'h6A597A5B786266394C545081816B57645F625F624999665A566450764C475A66),
    .INIT_0C(256'h5F68594F4E4C5B829D514F8C654E627072895E564F5D62617A946664686C575B),
    .INIT_0D(256'h6C5C4E4D7B796F6E5864A7946F63545A565A50546B72627D6A646B60675A5853),
    .INIT_0E(256'h84539055837F72755353585B83816D65715658484A5B5A8254504D626A525362),
    .INIT_0F(256'h514F808C8A78775A5B54585361807F5C5969928D857A5F6460575C5B7A7F7071),
    .INIT_10(256'h6B676C617390935F62685983818A6C756D506169676A767E6C5F6F6666737674),
    .INIT_11(256'h79595979596D595F5959597159596C595960575997927F7459705969649C598D),
    .INIT_12(256'hB9797979597979595959967996965979795996796C59595979799659B9967996),
    .INIT_13(256'h969679799696599679799696B9B9797996799679B9B979B9B9797987797979B9),
    .INIT_14(256'h9679B9B979797979795959797959967979597979799696795979967996797996),
    .INIT_15(256'h597996597996966C9679B996967979967987969659B9B95996B979B9B9799679),
    .INIT_16(256'h9696B97959B959799696797479799679B9B979797979797979B9969679965979),
    .INIT_17(256'h59799696797996967987799696B97996969679799679B9B959795979B9597996),
    .INIT_18(256'h595996B97996B9795987967979599679B979B979795979799696B979799696B9),
    .INIT_19(256'h7996B97996799696B979599679B96C9679B95959797979B9797979B9597979B9),
    .INIT_1A(256'hB9797979597979595959967996965979795996796C79599679799659B9967996),
    .INIT_1B(256'h969679799696599679799696B9B9797996799679B9B979B9B9797987797979B9),
    .INIT_1C(256'h9679B9B979797979795959797959967979597979799696795979967996797996),
    .INIT_1D(256'h597996597996966C9679B996967979967987969659B9B95996B979B9B9799679),
    .INIT_1E(256'h9696B97959B959799696797479799679B9B979797979797979B9969679965979),
    .INIT_1F(256'h59799696797996967987799696B97996969679799679B9B959795979B9597996),
    .INIT_20(256'h7F7FA363628E8DB086A96787ACA96289B0A66D5A52647EA2A9707FA9B062647D),
    .INIT_21(256'h536262A558567F8F817F56717D9B62628397626456857F7F92A9527F7F7AA062),
    .INIT_22(256'h68877F8F7F9EBF685662ADA2AE727CAF6F627F7F9AA955507F6856565656A999),
    .INIT_23(256'h675D5372635D81A789564C4D567477795A5E91888D7F6262627E7A829C5E8777),
    .INIT_24(256'hA9A9624E7F6CA9A97266508D7F877F6262658C9B6C90A9A996AC5D81A9A9A962),
    .INIT_25(256'h7F9185AF6262517382AEA2625A56615682A9A961507F7F5A696262507F895B52),
    .INIT_26(256'h567F887A627D847466506168878EA6A25A8484A96262A9AB8FA37D5997999E62),
    .INIT_27(256'h8162A9A369507F7FA367567F877754866556566C627F5C5F5D7E7F747FA28C66),
    .INIT_28(256'h3357570797979733979797979797575757333333335797079797573333333357),
    .INIT_29(256'h5733333333335757975707575757975757579757575733973333330733330757),
    .INIT_2A(256'h5707333357570757333333575757333307979797979733333333333333979757),
    .INIT_2B(256'h5757333333330733333333333357575707979797575757579797335763579797),
    .INIT_2C(256'h5797333333575707573333333333335797979797979797575757339707979757),
    .INIT_2D(256'h0797975757579797575757335757570757575797979733073397973333975757),
    .INIT_2E(256'h9797575733073333335757079733975757333333333397973333333333333357),
    .INIT_2F(256'h5757333333575757579797073333333357333357979757573333333333575757),
    .INIT_30(256'hBAD7D7C8D7C8C8C8C8C8D7D7B8D7D7D7BAD7D7D7D7D7D7C8D7D7D7C8C8C8C8D7),
    .INIT_31(256'hA5A59E9E9E9EA5A5A5A5A5A5A59E9E9EBAD7D7D7D7D7D7B8D7D7C8C8C8C8D7D7),
    .INIT_32(256'hC8C8C8C8D7D7D7D7BAD7D7D7D7B8C8C8D7D7D7D7B8C8C8D7BAD7D7C8C8C8C8D7),
    .INIT_33(256'hA5A59E9E9E9EA5A5A59E9E9E9E9EA5A5D7D7D7D7D7B8C8C8BAD7D7D7D7D7D7D7),
    .INIT_34(256'hBAC8C8D7B8C8C8C8D7D7D7C8C8C8C8C8BAD7D7D7D7D7D7D7D7C8B8D7D7D7D7D7),
    .INIT_35(256'hA59E9E9EA5A5A5A5A59E9E9EA5A59EA5BAD7D7D7D7D7C8C8C8C8D7D7D7D7D7D7),
    .INIT_36(256'hD7C8C8C8C8D7D7D7BAD7D7D7D7B8C8D7D7D7D7D7C8C8B8C8BAD7C8D7D7D7D7D7),
    .INIT_37(256'hA59E9E8E9EA5A5A59EAE9E9EAEA5A5A5D7D7D7D7D7C8D7D7BAD7D7C8C8C8D7D7),
    .INIT_38(256'h9FBCB49FB49F9F9F9F9FB4B473B4BCBC9FBCBCBCBCBCBC9FB4BCBC9F9F9F9FBC),
    .INIT_39(256'h737369696969737373737373736969699FBCBCBCB4BCBC73B4B49F9F9F9FBCBC),
    .INIT_3A(256'h9F9F9F9FB4B4B4B49FBCB4B4B4739F9FBCB4B4B4739F9FBC9FBCBC9F9F9F9FBC),
    .INIT_3B(256'h73736969696973737369696969697373BCBCBCBCBC739F9F9FBCBCBCB4BCBCBC),
    .INIT_3C(256'h9F9F9FBC739F9F9FB4B4BC9F9F9F9F9F9FBCBCBCB4B4B4BCBC9F73BCBCBCBCBC),
    .INIT_3D(256'h736969697373737373696969737369739FB4B4B4B4B49F9F9F9FBCBCB4B4B4BC),
    .INIT_3E(256'hB49F9F9F9FB4B4BC9FBCBCBCBC739FB4BCBCBCB49F9F739F9FBC9FBCBCBCBCBC),
    .INIT_3F(256'h7369694C69737373697C69697C737373BCBCBCBCB49FBCBC9FBCBC9F9F9FBCBC),
    .INIT_40(256'hE8C4CED0C4C4BBC6C7C4C4C4CDC4BAF2B1EBE93A3A20E4E0DBEDB8ECEEEBEAB2),
    .INIT_41(256'hEAC4A7C8CAC8CECFC8C8C8C8C6AAC43ADBCDA9A7A7A7A7ADA4A7A0A7A6A5C5D6),
    .INIT_42(256'h3AC7A4C7C4A7A7A7ABAAA7C7CBA4CD20E5C4A7C8CAC7C9C4C4C4C7C5C8A5C43A),
    .INIT_43(256'h20BBA7CFC1A8CEC4C4CFA7C4CFA7C7E520BBA7CECDA7C8C9C6C7A5C5CAA7CED2),
    .INIT_44(256'hE9C4A5C8C4A7CFC8C8C8A3CDCFA4BAECDDCAA4C8C4A6CFC4C4CEA7CDC8B1C7DC),
    .INIT_45(256'hD9C4ABCBCAC4C7C7C7C7C5C4C8A7C4E9EAC4A7C6C7A7A7A7A7A7A7C4C6A7C4B7),
    .INIT_46(256'hECC4ABADAAA7A8A3A7A7A7ABA7A2C73AE5C4A7C7CBC9C8C8C6CACECFC9A7C7E3),
    .INIT_47(256'hF4FFFFDCE0D720203A3ADAD9DA3A2020E5C4C7C7C4CBC8BABABAC9C7C4C4C43A),
    .INIT_48(256'hE8F1ECEAEBE7E8E7EAE6E6DCDBD9E7F2B1EBE9FFFFFFE4E0DBEDB8ECEEEBEAB2),
    .INIT_49(256'hEADAEDE8EEEAF1ED3C201541B1E3FFEEDBD9E5E8B6E7DADCDDEBE2EBEDE7E8D6),
    .INIT_4A(256'h1A1D3CEDFFFFEBFFFFEAF0FFFFED413ADA42E0DBD5D9E53E203D3EDDB6B6EBEA),
    .INIT_4B(256'hD7D9DDFFEAE6BFFFE6DEDBEAECFFBAE7EBE9EFB4EAEFD9D2DBEABBE8E1DAE03D),
    .INIT_4C(256'hE9F0E9E9ECD6D9B6DFB1DEDEE2E9E3ECDDD2ECE3EDF0EAEAFFF1E8FFFFDEDADC),
    .INIT_4D(256'hD9DDB4B0DDD5EDEDB0B0BCE9E3E6EBE9EAFFE4EAFFFFECECECECB6DFDBDAECB7),
    .INIT_4E(256'h1B1F3E40E8EBE9D8B5E6EAEEECD7DB3A423EE9EAEBE8E7EAEAD7DBD7ECFFFFE3),
    .INIT_4F(256'hF4FFFFDCE0D7EDEAEDE2DAD93BEAEBE81C1DDABA3C3ADBEDFFFFFFE9EA363F19),
    .INIT_50(256'h64B4BAB9B4B4B1AEB4B4B4B4B4B1B4696D6C696E3C6A693C3C3C6769693C696A),
    .INIT_51(256'h3CB49FBDB9BCB8BCBCBCBCBCB7A3B46969B5A29F9F9F9FA79B9F979F9E9DB63C),
    .INIT_52(256'h69B49BB9B49F9F9FA4A39FB4BC9CB43C69B49FBCB8B4B7B4B4B4B9B4BC9DB34C),
    .INIT_53(256'h74B49FBCADA1BBB4B4BC9FB4C99FB53C3CB49FB8B49FBCBFBBBA9DB6BA9FB43C),
    .INIT_54(256'h69B49DBDB49FBEBCBCBC9AB3BC9CB76969B89CBCB49EBCB4B4BA9FB4BCACB469),
    .INIT_55(256'h65B4A4BCB9B4B4B4B3B4B6B3BC9FB33C68B49FBDB99F9F9F9F9F9FB4B79FB166),
    .INIT_56(256'h3CB2A4A7A39FA09A9F9F9FA49F99B43C3CB59FBABCBFBCBCBCBBB7BDBF9FB43C),
    .INIT_57(256'h693C3C3C696969696A3C68696C3C6F6969B4B4B4B4ABB4B4AEADB7B4B4B4B44C),
    .INIT_58(256'h954C7C4C9A683D996641983F386F653F9C697C6D7C67686641956D3D9B6C6946),
    .INIT_59(256'h7C429C3D98683C98683E7C7C4063456D994C7C4C7C673C98673E996841645E3A),
    .INIT_5A(256'h67407C3E8F693D6B6A66689A666C5E6C7C3C9A3D9A6A426E676C7C7C676C416A),
    .INIT_5B(256'h6E3F7C664C7C3A99419A3D9B6B3E9A6B6E3E7C37597C3C913C6862976C4C7C68),
    .INIT_5C(256'h7C41956B4295396A6A42946D67469C697C3F6B6C3C93426940694194703F9969),
    .INIT_5D(256'h9B3C976C3D9D5E389A429A6F673F7C3E95439B6A409F5E3E643A96676A407C45),
    .INIT_5E(256'h3A9C946A3D67636D6E4C7C686C5E6D419840626A3C97653F6A389A6B66399A3B),
    .INIT_5F(256'h7C65696737676C69406869643E7C685E673D7C653B9868923E4C7C6B4097673A),
    .INIT_60(256'h540050B4B3004E560000540099BB0087AB0056000000007F0000005A9FAD0097),
    .INIT_61(256'h9AAD008BAF4F9AAB008AAD0000000000ABB00094B15FAA9E00A2AF51008F0000),
    .INIT_62(256'h84005B0057009A52005D8D4F0086B0008A93008D00008D990052A50000A0A100),
    .INIT_63(256'h6200520053BBA80091AF58B5A600B6A25C59520000650000A7A2005850009453),
    .INIT_64(256'h0092AC5600950056009A008D59004E8D569EBB0000919400919754949B008FB8),
    .INIT_65(256'hA9510087AB0099AD00000000B4AD00AD000099580000ABA900584B000000005F),
    .INIT_66(256'h00ABAE4F94005100008BA500925A0093A44E00909400890000B3AC0099B2008A),
    .INIT_67(256'hAF578F000052AFAB53009A00000000A35892B200955064000000865C5A000066),
    .INIT_68(256'h540050B4B3004E560000540099BB0087AB0056000000007F0000005A9FAD0097),
    .INIT_69(256'h9AAD008BAF4F9AAB008AAD0000000000ABB00094B15FAA9E00A2AF51008F0000),
    .INIT_6A(256'h84005B0057009A52005D8D4F0086B0008A93008D00008D990052A50000A0A100),
    .INIT_6B(256'h6200520053BBA80091AF58B5A600B6A25C59520000650000A7A2005850009453),
    .INIT_6C(256'h0092AC5600950056009A008D59004E8D569EBB0000919400919754949B008FB8),
    .INIT_6D(256'hA9510087AB0099AD00000000B4AD00AD000099580000ABA900584B000000005F),
    .INIT_6E(256'h00ABAE4F94005100008BA500925A0093A44E00909400890000B3AC0099B2008A),
    .INIT_6F(256'hAF578F000052AFAB53009A00000000A35892B200955064000000865C5A000066),
    .INIT_70(256'hE9DFD8DEDCFFE6E2D3D0D2BFE7E0D8DED9CAF7DCDFD8DDE2D8D2DAE6DBE1E2C7),
    .INIT_71(256'hBFDAE7E8E2D9D6B0DDD1DFD0DDD8D6CCF8D2CFD9E8E6E2DCDBDBD6D8D6F9EEE2),
    .INIT_72(256'hC2DAD1CFC5DCF1D6DDDEE9D3FFCFDFCDC9EEC2D7E6D2CDD0E8E6E8E8D6E8D6E4),
    .INIT_73(256'hE6EEE0DFD3D6D0DDFBE5D1DBD8E6D6DAD9DDE6DCFFE8D6D6D2D8E2BFDBCBDFBC),
    .INIT_74(256'hEAD7E0DAEEDCDCDAD2D0DDD8D9E4D8C1DBDDDBD6DCC1FFD5DFE8D3E0E7EDDFE0),
    .INIT_75(256'hBBD1D2D2FFD8DCDDD8DCD6DDC9E5E5CEDAD6FBDAD6E6F1F1DBD7EDC7E5A9E0DF),
    .INIT_76(256'hD5E6D6E3DFE6F6E0F4D3D2D1B3CCE6DED6D0E5E0D1D8DCC7BEE2D2DFEFD3DDEE),
    .INIT_77(256'hC6D6DBDFDED1F1DAEDC7DFFFC1D6E3D6E0CFCBE6D6BBDFC8E1DCD5DECFD7D8E2),
    .INIT_78(256'h2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F),
    .INIT_79(256'h2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F),
    .INIT_7A(256'h2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F),
    .INIT_7B(256'h2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F),
    .INIT_7C(256'h2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F),
    .INIT_7D(256'h2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F),
    .INIT_7E(256'h2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F),
    .INIT_7F(256'h2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F2F),
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
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:8],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_71 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ena_array),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "blk_mem_gen_prim_wrapper_init" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_prim_wrapper_init__parameterized6
   (\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ,
    clka,
    ena_array,
    addra);
  output [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  input clka;
  input [0:0]ena_array;
  input [11:0]addra;

  wire [7:0]\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 ;
  wire \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_71 ;
  wire [11:0]addra;
  wire clka;
  wire [0:0]ena_array;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ;
  wire \NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ;
  wire [31:8]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED ;
  wire [31:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED ;
  wire [3:1]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED ;
  wire [3:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED ;
  wire [7:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED ;

  (* box_type = "PRIMITIVE" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
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
    .INIT_00(256'hBDE6E6E6E6E6E6E6EDEDEEEDEAE8E8CABAB9B9B9B8C4C3C3C3C4C3BFBAB5B4BE),
    .INIT_01(256'hB1D6D6D8D9E0E0E0E0DCDCDCDCDCDEB7BDE6E6E6E6E6E6E6E6E6E6E6E6E6E6C4),
    .INIT_02(256'hBEE6E6E6E6E6E6E6E6E6E6E6E6E6E6C4BEE6E6E6E6E6E6EFEFEFF0EEEFEEF0C4),
    .INIT_03(256'hBDE6E6E6E6E6E6E6E9E9E9E9EDEEF1C4B1D9D8D9D9D9E0E0E0E0DBDCDCDCDCB9),
    .INIT_04(256'hB1DCD6D6D9D9E0DDDDE0E0E0DCDCDEB7BDE6E6E6E6E6E6E6E6E6E6E6E6E6E6C5),
    .INIT_05(256'hBBE6E6E6E6E6E6E6E6E6E6E6E6E6E6C6BCE6E6E6E6ECECECECF2F2F2F3F3F2C5),
    .INIT_06(256'hBAE6E6E6E6E6E6EEF1F2F2F2EFF0F2C6B1D9D6D8D8D8E0E0E1E1DCDCDCDCDCB7),
    .INIT_07(256'hB5B4B4B4BCBCBDBCB7B8B9B9B9BABABFB9E6E6E6E6E6E6E6E6E6E6E6E6E6E6C5),
    .INIT_08(256'hEAFFFFFFFFFFFFFEFEFEFEFEFFFEFDE7EAF0EFEDEAEBECEBEAEAE8E3E0DAD8D8),
    .INIT_09(256'hE9FFFFFFFFFEFCFDFEFEFDFFFFFFFFEAEAFAFBFEFFFEFCFBFBFBFCFFFFFFFFE8),
    .INIT_0A(256'hEAFCFCFDFDFDFEFFFFFFFFFFFFFDFEEAEAFDFDFDFEFEFFFFFFFFFFFDFDFFFFEA),
    .INIT_0B(256'hE9FCFDFDFBFAFEFFFFFFFFFFFFFDFDE8EAFEFDFCF9F9FFFFFFFFFDFFFFFAFBE7),
    .INIT_0C(256'hEAFFFFFEFEFCFDFDFEFEFEFFFFFFFFEAE8F7FBFFFFFFFFFFFFFFFFFFFFFFFFEA),
    .INIT_0D(256'hE6F8F9FCFFFFFEFEFFFFFFFFFFFFFFEAE8FEFFFFFFFEFDFDFEFEFFFFFFFFFFEA),
    .INIT_0E(256'hE9FCFAFAFCFBFCFDFFFFFFFEFBFBFEEAE8F6F4F6FEFFFDFDFFFFFFFFFDFEFFEA),
    .INIT_0F(256'hFAFBFDFFFFFDF2EFEEF0EDEDEEEEEEEEE6F6F5F6FCFCFEFFFFFFFFFEFDFDFFEA),
    .INIT_10(256'h0073787D82827D7D828287826E646400001E190A000000000000000000000000),
    .INIT_11(256'h007D7D7D82828791969B918C8C919100005A6978878C87878C8C8C918C8C8C00),
    .INIT_12(256'h007D7D87878787878782826969919B00007373787D82919191919687918C9600),
    .INIT_13(256'h005F73827D736E6969696969828C9B00006E7D87878287878282738282879100),
    .INIT_14(256'h00828C969B9B96969691969682A59600003C556969696969696969A082A09600),
    .INIT_15(256'h00233C5F879B9BA0A5AAAAAAAAAAAA000064879BA09BA0A0A5A5A0A5AAAAA500),
    .INIT_16(256'h000F0F1E2D46788C9BA0A0A09196A5000000051950788C96A0AAAAA5A0A0AA00),
    .INIT_17(256'h00000000000005000000000000000000000000000F326E787D8287827D8C9600),
    .INIT_18(256'h80A8A89DB0B0B0A3B0B0B0B0B0B0A88787808080808792789292878080808087),
    .INIT_19(256'h87A3A3A3A3A3A8A8B0A89DA8A8A8B08787A8B0A8A8A8A3B0A3A3A39DA3A39D87),
    .INIT_1A(256'h879DA3A3A8A89DA8A3A3A3A8A8A8A38078B0B0B0B0B0A3A3A3A3A3A3A3B0B087),
    .INIT_1B(256'h87A8A3A3A3A39DA3A3A3A3A3A3A8A88778B0B0B0A8A8A8A8B0B0A3A8A8A8B092),
    .INIT_1C(256'h87B0A3A3A3A8A89DA8A3A3A3A3A3A38792B0B0B0B0B0B0A8A8A8A3B09DB0B087),
    .INIT_1D(256'h78B0B0A8A8A8B0B0A8A8A8A3A8A8A87887A8A8B0B0B0A39DA3B0B0A3A3B0A887),
    .INIT_1E(256'h92B0A8A8A39DA3A3A3A8A89DB0A3B08787A3A3A3A3A3B0B0A3A3A3A3A3A3A387),
    .INIT_1F(256'h8787808080878787879292788080808087A3A3A8B0B0A8A8A3A3A3A3A3A8A887),
    .INIT_20(256'h7E7C7F9BAF83767C676E7CB1B7867C7C9B9BA59BAF8DAA9BA58F9D9BAC9B929B),
    .INIT_21(256'hA39B9E9EB59EA09E9B9E9E9EB19C9FA08D7C8F82AF7C7C7C737C7F9BAF6B8C7C),
    .INIT_22(256'hB17C7C6D7C737C9BAF797C6A7C9A7C9BAE9B9B9B9B9FA5A5AF9B929B9B9B9B89),
    .INIT_23(256'hB19E9E9E9E9B9E9EB19EA09D9C9E9E9EAE7C7C7C76836EA7B57C657C6E88629B),
    .INIT_24(256'h7C7C889BAB7989867C7C7C94AD7C7C7C7EB29B9BAF9B9B9FB2A39B97AF9B9B9F),
    .INIT_25(256'h9E9BA09DB29C9E9E9E9E9E9EB1999E9E7C867C9BAE7C826B7C5F7C9BB6887C89),
    .INIT_26(256'hAF807E7C7C7C799BAB6A7C7C7C797C9BB89D9B979B9BB294AB929B9B9BAA9F9D),
    .INIT_27(256'hAC9E9EA09E9B9EA0B19E9E9E9E989D9EAF807C827C7C7C9BB07C7C7C7C866A9B),
    .INIT_28(256'h918E8EDB918E8EDB918E8EDB918E8EDBA8DBDBDBA8DBDBDBA8DBDBDBA8DBDBDB),
    .INIT_29(256'h9191915691910056915691A8569191A8918E56DB918E560000568EDB91568EDB),
    .INIT_2A(256'h918E8E0056568E56910000DB918E8EDBA8DBDB560000DB56A856DB56A8DBDBDB),
    .INIT_2B(256'h919100A89156000000000056919191A8918E00565600560056008EDB56568EDB),
    .INIT_2C(256'h918E5600918E00000000000056568EDBA8DB005656DB56000000DBDBA8DBDBDB),
    .INIT_2D(256'h919191560091560091009100919191A8918E8E0091568E00000000DB918E8EDB),
    .INIT_2E(256'h918E56DB918E56DB918E8EDB91568EDBA8DBDB5656000056A856DBDB56DBDBDB),
    .INIT_2F(256'h919191A8919191A8919191A8919191A8918E8EDB918E8EDB918E8EDB918E8EDB),
    .INIT_30(256'h91A8C1DB91A8C1DB91A8C1DB91A8C1DBA7B7C9DBA7B7C9DBA7B7C9DBA7B7C9DB),
    .INIT_31(256'h91A8C1DB91A8C1DB91A8C1DB91A8C1DB91A8C1DB91A8C1DB91A8C1DB91A8C1DB),
    .INIT_32(256'hCEDBDBCECEDBDBCEDBDBDBDBCEDBDBDB91A8C1DB91A8C1DB91A8C1DB91A8C1DB),
    .INIT_33(256'hCECECE00CECE00CE0000CECE00CECECECEDB000000CE00DBCE00CE000000DBCE),
    .INIT_34(256'hCEAFAF00CECE00CECE00AFCE00AFAFCECECECE00CECE0000CE00CECE00CECECE),
    .INIT_35(256'h788BA0B6788BA0B6788BA0B6788BA0B6AFAFAFCEAFAFCEAFAFAFCEAFAFCEAFAF),
    .INIT_36(256'h91A8C1DB91A8C1DB91A8C1DB91A8C1DB91A8C1DB91A8C1DB91A8C1DB91A8C1DB),
    .INIT_37(256'h91A0B2C491A0B2C491A0B2C491A0B2C491A8C1DB91A8C1DB91A8C1DB91A8C1DB),
    .INIT_38(256'h918E8EDB918E8EDB918E8EDB918E8EDBA8DBDBDBA8DBDBDBA8DBDBDBA8DBDBDB),
    .INIT_39(256'h919191A8919191A8919191A8919191A8918E8EDB918E8EDB918E8EDB918E8EDB),
    .INIT_3A(256'h918E8EDB918E8EDB918E8EDB918E8EDBA8DBDBDBA8DBDBDBA8DBDBDBA8DBDBDB),
    .INIT_3B(256'h919191A8919191A8919191A8919191A8918E8EDB918E8EDB918E8EDB918E8EDB),
    .INIT_3C(256'h918E8EDB918E8EDB918E8EDB918E8EDBA8DBDBDBA8DBDBDBA8DBDBDBA8DBDBDB),
    .INIT_3D(256'h919191A8919191A8919191A8919191A8918E8EDB918E8EDB918E8EDB918E8EDB),
    .INIT_3E(256'h918E8EDB918E8EDB918E8EDB918E8EDBA8DBDBDBA8DBDBDBA8DBDBDBA8DBDBDB),
    .INIT_3F(256'h919191A8919191A8919191A8919191A8918E8EDB918E8EDB918E8EDB918E8EDB),
    .INIT_40(256'h9F2C272727272C2C5E75272727272CBC9FBCBCBCBC739F9F9FBCBCBCB4BCBCBC),
    .INIT_41(256'h730C115E753691BC5E752A311189B5699F413F5E753636365E752A312C91BCBC),
    .INIT_42(256'h9F0C115E7591BC413F492A311191BC9FBC89B55E753F91BC3F492A311191BCBC),
    .INIT_43(256'h73736969696973737369696969697373BC0C115E7591BC3F5E752A311191BCBC),
    .INIT_44(256'h9F2C2A3127272C2C2C2727272727279F9F9F9FBC739F9F9FB4B4BC9F9F9F9FBC),
    .INIT_45(256'h73112A319189B55E413691BC637787739F362A312C89A8363F3F91BC363627BC),
    .INIT_46(256'hB4112A319189A8365E3191BC637787B4BC112A319189B55E363191BC637787BC),
    .INIT_47(256'h7369694C69737373697C69697C737373BC112A319189A8415E3191BC637787BC),
    .INIT_48(256'h18B4BA2CAFAFADABAFAFAFAF2BB1B4191A1A191A0E19190E0E0E1919190E1919),
    .INIT_49(256'h0E2BA25453544B4D5454544D53A42B1919B527A2A2A2A2A7A0A29DA2A126B60E),
    .INIT_4A(256'h19AFA0539E8D4CA29143A2AF54A0AF0E19AFA254B19E4BAFAF52A39E54A1AE12),
    .INIT_4B(256'h1CAFA254ABA354AFAF54A2AF58A2AF0E0EAFA2534A4C544E54544B5254A2AF0E),
    .INIT_4C(256'h19AFA154524C544D54544A514D8BB11919B1A054AFA154AFAF54A2AF5498AF19),
    .INIT_4D(256'h18AFA554B29E52AFAE52B09E54A2AE0E19AFA254B2A2428DA24CA29E4BA2AD18),
    .INIT_4E(256'h0EB227A7A4A2A39FA2A2A2A5A225B40E0E2CA2545455545454544B5455A22B0E),
    .INIT_4F(256'h190E0E0E19505050504950191A0E1A1919B4B42BAFA9AFAFABABB1AF2BB4B412),
    .INIT_50(256'h19BCB49FB49F26585826B4B473B4BC1919BCBCBCBC2DB4585BB42D9F9F9F9F19),
    .INIT_51(256'h197328282843731B1B73734A4A69691919BCBC73B4BCBC2D2BB49F7D9F9FBC19),
    .INIT_52(256'h196328282899B42B26BCB4B428739F1919702870287D9F2D26BCBC9F7D9F9F19),
    .INIT_53(256'h1947B5D8FF69731B1B696969286973191975B5D8D84A9F2626BCBCBC28BCBC19),
    .INIT_54(256'h1963B5FF739F9F262BB475B5D8B59F191975B5D870B4B42D2D9F73B528BCBC19),
    .INIT_55(256'h1941B5297373731B11694141737369191970B5D8B4B49F261E9F75B57070B419),
    .INIT_56(256'h1963639F9FB4B42D26BCBCBCA4739F191975FF999F9F9F261EBC9FBCA4BCBC19),
    .INIT_57(256'h1B69694C6973731B197C69697C73731B19BCBCBCB49FBC2D26BCBC9F7D9FBC19),
    .INIT_58(256'h19BCB49FB49F26585826B4B473B4BC1919BCBCBCBC2DB4585BB42D9F9F9F9F19),
    .INIT_59(256'h197369696943731B1B73734A4A69691919BCBC73B4BCBC2D2BB49F7D9F9FBC19),
    .INIT_5A(256'h199F9F9FB499B42B26BC28B428739F1919B4B4B4737D9F2D26BCBC9F7D9F9F19),
    .INIT_5B(256'h197369694369731B1B6969D86969731919BCBCBCBC4A9F262675287528BCBC19),
    .INIT_5C(256'h199F9FBC739F9F262B70B563B59F9F1919BCBCBCB4B4B42D2D63D875D8BCBC19),
    .INIT_5D(256'h196969437373731B116969697373691919B4B499B4B49F261E9FBCBCB4B4B419),
    .INIT_5E(256'h199F9F9F9FB4B42D26BCBCBCA4739F1919BC73999F9F9F261EBC9FBCA4BCBC19),
    .INIT_5F(256'h1B69694C6973731B197C69697C73731B19BCBCBCB49FBC2D26BCBC9F7D9FBC19),
    .INIT_60(256'h325645576164614C72725747615A6C383236272D35383B242D2D2F3033353538),
    .INIT_61(256'h29698B695B596E5F878867986F5C502D3050785F7F8451657A8F8F6255785229),
    .INIT_62(256'h2438687B837C919158787D7C6F7E592B24708673949589695B7B7B8F69787238),
    .INIT_63(256'h3A5259877C585B6A64698F8C655B5C2F236187827F8F8571796859746F7F6132),
    .INIT_64(256'h3050976B6A81809470905B7E929052293B784B5D64728492976E70A38B70442F),
    .INIT_65(256'h24706A8E64597A817A7A59737A88723829696A6B597D7A7A8390567A7A77502D),
    .INIT_66(256'h23617A817A899D6E596A938C9373613224387A7A889058607A6E59595959592B),
    .INIT_67(256'h3236272D35383B242D2D2F3033353538325645576164614C72725747615A6C38),
    .INIT_68(256'h325645576164614C72725747615A6C383236272D35383B242D2D2F3033353538),
    .INIT_69(256'h29698B69422129233233266E6F5C502D3050785F7F8451657A8F8F6255785229),
    .INIT_6A(256'h243868A30000000000000000297E592B2470865337000000000000354C787238),
    .INIT_6B(256'h3A5259A86BA5A6AAA9AAB671265B5C2F236187A600151310120F0D00297F6132),
    .INIT_6C(256'h3F8EC5C5C5C8CDC1CDCDC8C5C5C58E4B3B785D774C5055595B4F505E8378442F),
    .INIT_6D(256'h3276A3763D3D000000003B3F79A87F4B3079A89DB07F423D42427FB0B0B0794B),
    .INIT_6E(256'h3271B2001119171918181811003F764A2D7FB04200000000000000003D7F7F4B),
    .INIT_6F(256'h3261A52929292629292929292932613F2D7FB712282828282A2A2628113F7F4D),
    .INIT_70(256'h325645576164614C72725747615A6C383236272D35383B242D2D2F3033353538),
    .INIT_71(256'h29698B695B596E5F878867986F5C502D3050785F7F8451657A8F8F6255785229),
    .INIT_72(256'h2438687B837C919158787D7C6F7E592B24708673949589695B7B7B8F69787238),
    .INIT_73(256'h3A5259877C585B6A64698F8C655B5C2F236187827F8F8571796859746F7F6132),
    .INIT_74(256'h3F8EC5C5C5C8CDC1CDCDC8C5C5C58E4B3B785D6A6F7987919576789E8C78442F),
    .INIT_75(256'h3276A3A3A3A3A8A8B0A89DA8A8A87F4B3079A89DB0B0B0A3B0B0B0B0B0B0794B),
    .INIT_76(256'h3271A3A3A8A89DA8A3A3A3A8A8A8764A2D7FB0B0B0B0A3A3A3A3A3A3A3B07F4B),
    .INIT_77(256'h3232303030302D30303030303032323F2D7F7F7F797979797F7F767979797F4D),
    .INIT_78(256'hB300000000000000C0000000000000FEC0FEFEFEFEFEFEFEFEFEFEFE00FEFEFE),
    .INIT_79(256'hB3C00000000000000000000000FE00FE000000000000000000C00000FE0000FE),
    .INIT_7A(256'h000000C0000000FE00000000000000FEB300C0000000FE00000000000000FEFE),
    .INIT_7B(256'hB30000000000000000C0000000C000FEB300000000000000C000000000000000),
    .INIT_7C(256'h00000000000000FE00000000000000FEB300000000000000000000000000C0FE),
    .INIT_7D(256'hB30000FE0000000000C00000000000FE0000FE0000000000FE00000000000000),
    .INIT_7E(256'hB300000000C0000000000000000000C0B3000000FE000000000000000000C000),
    .INIT_7F(256'hC0B3B3B3B300B3B30000B3B3B3B3B3C0C00000000000000000000000000000FE),
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
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("REGCE"),
    .RSTREG_PRIORITY_B("REGCE"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram 
       (.ADDRARDADDR({1'b1,addra,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASCADEINA(1'b0),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTA_UNCONNECTED ),
        .CASCADEOUTB(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_CASCADEOUTB_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DBITERR_UNCONNECTED ),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0,1'b0,1'b0}),
        .DOADO({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOADO_UNCONNECTED [31:8],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0 }),
        .DOBDO(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOBDO_UNCONNECTED [31:0]),
        .DOPADOP({\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPADOP_UNCONNECTED [3:1],\DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_n_71 }),
        .DOPBDOP(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_DOPBDOP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_ECCPARITY_UNCONNECTED [7:0]),
        .ENARDEN(ena_array),
        .ENBWREN(1'b0),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_SBITERR_UNCONNECTED ),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_top
   (douta,
    clka,
    ena,
    addra);
  output [31:0]douta;
  input clka;
  input ena;
  input [12:0]addra;

  wire [12:0]addra;
  wire clka;
  wire [31:0]douta;
  wire ena;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_generic_cstr \valid.cstr 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

(* C_ADDRA_WIDTH = "13" *) (* C_ADDRB_WIDTH = "13" *) (* C_ALGORITHM = "1" *) 
(* C_AXI_ID_WIDTH = "4" *) (* C_AXI_SLAVE_TYPE = "0" *) (* C_AXI_TYPE = "1" *) 
(* C_BYTE_SIZE = "9" *) (* C_COMMON_CLK = "0" *) (* C_COUNT_18K_BRAM = "1" *) 
(* C_COUNT_36K_BRAM = "7" *) (* C_CTRL_ECC_ALGO = "NONE" *) (* C_DEFAULT_DATA = "0" *) 
(* C_DISABLE_WARN_BHV_COLL = "0" *) (* C_DISABLE_WARN_BHV_RANGE = "0" *) (* C_ELABORATION_DIR = "./" *) 
(* C_ENABLE_32BIT_ADDRESS = "0" *) (* C_EN_DEEPSLEEP_PIN = "0" *) (* C_EN_ECC_PIPE = "0" *) 
(* C_EN_RDADDRA_CHG = "0" *) (* C_EN_RDADDRB_CHG = "0" *) (* C_EN_SAFETY_CKT = "0" *) 
(* C_EN_SHUTDOWN_PIN = "0" *) (* C_EN_SLEEP_PIN = "0" *) (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     9.984642 mW" *) 
(* C_FAMILY = "zynq" *) (* C_HAS_AXI_ID = "0" *) (* C_HAS_ENA = "1" *) 
(* C_HAS_ENB = "0" *) (* C_HAS_INJECTERR = "0" *) (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
(* C_HAS_MEM_OUTPUT_REGS_B = "0" *) (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
(* C_HAS_REGCEA = "0" *) (* C_HAS_REGCEB = "0" *) (* C_HAS_RSTA = "0" *) 
(* C_HAS_RSTB = "0" *) (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
(* C_INITA_VAL = "0" *) (* C_INITB_VAL = "0" *) (* C_INIT_FILE = "texture_rom.mem" *) 
(* C_INIT_FILE_NAME = "texture_rom.mif" *) (* C_INTERFACE_TYPE = "0" *) (* C_LOAD_INIT_FILE = "1" *) 
(* C_MEM_TYPE = "3" *) (* C_MUX_PIPELINE_STAGES = "0" *) (* C_PRIM_TYPE = "1" *) 
(* C_READ_DEPTH_A = "8192" *) (* C_READ_DEPTH_B = "8192" *) (* C_READ_LATENCY_A = "1" *) 
(* C_READ_LATENCY_B = "1" *) (* C_READ_WIDTH_A = "32" *) (* C_READ_WIDTH_B = "32" *) 
(* C_RSTRAM_A = "0" *) (* C_RSTRAM_B = "0" *) (* C_RST_PRIORITY_A = "CE" *) 
(* C_RST_PRIORITY_B = "CE" *) (* C_SIM_COLLISION_CHECK = "ALL" *) (* C_USE_BRAM_BLOCK = "0" *) 
(* C_USE_BYTE_WEA = "0" *) (* C_USE_BYTE_WEB = "0" *) (* C_USE_DEFAULT_DATA = "0" *) 
(* C_USE_ECC = "0" *) (* C_USE_SOFTECC = "0" *) (* C_USE_URAM = "0" *) 
(* C_WEA_WIDTH = "1" *) (* C_WEB_WIDTH = "1" *) (* C_WRITE_DEPTH_A = "8192" *) 
(* C_WRITE_DEPTH_B = "8192" *) (* C_WRITE_MODE_A = "WRITE_FIRST" *) (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
(* C_WRITE_WIDTH_A = "32" *) (* C_WRITE_WIDTH_B = "32" *) (* C_XDEVICEFAMILY = "zynq" *) 
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
  input [12:0]addra;
  input [31:0]dina;
  output [31:0]douta;
  input clkb;
  input rstb;
  input enb;
  input regceb;
  input [0:0]web;
  input [12:0]addrb;
  input [31:0]dinb;
  output [31:0]doutb;
  input injectsbiterr;
  input injectdbiterr;
  input eccpipece;
  output sbiterr;
  output dbiterr;
  output [12:0]rdaddrecc;
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
  input [31:0]s_axi_wdata;
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
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output s_axi_rvalid;
  input s_axi_rready;
  input s_axi_injectsbiterr;
  input s_axi_injectdbiterr;
  output s_axi_sbiterr;
  output s_axi_dbiterr;
  output [12:0]s_axi_rdaddrecc;

  wire \<const0> ;
  wire [12:0]addra;
  wire clka;
  wire [31:0]douta;
  wire ena;

  assign dbiterr = \<const0> ;
  assign doutb[31] = \<const0> ;
  assign doutb[30] = \<const0> ;
  assign doutb[29] = \<const0> ;
  assign doutb[28] = \<const0> ;
  assign doutb[27] = \<const0> ;
  assign doutb[26] = \<const0> ;
  assign doutb[25] = \<const0> ;
  assign doutb[24] = \<const0> ;
  assign doutb[23] = \<const0> ;
  assign doutb[22] = \<const0> ;
  assign doutb[21] = \<const0> ;
  assign doutb[20] = \<const0> ;
  assign doutb[19] = \<const0> ;
  assign doutb[18] = \<const0> ;
  assign doutb[17] = \<const0> ;
  assign doutb[16] = \<const0> ;
  assign doutb[15] = \<const0> ;
  assign doutb[14] = \<const0> ;
  assign doutb[13] = \<const0> ;
  assign doutb[12] = \<const0> ;
  assign doutb[11] = \<const0> ;
  assign doutb[10] = \<const0> ;
  assign doutb[9] = \<const0> ;
  assign doutb[8] = \<const0> ;
  assign doutb[7] = \<const0> ;
  assign doutb[6] = \<const0> ;
  assign doutb[5] = \<const0> ;
  assign doutb[4] = \<const0> ;
  assign doutb[3] = \<const0> ;
  assign doutb[2] = \<const0> ;
  assign doutb[1] = \<const0> ;
  assign doutb[0] = \<const0> ;
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
  assign s_axi_rdata[31] = \<const0> ;
  assign s_axi_rdata[30] = \<const0> ;
  assign s_axi_rdata[29] = \<const0> ;
  assign s_axi_rdata[28] = \<const0> ;
  assign s_axi_rdata[27] = \<const0> ;
  assign s_axi_rdata[26] = \<const0> ;
  assign s_axi_rdata[25] = \<const0> ;
  assign s_axi_rdata[24] = \<const0> ;
  assign s_axi_rdata[23] = \<const0> ;
  assign s_axi_rdata[22] = \<const0> ;
  assign s_axi_rdata[21] = \<const0> ;
  assign s_axi_rdata[20] = \<const0> ;
  assign s_axi_rdata[19] = \<const0> ;
  assign s_axi_rdata[18] = \<const0> ;
  assign s_axi_rdata[17] = \<const0> ;
  assign s_axi_rdata[16] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
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
        .clka(clka),
        .douta(douta),
        .ena(ena));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_2_synth
   (douta,
    clka,
    ena,
    addra);
  output [31:0]douta;
  input clka;
  input ena;
  input [12:0]addra;

  wire [12:0]addra;
  wire clka;
  wire [31:0]douta;
  wire ena;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_top \gnbram.gnativebmg.native_blk_mem_gen 
       (.addra(addra),
        .clka(clka),
        .douta(douta),
        .ena(ena));
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
