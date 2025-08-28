`ifndef CONSTANTS
`define CONSTANTS

// --constants--
// display constants
// `define H_SYNC  40
// `define H_BACK  220
// `define H_DISP  1280
// `define H_FRONT 110
// `define H_TOTAL 1650  // H_DISP + H_FRONT + H_SYNC + H_BACK
// `define V_SYNC  5
// `define V_BACK  20
// `define V_DISP  720
// `define V_FRONT 5
// `define H_TOTAL 750   // V_DISP + V_FRONT + V_SYNC + V_BACK

`define H_DISP 15
`define V_DISP 10

// viewport constants
`define LOOKAT_REL_FAC 2
// `define CENTER_ADDR H_DISP * V_DISP / 2 + H_DISP / 2
`define EOF_ADDR 30 * 20 -1

// block constants
`define TEXTURE_RES 16
`define BLOCK_TYPE 24

// map constants
`define MAP_SIZE_X 64
`define MAP_SIZE_Y 64
`define MAP_SIZE_Z 32
`define BLOCK_TYPE 24
`define TEXTURE_TYPE 32
`define TEXTURE_SIZE 16 * 16

// radix constants
`define POS_INT_X_RADIX 6  // position integer [17:12]  // $clog2(MAP_SIZE_X)
`define POS_INT_Y_RADIX 6  // position integer [17:12]  // $clog2(MAP_SIZE_Y)
`define POS_INT_Z_RADIX 5  // position integer [16:12]  // $clog2(MAP_SIZE_Z)
`define POS_FRAC_RADIX 4   // position fracture [11:8]
`define POS_ADDI_RADIX 8   // position addition [7:0]

`define POS_X_RADIX 18  // position [17:0]  // POS_INTEGER_X + POS_FRACTION + POS_ADDITION
`define POS_Y_RADIX 18  // position [17:0]  // POS_INTEGER_Y + POS_FRACTION + POS_ADDITION
`define POS_Z_RADIX 17  // position [16:0]  // POS_INTEGER_Z + POS_FRACTION + POS_ADDITION
`define DISP_ADDR_RADIX 20                  // $clog2(H_DISP * V_DISP)
`define BLOCK_TYPE_RADIX 5                  // $clog2(BLOCK_TYPE)
`define TEXTURE_ADDR_RADIX 13               // $clog2(TEXTURE_TYPE * TEXTURE_SIZE)
`define MAP_ADDR_RADIX 17                   // $clog2(MAP_SIZE_X * MAP_SIZE_Y * MAP_SIZE_Z)

`define ANGLE_RADIX 22

// math constants
`define ANGLE_RADIUS 225
`define ANGLE_EIGHTH 158
`define ANGLE_QUARTER 317   // `define ANGLE_QUARTER ANGLE_EIGHTH * 2 + 1
`define ANGLE_HALF 634      // `define ANGLE_HALF ANGLE_EIGHTH * 4 + 2
`define ANGLE_MODULO 1268   // `define ANGLE_MODULO ANGLE_EIGHTH * 8 + 4











// color constants
`define SKY_COLOR (160, 224, 240, 255) // r g b a

// oythers
`define INT_RADIX 22

// control constants
`define POS_STEP 32
`define ANGLE_STEP 5

// gamepad
`define PSS_RES 256
`define PSS_MIDDLE 128
`define PSS_DEADZONE_RADIUS 2


`endif  // CONSTANTS
