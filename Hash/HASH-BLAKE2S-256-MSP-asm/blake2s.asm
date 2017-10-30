;******************************************************************************
;* MSP430 C/C++ Codegen                                        PC v16.9.3.LTS *
;* Date/Time created: Mon Oct 30 21:54:53 2017                                *
;******************************************************************************
	.compiler_opts --abi=eabi --hll_source=on --mem_model:code=large --mem_model:data=large --object_format=elf --silicon_errata=CPU15 --silicon_errata=CPU18 --silicon_errata=CPU21 --silicon_errata=CPU22 --silicon_errata=CPU23 --silicon_errata=CPU40 --silicon_version=mspx --symdebug:dwarf --symdebug:dwarf_version=3 

$C$DW$CU	.dwtag  DW_TAG_compile_unit
	.dwattr $C$DW$CU, DW_AT_name("../blake2s.c")
	.dwattr $C$DW$CU, DW_AT_producer("TI MSP430 C/C++ Codegen PC v16.9.3.LTS Copyright (c) 2003-2017 Texas Instruments Incorporated")
	.dwattr $C$DW$CU, DW_AT_TI_version(0x01)
	.dwattr $C$DW$CU, DW_AT_comp_dir("D:\MewX_Projects\UofA\Crypto4RFID-1\Hash\HASH-BLAKE2S-256-MSP\Debug")
	.sect	".const:blake2s_iv"
	.clink
	.align	2
	.elfsym	blake2s_iv,SYM_SIZE(32)
blake2s_iv:
	.bits	1779033703,32			; blake2s_iv[0] @ 0
	.bits	-1150833019,32			; blake2s_iv[1] @ 32
	.bits	1013904242,32			; blake2s_iv[2] @ 64
	.bits	-1521486534,32			; blake2s_iv[3] @ 96
	.bits	1359893119,32			; blake2s_iv[4] @ 128
	.bits	-1694144372,32			; blake2s_iv[5] @ 160
	.bits	528734635,32			; blake2s_iv[6] @ 192
	.bits	1541459225,32			; blake2s_iv[7] @ 224

$C$DW$1	.dwtag  DW_TAG_variable
	.dwattr $C$DW$1, DW_AT_name("blake2s_iv")
	.dwattr $C$DW$1, DW_AT_TI_symbol_name("blake2s_iv")
	.dwattr $C$DW$1, DW_AT_type(*$C$DW$T$86)
	.dwattr $C$DW$1, DW_AT_location[DW_OP_addr blake2s_iv]
	.dwattr $C$DW$1, DW_AT_decl_file("../blake2s.c")
	.dwattr $C$DW$1, DW_AT_decl_line(0x19)
	.dwattr $C$DW$1, DW_AT_decl_column(0x17)

	.sect	".const:$P$T0$1"
	.clink
	.align	2
	.elfsym	$P$T0$1,SYM_SIZE(160)
$P$T0$1:
	.bits	0,8			; $P$T0$1[0][0] @ 0
	.bits	1,8			; $P$T0$1[0][1] @ 8
	.bits	2,8			; $P$T0$1[0][2] @ 16
	.bits	3,8			; $P$T0$1[0][3] @ 24
	.bits	4,8			; $P$T0$1[0][4] @ 32
	.bits	5,8			; $P$T0$1[0][5] @ 40
	.bits	6,8			; $P$T0$1[0][6] @ 48
	.bits	7,8			; $P$T0$1[0][7] @ 56
	.bits	8,8			; $P$T0$1[0][8] @ 64
	.bits	9,8			; $P$T0$1[0][9] @ 72
	.bits	10,8			; $P$T0$1[0][10] @ 80
	.bits	11,8			; $P$T0$1[0][11] @ 88
	.bits	12,8			; $P$T0$1[0][12] @ 96
	.bits	13,8			; $P$T0$1[0][13] @ 104
	.bits	14,8			; $P$T0$1[0][14] @ 112
	.bits	15,8			; $P$T0$1[0][15] @ 120
	.bits	14,8			; $P$T0$1[1][0] @ 128
	.bits	10,8			; $P$T0$1[1][1] @ 136
	.bits	4,8			; $P$T0$1[1][2] @ 144
	.bits	8,8			; $P$T0$1[1][3] @ 152
	.bits	9,8			; $P$T0$1[1][4] @ 160
	.bits	15,8			; $P$T0$1[1][5] @ 168
	.bits	13,8			; $P$T0$1[1][6] @ 176
	.bits	6,8			; $P$T0$1[1][7] @ 184
	.bits	1,8			; $P$T0$1[1][8] @ 192
	.bits	12,8			; $P$T0$1[1][9] @ 200
	.bits	0,8			; $P$T0$1[1][10] @ 208
	.bits	2,8			; $P$T0$1[1][11] @ 216
	.bits	11,8			; $P$T0$1[1][12] @ 224
	.bits	7,8			; $P$T0$1[1][13] @ 232
	.bits	5,8			; $P$T0$1[1][14] @ 240
	.bits	3,8			; $P$T0$1[1][15] @ 248
	.bits	11,8			; $P$T0$1[2][0] @ 256
	.bits	8,8			; $P$T0$1[2][1] @ 264
	.bits	12,8			; $P$T0$1[2][2] @ 272
	.bits	0,8			; $P$T0$1[2][3] @ 280
	.bits	5,8			; $P$T0$1[2][4] @ 288
	.bits	2,8			; $P$T0$1[2][5] @ 296
	.bits	15,8			; $P$T0$1[2][6] @ 304
	.bits	13,8			; $P$T0$1[2][7] @ 312
	.bits	10,8			; $P$T0$1[2][8] @ 320
	.bits	14,8			; $P$T0$1[2][9] @ 328
	.bits	3,8			; $P$T0$1[2][10] @ 336
	.bits	6,8			; $P$T0$1[2][11] @ 344
	.bits	7,8			; $P$T0$1[2][12] @ 352
	.bits	1,8			; $P$T0$1[2][13] @ 360
	.bits	9,8			; $P$T0$1[2][14] @ 368
	.bits	4,8			; $P$T0$1[2][15] @ 376
	.bits	7,8			; $P$T0$1[3][0] @ 384
	.bits	9,8			; $P$T0$1[3][1] @ 392
	.bits	3,8			; $P$T0$1[3][2] @ 400
	.bits	1,8			; $P$T0$1[3][3] @ 408
	.bits	13,8			; $P$T0$1[3][4] @ 416
	.bits	12,8			; $P$T0$1[3][5] @ 424
	.bits	11,8			; $P$T0$1[3][6] @ 432
	.bits	14,8			; $P$T0$1[3][7] @ 440
	.bits	2,8			; $P$T0$1[3][8] @ 448
	.bits	6,8			; $P$T0$1[3][9] @ 456
	.bits	5,8			; $P$T0$1[3][10] @ 464
	.bits	10,8			; $P$T0$1[3][11] @ 472
	.bits	4,8			; $P$T0$1[3][12] @ 480
	.bits	0,8			; $P$T0$1[3][13] @ 488
	.bits	15,8			; $P$T0$1[3][14] @ 496
	.bits	8,8			; $P$T0$1[3][15] @ 504
	.bits	9,8			; $P$T0$1[4][0] @ 512
	.bits	0,8			; $P$T0$1[4][1] @ 520
	.bits	5,8			; $P$T0$1[4][2] @ 528
	.bits	7,8			; $P$T0$1[4][3] @ 536
	.bits	2,8			; $P$T0$1[4][4] @ 544
	.bits	4,8			; $P$T0$1[4][5] @ 552
	.bits	10,8			; $P$T0$1[4][6] @ 560
	.bits	15,8			; $P$T0$1[4][7] @ 568
	.bits	14,8			; $P$T0$1[4][8] @ 576
	.bits	1,8			; $P$T0$1[4][9] @ 584
	.bits	11,8			; $P$T0$1[4][10] @ 592
	.bits	12,8			; $P$T0$1[4][11] @ 600
	.bits	6,8			; $P$T0$1[4][12] @ 608
	.bits	8,8			; $P$T0$1[4][13] @ 616
	.bits	3,8			; $P$T0$1[4][14] @ 624
	.bits	13,8			; $P$T0$1[4][15] @ 632
	.bits	2,8			; $P$T0$1[5][0] @ 640
	.bits	12,8			; $P$T0$1[5][1] @ 648
	.bits	6,8			; $P$T0$1[5][2] @ 656
	.bits	10,8			; $P$T0$1[5][3] @ 664
	.bits	0,8			; $P$T0$1[5][4] @ 672
	.bits	11,8			; $P$T0$1[5][5] @ 680
	.bits	8,8			; $P$T0$1[5][6] @ 688
	.bits	3,8			; $P$T0$1[5][7] @ 696
	.bits	4,8			; $P$T0$1[5][8] @ 704
	.bits	13,8			; $P$T0$1[5][9] @ 712
	.bits	7,8			; $P$T0$1[5][10] @ 720
	.bits	5,8			; $P$T0$1[5][11] @ 728
	.bits	15,8			; $P$T0$1[5][12] @ 736
	.bits	14,8			; $P$T0$1[5][13] @ 744
	.bits	1,8			; $P$T0$1[5][14] @ 752
	.bits	9,8			; $P$T0$1[5][15] @ 760
	.bits	12,8			; $P$T0$1[6][0] @ 768
	.bits	5,8			; $P$T0$1[6][1] @ 776
	.bits	1,8			; $P$T0$1[6][2] @ 784
	.bits	15,8			; $P$T0$1[6][3] @ 792
	.bits	14,8			; $P$T0$1[6][4] @ 800
	.bits	13,8			; $P$T0$1[6][5] @ 808
	.bits	4,8			; $P$T0$1[6][6] @ 816
	.bits	10,8			; $P$T0$1[6][7] @ 824
	.bits	0,8			; $P$T0$1[6][8] @ 832
	.bits	7,8			; $P$T0$1[6][9] @ 840
	.bits	6,8			; $P$T0$1[6][10] @ 848
	.bits	3,8			; $P$T0$1[6][11] @ 856
	.bits	9,8			; $P$T0$1[6][12] @ 864
	.bits	2,8			; $P$T0$1[6][13] @ 872
	.bits	8,8			; $P$T0$1[6][14] @ 880
	.bits	11,8			; $P$T0$1[6][15] @ 888
	.bits	13,8			; $P$T0$1[7][0] @ 896
	.bits	11,8			; $P$T0$1[7][1] @ 904
	.bits	7,8			; $P$T0$1[7][2] @ 912
	.bits	14,8			; $P$T0$1[7][3] @ 920
	.bits	12,8			; $P$T0$1[7][4] @ 928
	.bits	1,8			; $P$T0$1[7][5] @ 936
	.bits	3,8			; $P$T0$1[7][6] @ 944
	.bits	9,8			; $P$T0$1[7][7] @ 952
	.bits	5,8			; $P$T0$1[7][8] @ 960
	.bits	0,8			; $P$T0$1[7][9] @ 968
	.bits	15,8			; $P$T0$1[7][10] @ 976
	.bits	4,8			; $P$T0$1[7][11] @ 984
	.bits	8,8			; $P$T0$1[7][12] @ 992
	.bits	6,8			; $P$T0$1[7][13] @ 1000
	.bits	2,8			; $P$T0$1[7][14] @ 1008
	.bits	10,8			; $P$T0$1[7][15] @ 1016
	.bits	6,8			; $P$T0$1[8][0] @ 1024
	.bits	15,8			; $P$T0$1[8][1] @ 1032
	.bits	14,8			; $P$T0$1[8][2] @ 1040
	.bits	9,8			; $P$T0$1[8][3] @ 1048
	.bits	11,8			; $P$T0$1[8][4] @ 1056
	.bits	3,8			; $P$T0$1[8][5] @ 1064
	.bits	0,8			; $P$T0$1[8][6] @ 1072
	.bits	8,8			; $P$T0$1[8][7] @ 1080
	.bits	12,8			; $P$T0$1[8][8] @ 1088
	.bits	2,8			; $P$T0$1[8][9] @ 1096
	.bits	13,8			; $P$T0$1[8][10] @ 1104
	.bits	7,8			; $P$T0$1[8][11] @ 1112
	.bits	1,8			; $P$T0$1[8][12] @ 1120
	.bits	4,8			; $P$T0$1[8][13] @ 1128
	.bits	10,8			; $P$T0$1[8][14] @ 1136
	.bits	5,8			; $P$T0$1[8][15] @ 1144
	.bits	10,8			; $P$T0$1[9][0] @ 1152
	.bits	2,8			; $P$T0$1[9][1] @ 1160
	.bits	8,8			; $P$T0$1[9][2] @ 1168
	.bits	4,8			; $P$T0$1[9][3] @ 1176
	.bits	7,8			; $P$T0$1[9][4] @ 1184
	.bits	6,8			; $P$T0$1[9][5] @ 1192
	.bits	1,8			; $P$T0$1[9][6] @ 1200
	.bits	5,8			; $P$T0$1[9][7] @ 1208
	.bits	15,8			; $P$T0$1[9][8] @ 1216
	.bits	11,8			; $P$T0$1[9][9] @ 1224
	.bits	9,8			; $P$T0$1[9][10] @ 1232
	.bits	14,8			; $P$T0$1[9][11] @ 1240
	.bits	3,8			; $P$T0$1[9][12] @ 1248
	.bits	12,8			; $P$T0$1[9][13] @ 1256
	.bits	13,8			; $P$T0$1[9][14] @ 1264
	.bits	0,8			; $P$T0$1[9][15] @ 1272

$C$DW$2	.dwtag  DW_TAG_variable
	.dwattr $C$DW$2, DW_AT_name("$P$T0$1")
	.dwattr $C$DW$2, DW_AT_TI_symbol_name("$P$T0$1")
	.dwattr $C$DW$2, DW_AT_type(*$C$DW$T$52)
	.dwattr $C$DW$2, DW_AT_location[DW_OP_addr $P$T0$1]
	.dwattr $C$DW$2, DW_AT_decl_file("../blake2s.c")
	.dwattr $C$DW$2, DW_AT_decl_line(0x2a)
	.dwattr $C$DW$2, DW_AT_decl_column(0x13)

;	D:\ti\ccsv7\tools\compiler\ti-cgt-msp430_16.9.3.LTS\bin\opt430.exe C:\\Users\\MewCa\\AppData\\Local\\Temp\\{7B3A79C7-504A-4628-8AA3-ED110993BED4} C:\\Users\\MewCa\\AppData\\Local\\Temp\\{A2FC5067-8912-47BE-BE58-E287787524E5} 
	.sect	".text:blake2s_compress"
	.clink

$C$DW$3	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$3, DW_AT_name("blake2s_compress")
	.dwattr $C$DW$3, DW_AT_low_pc(blake2s_compress)
	.dwattr $C$DW$3, DW_AT_high_pc(0x00)
	.dwattr $C$DW$3, DW_AT_TI_symbol_name("blake2s_compress")
	.dwattr $C$DW$3, DW_AT_TI_begin_file("../blake2s.c")
	.dwattr $C$DW$3, DW_AT_TI_begin_line(0x28)
	.dwattr $C$DW$3, DW_AT_TI_begin_column(0x0d)
	.dwattr $C$DW$3, DW_AT_decl_file("../blake2s.c")
	.dwattr $C$DW$3, DW_AT_decl_line(0x28)
	.dwattr $C$DW$3, DW_AT_decl_column(0x0d)
	.dwattr $C$DW$3, DW_AT_TI_max_frame_size(0x1ba)
	.dwpsn	file "../blake2s.c",line 41,column 1,is_stmt,address blake2s_compress,isa 0

	.dwfde $C$DW$CIE, blake2s_compress
$C$DW$4	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$4, DW_AT_name("ctx")
	.dwattr $C$DW$4, DW_AT_TI_symbol_name("ctx")
	.dwattr $C$DW$4, DW_AT_type(*$C$DW$T$29)
	.dwattr $C$DW$4, DW_AT_location[DW_OP_reg12]

$C$DW$5	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$5, DW_AT_name("last")
	.dwattr $C$DW$5, DW_AT_TI_symbol_name("last")
	.dwattr $C$DW$5, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$5, DW_AT_location[DW_OP_reg13]


;*****************************************************************************
;* FUNCTION NAME: blake2s_compress                                           *
;*                                                                           *
;*   Regs Modified     : SP,SR,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15     *
;*   Regs Used         : SP,SR,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15     *
;*   Local Frame Size  : 0 Args + 410 Auto + 28 Save = 438 byte              *
;*****************************************************************************
blake2s_compress:
;* --------------------------------------------------------------------------*
$C$DW$6	.dwtag  DW_TAG_variable
	.dwattr $C$DW$6, DW_AT_name("sigma")
	.dwattr $C$DW$6, DW_AT_TI_symbol_name("sigma")
	.dwattr $C$DW$6, DW_AT_type(*$C$DW$T$52)
	.dwattr $C$DW$6, DW_AT_location[DW_OP_breg1 0]

$C$DW$7	.dwtag  DW_TAG_variable
	.dwattr $C$DW$7, DW_AT_name("v")
	.dwattr $C$DW$7, DW_AT_TI_symbol_name("v")
	.dwattr $C$DW$7, DW_AT_type(*$C$DW$T$84)
	.dwattr $C$DW$7, DW_AT_location[DW_OP_breg1 160]

$C$DW$8	.dwtag  DW_TAG_variable
	.dwattr $C$DW$8, DW_AT_name("m")
	.dwattr $C$DW$8, DW_AT_TI_symbol_name("m")
	.dwattr $C$DW$8, DW_AT_type(*$C$DW$T$84)
	.dwattr $C$DW$8, DW_AT_location[DW_OP_breg1 224]

;* r13   assigned to $O$T1
;* r6    assigned to $O$T2
;* r6    assigned to $O$C3
;* r6    assigned to $O$C4
;* r15   assigned to $O$C5
;* r6    assigned to $O$C6
;* r8    assigned to $O$C7
;* r6    assigned to $O$C8
;* r6    assigned to $O$C9
;* r5    assigned to $O$C10
;* r4    assigned to $O$C13
;* r4    assigned to $O$C14
;* r4    assigned to $O$C15
;* r4    assigned to $O$C16
;* r14   assigned to $O$C17
;* r7    assigned to $O$C18
;* r9    assigned to $O$C20
;* r9    assigned to $O$C21
;* r9    assigned to $O$C22
;* r9    assigned to $O$C23
;* r6    assigned to $O$C24
;* r7    assigned to $O$C25
;* r10   assigned to $O$C28
;* r5    assigned to $O$C29
;* r10   assigned to $O$C30
;* r10   assigned to $O$C31
;* r7    assigned to $O$C32
;* r7    assigned to $O$C33
;* r6    assigned to $O$C34
;* r8    assigned to $O$C36
;* r14   assigned to $O$C38
;* r4    assigned to $O$C39
;* r6    assigned to $O$C41
;* r4    assigned to $O$C42
;* r13   assigned to $O$C43
;* r15   assigned to $O$C44
;* r14   assigned to $O$C45
;* r14   assigned to $O$C46
;* r8    assigned to $O$C47
;* r13   assigned to $O$C48
;* r15   assigned to $O$C49
;* r6    assigned to $O$C50
;* r14   assigned to $O$C51
;* r5    assigned to $O$C52
;* r13   assigned to $O$C53
;* r14   assigned to $O$C54
;* r13   assigned to $O$C55
;* r9    assigned to $O$C56
;* r14   assigned to $O$C57
;* r15   assigned to $O$C58
;* r10   assigned to $O$Y5
;* r8    assigned to $O$Y6
;* r12   assigned to $O$Y7
;* r9    assigned to $O$Y8
;* r7    assigned to $O$Y12
;* r10   assigned to $O$Y13
;* r4    assigned to $O$Y14
;* r6    assigned to $O$Y19
;* r10   assigned to $O$Y20
;* r8    assigned to $O$Y21
;* r10   assigned to $O$Y24
;* r6    assigned to $O$Y25
;* r14   assigned to $O$Y26
;* r14   assigned to $O$Y34
;* r7    assigned to $O$Y37
;* r10   assigned to $O$Y42
;* r14   assigned to $O$Y43
;* r5    assigned to $O$Y44
;* r9    assigned to $O$Y45
;* r10   assigned to $O$Y50
;* r8    assigned to $O$Y51
;* r6    assigned to $O$Y52
;* r4    assigned to $O$Y53
;* r4    assigned to $O$Y60
;* r6    assigned to $O$Y62
;* r10   assigned to ctx
$C$DW$9	.dwtag  DW_TAG_variable
	.dwattr $C$DW$9, DW_AT_name("ctx")
	.dwattr $C$DW$9, DW_AT_TI_symbol_name("ctx")
	.dwattr $C$DW$9, DW_AT_type(*$C$DW$T$30)
	.dwattr $C$DW$9, DW_AT_location[DW_OP_reg10]

;* r9    assigned to last
$C$DW$10	.dwtag  DW_TAG_variable
	.dwattr $C$DW$10, DW_AT_name("last")
	.dwattr $C$DW$10, DW_AT_TI_symbol_name("last")
	.dwattr $C$DW$10, DW_AT_type(*$C$DW$T$57)
	.dwattr $C$DW$10, DW_AT_location[DW_OP_reg9]

$C$DW$11	.dwtag  DW_TAG_variable
	.dwattr $C$DW$11, DW_AT_name("h16")
	.dwattr $C$DW$11, DW_AT_TI_symbol_name("h16")
	.dwattr $C$DW$11, DW_AT_type(*$C$DW$T$69)
	.dwattr $C$DW$11, DW_AT_location[DW_OP_breg1 406]

	.dwcfi	cfa_offset, 4
	.dwcfi	save_reg_to_mem, 16, -4
        PUSHM.A   #7,r10                ; [] 
	.dwcfi	save_reg_to_mem, 10, -8
	.dwcfi	save_reg_to_mem, 9, -12
	.dwcfi	save_reg_to_mem, 8, -16
	.dwcfi	save_reg_to_mem, 7, -20
	.dwcfi	save_reg_to_mem, 6, -24
	.dwcfi	save_reg_to_mem, 5, -28
	.dwcfi	save_reg_to_mem, 4, -32
	.dwcfi	cfa_offset, 32
        SUBA      #410,SP               ; [] 
	.dwcfi	cfa_offset, 442
        MOVA      r13,r9                ; [] |41| 
        MOVA      r12,r10               ; [] |41| 
	.dwpsn	file "../blake2s.c",line 42,column 19,is_stmt,isa 0
        MOVX.A    SP,r12                ; [] |42| 
        MOVX.A    #$P$T0$1+0,r13        ; [] |42| 
        MOV.W     #160,r14              ; [] |42| 
$C$DW$12	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$12, DW_AT_low_pc(0x00)
	.dwattr $C$DW$12, DW_AT_name("memcpy")
	.dwattr $C$DW$12, DW_AT_TI_call

        CALLA     #memcpy               ; [] |42| 
                                          ; [] |42| 
	.dwpsn	file "../blake2s.c",line 57,column 19,is_stmt,isa 0
        MOVA      r10,r15               ; [] |57| 
        ADDA      #64,r15               ; [] |57| 
        MOVX.A    r15,406(SP)           ; [] |57| 
	.dwpsn	file "../blake2s.c",line 62,column 9,is_stmt,isa 0
        MOV.W     @r15,160(SP)          ; [] |62| 
	.dwpsn	file "../blake2s.c",line 63,column 9,is_stmt,isa 0
        MOVX.W    &blake2s_iv+0,192(SP) ; [] |63| 
	.dwpsn	file "../blake2s.c",line 62,column 9,is_stmt,isa 0
        MOV.W     66(r10),162(SP)       ; [] |62| 
	.dwpsn	file "../blake2s.c",line 63,column 9,is_stmt,isa 0
        MOVX.W    &blake2s_iv+2,194(SP) ; [] |63| 
	.dwpsn	file "../blake2s.c",line 62,column 9,is_stmt,isa 0
        MOV.W     68(r10),164(SP)       ; [] |62| 
	.dwpsn	file "../blake2s.c",line 63,column 9,is_stmt,isa 0
        MOVX.W    &blake2s_iv+4,196(SP) ; [] |63| 
	.dwpsn	file "../blake2s.c",line 62,column 9,is_stmt,isa 0
        MOV.W     70(r10),166(SP)       ; [] |62| 
	.dwpsn	file "../blake2s.c",line 63,column 9,is_stmt,isa 0
        MOVX.W    &blake2s_iv+6,198(SP) ; [] |63| 
	.dwpsn	file "../blake2s.c",line 62,column 9,is_stmt,isa 0
        MOV.W     72(r10),168(SP)       ; [] |62| 
	.dwpsn	file "../blake2s.c",line 63,column 9,is_stmt,isa 0
        MOVX.W    &blake2s_iv+8,200(SP) ; [] |63| 
	.dwpsn	file "../blake2s.c",line 62,column 9,is_stmt,isa 0
        MOV.W     74(r10),170(SP)       ; [] |62| 
	.dwpsn	file "../blake2s.c",line 63,column 9,is_stmt,isa 0
        MOVX.W    &blake2s_iv+10,202(SP) ; [] |63| 
	.dwpsn	file "../blake2s.c",line 62,column 9,is_stmt,isa 0
        MOV.W     76(r10),172(SP)       ; [] |62| 
	.dwpsn	file "../blake2s.c",line 63,column 9,is_stmt,isa 0
        MOVX.W    &blake2s_iv+12,204(SP) ; [] |63| 
	.dwpsn	file "../blake2s.c",line 62,column 9,is_stmt,isa 0
        MOV.W     78(r10),174(SP)       ; [] |62| 
	.dwpsn	file "../blake2s.c",line 63,column 9,is_stmt,isa 0
        MOVX.W    &blake2s_iv+14,206(SP) ; [] |63| 
	.dwpsn	file "../blake2s.c",line 62,column 9,is_stmt,isa 0
        MOV.W     80(r10),176(SP)       ; [] |62| 
        MOV.W     82(r10),178(SP)       ; [] |62| 
        MOV.W     84(r10),180(SP)       ; [] |62| 
        MOV.W     86(r10),182(SP)       ; [] |62| 
        MOV.W     88(r10),184(SP)       ; [] |62| 
	.dwpsn	file "../blake2s.c",line 63,column 9,is_stmt,isa 0
        MOVX.W    &blake2s_iv+24,216(SP) ; [] |63| 
	.dwpsn	file "../blake2s.c",line 62,column 9,is_stmt,isa 0
        MOV.W     90(r10),186(SP)       ; [] |62| 
	.dwpsn	file "../blake2s.c",line 63,column 9,is_stmt,isa 0
        MOVX.W    &blake2s_iv+26,218(SP) ; [] |63| 
	.dwpsn	file "../blake2s.c",line 62,column 9,is_stmt,isa 0
        MOV.W     92(r10),188(SP)       ; [] |62| 
	.dwpsn	file "../blake2s.c",line 63,column 9,is_stmt,isa 0
        MOVX.W    &blake2s_iv+28,220(SP) ; [] |63| 
	.dwpsn	file "../blake2s.c",line 62,column 9,is_stmt,isa 0
        MOV.W     94(r10),190(SP)       ; [] |62| 
	.dwpsn	file "../blake2s.c",line 63,column 9,is_stmt,isa 0
        MOVX.W    &blake2s_iv+30,222(SP) ; [] |63| 
	.dwpsn	file "../blake2s.c",line 66,column 5,is_stmt,isa 0
        MOVX.W    &blake2s_iv+16,r15    ; [] |66| 
        XOR.W     96(r10),r15           ; [] |66| 
        MOV.W     r15,208(SP)           ; [] |66| 
	.dwpsn	file "../blake2s.c",line 67,column 5,is_stmt,isa 0
        MOVX.W    &blake2s_iv+18,r15    ; [] |67| 
        XOR.W     98(r10),r15           ; [] |67| 
        MOV.W     r15,210(SP)           ; [] |67| 
	.dwpsn	file "../blake2s.c",line 68,column 5,is_stmt,isa 0
        MOVX.W    &blake2s_iv+20,r15    ; [] |68| 
        XOR.W     100(r10),r15          ; [] |68| 
        MOV.W     r15,212(SP)           ; [] |68| 
	.dwpsn	file "../blake2s.c",line 69,column 5,is_stmt,isa 0
        MOVX.W    &blake2s_iv+22,r15    ; [] |69| 
        XOR.W     102(r10),r15          ; [] |69| 
        MOV.W     r15,214(SP)           ; [] |69| 
	.dwpsn	file "../blake2s.c",line 70,column 5,is_stmt,isa 0
        TST.W     r9                    ; [] |70| 
        JEQ       $C$L1                 ; [] |70| 
                                          ; [] |70| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../blake2s.c",line 71,column 9,is_stmt,isa 0
        XOR.W     #65535,216(SP)        ; [] |71| 
	.dwpsn	file "../blake2s.c",line 72,column 9,is_stmt,isa 0
        XOR.W     #65535,218(SP)        ; [] |72| 
;* --------------------------------------------------------------------------*
$C$L1:    
	.dwpsn	file "../blake2s.c",line 76,column 9,is_stmt,isa 0
        MOV.W     @r10,224(SP)          ; [] |76| 
        MOV.W     2(r10),226(SP)        ; [] |76| 
        MOV.W     4(r10),228(SP)        ; [] |76| 
        MOV.W     6(r10),230(SP)        ; [] |76| 
        MOV.W     8(r10),232(SP)        ; [] |76| 
        MOV.W     10(r10),234(SP)       ; [] |76| 
        MOV.W     12(r10),236(SP)       ; [] |76| 
        MOV.W     14(r10),238(SP)       ; [] |76| 
        MOV.W     16(r10),240(SP)       ; [] |76| 
        MOV.W     18(r10),242(SP)       ; [] |76| 
        MOV.W     20(r10),244(SP)       ; [] |76| 
        MOV.W     22(r10),246(SP)       ; [] |76| 
        MOV.W     24(r10),248(SP)       ; [] |76| 
        MOV.W     26(r10),250(SP)       ; [] |76| 
        MOV.W     28(r10),252(SP)       ; [] |76| 
        MOV.W     30(r10),254(SP)       ; [] |76| 
        MOV.W     32(r10),256(SP)       ; [] |76| 
        MOV.W     34(r10),258(SP)       ; [] |76| 
        MOV.W     36(r10),260(SP)       ; [] |76| 
        MOV.W     38(r10),262(SP)       ; [] |76| 
        MOV.W     40(r10),264(SP)       ; [] |76| 
        MOV.W     42(r10),266(SP)       ; [] |76| 
        MOV.W     44(r10),268(SP)       ; [] |76| 
        MOV.W     46(r10),270(SP)       ; [] |76| 
        MOV.W     48(r10),272(SP)       ; [] |76| 
        MOV.W     50(r10),274(SP)       ; [] |76| 
        MOV.W     52(r10),276(SP)       ; [] |76| 
        MOV.W     54(r10),278(SP)       ; [] |76| 
        MOV.W     56(r10),280(SP)       ; [] |76| 
        MOV.W     58(r10),282(SP)       ; [] |76| 
        MOV.W     60(r10),284(SP)       ; [] |76| 
        MOV.W     62(r10),286(SP)       ; [] |76| 
        MOVX.A    SP,r15                ; [] 
        ADDX.A    #1,r15                ; [] 
        MOVX.A    r15,346(SP)           ; [] 
        MOVX.A    SP,r15                ; [] 
        ADDX.A    #2,r15                ; [] 
        MOVX.A    r15,350(SP)           ; [] 
        MOVX.A    SP,r15                ; [] 
        ADDX.A    #3,r15                ; [] 
        MOVX.A    r15,354(SP)           ; [] 
        MOVX.A    SP,r15                ; [] 
        ADDX.A    #4,r15                ; [] 
        MOVX.A    r15,358(SP)           ; [] 
        MOVX.A    SP,r15                ; [] 
        ADDX.A    #5,r15                ; [] 
        MOVX.A    r15,362(SP)           ; [] 
        MOVX.A    SP,r15                ; [] 
        ADDX.A    #6,r15                ; [] 
        MOVX.A    r15,366(SP)           ; [] 
        MOVX.A    SP,r15                ; [] 
        ADDX.A    #7,r15                ; [] 
        MOVX.A    r15,370(SP)           ; [] 
        MOVX.A    SP,r15                ; [] 
        ADDX.A    #8,r15                ; [] 
        MOVX.A    r15,374(SP)           ; [] 
        MOVX.A    SP,r15                ; [] 
        ADDX.A    #9,r15                ; [] 
        MOVX.A    r15,378(SP)           ; [] 
        MOVX.A    SP,r15                ; [] 
        ADDX.A    #10,r15               ; [] 
        MOVX.A    r15,382(SP)           ; [] 
        MOVX.A    SP,r15                ; [] 
        ADDX.A    #11,r15               ; [] 
        MOVX.A    r15,386(SP)           ; [] 
        MOVX.A    SP,r15                ; [] 
        ADDX.A    #12,r15               ; [] 
        MOVX.A    r15,390(SP)           ; [] 
        MOVX.A    SP,r15                ; [] 
        ADDX.A    #13,r15               ; [] 
        MOVX.A    r15,394(SP)           ; [] 
        MOVX.A    SP,r15                ; [] 
        ADDX.A    #14,r15               ; [] 
        MOVX.A    r15,398(SP)           ; [] 
        MOVX.A    SP,r15                ; [] 
        ADDX.A    #15,r15               ; [] 
        MOVX.A    r15,402(SP)           ; [] 
	.dwpsn	file "../blake2s.c",line 78,column 17,is_stmt,isa 0
        MOV.W     #10,340(SP)           ; [] |78| 
        MOVX.A    SP,r15                ; [] 
        MOVX.A    r15,342(SP)           ; [] 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP $C$L2
;*
;*   Loop source line                : 78
;*   Loop closing brace source line  : 87
;*   Known Minimum Trip Count        : 10
;*   Known Maximum Trip Count        : 10
;*   Known Max Trip Count Factor     : 10
;* --------------------------------------------------------------------------*
$C$L2:    
	.dwpsn	file "../blake2s.c",line 79,column 9,is_stmt,isa 0
        MOVX.A    SP,r14                ; [] |79| 
        ADDX.A    #224,r14              ; [] |79| 
        MOVX.A    342(SP),r15           ; [] |79| 
        MOV.B     @r15,r15              ; [] |79| 
        RLAM.W    #2,r15                ; [] |79| 
        RLAM.A    #4,r15                ; [] |79| 
        RRAM.A    #4,r15                ; [] |79| 
        ADDA      r14,r15               ; [] |79| 
        MOV.W     176(SP),r9            ; [] |79| 
        MOV.W     178(SP),r7            ; [] |79| 
        ADD.W     160(SP),r9            ; [] |79| 
        ADDC.W    162(SP),r7            ; [] |79| 
        ADD.W     @r15,r9               ; [] |79| 
        ADDC.W    2(r15),r7             ; [] |79| 
        MOVA      r9,r15                ; [] |79| 
        MOVA      r7,r10                ; [] |79| 
        XOR.W     208(SP),r15           ; [] |79| 
        XOR.W     210(SP),r10           ; [] |79| 
        XOR.W     #0,r10                ; [] |79| 
        MOV.W     #0,r11                ; [] |79| 
        XOR.W     r15,r11               ; [] |79| 
        MOVA      r10,r8                ; [] |79| 
        MOVA      r11,r15               ; [] |79| 
        ADD.W     192(SP),r8            ; [] |79| 
        ADDC.W    194(SP),r15           ; [] |79| 
        MOVA      r8,r14                ; [] |79| 
        MOVA      r15,r13               ; [] |79| 
        XOR.W     176(SP),r14           ; [] |79| 
        XOR.W     178(SP),r13           ; [] |79| 
        MOVA      r14,r12               ; [] |79| 
$C$DW$13	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$13, DW_AT_low_pc(0x00)
	.dwattr $C$DW$13, DW_AT_name("__mspabi_srll_12")
	.dwattr $C$DW$13, DW_AT_TI_call

        CALLA     #__mspabi_srll_12     ; [] |79| 
                                          ; [] |79| 
        RLAM.W    #4,r14                ; [] |79| 
        MOV.W     #0,r6                 ; [] |79| 
        XOR.W     r12,r6                ; [] |79| 
        XOR.W     r13,r14               ; [] |79| 
        MOVA      r6,r12                ; [] |79| 
        MOVX.A    SP,r13                ; [] |79| 
        ADDX.A    #224,r13              ; [] |79| 
        MOVX.A    346(SP),r6            ; [] |79| 
        MOV.B     @r6,r6                ; [] |79| 
        RLAM.W    #2,r6                 ; [] |79| 
        RLAM.A    #4,r6                 ; [] |79| 
        RRAM.A    #4,r6                 ; [] |79| 
        ADDA      r13,r6                ; [] |79| 
        MOVA      r12,r5                ; [] |79| 
        MOVA      r14,r13               ; [] |79| 
        ADD.W     @r6,r5                ; [] |79| 
        ADDC.W    2(r6),r13             ; [] |79| 
        ADD.W     r5,r9                 ; [] |79| 
        ADDC.W    r7,r13                ; [] |79| 
        MOV.W     r13,302(SP)           ; [] 
        MOV.W     r9,160(SP)            ; [] |79| 
        MOVA      r13,r7                ; [] 
        MOV.W     r7,162(SP)            ; [] |79| 
        MOVA      r9,r13                ; [] |79| 
        XOR.W     r10,r13               ; [] |79| 
        XOR.W     r11,r7                ; [] |79| 
        MOV.B     r13,r11               ; [] |79| 
        SWPB      r11                   ; [] |79| 
        SWPB      r13                   ; [] |79| 
        SWPB      r7                    ; [] |79| 
        XOR.B     r7,r13                ; [] |79| 
        XOR.W     r7,r13                ; [] |79| 
        XOR.W     #0,r13                ; [] |79| 
        MOV.B     r7,r7                 ; [] |79| 
        XOR.W     r11,r7                ; [] |79| 
        MOV.W     r13,304(SP)           ; [] 
        MOV.W     r7,306(SP)            ; [] 
        MOV.W     r13,208(SP)           ; [] |79| 
        MOVA      r7,r13                ; [] 
        MOV.W     r13,210(SP)           ; [] |79| 
        ADD.W     304(SP),r8            ; [] |79| 
        ADDC.W    r15,r13               ; [] |79| 
        MOV.W     r13,310(SP)           ; [] 
        MOV.W     r8,308(SP)            ; [] 
        MOV.W     r8,192(SP)            ; [] |79| 
        MOVA      r13,r15               ; [] 
        MOV.W     r15,194(SP)           ; [] |79| 
        XOR.W     r12,r8                ; [] |79| 
        XOR.W     r14,r15               ; [] |79| 
        MOVA      r8,r14                ; [] |79| 
        MOVA      r14,r12               ; [] |79| 
        MOVA      r15,r13               ; [] |79| 
$C$DW$14	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$14, DW_AT_low_pc(0x00)
	.dwattr $C$DW$14, DW_AT_name("__mspabi_srll_7")
	.dwattr $C$DW$14, DW_AT_TI_call

        CALLA     #__mspabi_srll_7      ; [] |79| 
                                          ; [] |79| 
        RPT #9 || RLAX.W r14 ; [] |79| 
        MOV.W     #0,r15                ; [] |79| 
        XOR.W     r12,r15               ; [] |79| 
        XOR.W     r13,r14               ; [] |79| 
        MOV.W     r15,288(SP)           ; [] 
        MOV.W     r14,290(SP)           ; [] 
        MOV.W     r15,176(SP)           ; [] |79| 
        MOVA      r14,r15               ; [] 
        MOV.W     r15,178(SP)           ; [] |79| 
	.dwpsn	file "../blake2s.c",line 80,column 9,is_stmt,isa 0
        MOVX.A    SP,r15                ; [] |80| 
        ADDX.A    #224,r15              ; [] |80| 
        MOVX.A    350(SP),r14           ; [] |80| 
        MOV.B     @r14,r13              ; [] |80| 
        RLAM.W    #2,r13                ; [] |80| 
        RLAM.A    #4,r13                ; [] |80| 
        RRAM.A    #4,r13                ; [] |80| 
        ADDA      r15,r13               ; [] |80| 
        MOV.W     180(SP),r14           ; [] |80| 
        MOV.W     182(SP),r15           ; [] |80| 
        ADD.W     164(SP),r14           ; [] |80| 
        ADDC.W    166(SP),r15           ; [] |80| 
        ADD.W     @r13,r14              ; [] |80| 
        ADDC.W    2(r13),r15            ; [] |80| 
        MOVA      r14,r13               ; [] |80| 
        MOVA      r15,r7                ; [] |80| 
        XOR.W     212(SP),r13           ; [] |80| 
        XOR.W     214(SP),r7            ; [] |80| 
        XOR.W     #0,r7                 ; [] |80| 
        MOV.W     #0,r8                 ; [] |80| 
        XOR.W     r13,r8                ; [] |80| 
        MOVA      r7,r10                ; [] |80| 
        MOVA      r8,r11                ; [] |80| 
        ADD.W     196(SP),r10           ; [] |80| 
        ADDC.W    198(SP),r11           ; [] |80| 
        MOVA      r10,r5                ; [] |80| 
        MOVA      r11,r13               ; [] |80| 
        XOR.W     180(SP),r5            ; [] |80| 
        XOR.W     182(SP),r13           ; [] |80| 
        MOVA      r5,r12                ; [] |80| 
$C$DW$15	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$15, DW_AT_low_pc(0x00)
	.dwattr $C$DW$15, DW_AT_name("__mspabi_srll_12")
	.dwattr $C$DW$15, DW_AT_TI_call

        CALLA     #__mspabi_srll_12     ; [] |80| 
                                          ; [] |80| 
        RLAM.W    #4,r5                 ; [] |80| 
        MOV.W     #0,r4                 ; [] |80| 
        XOR.W     r12,r4                ; [] |80| 
        XOR.W     r13,r5                ; [] |80| 
        MOVX.A    SP,r12                ; [] |80| 
        ADDX.A    #224,r12              ; [] |80| 
        MOVX.A    354(SP),r13           ; [] |80| 
        MOV.B     @r13,r13              ; [] |80| 
        RLAM.W    #2,r13                ; [] |80| 
        RLAM.A    #4,r13                ; [] |80| 
        RRAM.A    #4,r13                ; [] |80| 
        ADDA      r12,r13               ; [] |80| 
        MOVA      r4,r6                 ; [] |80| 
        MOVA      r5,r12                ; [] |80| 
        ADD.W     @r13,r6               ; [] |80| 
        ADDC.W    2(r13),r12            ; [] |80| 
        ADD.W     r14,r6                ; [] |80| 
        ADDC.W    r12,r15               ; [] |80| 
        MOV.W     r15,314(SP)           ; [] 
        MOV.W     r6,312(SP)            ; [] 
        MOV.W     r6,164(SP)            ; [] |80| 
        MOV.W     r15,166(SP)           ; [] |80| 
        XOR.W     r7,r6                 ; [] |80| 
        XOR.W     r8,r15                ; [] |80| 
        MOV.B     r6,r14                ; [] |80| 
        SWPB      r14                   ; [] |80| 
        SWPB      r6                    ; [] |80| 
        SWPB      r15                   ; [] |80| 
        XOR.B     r15,r6                ; [] |80| 
        XOR.W     r15,r6                ; [] |80| 
        XOR.W     #0,r6                 ; [] |80| 
        MOV.B     r15,r15               ; [] |80| 
        XOR.W     r14,r15               ; [] |80| 
        MOV.W     r6,316(SP)            ; [] 
        MOV.W     r15,318(SP)           ; [] 
        MOVA      r6,r15                ; [] 
        MOV.W     r15,212(SP)           ; [] |80| 
        MOV.W     318(SP),214(SP)       ; [] 
        MOVA      r6,r15                ; [] 
        MOV.W     318(SP),r14           ; [] 
        ADD.W     r10,r15               ; [] |80| 
        ADDC.W    r11,r14               ; [] |80| 
        MOV.W     r14,322(SP)           ; [] 
        MOV.W     r15,320(SP)           ; [] 
        MOVA      r15,r10               ; [] 
        MOV.W     r10,196(SP)           ; [] |80| 
        MOVA      r14,r11               ; [] 
        MOV.W     r11,198(SP)           ; [] |80| 
        XOR.W     r4,r15                ; [] |80| 
        XOR.W     r5,r11                ; [] |80| 
        MOVA      r15,r12               ; [] |80| 
        MOVA      r11,r13               ; [] |80| 
$C$DW$16	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$16, DW_AT_low_pc(0x00)
	.dwattr $C$DW$16, DW_AT_name("__mspabi_srll_7")
	.dwattr $C$DW$16, DW_AT_TI_call

        CALLA     #__mspabi_srll_7      ; [] |80| 
                                          ; [] |80| 
        RPT #9 || RLAX.W r15 ; [] |80| 
        MOV.W     #0,r14                ; [] |80| 
        XOR.W     r12,r14               ; [] |80| 
        XOR.W     r13,r15               ; [] |80| 
        MOV.W     r14,296(SP)           ; [] 
        MOV.W     r15,298(SP)           ; [] 
        MOVA      r14,r15               ; [] 
        MOV.W     r15,180(SP)           ; [] |80| 
        MOV.W     298(SP),182(SP)       ; [] 
	.dwpsn	file "../blake2s.c",line 81,column 9,is_stmt,isa 0
        MOVX.A    SP,r15                ; [] |81| 
        ADDX.A    #224,r15              ; [] |81| 
        MOVX.A    358(SP),r14           ; [] |81| 
        MOV.B     @r14,r13              ; [] |81| 
        RLAM.W    #2,r13                ; [] |81| 
        RLAM.A    #4,r13                ; [] |81| 
        RRAM.A    #4,r13                ; [] |81| 
        ADDA      r15,r13               ; [] |81| 
        MOV.W     184(SP),r14           ; [] |81| 
        MOV.W     186(SP),r15           ; [] |81| 
        ADD.W     168(SP),r14           ; [] |81| 
        ADDC.W    170(SP),r15           ; [] |81| 
        ADD.W     @r13,r14              ; [] |81| 
        ADDC.W    2(r13),r15            ; [] |81| 
        MOVA      r14,r13               ; [] |81| 
        MOVA      r15,r6                ; [] |81| 
        XOR.W     216(SP),r13           ; [] |81| 
        XOR.W     218(SP),r6            ; [] |81| 
        XOR.W     #0,r6                 ; [] |81| 
        MOV.W     #0,r7                 ; [] |81| 
        XOR.W     r13,r7                ; [] |81| 
        MOVA      r6,r10                ; [] |81| 
        MOVA      r7,r11                ; [] |81| 
        ADD.W     200(SP),r10           ; [] |81| 
        ADDC.W    202(SP),r11           ; [] |81| 
        MOVA      r10,r8                ; [] |81| 
        MOVA      r11,r13               ; [] |81| 
        XOR.W     184(SP),r8            ; [] |81| 
        XOR.W     186(SP),r13           ; [] |81| 
        MOVA      r8,r12                ; [] |81| 
$C$DW$17	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$17, DW_AT_low_pc(0x00)
	.dwattr $C$DW$17, DW_AT_name("__mspabi_srll_12")
	.dwattr $C$DW$17, DW_AT_TI_call

        CALLA     #__mspabi_srll_12     ; [] |81| 
                                          ; [] |81| 
        MOVA      r8,r5                 ; [] |81| 
        RLAM.W    #4,r5                 ; [] |81| 
        MOV.W     #0,r8                 ; [] |81| 
        XOR.W     r12,r8                ; [] |81| 
        XOR.W     r13,r5                ; [] |81| 
        MOVA      r5,r12                ; [] |81| 
        MOVX.A    SP,r5                 ; [] |81| 
        ADDX.A    #224,r5               ; [] |81| 
        MOVX.A    362(SP),r13           ; [] |81| 
        MOV.B     @r13,r13              ; [] |81| 
        RLAM.W    #2,r13                ; [] |81| 
        RLAM.A    #4,r13                ; [] |81| 
        RRAM.A    #4,r13                ; [] |81| 
        ADDA      r5,r13                ; [] |81| 
        MOVA      r8,r4                 ; [] |81| 
        MOVA      r12,r5                ; [] |81| 
        ADD.W     @r13,r4               ; [] |81| 
        ADDC.W    2(r13),r5             ; [] |81| 
        ADD.W     r14,r4                ; [] |81| 
        ADDC.W    r15,r5                ; [] |81| 
        MOV.W     r5,326(SP)            ; [] 
        MOV.W     r4,324(SP)            ; [] 
        MOVA      r4,r14                ; [] 
        MOV.W     r14,168(SP)           ; [] |81| 
        MOVA      r5,r15                ; [] 
        MOV.W     r15,170(SP)           ; [] |81| 
        XOR.W     r6,r14                ; [] |81| 
        XOR.W     r7,r15                ; [] |81| 
        MOV.B     r14,r13               ; [] |81| 
        SWPB      r13                   ; [] |81| 
        SWPB      r14                   ; [] |81| 
        SWPB      r15                   ; [] |81| 
        XOR.B     r15,r14               ; [] |81| 
        XOR.W     r15,r14               ; [] |81| 
        XOR.W     #0,r14                ; [] |81| 
        MOV.B     r15,r15               ; [] |81| 
        XOR.W     r13,r15               ; [] |81| 
        MOV.W     r14,328(SP)           ; [] 
        MOV.W     r15,330(SP)           ; [] 
        MOVA      r14,r15               ; [] 
        MOV.W     r15,216(SP)           ; [] |81| 
        MOV.W     330(SP),r15           ; [] 
        MOV.W     r15,218(SP)           ; [] |81| 
        ADD.W     r14,r10               ; [] |81| 
        ADDC.W    r15,r11               ; [] |81| 
        MOV.W     r10,200(SP)           ; [] |81| 
        MOV.W     r11,202(SP)           ; [] |81| 
        MOVA      r10,r15               ; [] |81| 
        MOVA      r11,r13               ; [] |81| 
        XOR.W     r8,r15                ; [] |81| 
        XOR.W     r12,r13               ; [] |81| 
        MOVA      r15,r12               ; [] |81| 
$C$DW$18	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$18, DW_AT_low_pc(0x00)
	.dwattr $C$DW$18, DW_AT_name("__mspabi_srll_7")
	.dwattr $C$DW$18, DW_AT_TI_call

        CALLA     #__mspabi_srll_7      ; [] |81| 
                                          ; [] |81| 
        RPT #9 || RLAX.W r15 ; [] |81| 
        MOV.W     #0,r14                ; [] |81| 
        XOR.W     r12,r14               ; [] |81| 
        XOR.W     r13,r15               ; [] |81| 
        MOV.W     r14,292(SP)           ; [] 
        MOV.W     r15,294(SP)           ; [] 
        MOVA      r14,r15               ; [] 
        MOV.W     r15,184(SP)           ; [] |81| 
        MOV.W     294(SP),186(SP)       ; [] 
	.dwpsn	file "../blake2s.c",line 82,column 9,is_stmt,isa 0
        MOVX.A    SP,r14                ; [] |82| 
        ADDX.A    #224,r14              ; [] |82| 
        MOVX.A    366(SP),r15           ; [] |82| 
        MOV.B     @r15,r15              ; [] |82| 
        RLAM.W    #2,r15                ; [] |82| 
        RLAM.A    #4,r15                ; [] |82| 
        RRAM.A    #4,r15                ; [] |82| 
        ADDA      r14,r15               ; [] |82| 
        MOV.W     188(SP),r6            ; [] |82| 
        MOV.W     190(SP),r7            ; [] |82| 
        ADD.W     172(SP),r6            ; [] |82| 
        ADDC.W    174(SP),r7            ; [] |82| 
        ADD.W     @r15,r6               ; [] |82| 
        ADDC.W    2(r15),r7             ; [] |82| 
        MOV.W     r6,172(SP)            ; [] |82| 
        MOV.W     r7,174(SP)            ; [] |82| 
        MOVA      r6,r13                ; [] |82| 
        MOVA      r7,r14                ; [] |82| 
        XOR.W     220(SP),r13           ; [] |82| 
        XOR.W     222(SP),r14           ; [] |82| 
        XOR.W     #0,r14                ; [] |82| 
        MOV.W     #0,r15                ; [] |82| 
        XOR.W     r13,r15               ; [] |82| 
        MOV.W     r14,220(SP)           ; [] |82| 
        MOV.W     r15,222(SP)           ; [] |82| 
        MOVA      r14,r13               ; [] |82| 
        MOVA      r15,r8                ; [] |82| 
        ADD.W     204(SP),r13           ; [] |82| 
        ADDC.W    206(SP),r8            ; [] |82| 
        MOV.W     r13,204(SP)           ; [] |82| 
        MOV.W     r8,206(SP)            ; [] |82| 
        MOV.W     r13,332(SP)           ; [] 
        MOVA      r13,r4                ; [] 
        MOVA      r8,r13                ; [] |82| 
        XOR.W     188(SP),r4            ; [] |82| 
        XOR.W     190(SP),r13           ; [] |82| 
        MOVA      r4,r12                ; [] |82| 
$C$DW$19	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$19, DW_AT_low_pc(0x00)
	.dwattr $C$DW$19, DW_AT_name("__mspabi_srll_12")
	.dwattr $C$DW$19, DW_AT_TI_call

        CALLA     #__mspabi_srll_12     ; [] |82| 
                                          ; [] |82| 
        RLAM.W    #4,r4                 ; [] |82| 
        MOV.W     #0,r5                 ; [] |82| 
        XOR.W     r12,r5                ; [] |82| 
        XOR.W     r13,r4                ; [] |82| 
        MOV.W     r5,300(SP)            ; [] 
        MOVX.A    SP,r12                ; [] |82| 
        ADDX.A    #224,r12              ; [] |82| 
        MOVX.A    370(SP),r13           ; [] |82| 
        MOV.B     @r13,r13              ; [] |82| 
        RLAM.W    #2,r13                ; [] |82| 
        RLAM.A    #4,r13                ; [] |82| 
        RRAM.A    #4,r13                ; [] |82| 
        ADDA      r12,r13               ; [] |82| 
        MOVA      r5,r12                ; [] 
        MOVA      r4,r5                 ; [] |82| 
        ADD.W     @r13,r12              ; [] |82| 
        ADDC.W    2(r13),r5             ; [] |82| 
        ADD.W     r6,r12                ; [] |82| 
        ADDC.W    r7,r5                 ; [] |82| 
        MOV.W     r5,336(SP)            ; [] 
        MOV.W     r12,334(SP)           ; [] 
        MOVA      r12,r6                ; [] 
        MOVA      r5,r7                 ; [] 
        XOR.W     r14,r6                ; [] |82| 
        XOR.W     r15,r7                ; [] |82| 
        MOV.B     r6,r15                ; [] |82| 
        SWPB      r15                   ; [] |82| 
        SWPB      r6                    ; [] |82| 
        SWPB      r7                    ; [] |82| 
        XOR.B     r7,r6                 ; [] |82| 
        XOR.W     r7,r6                 ; [] |82| 
        XOR.W     #0,r6                 ; [] |82| 
        MOV.B     r7,r7                 ; [] |82| 
        XOR.W     r15,r7                ; [] |82| 
        MOVA      r6,r14                ; [] |82| 
        MOVA      r7,r15                ; [] |82| 
        ADD.W     r14,332(SP)           ; [] |82| 
        MOV.W     332(SP),r13           ; [] 
        ADDC.W    r15,r8                ; [] |82| 
        MOV.W     r8,338(SP)            ; [] 
        MOVA      r13,r12               ; [] 
        XOR.W     300(SP),r12           ; [] |82| 
        XOR.W     r4,r8                 ; [] |82| 
        MOVA      r12,r4                ; [] |82| 
        MOVA      r8,r13                ; [] |82| 
$C$DW$20	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$20, DW_AT_low_pc(0x00)
	.dwattr $C$DW$20, DW_AT_name("__mspabi_srll_7")
	.dwattr $C$DW$20, DW_AT_TI_call

        CALLA     #__mspabi_srll_7      ; [] |82| 
                                          ; [] |82| 
;* --------------------------------------------------------------------------*
        RPT #9 || RLAX.W r4 ; [] |82| 
        MOV.W     #0,r8                 ; [] |82| 
        XOR.W     r12,r8                ; [] |82| 
        XOR.W     r13,r4                ; [] |82| 
        MOV.W     r8,300(SP)            ; [] 
	.dwpsn	file "../blake2s.c",line 83,column 9,is_stmt,isa 0
        MOVX.A    SP,r13                ; [] |83| 
        ADDX.A    #224,r13              ; [] |83| 
        MOVX.A    374(SP),r12           ; [] |83| 
        MOV.B     @r12,r12              ; [] |83| 
        RLAM.W    #2,r12                ; [] |83| 
        RLAM.A    #4,r12                ; [] |83| 
        RRAM.A    #4,r12                ; [] |83| 
        ADDA      r13,r12               ; [] |83| 
        MOV.W     296(SP),r8            ; [] 
        MOV.W     298(SP),r13           ; [] 
        ADD.W     @r12,r8               ; [] |83| 
        ADDC.W    2(r12),r13            ; [] |83| 
        ADD.W     r9,r8                 ; [] |83| 
        MOVA      r13,r9                ; [] |83| 
        ADDC.W    302(SP),r9            ; [] |83| 
        MOVA      r8,r12                ; [] |83| 
        MOVA      r9,r13                ; [] |83| 
        XOR.W     r14,r12               ; [] |83| 
        XOR.W     r15,r13               ; [] |83| 
        XOR.W     #0,r13                ; [] |83| 
        MOV.W     #0,r15                ; [] |83| 
        XOR.W     r12,r15               ; [] |83| 
        MOVA      r13,r14               ; [] |83| 
        ADD.W     r14,r10               ; [] |83| 
        ADDC.W    r15,r11               ; [] |83| 
        MOVA      r10,r6                ; [] |83| 
        MOVA      r11,r13               ; [] |83| 
        XOR.W     296(SP),r6            ; [] |83| 
        XOR.W     298(SP),r13           ; [] |83| 
        MOVA      r6,r12                ; [] |83| 
$C$DW$21	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$21, DW_AT_low_pc(0x00)
	.dwattr $C$DW$21, DW_AT_name("__mspabi_srll_12")
	.dwattr $C$DW$21, DW_AT_TI_call

        CALLA     #__mspabi_srll_12     ; [] |83| 
                                          ; [] |83| 
        RLAM.W    #4,r6                 ; [] |83| 
        MOV.W     #0,r5                 ; [] |83| 
        XOR.W     r12,r5                ; [] |83| 
        XOR.W     r13,r6                ; [] |83| 
        MOVX.A    SP,r12                ; [] |83| 
        ADDX.A    #224,r12              ; [] |83| 
        MOVX.A    378(SP),r13           ; [] |83| 
        MOV.B     @r13,r13              ; [] |83| 
        RLAM.W    #2,r13                ; [] |83| 
        RLAM.A    #4,r13                ; [] |83| 
        RRAM.A    #4,r13                ; [] |83| 
        ADDA      r12,r13               ; [] |83| 
        MOVA      r5,r7                 ; [] |83| 
        MOVA      r6,r12                ; [] |83| 
        ADD.W     @r13,r7               ; [] |83| 
        ADDC.W    2(r13),r12            ; [] |83| 
        ADD.W     r8,r7                 ; [] |83| 
        ADDC.W    r9,r12                ; [] |83| 
        MOV.W     r7,160(SP)            ; [] |83| 
        MOV.W     r12,162(SP)           ; [] |83| 
        XOR.W     r14,r7                ; [] |83| 
        XOR.W     r15,r12               ; [] |83| 
        MOV.B     r7,r15                ; [] |83| 
        SWPB      r15                   ; [] |83| 
        SWPB      r7                    ; [] |83| 
        SWPB      r12                   ; [] |83| 
        XOR.B     r12,r7                ; [] |83| 
        XOR.W     r12,r7                ; [] |83| 
        XOR.W     #0,r7                 ; [] |83| 
        MOV.B     r12,r12               ; [] |83| 
        XOR.W     r15,r12               ; [] |83| 
        MOV.W     r7,220(SP)            ; [] |83| 
        MOV.W     r12,222(SP)           ; [] |83| 
        ADD.W     r7,r10                ; [] |83| 
        ADDC.W    r11,r12               ; [] |83| 
        MOV.W     r10,200(SP)           ; [] |83| 
        MOV.W     r12,202(SP)           ; [] |83| 
        XOR.W     r5,r10                ; [] |83| 
        XOR.W     r6,r12                ; [] |83| 
        MOVA      r12,r13               ; [] |83| 
        MOVA      r10,r12               ; [] |83| 
$C$DW$22	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$22, DW_AT_low_pc(0x00)
	.dwattr $C$DW$22, DW_AT_name("__mspabi_srll_7")
	.dwattr $C$DW$22, DW_AT_TI_call

        CALLA     #__mspabi_srll_7      ; [] |83| 
                                          ; [] |83| 
        RPT #9 || RLAX.W r10 ; [] |83| 
        MOV.W     #0,r15                ; [] |83| 
        XOR.W     r12,r15               ; [] |83| 
        XOR.W     r13,r10               ; [] |83| 
        MOV.W     r15,180(SP)           ; [] |83| 
        MOV.W     r10,182(SP)           ; [] |83| 
	.dwpsn	file "../blake2s.c",line 84,column 9,is_stmt,isa 0
        MOVX.A    SP,r15                ; [] |84| 
        ADDX.A    #224,r15              ; [] |84| 
        MOVX.A    382(SP),r14           ; [] |84| 
        MOV.B     @r14,r14              ; [] |84| 
        RLAM.W    #2,r14                ; [] |84| 
        RLAM.A    #4,r14                ; [] |84| 
        RRAM.A    #4,r14                ; [] |84| 
        ADDA      r15,r14               ; [] |84| 
        MOV.W     292(SP),r6            ; [] 
        MOV.W     294(SP),r15           ; [] 
        ADD.W     @r14,r6               ; [] |84| 
        ADDC.W    2(r14),r15            ; [] |84| 
        ADD.W     312(SP),r6            ; [] |84| 
        ADDC.W    314(SP),r15           ; [] |84| 
        MOVA      r6,r14                ; [] |84| 
        MOVA      r15,r10               ; [] |84| 
        XOR.W     304(SP),r14           ; [] |84| 
        XOR.W     306(SP),r10           ; [] |84| 
        XOR.W     #0,r10                ; [] |84| 
        MOV.W     #0,r11                ; [] |84| 
        XOR.W     r14,r11               ; [] |84| 
        MOV.W     332(SP),r14           ; [] 
        MOV.W     338(SP),r8            ; [] 
        ADD.W     r10,r14               ; [] |84| 
        ADDC.W    r11,r8                ; [] |84| 
        MOVA      r14,r7                ; [] |84| 
        MOVA      r8,r13                ; [] |84| 
        XOR.W     292(SP),r7            ; [] |84| 
        XOR.W     294(SP),r13           ; [] |84| 
        MOVA      r7,r12                ; [] |84| 
$C$DW$23	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$23, DW_AT_low_pc(0x00)
	.dwattr $C$DW$23, DW_AT_name("__mspabi_srll_12")
	.dwattr $C$DW$23, DW_AT_TI_call

        CALLA     #__mspabi_srll_12     ; [] |84| 
                                          ; [] |84| 
        RLAM.W    #4,r7                 ; [] |84| 
        MOV.W     #0,r5                 ; [] |84| 
        XOR.W     r12,r5                ; [] |84| 
        XOR.W     r13,r7                ; [] |84| 
        MOVX.A    SP,r12                ; [] |84| 
        ADDX.A    #224,r12              ; [] |84| 
        MOVX.A    386(SP),r13           ; [] |84| 
        MOV.B     @r13,r13              ; [] |84| 
        RLAM.W    #2,r13                ; [] |84| 
        RLAM.A    #4,r13                ; [] |84| 
        RRAM.A    #4,r13                ; [] |84| 
        ADDA      r12,r13               ; [] |84| 
        MOVA      r5,r9                 ; [] |84| 
        MOVA      r7,r12                ; [] |84| 
        ADD.W     @r13,r9               ; [] |84| 
        ADDC.W    2(r13),r12            ; [] |84| 
        ADD.W     r6,r9                 ; [] |84| 
        ADDC.W    r15,r12               ; [] |84| 
        MOV.W     r9,164(SP)            ; [] |84| 
        MOV.W     r12,166(SP)           ; [] |84| 
        XOR.W     r10,r9                ; [] |84| 
        XOR.W     r11,r12               ; [] |84| 
        MOV.B     r9,r15                ; [] |84| 
        SWPB      r15                   ; [] |84| 
        SWPB      r9                    ; [] |84| 
        SWPB      r12                   ; [] |84| 
        XOR.B     r12,r9                ; [] |84| 
        XOR.W     r12,r9                ; [] |84| 
        XOR.W     #0,r9                 ; [] |84| 
        MOV.B     r12,r12               ; [] |84| 
        XOR.W     r15,r12               ; [] |84| 
        MOV.W     r9,208(SP)            ; [] |84| 
        MOV.W     r12,210(SP)           ; [] |84| 
        ADD.W     r14,r9                ; [] |84| 
        ADDC.W    r8,r12                ; [] |84| 
        MOV.W     r9,204(SP)            ; [] |84| 
        MOV.W     r12,206(SP)           ; [] |84| 
        XOR.W     r5,r9                 ; [] |84| 
        XOR.W     r7,r12                ; [] |84| 
        MOVA      r12,r13               ; [] |84| 
        MOVA      r9,r12                ; [] |84| 
$C$DW$24	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$24, DW_AT_low_pc(0x00)
	.dwattr $C$DW$24, DW_AT_name("__mspabi_srll_7")
	.dwattr $C$DW$24, DW_AT_TI_call

        CALLA     #__mspabi_srll_7      ; [] |84| 
                                          ; [] |84| 
        RPT #9 || RLAX.W r9 ; [] |84| 
        MOV.W     #0,r15                ; [] |84| 
        XOR.W     r12,r15               ; [] |84| 
        XOR.W     r13,r9                ; [] |84| 
        MOV.W     r15,184(SP)           ; [] |84| 
        MOV.W     r9,186(SP)            ; [] |84| 
	.dwpsn	file "../blake2s.c",line 85,column 9,is_stmt,isa 0
        MOVX.A    SP,r15                ; [] |85| 
        ADDX.A    #224,r15              ; [] |85| 
        MOVX.A    390(SP),r14           ; [] |85| 
        MOV.B     @r14,r13              ; [] |85| 
        RLAM.W    #2,r13                ; [] |85| 
        RLAM.A    #4,r13                ; [] |85| 
        RRAM.A    #4,r13                ; [] |85| 
        ADDA      r15,r13               ; [] |85| 
        MOV.W     300(SP),r14           ; [] 
        MOVA      r4,r15                ; [] |85| 
        ADD.W     @r13,r14              ; [] |85| 
        ADDC.W    2(r13),r15            ; [] |85| 
        ADD.W     324(SP),r14           ; [] |85| 
        ADDC.W    326(SP),r15           ; [] |85| 
        MOVA      r14,r13               ; [] |85| 
        MOVA      r15,r10               ; [] |85| 
        XOR.W     316(SP),r13           ; [] |85| 
        XOR.W     318(SP),r10           ; [] |85| 
        XOR.W     #0,r10                ; [] |85| 
        MOV.W     #0,r11                ; [] |85| 
        XOR.W     r13,r11               ; [] |85| 
        MOV.W     308(SP),r8            ; [] 
        MOV.W     310(SP),r9            ; [] 
        ADD.W     r10,r8                ; [] |85| 
        ADDC.W    r11,r9                ; [] |85| 
        MOVA      r8,r7                 ; [] |85| 
        MOVA      r9,r13                ; [] |85| 
        XOR.W     300(SP),r7            ; [] |85| 
        XOR.W     r4,r13                ; [] |85| 
        MOVA      r7,r12                ; [] |85| 
$C$DW$25	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$25, DW_AT_low_pc(0x00)
	.dwattr $C$DW$25, DW_AT_name("__mspabi_srll_12")
	.dwattr $C$DW$25, DW_AT_TI_call

        CALLA     #__mspabi_srll_12     ; [] |85| 
                                          ; [] |85| 
        RLAM.W    #4,r7                 ; [] |85| 
        MOV.W     #0,r6                 ; [] |85| 
        XOR.W     r12,r6                ; [] |85| 
        XOR.W     r13,r7                ; [] |85| 
        MOVX.A    SP,r12                ; [] |85| 
        ADDX.A    #224,r12              ; [] |85| 
        MOVX.A    394(SP),r13           ; [] |85| 
        MOV.B     @r13,r13              ; [] |85| 
        RLAM.W    #2,r13                ; [] |85| 
        RLAM.A    #4,r13                ; [] |85| 
        RRAM.A    #4,r13                ; [] |85| 
        ADDA      r12,r13               ; [] |85| 
        MOVA      r6,r4                 ; [] |85| 
        MOVA      r7,r12                ; [] |85| 
        ADD.W     @r13,r4               ; [] |85| 
        ADDC.W    2(r13),r12            ; [] |85| 
        ADD.W     r14,r4                ; [] |85| 
        ADDC.W    r15,r12               ; [] |85| 
        MOV.W     r4,168(SP)            ; [] |85| 
        MOV.W     r12,170(SP)           ; [] |85| 
        XOR.W     r10,r4                ; [] |85| 
        XOR.W     r11,r12               ; [] |85| 
        MOV.B     r4,r15                ; [] |85| 
        SWPB      r15                   ; [] |85| 
        SWPB      r4                    ; [] |85| 
        SWPB      r12                   ; [] |85| 
        XOR.B     r12,r4                ; [] |85| 
        XOR.W     r12,r4                ; [] |85| 
        XOR.W     #0,r4                 ; [] |85| 
        MOV.B     r12,r12               ; [] |85| 
        XOR.W     r15,r12               ; [] |85| 
        MOV.W     r4,212(SP)            ; [] |85| 
        MOV.W     r12,214(SP)           ; [] |85| 
        ADD.W     r8,r4                 ; [] |85| 
        ADDC.W    r9,r12                ; [] |85| 
        MOV.W     r4,192(SP)            ; [] |85| 
        MOV.W     r12,194(SP)           ; [] |85| 
        XOR.W     r6,r4                 ; [] |85| 
        XOR.W     r7,r12                ; [] |85| 
        MOVA      r12,r13               ; [] |85| 
        MOVA      r4,r12                ; [] |85| 
$C$DW$26	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$26, DW_AT_low_pc(0x00)
	.dwattr $C$DW$26, DW_AT_name("__mspabi_srll_7")
	.dwattr $C$DW$26, DW_AT_TI_call

        CALLA     #__mspabi_srll_7      ; [] |85| 
                                          ; [] |85| 
        RPT #9 || RLAX.W r4 ; [] |85| 
        MOV.W     #0,r15                ; [] |85| 
        XOR.W     r12,r15               ; [] |85| 
        XOR.W     r13,r4                ; [] |85| 
        MOV.W     r15,188(SP)           ; [] |85| 
        MOV.W     r4,190(SP)            ; [] |85| 
	.dwpsn	file "../blake2s.c",line 86,column 9,is_stmt,isa 0
        MOVX.A    SP,r14                ; [] |86| 
        ADDX.A    #224,r14              ; [] |86| 
        MOVX.A    398(SP),r15           ; [] |86| 
        MOV.B     @r15,r15              ; [] |86| 
        RLAM.W    #2,r15                ; [] |86| 
        RLAM.A    #4,r15                ; [] |86| 
        RRAM.A    #4,r15                ; [] |86| 
        ADDA      r14,r15               ; [] |86| 
        MOV.W     288(SP),r13           ; [] 
        MOV.W     290(SP),r14           ; [] 
        ADD.W     @r15,r13              ; [] |86| 
        ADDC.W    2(r15),r14            ; [] |86| 
        MOV.W     334(SP),r6            ; [] 
        ADD.W     r13,r6                ; [] |86| 
        ADDC.W    336(SP),r14           ; [] |86| 
        MOVA      r6,r15                ; [] |86| 
        MOVA      r14,r8                ; [] |86| 
        XOR.W     328(SP),r15           ; [] |86| 
        XOR.W     330(SP),r8            ; [] |86| 
        XOR.W     #0,r8                 ; [] |86| 
        MOV.W     #0,r9                 ; [] |86| 
        XOR.W     r15,r9                ; [] |86| 
        MOV.W     320(SP),r15           ; [] 
        MOV.W     322(SP),r11           ; [] 
        ADD.W     r8,r15                ; [] |86| 
        ADDC.W    r9,r11                ; [] |86| 
        MOVA      r15,r5                ; [] |86| 
        MOVA      r11,r13               ; [] |86| 
        XOR.W     288(SP),r5            ; [] |86| 
        XOR.W     290(SP),r13           ; [] |86| 
        MOVA      r5,r12                ; [] |86| 
$C$DW$27	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$27, DW_AT_low_pc(0x00)
	.dwattr $C$DW$27, DW_AT_name("__mspabi_srll_12")
	.dwattr $C$DW$27, DW_AT_TI_call

        CALLA     #__mspabi_srll_12     ; [] |86| 
                                          ; [] |86| 
        RLAM.W    #4,r5                 ; [] |86| 
        MOV.W     #0,r4                 ; [] |86| 
        XOR.W     r12,r4                ; [] |86| 
        XOR.W     r13,r5                ; [] |86| 
        MOVX.A    SP,r12                ; [] |86| 
        ADDX.A    #224,r12              ; [] |86| 
        MOVX.A    402(SP),r13           ; [] |86| 
        MOV.B     @r13,r13              ; [] |86| 
        RLAM.W    #2,r13                ; [] |86| 
        RLAM.A    #4,r13                ; [] |86| 
        RRAM.A    #4,r13                ; [] |86| 
        ADDA      r12,r13               ; [] |86| 
        MOVA      r4,r10                ; [] |86| 
        MOVA      r5,r12                ; [] |86| 
        ADD.W     @r13,r10              ; [] |86| 
        ADDC.W    2(r13),r12            ; [] |86| 
        ADD.W     r10,r6                ; [] |86| 
        ADDC.W    r12,r14               ; [] |86| 
        MOV.W     r6,172(SP)            ; [] |86| 
        MOV.W     r14,174(SP)           ; [] |86| 
        XOR.W     r8,r6                 ; [] |86| 
        XOR.W     r9,r14                ; [] |86| 
        MOV.B     r6,r13                ; [] |86| 
        SWPB      r13                   ; [] |86| 
        SWPB      r6                    ; [] |86| 
        SWPB      r14                   ; [] |86| 
        XOR.B     r14,r6                ; [] |86| 
        XOR.W     r14,r6                ; [] |86| 
        XOR.W     #0,r6                 ; [] |86| 
        MOV.B     r14,r14               ; [] |86| 
        XOR.W     r13,r14               ; [] |86| 
        MOV.W     r6,216(SP)            ; [] |86| 
        MOV.W     r14,218(SP)           ; [] |86| 
        ADD.W     r15,r6                ; [] |86| 
        ADDC.W    r11,r14               ; [] |86| 
        MOV.W     r6,196(SP)            ; [] |86| 
        MOV.W     r14,198(SP)           ; [] |86| 
        XOR.W     r4,r6                 ; [] |86| 
        XOR.W     r5,r14                ; [] |86| 
        MOVA      r6,r12                ; [] |86| 
        MOVA      r14,r13               ; [] |86| 
$C$DW$28	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$28, DW_AT_low_pc(0x00)
	.dwattr $C$DW$28, DW_AT_name("__mspabi_srll_7")
	.dwattr $C$DW$28, DW_AT_TI_call

        CALLA     #__mspabi_srll_7      ; [] |86| 
                                          ; [] |86| 
        RPT #9 || RLAX.W r6 ; [] |86| 
        MOV.W     #0,r15                ; [] |86| 
        XOR.W     r12,r15               ; [] |86| 
        XOR.W     r13,r6                ; [] |86| 
        MOV.W     r15,176(SP)           ; [] |86| 
        MOV.W     r6,178(SP)            ; [] |86| 
        MOVX.A    342(SP),r15           ; [] |86| 
	.dwpsn	file "../blake2s.c",line 78,column 17,is_stmt,isa 0
        ADDA      #16,r15               ; [] |78| 
        MOVX.A    r15,342(SP)           ; [] |78| 
        MOVX.A    346(SP),r15           ; [] |78| 
        ADDA      #16,r15               ; [] |78| 
        MOVX.A    r15,346(SP)           ; [] |78| 
        MOVX.A    350(SP),r15           ; [] |78| 
        ADDA      #16,r15               ; [] |78| 
        MOVX.A    r15,350(SP)           ; [] |78| 
        MOVX.A    354(SP),r15           ; [] |78| 
        ADDA      #16,r15               ; [] |78| 
        MOVX.A    r15,354(SP)           ; [] |78| 
        MOVX.A    358(SP),r15           ; [] |78| 
        ADDA      #16,r15               ; [] |78| 
        MOVX.A    r15,358(SP)           ; [] |78| 
        MOVX.A    362(SP),r15           ; [] |78| 
        ADDA      #16,r15               ; [] |78| 
        MOVX.A    r15,362(SP)           ; [] |78| 
        MOVX.A    366(SP),r15           ; [] |78| 
        ADDA      #16,r15               ; [] |78| 
        MOVX.A    r15,366(SP)           ; [] |78| 
        MOVX.A    370(SP),r15           ; [] |78| 
        ADDA      #16,r15               ; [] |78| 
        MOVX.A    r15,370(SP)           ; [] |78| 
        MOVX.A    374(SP),r15           ; [] |78| 
        ADDA      #16,r15               ; [] |78| 
        MOVX.A    r15,374(SP)           ; [] |78| 
        MOVX.A    378(SP),r15           ; [] |78| 
        ADDA      #16,r15               ; [] |78| 
        MOVX.A    r15,378(SP)           ; [] |78| 
        MOVX.A    382(SP),r15           ; [] |78| 
        ADDA      #16,r15               ; [] |78| 
        MOVX.A    r15,382(SP)           ; [] |78| 
        MOVX.A    386(SP),r15           ; [] |78| 
        ADDA      #16,r15               ; [] |78| 
        MOVX.A    r15,386(SP)           ; [] |78| 
        MOVX.A    390(SP),r15           ; [] |78| 
        ADDA      #16,r15               ; [] |78| 
        MOVX.A    r15,390(SP)           ; [] |78| 
        MOVX.A    394(SP),r15           ; [] |78| 
        ADDA      #16,r15               ; [] |78| 
        MOVX.A    r15,394(SP)           ; [] |78| 
        MOVX.A    398(SP),r15           ; [] |78| 
        ADDA      #16,r15               ; [] |78| 
        MOVX.A    r15,398(SP)           ; [] |78| 
        MOVX.A    402(SP),r15           ; [] |78| 
        ADDA      #16,r15               ; [] |78| 
        MOVX.A    r15,402(SP)           ; [] |78| 
        SUB.W     #1,340(SP)            ; [] |78| 
        JNE       $C$L2                 ; [] |78| 
                                          ; [] |78| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../blake2s.c",line 96,column 9,is_stmt,isa 0
        MOV.W     160(SP),r13           ; [] |96| 
        MOV.W     162(SP),r14           ; [] |96| 
        MOVX.A    406(SP),r15           ; [] |96| 
        XOR.W     @r15,r13              ; [] |96| 
        XOR.W     2(r15),r14            ; [] |96| 
        XOR.W     192(SP),r13           ; [] |96| 
        XOR.W     194(SP),r14           ; [] |96| 
        MOV.W     r13,0(r15)            ; [] |96| 
        MOV.W     r14,2(r15)            ; [] |96| 
        MOV.W     164(SP),r13           ; [] |96| 
        MOV.W     166(SP),r14           ; [] |96| 
        XOR.W     4(r15),r13            ; [] |96| 
        XOR.W     6(r15),r14            ; [] |96| 
        XOR.W     196(SP),r13           ; [] |96| 
        XOR.W     198(SP),r14           ; [] |96| 
        MOV.W     r13,4(r15)            ; [] |96| 
        MOV.W     r14,6(r15)            ; [] |96| 
        MOV.W     168(SP),r13           ; [] |96| 
        MOV.W     170(SP),r14           ; [] |96| 
        XOR.W     8(r15),r13            ; [] |96| 
        XOR.W     10(r15),r14           ; [] |96| 
        XOR.W     200(SP),r13           ; [] |96| 
        XOR.W     202(SP),r14           ; [] |96| 
        MOV.W     r13,8(r15)            ; [] |96| 
        MOV.W     r14,10(r15)           ; [] |96| 
        MOV.W     172(SP),r13           ; [] |96| 
        MOV.W     174(SP),r14           ; [] |96| 
        XOR.W     12(r15),r13           ; [] |96| 
        XOR.W     14(r15),r14           ; [] |96| 
        XOR.W     204(SP),r13           ; [] |96| 
        XOR.W     206(SP),r14           ; [] |96| 
        MOV.W     r13,12(r15)           ; [] |96| 
        MOV.W     r14,14(r15)           ; [] |96| 
        MOV.W     176(SP),r13           ; [] |96| 
        MOV.W     178(SP),r14           ; [] |96| 
        XOR.W     16(r15),r13           ; [] |96| 
        XOR.W     18(r15),r14           ; [] |96| 
        XOR.W     208(SP),r13           ; [] |96| 
        XOR.W     210(SP),r14           ; [] |96| 
        MOV.W     r13,16(r15)           ; [] |96| 
        MOV.W     r14,18(r15)           ; [] |96| 
        MOV.W     180(SP),r13           ; [] |96| 
        MOV.W     182(SP),r14           ; [] |96| 
        XOR.W     20(r15),r13           ; [] |96| 
        XOR.W     22(r15),r14           ; [] |96| 
        XOR.W     212(SP),r13           ; [] |96| 
        XOR.W     214(SP),r14           ; [] |96| 
        MOV.W     r13,20(r15)           ; [] |96| 
        MOV.W     r14,22(r15)           ; [] |96| 
        MOV.W     184(SP),r13           ; [] |96| 
        MOV.W     186(SP),r14           ; [] |96| 
        XOR.W     24(r15),r13           ; [] |96| 
        XOR.W     26(r15),r14           ; [] |96| 
        XOR.W     216(SP),r13           ; [] |96| 
        XOR.W     218(SP),r14           ; [] |96| 
        MOV.W     r13,24(r15)           ; [] |96| 
        MOV.W     r14,26(r15)           ; [] |96| 
        MOV.W     188(SP),r13           ; [] |96| 
        MOV.W     190(SP),r14           ; [] |96| 
        XOR.W     28(r15),r13           ; [] |96| 
        XOR.W     30(r15),r14           ; [] |96| 
        XOR.W     220(SP),r13           ; [] |96| 
        XOR.W     222(SP),r14           ; [] |96| 
        MOV.W     r13,28(r15)           ; [] |96| 
        MOV.W     r14,30(r15)           ; [] |96| 
        ADDA      #410,SP               ; [] 
	.dwcfi	cfa_offset, 32
        POPM.A    #7,r10                ; [] 
	.dwcfi	restore_reg, 4
	.dwcfi	restore_reg, 5
	.dwcfi	restore_reg, 6
	.dwcfi	restore_reg, 7
	.dwcfi	restore_reg, 8
	.dwcfi	restore_reg, 9
	.dwcfi	restore_reg, 10
	.dwcfi	cfa_offset, 4
$C$DW$29	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$29, DW_AT_low_pc(0x00)
	.dwattr $C$DW$29, DW_AT_TI_return

        RETA      ; [] 
        ; [] 
	.dwattr $C$DW$3, DW_AT_TI_end_file("../blake2s.c")
	.dwattr $C$DW$3, DW_AT_TI_end_line(0x61)
	.dwattr $C$DW$3, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$3

	.sect	".text:blake2s_update"
	.clink
	.global	blake2s_update

$C$DW$30	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$30, DW_AT_name("blake2s_update")
	.dwattr $C$DW$30, DW_AT_low_pc(blake2s_update)
	.dwattr $C$DW$30, DW_AT_high_pc(0x00)
	.dwattr $C$DW$30, DW_AT_TI_symbol_name("blake2s_update")
	.dwattr $C$DW$30, DW_AT_external
	.dwattr $C$DW$30, DW_AT_TI_begin_file("../blake2s.c")
	.dwattr $C$DW$30, DW_AT_TI_begin_line(0x84)
	.dwattr $C$DW$30, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$30, DW_AT_decl_file("../blake2s.c")
	.dwattr $C$DW$30, DW_AT_decl_line(0x84)
	.dwattr $C$DW$30, DW_AT_decl_column(0x06)
	.dwattr $C$DW$30, DW_AT_TI_max_frame_size(0x10)
	.dwpsn	file "../blake2s.c",line 134,column 1,is_stmt,address blake2s_update,isa 0

	.dwfde $C$DW$CIE, blake2s_update
$C$DW$31	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$31, DW_AT_name("ctx")
	.dwattr $C$DW$31, DW_AT_TI_symbol_name("ctx")
	.dwattr $C$DW$31, DW_AT_type(*$C$DW$T$29)
	.dwattr $C$DW$31, DW_AT_location[DW_OP_reg12]

$C$DW$32	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$32, DW_AT_name("in")
	.dwattr $C$DW$32, DW_AT_TI_symbol_name("in")
	.dwattr $C$DW$32, DW_AT_type(*$C$DW$T$35)
	.dwattr $C$DW$32, DW_AT_location[DW_OP_reg13]

$C$DW$33	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$33, DW_AT_name("inlen")
	.dwattr $C$DW$33, DW_AT_TI_symbol_name("inlen")
	.dwattr $C$DW$33, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$33, DW_AT_location[DW_OP_reg14]


;*****************************************************************************
;* FUNCTION NAME: blake2s_update                                             *
;*                                                                           *
;*   Regs Modified     : SP,SR,r8,r9,r10,r11,r12,r13,r14,r15                 *
;*   Regs Used         : SP,SR,r8,r9,r10,r11,r12,r13,r14,r15                 *
;*   Local Frame Size  : 0 Args + 0 Auto + 12 Save = 12 byte                 *
;*****************************************************************************
blake2s_update:
;* --------------------------------------------------------------------------*
;* r15   assigned to $O$U8
;* r8    assigned to $O$U24
;* r9    assigned to $O$L1
;* r10   assigned to ctx
$C$DW$34	.dwtag  DW_TAG_variable
	.dwattr $C$DW$34, DW_AT_name("ctx")
	.dwattr $C$DW$34, DW_AT_TI_symbol_name("ctx")
	.dwattr $C$DW$34, DW_AT_type(*$C$DW$T$30)
	.dwattr $C$DW$34, DW_AT_location[DW_OP_reg10]

;* r13   assigned to in
$C$DW$35	.dwtag  DW_TAG_variable
	.dwattr $C$DW$35, DW_AT_name("in")
	.dwattr $C$DW$35, DW_AT_TI_symbol_name("in")
	.dwattr $C$DW$35, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$35, DW_AT_location[DW_OP_reg13]

;* r14   assigned to inlen
$C$DW$36	.dwtag  DW_TAG_variable
	.dwattr $C$DW$36, DW_AT_name("inlen")
	.dwattr $C$DW$36, DW_AT_TI_symbol_name("inlen")
	.dwattr $C$DW$36, DW_AT_type(*$C$DW$T$67)
	.dwattr $C$DW$36, DW_AT_location[DW_OP_reg14]

	.dwcfi	cfa_offset, 4
	.dwcfi	save_reg_to_mem, 16, -4
        PUSHM.A   #3,r10                ; [] 
	.dwcfi	save_reg_to_mem, 10, -8
	.dwcfi	save_reg_to_mem, 9, -12
	.dwcfi	save_reg_to_mem, 8, -16
	.dwcfi	cfa_offset, 16
        MOVA      r12,r10               ; [] |134| 
	.dwpsn	file "../blake2s.c",line 137,column 17,is_stmt,isa 0
        TST.W     r14                   ; [] |137| 
        JEQ       $C$L6                 ; [] |137| 
                                          ; [] |137| 
;* --------------------------------------------------------------------------*
        MOVA      r13,r8                ; [] 
	.dwpsn	file "../blake2s.c",line 138,column 9,is_stmt,isa 0
        MOVA      r14,r9                ; [] |138| 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP $C$L3
;*
;*   Loop source line                : 137
;*   Loop closing brace source line  : 146
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 65535
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
$C$L3:    
        MOV.W     104(r10),r15          ; [] |138| 
        CMP.W     #64,r15               ; [] |138| 
        JNE       $C$L5                 ; [] |138| 
                                          ; [] |138| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../blake2s.c",line 139,column 13,is_stmt,isa 0
        ADD.W     r15,96(r10)           ; [] |139| 
        ADDC.W    #0,98(r10)            ; [] |139| 
	.dwpsn	file "../blake2s.c",line 140,column 13,is_stmt,isa 0
        JNE       $C$L4                 ; [] |140| 
                                          ; [] |140| 
;* --------------------------------------------------------------------------*
        CMP.W     104(r10),96(r10)      ; [] |140| 
        JHS       $C$L4                 ; [] |140| 
                                          ; [] |140| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../blake2s.c",line 141,column 17,is_stmt,isa 0
        ADD.W     #1,100(r10)           ; [] |141| 
        ADDC.W    #0,102(r10)           ; [] |141| 
;* --------------------------------------------------------------------------*
$C$L4:    
	.dwpsn	file "../blake2s.c",line 142,column 13,is_stmt,isa 0
        MOVA      r10,r12               ; [] |142| 
        MOV.W     #0,r13                ; [] |142| 
$C$DW$37	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$37, DW_AT_low_pc(0x00)
	.dwattr $C$DW$37, DW_AT_name("blake2s_compress")
	.dwattr $C$DW$37, DW_AT_TI_call

        CALLA     #blake2s_compress     ; [] |142| 
                                          ; [] |142| 
	.dwpsn	file "../blake2s.c",line 143,column 13,is_stmt,isa 0
        MOV.W     #0,104(r10)           ; [] |143| 
        MOV.W     #0,r15                ; [] 
;* --------------------------------------------------------------------------*
$C$L5:    
	.dwpsn	file "../blake2s.c",line 145,column 9,is_stmt,isa 0
        ADD.W     #1,104(r10)           ; [] |145| 
        RLAM.A    #4,r15                ; [] |145| 
        RRAM.A    #4,r15                ; [] |145| 
        ADDA      r10,r15               ; [] |145| 
        MOV.B     @r8+,0(r15)           ; [] |145| 
	.dwpsn	file "../blake2s.c",line 137,column 17,is_stmt,isa 0
        SUB.W     #1,r9                 ; [] |137| 
        JNE       $C$L3                 ; [] |137| 
                                          ; [] |137| 
;* --------------------------------------------------------------------------*
$C$L6:    
        POPM.A    #3,r10                ; [] 
	.dwcfi	restore_reg, 8
	.dwcfi	restore_reg, 9
	.dwcfi	restore_reg, 10
	.dwcfi	cfa_offset, 4
$C$DW$38	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$38, DW_AT_low_pc(0x00)
	.dwattr $C$DW$38, DW_AT_TI_return

        RETA      ; [] 
        ; [] 
	.dwattr $C$DW$30, DW_AT_TI_end_file("../blake2s.c")
	.dwattr $C$DW$30, DW_AT_TI_end_line(0x93)
	.dwattr $C$DW$30, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$30

	.sect	".text:blake2s_init"
	.clink
	.global	blake2s_init

$C$DW$39	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$39, DW_AT_name("blake2s_init")
	.dwattr $C$DW$39, DW_AT_low_pc(blake2s_init)
	.dwattr $C$DW$39, DW_AT_high_pc(0x00)
	.dwattr $C$DW$39, DW_AT_TI_symbol_name("blake2s_init")
	.dwattr $C$DW$39, DW_AT_external
	.dwattr $C$DW$39, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$39, DW_AT_TI_begin_file("../blake2s.c")
	.dwattr $C$DW$39, DW_AT_TI_begin_line(0x67)
	.dwattr $C$DW$39, DW_AT_TI_begin_column(0x05)
	.dwattr $C$DW$39, DW_AT_decl_file("../blake2s.c")
	.dwattr $C$DW$39, DW_AT_decl_line(0x67)
	.dwattr $C$DW$39, DW_AT_decl_column(0x05)
	.dwattr $C$DW$39, DW_AT_TI_max_frame_size(0x10)
	.dwpsn	file "../blake2s.c",line 105,column 1,is_stmt,address blake2s_init,isa 0

	.dwfde $C$DW$CIE, blake2s_init
$C$DW$40	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$40, DW_AT_name("ctx")
	.dwattr $C$DW$40, DW_AT_TI_symbol_name("ctx")
	.dwattr $C$DW$40, DW_AT_type(*$C$DW$T$29)
	.dwattr $C$DW$40, DW_AT_location[DW_OP_reg12]

$C$DW$41	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$41, DW_AT_name("outlen")
	.dwattr $C$DW$41, DW_AT_TI_symbol_name("outlen")
	.dwattr $C$DW$41, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$41, DW_AT_location[DW_OP_reg13]

$C$DW$42	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$42, DW_AT_name("key")
	.dwattr $C$DW$42, DW_AT_TI_symbol_name("key")
	.dwattr $C$DW$42, DW_AT_type(*$C$DW$T$35)
	.dwattr $C$DW$42, DW_AT_location[DW_OP_reg14]

$C$DW$43	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$43, DW_AT_name("keylen")
	.dwattr $C$DW$43, DW_AT_TI_symbol_name("keylen")
	.dwattr $C$DW$43, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$43, DW_AT_location[DW_OP_reg15]


;*****************************************************************************
;* FUNCTION NAME: blake2s_init                                               *
;*                                                                           *
;*   Regs Modified     : SP,SR,r8,r9,r10,r11,r12,r13,r14,r15                 *
;*   Regs Used         : SP,SR,r8,r9,r10,r11,r12,r13,r14,r15                 *
;*   Local Frame Size  : 0 Args + 0 Auto + 12 Save = 12 byte                 *
;*****************************************************************************
blake2s_init:
;* --------------------------------------------------------------------------*
;* r8    assigned to $O$C1
;* r8    assigned to $O$C2
;* r12   assigned to $O$U85
;* r13   assigned to $O$U88
;* r11   assigned to $O$d2
;* r9    assigned to ctx
$C$DW$44	.dwtag  DW_TAG_variable
	.dwattr $C$DW$44, DW_AT_name("ctx")
	.dwattr $C$DW$44, DW_AT_TI_symbol_name("ctx")
	.dwattr $C$DW$44, DW_AT_type(*$C$DW$T$30)
	.dwattr $C$DW$44, DW_AT_location[DW_OP_reg9]

;* r13   assigned to outlen
$C$DW$45	.dwtag  DW_TAG_variable
	.dwattr $C$DW$45, DW_AT_name("outlen")
	.dwattr $C$DW$45, DW_AT_TI_symbol_name("outlen")
	.dwattr $C$DW$45, DW_AT_type(*$C$DW$T$67)
	.dwattr $C$DW$45, DW_AT_location[DW_OP_reg13]

;* r14   assigned to key
$C$DW$46	.dwtag  DW_TAG_variable
	.dwattr $C$DW$46, DW_AT_name("key")
	.dwattr $C$DW$46, DW_AT_TI_symbol_name("key")
	.dwattr $C$DW$46, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$46, DW_AT_location[DW_OP_reg14]

;* r15   assigned to keylen
$C$DW$47	.dwtag  DW_TAG_variable
	.dwattr $C$DW$47, DW_AT_name("keylen")
	.dwattr $C$DW$47, DW_AT_TI_symbol_name("keylen")
	.dwattr $C$DW$47, DW_AT_type(*$C$DW$T$67)
	.dwattr $C$DW$47, DW_AT_location[DW_OP_reg15]

;* r10   assigned to i
$C$DW$48	.dwtag  DW_TAG_variable
	.dwattr $C$DW$48, DW_AT_name("i")
	.dwattr $C$DW$48, DW_AT_TI_symbol_name("i")
	.dwattr $C$DW$48, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$48, DW_AT_location[DW_OP_reg10]

	.dwcfi	cfa_offset, 4
	.dwcfi	save_reg_to_mem, 16, -4
        PUSHM.A   #3,r10                ; [] 
	.dwcfi	save_reg_to_mem, 10, -8
	.dwcfi	save_reg_to_mem, 9, -12
	.dwcfi	save_reg_to_mem, 8, -16
	.dwcfi	cfa_offset, 16
        MOVA      r12,r9                ; [] |105| 
	.dwpsn	file "../blake2s.c",line 108,column 5,is_stmt,isa 0
        MOVA      r13,r12               ; [] |108| 
        SUB.W     #1,r12                ; [] |108| 
        CMP.W     #32,r12               ; [] |108| 
        JHS       $C$L7                 ; [] |108| 
                                          ; [] |108| 
;* --------------------------------------------------------------------------*
        CMP.W     #33,r15               ; [] |108| 
        JLO       $C$L8                 ; [] |108| 
                                          ; [] |108| 
;* --------------------------------------------------------------------------*
$C$L7:    
	.dwpsn	file "../blake2s.c",line 109,column 9,is_stmt,isa 0
        MOV.W     #-1,r12               ; [] |109| 
        JMP       $C$L13                ; [] |109| 
                                          ; [] |109| 
;* --------------------------------------------------------------------------*
$C$L8:    
	.dwpsn	file "../blake2s.c",line 112,column 9,is_stmt,isa 0
        MOVX.W    &blake2s_iv+0,64(r9)  ; [] |112| 
        MOVX.W    &blake2s_iv+2,66(r9)  ; [] |112| 
        MOVX.W    &blake2s_iv+4,68(r9)  ; [] |112| 
        MOVX.W    &blake2s_iv+6,70(r9)  ; [] |112| 
        MOVX.W    &blake2s_iv+8,72(r9)  ; [] |112| 
        MOVX.W    &blake2s_iv+10,74(r9) ; [] |112| 
        MOVX.W    &blake2s_iv+12,76(r9) ; [] |112| 
        MOVX.W    &blake2s_iv+14,78(r9) ; [] |112| 
        MOVX.W    &blake2s_iv+16,80(r9) ; [] |112| 
        MOVX.W    &blake2s_iv+18,82(r9) ; [] |112| 
        MOVX.W    &blake2s_iv+20,84(r9) ; [] |112| 
        MOVX.W    &blake2s_iv+22,86(r9) ; [] |112| 
        MOVX.W    &blake2s_iv+24,88(r9) ; [] |112| 
        MOVX.W    &blake2s_iv+26,90(r9) ; [] |112| 
        MOVX.W    &blake2s_iv+28,92(r9) ; [] |112| 
        MOVX.W    &blake2s_iv+30,94(r9) ; [] |112| 
	.dwpsn	file "../blake2s.c",line 113,column 5,is_stmt,isa 0
        MOV.W     #0,r12                ; [] |113| 
        MOV.W     #257,r10              ; [] |113| 
        MOV.B     r15,r11               ; [] |113| 
        SWPB      r11                   ; [] |113| 
        OR.W      r11,r12               ; [] |113| 
        XOR.W     64(r9),r12            ; [] |113| 
        XOR.W     66(r9),r10            ; [] |113| 
        XOR.W     r13,r12               ; [] |113| 
        MOV.W     r12,64(r9)            ; [] |113| 
        MOV.W     r10,66(r9)            ; [] |113| 
	.dwpsn	file "../blake2s.c",line 115,column 5,is_stmt,isa 0
        MOVX.A    #0,96(r9)             ; [] |115| 
	.dwpsn	file "../blake2s.c",line 116,column 5,is_stmt,isa 0
        MOVX.A    #0,100(r9)            ; [] |116| 
	.dwpsn	file "../blake2s.c",line 117,column 5,is_stmt,isa 0
        MOV.W     #0,104(r9)            ; [] |117| 
	.dwpsn	file "../blake2s.c",line 118,column 5,is_stmt,isa 0
        MOV.W     r13,106(r9)           ; [] |118| 
	.dwpsn	file "../blake2s.c",line 120,column 10,is_stmt,isa 0
        MOVA      r15,r10               ; [] |120| 
	.dwpsn	file "../blake2s.c",line 120,column 22,is_stmt,isa 0
        MOV.W     #64,r8                ; [] |120| 
        SUB.W     r10,r8                ; [] |120| 
        MOVA      r8,r11                ; [] |120| 
        RRUM.W    #1,r11                ; [] |120| 
        BIC.W     #1,r8                 ; [] |120| 
        TST.W     r8                    ; [] |120| 
        JEQ       $C$L10                ; [] |120| 
                                          ; [] |120| 
;* --------------------------------------------------------------------------*
        MOVA      r10,r12               ; [] 
        RLAM.A    #4,r12                ; [] 
        RRAM.A    #4,r12                ; [] 
        ADDA      r9,r12                ; [] 
        MOVA      r10,r13               ; [] 
        ADD.W     #1,r13                ; [] 
        RLAM.A    #4,r13                ; [] 
        RRAM.A    #4,r13                ; [] 
        ADDA      r9,r13                ; [] 
	.dwpsn	file "../blake2s.c",line 120,column 30,is_stmt,isa 0
        ADD.W     r8,r10                ; [] |120| 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP $C$L9
;*
;*   Loop source line                : 120
;*   Loop closing brace source line  : 121
;*   Loop Unroll Multiple            : 2x
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 32
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
$C$L9:    
	.dwpsn	file "../blake2s.c",line 121,column 9,is_stmt,isa 0
        MOV.B     #0,0(r12)             ; [] |121| 
        MOV.B     #0,0(r13)             ; [] |121| 
	.dwpsn	file "../blake2s.c",line 120,column 30,is_stmt,isa 0
        ADDA      #2,r12                ; [] |120| 
        ADDA      #2,r13                ; [] |120| 
	.dwpsn	file "../blake2s.c",line 120,column 22,is_stmt,isa 0
        SUB.W     #1,r11                ; [] |120| 
        JNE       $C$L9                 ; [] |120| 
                                          ; [] |120| 
;* --------------------------------------------------------------------------*
$C$L10:    
        BIT.W     #1,r15                ; [] 
        JEQ       $C$L11                ; [] 
                                          ; [] 
;* --------------------------------------------------------------------------*
; Peeled loop iterations for unrolled loop:
	.dwpsn	file "../blake2s.c",line 121,column 9,is_stmt,isa 0
        RLAM.A    #4,r10                ; [] |121| 
        RRAM.A    #4,r10                ; [] |121| 
        ADDA      r9,r10                ; [] |121| 
        MOV.B     #0,0(r10)             ; [] |121| 
;* --------------------------------------------------------------------------*
$C$L11:    
	.dwpsn	file "../blake2s.c",line 122,column 5,is_stmt,isa 0
        TST.W     r15                   ; [] |122| 
        JEQ       $C$L12                ; [] |122| 
                                          ; [] |122| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../blake2s.c",line 123,column 9,is_stmt,isa 0
        MOVA      r9,r12                ; [] |123| 
        MOVA      r14,r13               ; [] |123| 
        MOVA      r15,r14               ; [] |123| 
$C$DW$49	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$49, DW_AT_low_pc(0x00)
	.dwattr $C$DW$49, DW_AT_name("blake2s_update")
	.dwattr $C$DW$49, DW_AT_TI_call

        CALLA     #blake2s_update       ; [] |123| 
                                          ; [] |123| 
	.dwpsn	file "../blake2s.c",line 124,column 9,is_stmt,isa 0
        MOV.W     #64,104(r9)           ; [] |124| 
;* --------------------------------------------------------------------------*
$C$L12:    
	.dwpsn	file "../blake2s.c",line 127,column 5,is_stmt,isa 0
        MOV.W     #0,r12                ; [] |127| 
;* --------------------------------------------------------------------------*
$C$L13:    
        POPM.A    #3,r10                ; [] 
	.dwcfi	restore_reg, 8
	.dwcfi	restore_reg, 9
	.dwcfi	restore_reg, 10
	.dwcfi	cfa_offset, 4
$C$DW$50	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$50, DW_AT_low_pc(0x00)
	.dwattr $C$DW$50, DW_AT_TI_return

        RETA      ; [] 
        ; [] 
	.dwattr $C$DW$39, DW_AT_TI_end_file("../blake2s.c")
	.dwattr $C$DW$39, DW_AT_TI_end_line(0x80)
	.dwattr $C$DW$39, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$39

	.sect	".text:blake2s_final"
	.clink
	.global	blake2s_final

$C$DW$51	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$51, DW_AT_name("blake2s_final")
	.dwattr $C$DW$51, DW_AT_low_pc(blake2s_final)
	.dwattr $C$DW$51, DW_AT_high_pc(0x00)
	.dwattr $C$DW$51, DW_AT_TI_symbol_name("blake2s_final")
	.dwattr $C$DW$51, DW_AT_external
	.dwattr $C$DW$51, DW_AT_TI_begin_file("../blake2s.c")
	.dwattr $C$DW$51, DW_AT_TI_begin_line(0x98)
	.dwattr $C$DW$51, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$51, DW_AT_decl_file("../blake2s.c")
	.dwattr $C$DW$51, DW_AT_decl_line(0x98)
	.dwattr $C$DW$51, DW_AT_decl_column(0x06)
	.dwattr $C$DW$51, DW_AT_TI_max_frame_size(0x10)
	.dwpsn	file "../blake2s.c",line 153,column 1,is_stmt,address blake2s_final,isa 0

	.dwfde $C$DW$CIE, blake2s_final
$C$DW$52	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$52, DW_AT_name("ctx")
	.dwattr $C$DW$52, DW_AT_TI_symbol_name("ctx")
	.dwattr $C$DW$52, DW_AT_type(*$C$DW$T$29)
	.dwattr $C$DW$52, DW_AT_location[DW_OP_reg12]

$C$DW$53	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$53, DW_AT_name("out")
	.dwattr $C$DW$53, DW_AT_TI_symbol_name("out")
	.dwattr $C$DW$53, DW_AT_type(*$C$DW$T$3)
	.dwattr $C$DW$53, DW_AT_location[DW_OP_reg13]


;*****************************************************************************
;* FUNCTION NAME: blake2s_final                                              *
;*                                                                           *
;*   Regs Modified     : SP,SR,r8,r9,r10,r11,r12,r13,r14,r15                 *
;*   Regs Used         : SP,SR,r8,r9,r10,r11,r12,r13,r14,r15                 *
;*   Local Frame Size  : 0 Args + 0 Auto + 12 Save = 12 byte                 *
;*****************************************************************************
blake2s_final:
;* --------------------------------------------------------------------------*
;* r15   assigned to $O$U3
;* r8    assigned to $O$U34
;* r10   assigned to $O$U38
;* r9    assigned to ctx
$C$DW$54	.dwtag  DW_TAG_variable
	.dwattr $C$DW$54, DW_AT_name("ctx")
	.dwattr $C$DW$54, DW_AT_TI_symbol_name("ctx")
	.dwattr $C$DW$54, DW_AT_type(*$C$DW$T$30)
	.dwattr $C$DW$54, DW_AT_location[DW_OP_reg9]

;* r10   assigned to out
$C$DW$55	.dwtag  DW_TAG_variable
	.dwattr $C$DW$55, DW_AT_name("out")
	.dwattr $C$DW$55, DW_AT_TI_symbol_name("out")
	.dwattr $C$DW$55, DW_AT_type(*$C$DW$T$31)
	.dwattr $C$DW$55, DW_AT_location[DW_OP_reg10]

;* r11   assigned to i
$C$DW$56	.dwtag  DW_TAG_variable
	.dwattr $C$DW$56, DW_AT_name("i")
	.dwattr $C$DW$56, DW_AT_TI_symbol_name("i")
	.dwattr $C$DW$56, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$56, DW_AT_location[DW_OP_reg11]

	.dwcfi	cfa_offset, 4
	.dwcfi	save_reg_to_mem, 16, -4
        PUSHM.A   #3,r10                ; [] 
	.dwcfi	save_reg_to_mem, 10, -8
	.dwcfi	save_reg_to_mem, 9, -12
	.dwcfi	save_reg_to_mem, 8, -16
	.dwcfi	cfa_offset, 16
        MOVA      r13,r10               ; [] |153| 
        MOVA      r12,r9                ; [] |153| 
	.dwpsn	file "../blake2s.c",line 156,column 5,is_stmt,isa 0
        ADD.W     104(r9),96(r9)        ; [] |156| 
        ADDC.W    #0,98(r9)             ; [] |156| 
	.dwpsn	file "../blake2s.c",line 157,column 5,is_stmt,isa 0
        MOV.W     104(r9),r15           ; [] |157| 
        JNE       $C$L14                ; [] |157| 
                                          ; [] |157| 
;* --------------------------------------------------------------------------*
        CMP.W     r15,96(r9)            ; [] |157| 
        JHS       $C$L14                ; [] |157| 
                                          ; [] |157| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../blake2s.c",line 158,column 9,is_stmt,isa 0
        ADD.W     #1,100(r9)            ; [] |158| 
        ADDC.W    #0,102(r9)            ; [] |158| 
        MOV.W     104(r9),r15           ; [] 
;* --------------------------------------------------------------------------*
$C$L14:    
	.dwpsn	file "../blake2s.c",line 160,column 12,is_stmt,isa 0
        CMP.W     #64,r15               ; [] |160| 
        JHS       $C$L16                ; [] |160| 
                                          ; [] |160| 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP $C$L15
;*
;*   Loop source line                : 160
;*   Loop closing brace source line  : 161
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
$C$L15:    
	.dwpsn	file "../blake2s.c",line 161,column 9,is_stmt,isa 0
        ADD.W     #1,104(r9)            ; [] |161| 
        RLAM.A    #4,r15                ; [] |161| 
        RRAM.A    #4,r15                ; [] |161| 
        ADDA      r9,r15                ; [] |161| 
        MOV.B     #0,0(r15)             ; [] |161| 
	.dwpsn	file "../blake2s.c",line 160,column 12,is_stmt,isa 0
        MOV.W     104(r9),r15           ; [] |160| 
        CMP.W     #64,r15               ; [] |160| 
        JLO       $C$L15                ; [] |160| 
                                          ; [] |160| 
;* --------------------------------------------------------------------------*
$C$L16:    
	.dwpsn	file "../blake2s.c",line 162,column 5,is_stmt,isa 0
        MOV.W     #1,r13                ; [] |162| 
$C$DW$57	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$57, DW_AT_low_pc(0x00)
	.dwattr $C$DW$57, DW_AT_name("blake2s_compress")
	.dwattr $C$DW$57, DW_AT_TI_call

        CALLA     #blake2s_compress     ; [] |162| 
                                          ; [] |162| 
	.dwpsn	file "../blake2s.c",line 165,column 17,is_stmt,isa 0
        TST.W     106(r9)               ; [] |165| 
        JEQ       $C$L18                ; [] |165| 
                                          ; [] |165| 
;* --------------------------------------------------------------------------*
        MOV.W     #0,r8                 ; [] 
	.dwpsn	file "../blake2s.c",line 165,column 10,is_stmt,isa 0
        MOV.W     #0,r11                ; [] |165| 
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP $C$L17
;*
;*   Loop source line                : 165
;*   Loop closing brace source line  : 168
;*   Loop Unroll Multiple            : 4x
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
$C$L17:    
	.dwpsn	file "../blake2s.c",line 166,column 9,is_stmt,isa 0
        MOVA      r11,r15               ; [] |166| 
        RRUM.W    #2,r15                ; [] |166| 
        ADD.W     #16,r15               ; [] |166| 
        RLAM.W    #2,r15                ; [] |166| 
        RLAM.A    #4,r15                ; [] |166| 
        RRAM.A    #4,r15                ; [] |166| 
        ADDA      r9,r15                ; [] |166| 
        MOV.W     @r15,r12              ; [] |166| 
        MOV.W     2(r15),r13            ; [] |166| 
        MOV.W     #24,r14               ; [] |166| 
        AND.W     r8,r14                ; [] |166| 
$C$DW$58	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$58, DW_AT_low_pc(0x00)
	.dwattr $C$DW$58, DW_AT_name("__mspabi_srll")
	.dwattr $C$DW$58, DW_AT_TI_call

        CALLA     #__mspabi_srll        ; [] |166| 
                                          ; [] |166| 
        MOV.B     r12,0(r10)            ; [] |166| 
	.dwpsn	file "../blake2s.c",line 165,column 17,is_stmt,isa 0
        ADD.W     #1,r11                ; [] |165| 
        CMP.W     106(r9),r11           ; [] |165| 
        JHS       $C$L18                ; [] |165| 
                                          ; [] |165| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../blake2s.c",line 166,column 9,is_stmt,isa 0
        MOVA      r11,r15               ; [] |166| 
        RRUM.W    #2,r15                ; [] |166| 
        ADD.W     #16,r15               ; [] |166| 
        RLAM.W    #2,r15                ; [] |166| 
        RLAM.A    #4,r15                ; [] |166| 
        RRAM.A    #4,r15                ; [] |166| 
        ADDA      r9,r15                ; [] |166| 
        MOV.W     @r15,r12              ; [] |166| 
        MOV.W     2(r15),r13            ; [] |166| 
        ADD.W     #8,r8                 ; [] |166| 
        MOV.W     #24,r14               ; [] |166| 
        AND.W     r8,r14                ; [] |166| 
$C$DW$59	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$59, DW_AT_low_pc(0x00)
	.dwattr $C$DW$59, DW_AT_name("__mspabi_srll")
	.dwattr $C$DW$59, DW_AT_TI_call

        CALLA     #__mspabi_srll        ; [] |166| 
                                          ; [] |166| 
        ADDA      #1,r10                ; [] |166| 
        MOV.B     r12,0(r10)            ; [] |166| 
	.dwpsn	file "../blake2s.c",line 165,column 17,is_stmt,isa 0
        ADD.W     #1,r11                ; [] |165| 
        CMP.W     106(r9),r11           ; [] |165| 
        JHS       $C$L18                ; [] |165| 
                                          ; [] |165| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../blake2s.c",line 166,column 9,is_stmt,isa 0
        MOVA      r11,r15               ; [] |166| 
        RRUM.W    #2,r15                ; [] |166| 
        ADD.W     #16,r15               ; [] |166| 
        RLAM.W    #2,r15                ; [] |166| 
        RLAM.A    #4,r15                ; [] |166| 
        RRAM.A    #4,r15                ; [] |166| 
        ADDA      r9,r15                ; [] |166| 
        MOV.W     @r15,r12              ; [] |166| 
        MOV.W     2(r15),r13            ; [] |166| 
        ADD.W     #8,r8                 ; [] |166| 
        MOV.W     #24,r14               ; [] |166| 
        AND.W     r8,r14                ; [] |166| 
$C$DW$60	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$60, DW_AT_low_pc(0x00)
	.dwattr $C$DW$60, DW_AT_name("__mspabi_srll")
	.dwattr $C$DW$60, DW_AT_TI_call

        CALLA     #__mspabi_srll        ; [] |166| 
                                          ; [] |166| 
        ADDA      #1,r10                ; [] |166| 
        MOV.B     r12,0(r10)            ; [] |166| 
	.dwpsn	file "../blake2s.c",line 165,column 17,is_stmt,isa 0
        ADD.W     #1,r11                ; [] |165| 
        CMP.W     106(r9),r11           ; [] |165| 
        JHS       $C$L18                ; [] |165| 
                                          ; [] |165| 
;* --------------------------------------------------------------------------*
        ADDA      #1,r10                ; [] 
	.dwpsn	file "../blake2s.c",line 166,column 9,is_stmt,isa 0
        MOVA      r11,r15               ; [] |166| 
        RRUM.W    #2,r15                ; [] |166| 
        ADD.W     #16,r15               ; [] |166| 
        RLAM.W    #2,r15                ; [] |166| 
        RLAM.A    #4,r15                ; [] |166| 
        RRAM.A    #4,r15                ; [] |166| 
        ADDA      r9,r15                ; [] |166| 
        MOV.W     @r15,r12              ; [] |166| 
        MOV.W     2(r15),r13            ; [] |166| 
        ADD.W     #8,r8                 ; [] |166| 
        MOV.W     #24,r14               ; [] |166| 
        AND.W     r8,r14                ; [] |166| 
$C$DW$61	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$61, DW_AT_low_pc(0x00)
	.dwattr $C$DW$61, DW_AT_name("__mspabi_srll")
	.dwattr $C$DW$61, DW_AT_TI_call

        CALLA     #__mspabi_srll        ; [] |166| 
                                          ; [] |166| 
        ADDA      #1,r10                ; [] |166| 
        MOV.B     r12,-1(r10)           ; [] |166| 
	.dwpsn	file "../blake2s.c",line 165,column 17,is_stmt,isa 0
        ADD.W     #8,r8                 ; [] |165| 
        ADD.W     #1,r11                ; [] |165| 
        CMP.W     106(r9),r11           ; [] |165| 
        JLO       $C$L17                ; [] |165| 
                                          ; [] |165| 
;* --------------------------------------------------------------------------*
$C$L18:    
        POPM.A    #3,r10                ; [] 
	.dwcfi	restore_reg, 8
	.dwcfi	restore_reg, 9
	.dwcfi	restore_reg, 10
	.dwcfi	cfa_offset, 4
$C$DW$62	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$62, DW_AT_low_pc(0x00)
	.dwattr $C$DW$62, DW_AT_TI_return

        RETA      ; [] 
        ; [] 
	.dwattr $C$DW$51, DW_AT_TI_end_file("../blake2s.c")
	.dwattr $C$DW$51, DW_AT_TI_end_line(0xa9)
	.dwattr $C$DW$51, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$51

	.sect	".text:blake2s"
	.clink
	.global	blake2s

$C$DW$63	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$63, DW_AT_name("blake2s")
	.dwattr $C$DW$63, DW_AT_low_pc(blake2s)
	.dwattr $C$DW$63, DW_AT_high_pc(0x00)
	.dwattr $C$DW$63, DW_AT_TI_symbol_name("blake2s")
	.dwattr $C$DW$63, DW_AT_external
	.dwattr $C$DW$63, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$63, DW_AT_TI_begin_file("../blake2s.c")
	.dwattr $C$DW$63, DW_AT_TI_begin_line(0xad)
	.dwattr $C$DW$63, DW_AT_TI_begin_column(0x05)
	.dwattr $C$DW$63, DW_AT_decl_file("../blake2s.c")
	.dwattr $C$DW$63, DW_AT_decl_line(0xad)
	.dwattr $C$DW$63, DW_AT_decl_column(0x05)
	.dwattr $C$DW$63, DW_AT_TI_max_frame_size(0x7c)
	.dwpsn	file "../blake2s.c",line 176,column 1,is_stmt,address blake2s,isa 0

	.dwfde $C$DW$CIE, blake2s
$C$DW$64	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$64, DW_AT_name("out")
	.dwattr $C$DW$64, DW_AT_TI_symbol_name("out")
	.dwattr $C$DW$64, DW_AT_type(*$C$DW$T$3)
	.dwattr $C$DW$64, DW_AT_location[DW_OP_reg12]

$C$DW$65	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$65, DW_AT_name("outlen")
	.dwattr $C$DW$65, DW_AT_TI_symbol_name("outlen")
	.dwattr $C$DW$65, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$65, DW_AT_location[DW_OP_reg13]

$C$DW$66	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$66, DW_AT_name("key")
	.dwattr $C$DW$66, DW_AT_TI_symbol_name("key")
	.dwattr $C$DW$66, DW_AT_type(*$C$DW$T$35)
	.dwattr $C$DW$66, DW_AT_location[DW_OP_reg14]

$C$DW$67	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$67, DW_AT_name("keylen")
	.dwattr $C$DW$67, DW_AT_TI_symbol_name("keylen")
	.dwattr $C$DW$67, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$67, DW_AT_location[DW_OP_reg15]

$C$DW$68	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$68, DW_AT_name("in")
	.dwattr $C$DW$68, DW_AT_TI_symbol_name("in")
	.dwattr $C$DW$68, DW_AT_type(*$C$DW$T$35)
	.dwattr $C$DW$68, DW_AT_location[DW_OP_breg1 124]

$C$DW$69	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$69, DW_AT_name("inlen")
	.dwattr $C$DW$69, DW_AT_TI_symbol_name("inlen")
	.dwattr $C$DW$69, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$69, DW_AT_location[DW_OP_breg1 128]


;*****************************************************************************
;* FUNCTION NAME: blake2s                                                    *
;*                                                                           *
;*   Regs Modified     : SP,SR,r8,r9,r10,r11,r12,r13,r14,r15                 *
;*   Regs Used         : SP,SR,r8,r9,r10,r11,r12,r13,r14,r15                 *
;*   Local Frame Size  : 0 Args + 108 Auto + 12 Save = 120 byte              *
;*****************************************************************************
blake2s:
;* --------------------------------------------------------------------------*
$C$DW$70	.dwtag  DW_TAG_variable
	.dwattr $C$DW$70, DW_AT_name("ctx")
	.dwattr $C$DW$70, DW_AT_TI_symbol_name("ctx")
	.dwattr $C$DW$70, DW_AT_type(*$C$DW$T$28)
	.dwattr $C$DW$70, DW_AT_location[DW_OP_breg1 0]

;* r8    assigned to out
$C$DW$71	.dwtag  DW_TAG_variable
	.dwattr $C$DW$71, DW_AT_name("out")
	.dwattr $C$DW$71, DW_AT_TI_symbol_name("out")
	.dwattr $C$DW$71, DW_AT_type(*$C$DW$T$31)
	.dwattr $C$DW$71, DW_AT_location[DW_OP_reg8]

;* r9    assigned to in
$C$DW$72	.dwtag  DW_TAG_variable
	.dwattr $C$DW$72, DW_AT_name("in")
	.dwattr $C$DW$72, DW_AT_TI_symbol_name("in")
	.dwattr $C$DW$72, DW_AT_type(*$C$DW$T$36)
	.dwattr $C$DW$72, DW_AT_location[DW_OP_reg9]

;* r10   assigned to inlen
$C$DW$73	.dwtag  DW_TAG_variable
	.dwattr $C$DW$73, DW_AT_name("inlen")
	.dwattr $C$DW$73, DW_AT_TI_symbol_name("inlen")
	.dwattr $C$DW$73, DW_AT_type(*$C$DW$T$67)
	.dwattr $C$DW$73, DW_AT_location[DW_OP_reg10]

	.dwcfi	cfa_offset, 4
	.dwcfi	save_reg_to_mem, 16, -4
        PUSHM.A   #3,r10                ; [] 
	.dwcfi	save_reg_to_mem, 10, -8
	.dwcfi	save_reg_to_mem, 9, -12
	.dwcfi	save_reg_to_mem, 8, -16
	.dwcfi	cfa_offset, 16
        SUBA      #108,SP               ; [] 
	.dwcfi	cfa_offset, 124
        MOVA      r12,r8                ; [] |176| 
        MOV.W     128(SP),r10           ; [] |176| 
        MOVX.A    124(SP),r9            ; [] |176| 
	.dwpsn	file "../blake2s.c",line 179,column 5,is_stmt,isa 0
        MOVX.A    SP,r12                ; [] |179| 
$C$DW$74	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$74, DW_AT_low_pc(0x00)
	.dwattr $C$DW$74, DW_AT_name("blake2s_init")
	.dwattr $C$DW$74, DW_AT_TI_call

        CALLA     #blake2s_init         ; [] |179| 
                                          ; [] |179| 
        TST.W     r12                   ; [] |179| 
        JEQ       $C$L19                ; [] |179| 
                                          ; [] |179| 
;* --------------------------------------------------------------------------*
	.dwpsn	file "../blake2s.c",line 180,column 9,is_stmt,isa 0
        MOV.W     #-1,r12               ; [] |180| 
        JMP       $C$L20                ; [] |180| 
                                          ; [] |180| 
;* --------------------------------------------------------------------------*
$C$L19:    
	.dwpsn	file "../blake2s.c",line 181,column 5,is_stmt,isa 0
        MOVX.A    SP,r12                ; [] |181| 
        MOVA      r9,r13                ; [] |181| 
        MOVA      r10,r14               ; [] |181| 
$C$DW$75	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$75, DW_AT_low_pc(0x00)
	.dwattr $C$DW$75, DW_AT_name("blake2s_update")
	.dwattr $C$DW$75, DW_AT_TI_call

        CALLA     #blake2s_update       ; [] |181| 
                                          ; [] |181| 
	.dwpsn	file "../blake2s.c",line 182,column 5,is_stmt,isa 0
        MOVX.A    SP,r12                ; [] |182| 
        MOVA      r8,r13                ; [] |182| 
$C$DW$76	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$76, DW_AT_low_pc(0x00)
	.dwattr $C$DW$76, DW_AT_name("blake2s_final")
	.dwattr $C$DW$76, DW_AT_TI_call

        CALLA     #blake2s_final        ; [] |182| 
                                          ; [] |182| 
	.dwpsn	file "../blake2s.c",line 184,column 5,is_stmt,isa 0
        MOV.W     #0,r12                ; [] |184| 
;* --------------------------------------------------------------------------*
$C$L20:    
        ADDA      #108,SP               ; [] 
	.dwcfi	cfa_offset, 16
        POPM.A    #3,r10                ; [] 
	.dwcfi	restore_reg, 8
	.dwcfi	restore_reg, 9
	.dwcfi	restore_reg, 10
	.dwcfi	cfa_offset, 4
$C$DW$77	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$77, DW_AT_low_pc(0x00)
	.dwattr $C$DW$77, DW_AT_TI_return

        RETA      ; [] 
        ; [] 
	.dwattr $C$DW$63, DW_AT_TI_end_file("../blake2s.c")
	.dwattr $C$DW$63, DW_AT_TI_end_line(0xb9)
	.dwattr $C$DW$63, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$63

;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	memcpy
	.global	__mspabi_srll_12
	.global	__mspabi_srll_7
	.global	__mspabi_srll

;******************************************************************************
;* BUILD ATTRIBUTES                                                           *
;******************************************************************************
	.battr "TI", Tag_File, 1, Tag_LOCKIO_INFO(1)
	.battr "TI", Tag_File, 1, Tag_WAITSTATE_INFO(2)
	.battr "TI", Tag_File, 1, Tag_HW_MPY_ISR_INFO(1)
	.battr "TI", Tag_File, 1, Tag_HW_MPY_INLINE_INFO(2)
	.battr "mspabi", Tag_File, 1, Tag_enum_size(3)

;******************************************************************************
;* TYPE INFORMATION                                                           *
;******************************************************************************

$C$DW$T$25	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$25, DW_AT_byte_size(0x6c)
$C$DW$78	.dwtag  DW_TAG_member
	.dwattr $C$DW$78, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$78, DW_AT_name("b")
	.dwattr $C$DW$78, DW_AT_TI_symbol_name("b")
	.dwattr $C$DW$78, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$78, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$78, DW_AT_decl_file("..\blake2s.h")
	.dwattr $C$DW$78, DW_AT_decl_line(0x0c)
	.dwattr $C$DW$78, DW_AT_decl_column(0x0d)

$C$DW$79	.dwtag  DW_TAG_member
	.dwattr $C$DW$79, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$79, DW_AT_name("h")
	.dwattr $C$DW$79, DW_AT_TI_symbol_name("h")
	.dwattr $C$DW$79, DW_AT_data_member_location[DW_OP_plus_uconst 0x40]
	.dwattr $C$DW$79, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$79, DW_AT_decl_file("..\blake2s.h")
	.dwattr $C$DW$79, DW_AT_decl_line(0x0d)
	.dwattr $C$DW$79, DW_AT_decl_column(0x0e)

$C$DW$80	.dwtag  DW_TAG_member
	.dwattr $C$DW$80, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$80, DW_AT_name("t")
	.dwattr $C$DW$80, DW_AT_TI_symbol_name("t")
	.dwattr $C$DW$80, DW_AT_data_member_location[DW_OP_plus_uconst 0x60]
	.dwattr $C$DW$80, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$80, DW_AT_decl_file("..\blake2s.h")
	.dwattr $C$DW$80, DW_AT_decl_line(0x0e)
	.dwattr $C$DW$80, DW_AT_decl_column(0x0e)

$C$DW$81	.dwtag  DW_TAG_member
	.dwattr $C$DW$81, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$81, DW_AT_name("c")
	.dwattr $C$DW$81, DW_AT_TI_symbol_name("c")
	.dwattr $C$DW$81, DW_AT_data_member_location[DW_OP_plus_uconst 0x68]
	.dwattr $C$DW$81, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$81, DW_AT_decl_file("..\blake2s.h")
	.dwattr $C$DW$81, DW_AT_decl_line(0x0f)
	.dwattr $C$DW$81, DW_AT_decl_column(0x0c)

$C$DW$82	.dwtag  DW_TAG_member
	.dwattr $C$DW$82, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$82, DW_AT_name("outlen")
	.dwattr $C$DW$82, DW_AT_TI_symbol_name("outlen")
	.dwattr $C$DW$82, DW_AT_data_member_location[DW_OP_plus_uconst 0x6a]
	.dwattr $C$DW$82, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$82, DW_AT_decl_file("..\blake2s.h")
	.dwattr $C$DW$82, DW_AT_decl_line(0x10)
	.dwattr $C$DW$82, DW_AT_decl_column(0x0c)

	.dwattr $C$DW$T$25, DW_AT_decl_file("..\blake2s.h")
	.dwattr $C$DW$T$25, DW_AT_decl_line(0x0b)
	.dwattr $C$DW$T$25, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$25

$C$DW$T$28	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$28, DW_AT_name("blake2s_ctx")
	.dwattr $C$DW$T$28, DW_AT_type(*$C$DW$T$25)
	.dwattr $C$DW$T$28, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$28, DW_AT_decl_file("..\blake2s.h")
	.dwattr $C$DW$T$28, DW_AT_decl_line(0x11)
	.dwattr $C$DW$T$28, DW_AT_decl_column(0x03)

$C$DW$T$29	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$29, DW_AT_type(*$C$DW$T$28)
	.dwattr $C$DW$T$29, DW_AT_address_class(0x14)

$C$DW$83	.dwtag  DW_TAG_TI_far_type
	.dwattr $C$DW$83, DW_AT_type(*$C$DW$T$29)

$C$DW$T$30	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$30, DW_AT_type(*$C$DW$83)

$C$DW$T$2	.dwtag  DW_TAG_unspecified_type
	.dwattr $C$DW$T$2, DW_AT_name("void")

$C$DW$T$3	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$3, DW_AT_type(*$C$DW$T$2)
	.dwattr $C$DW$T$3, DW_AT_address_class(0x14)

$C$DW$84	.dwtag  DW_TAG_TI_far_type
	.dwattr $C$DW$84, DW_AT_type(*$C$DW$T$3)

$C$DW$T$31	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$31, DW_AT_type(*$C$DW$84)

$C$DW$85	.dwtag  DW_TAG_TI_far_type
	.dwattr $C$DW$85, DW_AT_type(*$C$DW$T$2)

$C$DW$T$34	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$34, DW_AT_type(*$C$DW$85)

$C$DW$T$35	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$35, DW_AT_type(*$C$DW$T$34)
	.dwattr $C$DW$T$35, DW_AT_address_class(0x14)

$C$DW$86	.dwtag  DW_TAG_TI_far_type
	.dwattr $C$DW$86, DW_AT_type(*$C$DW$T$35)

$C$DW$T$36	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$36, DW_AT_type(*$C$DW$86)

$C$DW$T$4	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$4, DW_AT_encoding(DW_ATE_boolean)
	.dwattr $C$DW$T$4, DW_AT_name("bool")
	.dwattr $C$DW$T$4, DW_AT_byte_size(0x01)

$C$DW$T$5	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$5, DW_AT_encoding(DW_ATE_signed_char)
	.dwattr $C$DW$T$5, DW_AT_name("signed char")
	.dwattr $C$DW$T$5, DW_AT_byte_size(0x01)

$C$DW$T$41	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$41, DW_AT_name("int8_t")
	.dwattr $C$DW$T$41, DW_AT_type(*$C$DW$T$5)
	.dwattr $C$DW$T$41, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$41, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$41, DW_AT_decl_line(0x2a)
	.dwattr $C$DW$T$41, DW_AT_decl_column(0x1e)

$C$DW$T$42	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$42, DW_AT_name("int_least8_t")
	.dwattr $C$DW$T$42, DW_AT_type(*$C$DW$T$41)
	.dwattr $C$DW$T$42, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$42, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$42, DW_AT_decl_line(0x37)
	.dwattr $C$DW$T$42, DW_AT_decl_column(0x17)

$C$DW$T$6	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$6, DW_AT_encoding(DW_ATE_unsigned_char)
	.dwattr $C$DW$T$6, DW_AT_name("unsigned char")
	.dwattr $C$DW$T$6, DW_AT_byte_size(0x01)

$C$DW$T$19	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$19, DW_AT_name("uint8_t")
	.dwattr $C$DW$T$19, DW_AT_type(*$C$DW$T$6)
	.dwattr $C$DW$T$19, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$19, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$19, DW_AT_decl_line(0x2b)
	.dwattr $C$DW$T$19, DW_AT_decl_column(0x1d)


$C$DW$T$20	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$20, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$T$20, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$20, DW_AT_byte_size(0x40)
$C$DW$87	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$87, DW_AT_upper_bound(0x3f)

	.dwendtag $C$DW$T$20

$C$DW$88	.dwtag  DW_TAG_TI_far_type
	.dwattr $C$DW$88, DW_AT_type(*$C$DW$T$19)

$C$DW$T$50	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$50, DW_AT_type(*$C$DW$88)


$C$DW$T$51	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$51, DW_AT_type(*$C$DW$T$50)
	.dwattr $C$DW$T$51, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$51, DW_AT_byte_size(0x10)
$C$DW$89	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$89, DW_AT_upper_bound(0x0f)

	.dwendtag $C$DW$T$51


$C$DW$T$52	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$52, DW_AT_type(*$C$DW$T$50)
	.dwattr $C$DW$T$52, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$52, DW_AT_byte_size(0xa0)
$C$DW$90	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$90, DW_AT_upper_bound(0x09)

$C$DW$91	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$91, DW_AT_upper_bound(0x0f)

	.dwendtag $C$DW$T$52

$C$DW$T$53	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$53, DW_AT_name("uint_least8_t")
	.dwattr $C$DW$T$53, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$T$53, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$53, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$53, DW_AT_decl_line(0x38)
	.dwattr $C$DW$T$53, DW_AT_decl_column(0x16)

$C$DW$T$7	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$7, DW_AT_encoding(DW_ATE_signed_char)
	.dwattr $C$DW$T$7, DW_AT_name("wchar_t")
	.dwattr $C$DW$T$7, DW_AT_byte_size(0x02)

$C$DW$T$8	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$8, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$8, DW_AT_name("short")
	.dwattr $C$DW$T$8, DW_AT_byte_size(0x02)

$C$DW$T$9	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$9, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$9, DW_AT_name("unsigned short")
	.dwattr $C$DW$T$9, DW_AT_byte_size(0x02)

$C$DW$T$10	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$10, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$10, DW_AT_name("int")
	.dwattr $C$DW$T$10, DW_AT_byte_size(0x02)

$C$DW$92	.dwtag  DW_TAG_TI_far_type
	.dwattr $C$DW$92, DW_AT_type(*$C$DW$T$10)

$C$DW$T$57	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$57, DW_AT_type(*$C$DW$92)

$C$DW$T$58	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$58, DW_AT_name("int16_t")
	.dwattr $C$DW$T$58, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$T$58, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$58, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$58, DW_AT_decl_line(0x2c)
	.dwattr $C$DW$T$58, DW_AT_decl_column(0x1d)

$C$DW$T$59	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$59, DW_AT_name("int_fast16_t")
	.dwattr $C$DW$T$59, DW_AT_type(*$C$DW$T$58)
	.dwattr $C$DW$T$59, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$59, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$59, DW_AT_decl_line(0x47)
	.dwattr $C$DW$T$59, DW_AT_decl_column(0x17)

$C$DW$T$60	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$60, DW_AT_name("int_fast8_t")
	.dwattr $C$DW$T$60, DW_AT_type(*$C$DW$T$58)
	.dwattr $C$DW$T$60, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$60, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$60, DW_AT_decl_line(0x45)
	.dwattr $C$DW$T$60, DW_AT_decl_column(0x17)

$C$DW$T$61	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$61, DW_AT_name("int_least16_t")
	.dwattr $C$DW$T$61, DW_AT_type(*$C$DW$T$58)
	.dwattr $C$DW$T$61, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$61, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$61, DW_AT_decl_line(0x3a)
	.dwattr $C$DW$T$61, DW_AT_decl_column(0x17)

$C$DW$T$62	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$62, DW_AT_name("ptrdiff_t")
	.dwattr $C$DW$T$62, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$T$62, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$62, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stddef.h")
	.dwattr $C$DW$T$62, DW_AT_decl_line(0x36)
	.dwattr $C$DW$T$62, DW_AT_decl_column(0x1c)

$C$DW$T$11	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$11, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$11, DW_AT_name("unsigned int")
	.dwattr $C$DW$T$11, DW_AT_byte_size(0x02)

$C$DW$T$24	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$24, DW_AT_name("size_t")
	.dwattr $C$DW$T$24, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$24, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$24, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stddef.h")
	.dwattr $C$DW$T$24, DW_AT_decl_line(0x3a)
	.dwattr $C$DW$T$24, DW_AT_decl_column(0x19)

$C$DW$93	.dwtag  DW_TAG_TI_far_type
	.dwattr $C$DW$93, DW_AT_type(*$C$DW$T$24)

$C$DW$T$67	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$67, DW_AT_type(*$C$DW$93)

$C$DW$T$68	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$68, DW_AT_name("uint16_t")
	.dwattr $C$DW$T$68, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$68, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$68, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$68, DW_AT_decl_line(0x2d)
	.dwattr $C$DW$T$68, DW_AT_decl_column(0x1c)

$C$DW$T$69	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$69, DW_AT_type(*$C$DW$T$68)
	.dwattr $C$DW$T$69, DW_AT_address_class(0x14)

$C$DW$T$70	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$70, DW_AT_name("uint_fast16_t")
	.dwattr $C$DW$T$70, DW_AT_type(*$C$DW$T$68)
	.dwattr $C$DW$T$70, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$70, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$70, DW_AT_decl_line(0x48)
	.dwattr $C$DW$T$70, DW_AT_decl_column(0x16)

$C$DW$T$71	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$71, DW_AT_name("uint_fast8_t")
	.dwattr $C$DW$T$71, DW_AT_type(*$C$DW$T$68)
	.dwattr $C$DW$T$71, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$71, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$71, DW_AT_decl_line(0x46)
	.dwattr $C$DW$T$71, DW_AT_decl_column(0x16)

$C$DW$T$72	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$72, DW_AT_name("uint_least16_t")
	.dwattr $C$DW$T$72, DW_AT_type(*$C$DW$T$68)
	.dwattr $C$DW$T$72, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$72, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$72, DW_AT_decl_line(0x3b)
	.dwattr $C$DW$T$72, DW_AT_decl_column(0x16)

$C$DW$T$73	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$73, DW_AT_name("wchar_t")
	.dwattr $C$DW$T$73, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$73, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$73, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stddef.h")
	.dwattr $C$DW$T$73, DW_AT_decl_line(0x41)
	.dwattr $C$DW$T$73, DW_AT_decl_column(0x1a)

$C$DW$T$12	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$12, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$12, DW_AT_name("long")
	.dwattr $C$DW$T$12, DW_AT_byte_size(0x04)

$C$DW$T$74	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$74, DW_AT_name("int32_t")
	.dwattr $C$DW$T$74, DW_AT_type(*$C$DW$T$12)
	.dwattr $C$DW$T$74, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$74, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$74, DW_AT_decl_line(0x2e)
	.dwattr $C$DW$T$74, DW_AT_decl_column(0x1d)

$C$DW$T$75	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$75, DW_AT_name("int_fast32_t")
	.dwattr $C$DW$T$75, DW_AT_type(*$C$DW$T$74)
	.dwattr $C$DW$T$75, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$75, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$75, DW_AT_decl_line(0x4a)
	.dwattr $C$DW$T$75, DW_AT_decl_column(0x17)

$C$DW$T$76	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$76, DW_AT_name("int_least32_t")
	.dwattr $C$DW$T$76, DW_AT_type(*$C$DW$T$74)
	.dwattr $C$DW$T$76, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$76, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$76, DW_AT_decl_line(0x3c)
	.dwattr $C$DW$T$76, DW_AT_decl_column(0x17)

$C$DW$T$77	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$77, DW_AT_name("intptr_t")
	.dwattr $C$DW$T$77, DW_AT_type(*$C$DW$T$12)
	.dwattr $C$DW$T$77, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$77, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$77, DW_AT_decl_line(0x55)
	.dwattr $C$DW$T$77, DW_AT_decl_column(0x1b)

$C$DW$T$13	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$13, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$13, DW_AT_name("unsigned long")
	.dwattr $C$DW$T$13, DW_AT_byte_size(0x04)

$C$DW$T$21	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$21, DW_AT_name("uint32_t")
	.dwattr $C$DW$T$21, DW_AT_type(*$C$DW$T$13)
	.dwattr $C$DW$T$21, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$21, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$21, DW_AT_decl_line(0x2f)
	.dwattr $C$DW$T$21, DW_AT_decl_column(0x1c)


$C$DW$T$22	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$22, DW_AT_type(*$C$DW$T$21)
	.dwattr $C$DW$T$22, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$22, DW_AT_byte_size(0x20)
$C$DW$94	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$94, DW_AT_upper_bound(0x07)

	.dwendtag $C$DW$T$22


$C$DW$T$23	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$23, DW_AT_type(*$C$DW$T$21)
	.dwattr $C$DW$T$23, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$23, DW_AT_byte_size(0x08)
$C$DW$95	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$95, DW_AT_upper_bound(0x01)

	.dwendtag $C$DW$T$23


$C$DW$T$84	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$84, DW_AT_type(*$C$DW$T$21)
	.dwattr $C$DW$T$84, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$84, DW_AT_byte_size(0x40)
$C$DW$96	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$96, DW_AT_upper_bound(0x0f)

	.dwendtag $C$DW$T$84

$C$DW$97	.dwtag  DW_TAG_TI_far_type
	.dwattr $C$DW$97, DW_AT_type(*$C$DW$T$21)

$C$DW$T$85	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$85, DW_AT_type(*$C$DW$97)


$C$DW$T$86	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$86, DW_AT_type(*$C$DW$T$85)
	.dwattr $C$DW$T$86, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$86, DW_AT_byte_size(0x20)
$C$DW$98	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$98, DW_AT_upper_bound(0x07)

	.dwendtag $C$DW$T$86

$C$DW$T$87	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$87, DW_AT_name("uint_fast32_t")
	.dwattr $C$DW$T$87, DW_AT_type(*$C$DW$T$21)
	.dwattr $C$DW$T$87, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$87, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$87, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$T$87, DW_AT_decl_column(0x16)

$C$DW$T$88	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$88, DW_AT_name("uint_least32_t")
	.dwattr $C$DW$T$88, DW_AT_type(*$C$DW$T$21)
	.dwattr $C$DW$T$88, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$88, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$88, DW_AT_decl_line(0x3d)
	.dwattr $C$DW$T$88, DW_AT_decl_column(0x16)

$C$DW$T$89	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$89, DW_AT_name("uintptr_t")
	.dwattr $C$DW$T$89, DW_AT_type(*$C$DW$T$13)
	.dwattr $C$DW$T$89, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$89, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$89, DW_AT_decl_line(0x56)
	.dwattr $C$DW$T$89, DW_AT_decl_column(0x1b)

$C$DW$T$14	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$14, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$14, DW_AT_name("long long")
	.dwattr $C$DW$T$14, DW_AT_byte_size(0x08)

$C$DW$T$90	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$90, DW_AT_name("int64_t")
	.dwattr $C$DW$T$90, DW_AT_type(*$C$DW$T$14)
	.dwattr $C$DW$T$90, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$90, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$90, DW_AT_decl_line(0x32)
	.dwattr $C$DW$T$90, DW_AT_decl_column(0x21)

$C$DW$T$91	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$91, DW_AT_name("int_fast64_t")
	.dwattr $C$DW$T$91, DW_AT_type(*$C$DW$T$90)
	.dwattr $C$DW$T$91, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$91, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$91, DW_AT_decl_line(0x4e)
	.dwattr $C$DW$T$91, DW_AT_decl_column(0x17)

$C$DW$T$92	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$92, DW_AT_name("int_least64_t")
	.dwattr $C$DW$T$92, DW_AT_type(*$C$DW$T$90)
	.dwattr $C$DW$T$92, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$92, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$92, DW_AT_decl_line(0x40)
	.dwattr $C$DW$T$92, DW_AT_decl_column(0x17)

$C$DW$T$93	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$93, DW_AT_name("intmax_t")
	.dwattr $C$DW$T$93, DW_AT_type(*$C$DW$T$14)
	.dwattr $C$DW$T$93, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$93, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$93, DW_AT_decl_line(0x5d)
	.dwattr $C$DW$T$93, DW_AT_decl_column(0x20)

$C$DW$T$15	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$15, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$15, DW_AT_name("unsigned long long")
	.dwattr $C$DW$T$15, DW_AT_byte_size(0x08)

$C$DW$T$94	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$94, DW_AT_name("uint64_t")
	.dwattr $C$DW$T$94, DW_AT_type(*$C$DW$T$15)
	.dwattr $C$DW$T$94, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$94, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$94, DW_AT_decl_line(0x33)
	.dwattr $C$DW$T$94, DW_AT_decl_column(0x20)

$C$DW$T$95	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$95, DW_AT_name("uint_fast64_t")
	.dwattr $C$DW$T$95, DW_AT_type(*$C$DW$T$94)
	.dwattr $C$DW$T$95, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$95, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$95, DW_AT_decl_line(0x4f)
	.dwattr $C$DW$T$95, DW_AT_decl_column(0x16)

$C$DW$T$96	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$96, DW_AT_name("uint_least64_t")
	.dwattr $C$DW$T$96, DW_AT_type(*$C$DW$T$94)
	.dwattr $C$DW$T$96, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$96, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$96, DW_AT_decl_line(0x41)
	.dwattr $C$DW$T$96, DW_AT_decl_column(0x16)

$C$DW$T$97	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$97, DW_AT_name("uintmax_t")
	.dwattr $C$DW$T$97, DW_AT_type(*$C$DW$T$15)
	.dwattr $C$DW$T$97, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$97, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$97, DW_AT_decl_line(0x5e)
	.dwattr $C$DW$T$97, DW_AT_decl_column(0x20)

$C$DW$T$16	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$16, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$16, DW_AT_name("float")
	.dwattr $C$DW$T$16, DW_AT_byte_size(0x04)

$C$DW$T$17	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$17, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$17, DW_AT_name("double")
	.dwattr $C$DW$T$17, DW_AT_byte_size(0x08)

$C$DW$T$18	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$18, DW_AT_encoding(DW_ATE_float)
	.dwattr $C$DW$T$18, DW_AT_name("long double")
	.dwattr $C$DW$T$18, DW_AT_byte_size(0x08)

	.dwattr $C$DW$CU, DW_AT_language(DW_LANG_C)

;***************************************************************
;* DWARF CIE ENTRIES                                           *
;***************************************************************

$C$DW$CIE	.dwcie 16
	.dwcfi	cfa_register, 1
	.dwcfi	cfa_offset, 0
	.dwcfi	same_value, 0
	.dwcfi	same_value, 1
	.dwcfi	same_value, 3
	.dwcfi	same_value, 4
	.dwcfi	same_value, 5
	.dwcfi	same_value, 6
	.dwcfi	same_value, 7
	.dwcfi	same_value, 8
	.dwcfi	same_value, 9
	.dwcfi	same_value, 10
	.dwendentry

;***************************************************************
;* DWARF REGISTER MAP                                          *
;***************************************************************

$C$DW$99	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$99, DW_AT_name("PC")
	.dwattr $C$DW$99, DW_AT_location[DW_OP_reg0]

$C$DW$100	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$100, DW_AT_name("SP")
	.dwattr $C$DW$100, DW_AT_location[DW_OP_reg1]

$C$DW$101	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$101, DW_AT_name("SR")
	.dwattr $C$DW$101, DW_AT_location[DW_OP_reg2]

$C$DW$102	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$102, DW_AT_name("CG")
	.dwattr $C$DW$102, DW_AT_location[DW_OP_reg3]

$C$DW$103	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$103, DW_AT_name("r4")
	.dwattr $C$DW$103, DW_AT_location[DW_OP_reg4]

$C$DW$104	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$104, DW_AT_name("r5")
	.dwattr $C$DW$104, DW_AT_location[DW_OP_reg5]

$C$DW$105	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$105, DW_AT_name("r6")
	.dwattr $C$DW$105, DW_AT_location[DW_OP_reg6]

$C$DW$106	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$106, DW_AT_name("r7")
	.dwattr $C$DW$106, DW_AT_location[DW_OP_reg7]

$C$DW$107	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$107, DW_AT_name("r8")
	.dwattr $C$DW$107, DW_AT_location[DW_OP_reg8]

$C$DW$108	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$108, DW_AT_name("r9")
	.dwattr $C$DW$108, DW_AT_location[DW_OP_reg9]

$C$DW$109	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$109, DW_AT_name("r10")
	.dwattr $C$DW$109, DW_AT_location[DW_OP_reg10]

$C$DW$110	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$110, DW_AT_name("r11")
	.dwattr $C$DW$110, DW_AT_location[DW_OP_reg11]

$C$DW$111	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$111, DW_AT_name("r12")
	.dwattr $C$DW$111, DW_AT_location[DW_OP_reg12]

$C$DW$112	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$112, DW_AT_name("r13")
	.dwattr $C$DW$112, DW_AT_location[DW_OP_reg13]

$C$DW$113	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$113, DW_AT_name("r14")
	.dwattr $C$DW$113, DW_AT_location[DW_OP_reg14]

$C$DW$114	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$114, DW_AT_name("r15")
	.dwattr $C$DW$114, DW_AT_location[DW_OP_reg15]

$C$DW$115	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$115, DW_AT_name("CIE_RETA")
	.dwattr $C$DW$115, DW_AT_location[DW_OP_reg16]

	.dwendtag $C$DW$CU

