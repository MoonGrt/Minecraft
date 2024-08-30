module gw_gao(
    \ppl/ppl_ctrl/prepare_flag ,
    \align/align_ctrl/data_aligned_vs ,
    \align/data_aligned[15] ,
    \align/data_aligned[14] ,
    \align/data_aligned[13] ,
    \align/data_aligned[12] ,
    \align/data_aligned[11] ,
    \align/data_aligned[10] ,
    \align/data_aligned[9] ,
    \align/data_aligned[8] ,
    \align/data_aligned[7] ,
    \align/data_aligned[6] ,
    \align/data_aligned[5] ,
    \align/data_aligned[4] ,
    \align/data_aligned[3] ,
    \align/data_aligned[2] ,
    \align/data_aligned[1] ,
    \align/data_aligned[0] ,
    \align/data_aligned_valid ,
    \ppl/ppl_proc/pixel_addr_out[19] ,
    \ppl/ppl_proc/pixel_addr_out[18] ,
    \ppl/ppl_proc/pixel_addr_out[17] ,
    \ppl/ppl_proc/pixel_addr_out[16] ,
    \ppl/ppl_proc/pixel_addr_out[15] ,
    \ppl/ppl_proc/pixel_addr_out[14] ,
    \ppl/ppl_proc/pixel_addr_out[13] ,
    \ppl/ppl_proc/pixel_addr_out[12] ,
    \ppl/ppl_proc/pixel_addr_out[11] ,
    \ppl/ppl_proc/pixel_addr_out[10] ,
    \ppl/ppl_proc/pixel_addr_out[9] ,
    \ppl/ppl_proc/pixel_addr_out[8] ,
    \ppl/ppl_proc/pixel_addr_out[7] ,
    \ppl/ppl_proc/pixel_addr_out[6] ,
    \ppl/ppl_proc/pixel_addr_out[5] ,
    \ppl/ppl_proc/pixel_addr_out[4] ,
    \ppl/ppl_proc/pixel_addr_out[3] ,
    \ppl/ppl_proc/pixel_addr_out[2] ,
    \ppl/ppl_proc/pixel_addr_out[1] ,
    \ppl/ppl_proc/pixel_addr_out[0] ,
    \ppl/ppl_proc/next_en ,
    PPL_clk,
    tms_pad_i,
    tck_pad_i,
    tdi_pad_i,
    tdo_pad_o
);

input \ppl/ppl_ctrl/prepare_flag ;
input \align/align_ctrl/data_aligned_vs ;
input \align/data_aligned[15] ;
input \align/data_aligned[14] ;
input \align/data_aligned[13] ;
input \align/data_aligned[12] ;
input \align/data_aligned[11] ;
input \align/data_aligned[10] ;
input \align/data_aligned[9] ;
input \align/data_aligned[8] ;
input \align/data_aligned[7] ;
input \align/data_aligned[6] ;
input \align/data_aligned[5] ;
input \align/data_aligned[4] ;
input \align/data_aligned[3] ;
input \align/data_aligned[2] ;
input \align/data_aligned[1] ;
input \align/data_aligned[0] ;
input \align/data_aligned_valid ;
input \ppl/ppl_proc/pixel_addr_out[19] ;
input \ppl/ppl_proc/pixel_addr_out[18] ;
input \ppl/ppl_proc/pixel_addr_out[17] ;
input \ppl/ppl_proc/pixel_addr_out[16] ;
input \ppl/ppl_proc/pixel_addr_out[15] ;
input \ppl/ppl_proc/pixel_addr_out[14] ;
input \ppl/ppl_proc/pixel_addr_out[13] ;
input \ppl/ppl_proc/pixel_addr_out[12] ;
input \ppl/ppl_proc/pixel_addr_out[11] ;
input \ppl/ppl_proc/pixel_addr_out[10] ;
input \ppl/ppl_proc/pixel_addr_out[9] ;
input \ppl/ppl_proc/pixel_addr_out[8] ;
input \ppl/ppl_proc/pixel_addr_out[7] ;
input \ppl/ppl_proc/pixel_addr_out[6] ;
input \ppl/ppl_proc/pixel_addr_out[5] ;
input \ppl/ppl_proc/pixel_addr_out[4] ;
input \ppl/ppl_proc/pixel_addr_out[3] ;
input \ppl/ppl_proc/pixel_addr_out[2] ;
input \ppl/ppl_proc/pixel_addr_out[1] ;
input \ppl/ppl_proc/pixel_addr_out[0] ;
input \ppl/ppl_proc/next_en ;
input PPL_clk;
input tms_pad_i;
input tck_pad_i;
input tdi_pad_i;
output tdo_pad_o;

wire \ppl/ppl_ctrl/prepare_flag ;
wire \align/align_ctrl/data_aligned_vs ;
wire \align/data_aligned[15] ;
wire \align/data_aligned[14] ;
wire \align/data_aligned[13] ;
wire \align/data_aligned[12] ;
wire \align/data_aligned[11] ;
wire \align/data_aligned[10] ;
wire \align/data_aligned[9] ;
wire \align/data_aligned[8] ;
wire \align/data_aligned[7] ;
wire \align/data_aligned[6] ;
wire \align/data_aligned[5] ;
wire \align/data_aligned[4] ;
wire \align/data_aligned[3] ;
wire \align/data_aligned[2] ;
wire \align/data_aligned[1] ;
wire \align/data_aligned[0] ;
wire \align/data_aligned_valid ;
wire \ppl/ppl_proc/pixel_addr_out[19] ;
wire \ppl/ppl_proc/pixel_addr_out[18] ;
wire \ppl/ppl_proc/pixel_addr_out[17] ;
wire \ppl/ppl_proc/pixel_addr_out[16] ;
wire \ppl/ppl_proc/pixel_addr_out[15] ;
wire \ppl/ppl_proc/pixel_addr_out[14] ;
wire \ppl/ppl_proc/pixel_addr_out[13] ;
wire \ppl/ppl_proc/pixel_addr_out[12] ;
wire \ppl/ppl_proc/pixel_addr_out[11] ;
wire \ppl/ppl_proc/pixel_addr_out[10] ;
wire \ppl/ppl_proc/pixel_addr_out[9] ;
wire \ppl/ppl_proc/pixel_addr_out[8] ;
wire \ppl/ppl_proc/pixel_addr_out[7] ;
wire \ppl/ppl_proc/pixel_addr_out[6] ;
wire \ppl/ppl_proc/pixel_addr_out[5] ;
wire \ppl/ppl_proc/pixel_addr_out[4] ;
wire \ppl/ppl_proc/pixel_addr_out[3] ;
wire \ppl/ppl_proc/pixel_addr_out[2] ;
wire \ppl/ppl_proc/pixel_addr_out[1] ;
wire \ppl/ppl_proc/pixel_addr_out[0] ;
wire \ppl/ppl_proc/next_en ;
wire PPL_clk;
wire tms_pad_i;
wire tck_pad_i;
wire tdi_pad_i;
wire tdo_pad_o;
wire tms_i_c;
wire tck_i_c;
wire tdi_i_c;
wire tdo_o_c;
wire [9:0] control0;
wire gao_jtag_tck;
wire gao_jtag_reset;
wire run_test_idle_er1;
wire run_test_idle_er2;
wire shift_dr_capture_dr;
wire update_dr;
wire pause_dr;
wire enable_er1;
wire enable_er2;
wire gao_jtag_tdi;
wire tdo_er1;

IBUF tms_ibuf (
    .I(tms_pad_i),
    .O(tms_i_c)
);

IBUF tck_ibuf (
    .I(tck_pad_i),
    .O(tck_i_c)
);

IBUF tdi_ibuf (
    .I(tdi_pad_i),
    .O(tdi_i_c)
);

OBUF tdo_obuf (
    .I(tdo_o_c),
    .O(tdo_pad_o)
);

GW_JTAG  u_gw_jtag(
    .tms_pad_i(tms_i_c),
    .tck_pad_i(tck_i_c),
    .tdi_pad_i(tdi_i_c),
    .tdo_pad_o(tdo_o_c),
    .tck_o(gao_jtag_tck),
    .test_logic_reset_o(gao_jtag_reset),
    .run_test_idle_er1_o(run_test_idle_er1),
    .run_test_idle_er2_o(run_test_idle_er2),
    .shift_dr_capture_dr_o(shift_dr_capture_dr),
    .update_dr_o(update_dr),
    .pause_dr_o(pause_dr),
    .enable_er1_o(enable_er1),
    .enable_er2_o(enable_er2),
    .tdi_o(gao_jtag_tdi),
    .tdo_er1_i(tdo_er1),
    .tdo_er2_i(1'b0)
);

gw_con_top  u_icon_top(
    .tck_i(gao_jtag_tck),
    .tdi_i(gao_jtag_tdi),
    .tdo_o(tdo_er1),
    .rst_i(gao_jtag_reset),
    .control0(control0[9:0]),
    .enable_i(enable_er1),
    .shift_dr_capture_dr_i(shift_dr_capture_dr),
    .update_dr_i(update_dr)
);

ao_top_0  u_la0_top(
    .control(control0[9:0]),
    .trig0_i(\ppl/ppl_ctrl/prepare_flag ),
    .trig1_i(\align/align_ctrl/data_aligned_vs ),
    .data_i({\ppl/ppl_ctrl/prepare_flag ,\align/align_ctrl/data_aligned_vs ,\align/data_aligned[15] ,\align/data_aligned[14] ,\align/data_aligned[13] ,\align/data_aligned[12] ,\align/data_aligned[11] ,\align/data_aligned[10] ,\align/data_aligned[9] ,\align/data_aligned[8] ,\align/data_aligned[7] ,\align/data_aligned[6] ,\align/data_aligned[5] ,\align/data_aligned[4] ,\align/data_aligned[3] ,\align/data_aligned[2] ,\align/data_aligned[1] ,\align/data_aligned[0] ,\align/data_aligned_valid ,\ppl/ppl_proc/pixel_addr_out[19] ,\ppl/ppl_proc/pixel_addr_out[18] ,\ppl/ppl_proc/pixel_addr_out[17] ,\ppl/ppl_proc/pixel_addr_out[16] ,\ppl/ppl_proc/pixel_addr_out[15] ,\ppl/ppl_proc/pixel_addr_out[14] ,\ppl/ppl_proc/pixel_addr_out[13] ,\ppl/ppl_proc/pixel_addr_out[12] ,\ppl/ppl_proc/pixel_addr_out[11] ,\ppl/ppl_proc/pixel_addr_out[10] ,\ppl/ppl_proc/pixel_addr_out[9] ,\ppl/ppl_proc/pixel_addr_out[8] ,\ppl/ppl_proc/pixel_addr_out[7] ,\ppl/ppl_proc/pixel_addr_out[6] ,\ppl/ppl_proc/pixel_addr_out[5] ,\ppl/ppl_proc/pixel_addr_out[4] ,\ppl/ppl_proc/pixel_addr_out[3] ,\ppl/ppl_proc/pixel_addr_out[2] ,\ppl/ppl_proc/pixel_addr_out[1] ,\ppl/ppl_proc/pixel_addr_out[0] ,\ppl/ppl_proc/next_en }),
    .clk_i(PPL_clk)
);

endmodule
