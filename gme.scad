include <bit/boardgame_insert_toolkit_lib.2.scad>;

// determines whether lids are output.
g_b_print_lid = true;

// determines whether boxes are output.
g_b_print_box = true; 

// Focus on one box
g_isolated_print_box = ""; 

// Used to visualize how all of the boxes fit together. 
g_b_visualization = f;          
        
// this is the outer wall thickness. 
//Default = 1.5mm
g_wall_thickness = 1.5;

// The tolerance value is extra space put between planes of the lid and box that fit together.
// Increase the tolerance to loosen the fit and decrease it to tighten it.
//
// Note that the tolerance is applied exclusively to the lid.
// So if the lid is too tight or too loose, change this value ( up for looser fit, down for tighter fit ) and 
// you only need to reprint the lid.
// 
// The exception is the stackable box, where the bottom of the box is the lid of the box below,
// in which case the tolerance also affects that box bottom.
//
g_tolerance = 0.15;

// This adjusts the position of the lid detents downward. 
// The larger the value, the bigger the gap between the lid and the box.
g_tolerance_detents_pos = 0.1;

// Guild of merchant explorer data 
// This can be set using make file
gme_card_depth = 58;
gme_lid_solid = false;

z_width = 150.0;
z_height = 285;
z_depth = 29;

z_border = g_wall_thickness;
z_border_twice = z_border * 2;

player_height = 75;
player_width = z_width / 2;
player_depth = z_depth;

money_height = 50;
money_width = z_width;
money_depth = z_depth;

coin_width = (money_width - (5 * z_border)) / 5;
coin_height = money_height-z_border;

res_height = money_height;
res_width = z_width;
res_depth = z_depth;

token_width = (res_width - (5 * z_border)) / 5;
token_height = res_height-z_border;


card_width = z_width;
card_height = z_height - player_height - res_height;
card_depth = gme_card_depth;

if (card_depth < 20 ) {
    card_depth = 20;
}

if (card_depth > 58) {
    card_depth = 58;
}

b_card_width_l = 75 - z_border_twice;
b_card_height_l = 100 - z_border_twice;

s_card_width_l = 50 - z_border_twice;
s_card_height_l = 75 - z_border_twice;

lid_attr = [[ LID_SOLID_B, gme_lid_solid]];

data =
[
    [   "player-x4",
        [
            [ BOX_SIZE_XYZ, [player_width, player_height, player_depth] ],
            [ BOX_STACKABLE_B, false],
            [ BOX_LID,
                lid_attr,
            ],   
            [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ player_width - z_border_twice, player_height - z_border_twice, player_depth - z_border ],]
                ]
            ], 
        ]
    ],
    [   "coin" ,[
         [ BOX_SIZE_XYZ, [money_width, money_height, money_depth] ],
         [ BOX_STACKABLE_B, false],
         [ BOX_LID,
            lid_attr,
          ],
           [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ (coin_width*2), coin_height - z_border, money_depth - z_border ] ],
                    [POSITION_XY,                           [0,0]],
                    [ LABEL,
                        [
                            [ LBL_PLACEMENT, CENTER],
                            [ LBL_TEXT,     "1"],
                            [ LBL_SIZE,         12],
                            [ LBL_DEPTH,    0.5 ]
                        ]
                    ],
                ]
            ], 
            [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ coin_width, coin_height - z_border, money_depth - z_border ] ],
                    [POSITION_XY,                           [(coin_width)*2+z_border,0]],
                    [ LABEL,
                        [
                            [ LBL_PLACEMENT, CENTER],
                            [ LBL_TEXT,     "5"],
                            [ LBL_SIZE,         12],
                            [ LBL_DEPTH,    0.5 ]
                        ]
                    ],
                ]
            ],   
            [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ coin_width, coin_height - z_border, money_depth - z_border ] ],
                    [POSITION_XY,                           [(coin_width)*3+z_border*2,0]],
                    [ LABEL,
                        [
                            [ LBL_PLACEMENT, CENTER],
                            [ LBL_TEXT,     "10"],
                            [ LBL_SIZE,         12],
                            [ LBL_DEPTH,    0.5 ]
                        ]
                    ],
                ]
            ],  
             [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ coin_width, coin_height - z_border, money_depth - z_border ] ],
                    [POSITION_XY,                           [(coin_width)*4+z_border*3,0]],
                    [ LABEL,
                        [
                            [ LBL_PLACEMENT, CENTER],
                            [ LBL_TEXT,     "50"],
                            [ LBL_SIZE,         12],
                            [ LBL_DEPTH,    0.5 ]
                        ]
                    ],
                ]
            ],       
       ]
     ],
    [   "token" ,[
         [ BOX_SIZE_XYZ, [res_width, res_height, res_depth] ],
         [ BOX_STACKABLE_B, false],
         [ BOX_LID,
            lid_attr,
          ],
           [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ (token_width*2), token_height - z_border, res_depth - z_border ] ],
                    [POSITION_XY,                           [0,0]],
                    [ LABEL,
                        [
                            [ LBL_PLACEMENT, CENTER],
                            [ LBL_TEXT,     "Towers"],
                            [ LBL_SIZE,         10],
                            [ LBL_DEPTH,    0.5 ]
                        ]
                    ],
                ]
            ], 
            [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ token_width, token_height - z_border, res_depth - z_border ] ],
                    [POSITION_XY,                           [(token_width)*2+z_border,0]],
                    [ LABEL,
                        [
                            [ LBL_PLACEMENT, CENTER],
                            [ LBL_TEXT,     "Trading"],
                            [ LBL_SIZE,         8],
                            [ LBL_DEPTH,    0.5 ],
                            [ ROTATION, 90]
                        ]
                    ],
                ]
            ],   
            [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ token_width, token_height - z_border, res_depth - z_border ] ],
                    [POSITION_XY,                           [(token_width)*3+z_border*2,0]],
                    [ LABEL,
                        [
                            [ LBL_PLACEMENT, CENTER],
                            [ LBL_TEXT,     "Treasure"],
                            [ LBL_SIZE,         8],
                            [ LBL_DEPTH,    0.5 ],
                            [ ROTATION, 90]
                        ]
                    ],
                ]
            ],  
             [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ token_width, token_height / 2 - z_border, res_depth - z_border ] ],
                    [POSITION_XY,                           [(token_width)*4+z_border*3,0]],
                    [ LABEL,
                        [
                            [ LBL_PLACEMENT, CENTER],
                            [ LBL_TEXT,     "Gems"],
                            [ LBL_SIZE,         6],
                            [ LBL_DEPTH,    0.5 ],
                            [ ROTATION, 45 ]
                        ]
                    ],
                ]
            ],
         [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ token_width, token_height / 2 - z_border, res_depth - z_border ] ],
                    [POSITION_XY,                           [(token_width)*4+z_border*3,token_height / 2 ]],
                    [ LABEL,
                        [
                            [ LBL_PLACEMENT, CENTER],
                            [ LBL_TEXT,     "Solo"],
                            [ LBL_SIZE,         6],
                            [ LBL_DEPTH,    0.5 ],
                            [ ROTATION, 45 ]
                        ]
                    ],
                ]
            ],      
       ]
     ],
        [   "card",
        [
            [ BOX_SIZE_XYZ, [card_width, card_height, card_depth] ],
            [ BOX_STACKABLE_B, false],
            [ BOX_LID,
                lid_attr,
            ],
            [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ b_card_width_l, b_card_height_l, card_depth - z_border ],],
                    [POSITION_XY,               [0,CENTER]],
                    [ LABEL,
                        [
                            [ LBL_PLACEMENT, CENTER],
                            [ LBL_TEXT,     "Goals"],
                            [ LBL_SIZE,         10],
                            [ LBL_DEPTH,    0.5 ],
                            [ ROTATION, 90]
                        ]
                    ],
                ]
            ], 
            [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ s_card_height_l, s_card_width_l, card_depth - z_border ],],
                    [POSITION_XY,               [b_card_width_l+z_border,5]],
                    [ LABEL,
                        [
                            [ LBL_PLACEMENT, CENTER],
                            [ LBL_TEXT,     "Explore"],
                            [ LBL_SIZE,         7],
                            [ LBL_DEPTH,    0.5 ],
                        ]
                    ],
                ]
            ],
            [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ s_card_height_l, s_card_width_l, card_depth - z_border ],],
                    [POSITION_XY,               [b_card_width_l+z_border,CENTER]],
                    [ LABEL,
                        [
                            [ LBL_PLACEMENT, CENTER],
                            [ LBL_TEXT,     "Investigations"],
                            [ LBL_SIZE,         7],
                            [ LBL_DEPTH,    0.5 ],
                        ]
                    ],
                ]
            ],
            [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ s_card_height_l, s_card_width_l, card_depth - z_border ],],
                    [POSITION_XY,               [b_card_width_l+z_border,card_height-s_card_width_l-5-z_border]],
                    [ LABEL,
                        [
                            [ LBL_PLACEMENT, CENTER],
                            [ LBL_TEXT,     "Treasures"],
                            [ LBL_SIZE,         7],
                            [ LBL_DEPTH,    0.5 ],
                        ]
                    ],
                ]
            ],
            [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ 30, 30, card_depth - z_border ],],
                    [POSITION_XY,               [CENTER,90]],
                ]
            ],
            [ BOX_COMPONENT,
                [
                    [CMP_COMPARTMENT_SIZE_XYZ,  [ 30, 30, card_depth - z_border ],],
                    [POSITION_XY,               [CENTER,35]],
                ]
            ],
        ]
    ],
];


MakeAll();