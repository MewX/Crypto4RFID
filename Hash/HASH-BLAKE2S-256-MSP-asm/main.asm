;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
;
;
;-------------------------------------------------------------------------------
			.compiler_opts --abi=eabi --hll_source=on --mem_model:code=large --mem_model:data=large --object_format=elf --silicon_errata=CPU15 --silicon_errata=CPU18 --silicon_errata=CPU21 --silicon_errata=CPU22 --silicon_errata=CPU23 --silicon_errata=CPU40 --silicon_version=mspx --symdebug:dwarf --symdebug:dwarf_version=3

            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------
;******************************************************************************
;* MSP430 C/C++ Codegen                                        PC v16.9.3.LTS *
;* Date/Time created: Mon Oct 30 21:55:08 2017                                *
;******************************************************************************

$C$DW$CU	.dwtag  DW_TAG_compile_unit
	.dwattr $C$DW$CU, DW_AT_name("../main.c")
	.dwattr $C$DW$CU, DW_AT_producer("TI MSP430 C/C++ Codegen PC v16.9.3.LTS Copyright (c) 2003-2017 Texas Instruments Incorporated")
	.dwattr $C$DW$CU, DW_AT_TI_version(0x01)
	.dwattr $C$DW$CU, DW_AT_comp_dir("D:\MewX_Projects\UofA\Crypto4RFID-1\Hash\HASH-BLAKE2S-256-MSP\Debug")

$C$DW$1	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$1, DW_AT_name("memcpy")
	.dwattr $C$DW$1, DW_AT_TI_symbol_name("memcpy")
	.dwattr $C$DW$1, DW_AT_type(*$C$DW$T$3)
	.dwattr $C$DW$1, DW_AT_declaration
	.dwattr $C$DW$1, DW_AT_external
$C$DW$2	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$2, DW_AT_type(*$C$DW$T$3)

$C$DW$3	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$3, DW_AT_type(*$C$DW$T$28)

$C$DW$4	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$4, DW_AT_type(*$C$DW$T$11)

	.dwendtag $C$DW$1


$C$DW$5	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$5, DW_AT_name("blake2s")
	.dwattr $C$DW$5, DW_AT_TI_symbol_name("blake2s")
	.dwattr $C$DW$5, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$5, DW_AT_declaration
	.dwattr $C$DW$5, DW_AT_external
	.dwattr $C$DW$5, DW_AT_decl_file("..\blake2s.h")
	.dwattr $C$DW$5, DW_AT_decl_line(0x22)
	.dwattr $C$DW$5, DW_AT_decl_column(0x05)
$C$DW$6	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$6, DW_AT_type(*$C$DW$T$3)

$C$DW$7	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$7, DW_AT_type(*$C$DW$T$24)

$C$DW$8	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$8, DW_AT_type(*$C$DW$T$28)

$C$DW$9	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$9, DW_AT_type(*$C$DW$T$24)

$C$DW$10	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$10, DW_AT_type(*$C$DW$T$28)

$C$DW$11	.dwtag  DW_TAG_formal_parameter
	.dwattr $C$DW$11, DW_AT_type(*$C$DW$T$24)

	.dwendtag $C$DW$5

$C$DW$12	.dwtag  DW_TAG_variable
	.dwattr $C$DW$12, DW_AT_name("CSCTL0_H")
	.dwattr $C$DW$12, DW_AT_TI_symbol_name("CSCTL0_H")
	.dwattr $C$DW$12, DW_AT_type(*$C$DW$T$35)
	.dwattr $C$DW$12, DW_AT_declaration
	.dwattr $C$DW$12, DW_AT_external
	.dwattr $C$DW$12, DW_AT_decl_file("D:\ti\ccsv7\ccs_base\msp430\include\msp430fr5969.h")
	.dwattr $C$DW$12, DW_AT_decl_line(0x5f4)
	.dwattr $C$DW$12, DW_AT_decl_column(0x01)

$C$DW$13	.dwtag  DW_TAG_variable
	.dwattr $C$DW$13, DW_AT_name("CSCTL1")
	.dwattr $C$DW$13, DW_AT_TI_symbol_name("CSCTL1")
	.dwattr $C$DW$13, DW_AT_type(*$C$DW$T$52)
	.dwattr $C$DW$13, DW_AT_declaration
	.dwattr $C$DW$13, DW_AT_external
	.dwattr $C$DW$13, DW_AT_decl_file("D:\ti\ccsv7\ccs_base\msp430\include\msp430fr5969.h")
	.dwattr $C$DW$13, DW_AT_decl_line(0x5f5)
	.dwattr $C$DW$13, DW_AT_decl_column(0x01)

$C$DW$14	.dwtag  DW_TAG_variable
	.dwattr $C$DW$14, DW_AT_name("CSCTL2")
	.dwattr $C$DW$14, DW_AT_TI_symbol_name("CSCTL2")
	.dwattr $C$DW$14, DW_AT_type(*$C$DW$T$52)
	.dwattr $C$DW$14, DW_AT_declaration
	.dwattr $C$DW$14, DW_AT_external
	.dwattr $C$DW$14, DW_AT_decl_file("D:\ti\ccsv7\ccs_base\msp430\include\msp430fr5969.h")
	.dwattr $C$DW$14, DW_AT_decl_line(0x5f8)
	.dwattr $C$DW$14, DW_AT_decl_column(0x01)

$C$DW$15	.dwtag  DW_TAG_variable
	.dwattr $C$DW$15, DW_AT_name("CSCTL3")
	.dwattr $C$DW$15, DW_AT_TI_symbol_name("CSCTL3")
	.dwattr $C$DW$15, DW_AT_type(*$C$DW$T$52)
	.dwattr $C$DW$15, DW_AT_declaration
	.dwattr $C$DW$15, DW_AT_external
	.dwattr $C$DW$15, DW_AT_decl_file("D:\ti\ccsv7\ccs_base\msp430\include\msp430fr5969.h")
	.dwattr $C$DW$15, DW_AT_decl_line(0x5fb)
	.dwattr $C$DW$15, DW_AT_decl_column(0x01)

$C$DW$16	.dwtag  DW_TAG_variable
	.dwattr $C$DW$16, DW_AT_name("PM5CTL0")
	.dwattr $C$DW$16, DW_AT_TI_symbol_name("PM5CTL0")
	.dwattr $C$DW$16, DW_AT_type(*$C$DW$T$52)
	.dwattr $C$DW$16, DW_AT_declaration
	.dwattr $C$DW$16, DW_AT_external
	.dwattr $C$DW$16, DW_AT_decl_file("D:\ti\ccsv7\ccs_base\msp430\include\msp430fr5969.h")
	.dwattr $C$DW$16, DW_AT_decl_line(0xa0f)
	.dwattr $C$DW$16, DW_AT_decl_column(0x01)

$C$DW$17	.dwtag  DW_TAG_variable
	.dwattr $C$DW$17, DW_AT_name("WDTCTL")
	.dwattr $C$DW$17, DW_AT_TI_symbol_name("WDTCTL")
	.dwattr $C$DW$17, DW_AT_type(*$C$DW$T$52)
	.dwattr $C$DW$17, DW_AT_declaration
	.dwattr $C$DW$17, DW_AT_external
	.dwattr $C$DW$17, DW_AT_decl_file("D:\ti\ccsv7\ccs_base\msp430\include\msp430fr5969.h")
	.dwattr $C$DW$17, DW_AT_decl_line(0x1117)
	.dwattr $C$DW$17, DW_AT_decl_column(0x01)

	.sect	".const:.string:$P$T0$1"
	.clink
	.align	2
	.elfsym	$P$T0$1,SYM_SIZE(240)
$P$T0$1:
	.bits	129,8			; $P$T0$1[0] @ 0
	.bits	0,8			; $P$T0$1[1] @ 8
	.bits	0,8			; $P$T0$1[2] @ 16
	.bits	36,8			; $P$T0$1[3] @ 24
	.bits	176,8			; $P$T0$1[4] @ 32
	.bits	19,8			; $P$T0$1[5] @ 40
	.bits	240,8			; $P$T0$1[6] @ 48
	.bits	68,8			; $P$T0$1[7] @ 56
	.bits	12,8			; $P$T0$1[8] @ 64
	.bits	67,8			; $P$T0$1[9] @ 72
	.bits	176,8			; $P$T0$1[10] @ 80
	.bits	19,8			; $P$T0$1[11] @ 88
	.bits	52,8			; $P$T0$1[12] @ 96
	.bits	68,8			; $P$T0$1[13] @ 104
	.bits	176,8			; $P$T0$1[14] @ 112
	.bits	19,8			; $P$T0$1[15] @ 120
	.bits	234,8			; $P$T0$1[16] @ 128
	.bits	68,8			; $P$T0$1[17] @ 136
	.bits	79,8			; $P$T0$1[18] @ 144
	.bits	20,8			; $P$T0$1[19] @ 152
	.bits	194,8			; $P$T0$1[20] @ 160
	.bits	67,8			; $P$T0$1[21] @ 168
	.bits	28,8			; $P$T0$1[22] @ 176
	.bits	2,8			; $P$T0$1[23] @ 184
	.bits	176,8			; $P$T0$1[24] @ 192
	.bits	19,8			; $P$T0$1[25] @ 200
	.bits	210,8			; $P$T0$1[26] @ 208
	.bits	68,8			; $P$T0$1[27] @ 216
	.bits	75,8			; $P$T0$1[28] @ 224
	.bits	22,8			; $P$T0$1[29] @ 232
	.bits	0,8			; $P$T0$1[30] @ 240
	.bits	19,8			; $P$T0$1[31] @ 248
	.bits	242,8			; $P$T0$1[32] @ 256
	.bits	224,8			; $P$T0$1[33] @ 264
	.bits	64,8			; $P$T0$1[34] @ 272
	.bits	0,8			; $P$T0$1[35] @ 280
	.bits	35,8			; $P$T0$1[36] @ 288
	.bits	2,8			; $P$T0$1[37] @ 296
	.bits	146,8			; $P$T0$1[38] @ 304
	.bits	195,8			; $P$T0$1[39] @ 312
	.bits	66,8			; $P$T0$1[40] @ 320
	.bits	3,8			; $P$T0$1[41] @ 328
	.bits	0,8			; $P$T0$1[42] @ 336
	.bits	19,8			; $P$T0$1[43] @ 344
	.bits	255,8			; $P$T0$1[44] @ 352
	.bits	63,8			; $P$T0$1[45] @ 360
	.bits	3,8			; $P$T0$1[46] @ 368
	.bits	67,8			; $P$T0$1[47] @ 376
	.bits	178,8			; $P$T0$1[48] @ 384
	.bits	64,8			; $P$T0$1[49] @ 392
	.bits	128,8			; $P$T0$1[50] @ 400
	.bits	90,8			; $P$T0$1[51] @ 408
	.bits	92,8			; $P$T0$1[52] @ 416
	.bits	1,8			; $P$T0$1[53] @ 424
	.bits	242,8			; $P$T0$1[54] @ 432
	.bits	208,8			; $P$T0$1[55] @ 440
	.bits	64,8			; $P$T0$1[56] @ 448
	.bits	0,8			; $P$T0$1[57] @ 456
	.bits	37,8			; $P$T0$1[58] @ 464
	.bits	2,8			; $P$T0$1[59] @ 472
	.bits	242,8			; $P$T0$1[60] @ 480
	.bits	208,8			; $P$T0$1[61] @ 488
	.bits	64,8			; $P$T0$1[62] @ 496
	.bits	0,8			; $P$T0$1[63] @ 504
	.bits	35,8			; $P$T0$1[64] @ 512
	.bits	2,8			; $P$T0$1[65] @ 520
	.bits	146,8			; $P$T0$1[66] @ 528
	.bits	195,8			; $P$T0$1[67] @ 536
	.bits	48,8			; $P$T0$1[68] @ 544
	.bits	1,8			; $P$T0$1[69] @ 552
	.bits	30,8			; $P$T0$1[70] @ 560
	.bits	20,8			; $P$T0$1[71] @ 568
	.bits	61,8			; $P$T0$1[72] @ 576
	.bits	64,8			; $P$T0$1[73] @ 584
	.bits	68,8			; $P$T0$1[74] @ 592
	.bits	40,8			; $P$T0$1[75] @ 600
	.bits	30,8			; $P$T0$1[76] @ 608
	.bits	67,8			; $P$T0$1[77] @ 616
	.bits	29,8			; $P$T0$1[78] @ 624
	.bits	131,8			; $P$T0$1[79] @ 632
	.bits	14,8			; $P$T0$1[80] @ 640
	.bits	115,8			; $P$T0$1[81] @ 648
	.bits	253,8			; $P$T0$1[82] @ 656
	.bits	35,8			; $P$T0$1[83] @ 664
	.bits	13,8			; $P$T0$1[84] @ 672
	.bits	147,8			; $P$T0$1[85] @ 680
	.bits	251,8			; $P$T0$1[86] @ 688
	.bits	35,8			; $P$T0$1[87] @ 696
	.bits	29,8			; $P$T0$1[88] @ 704
	.bits	22,8			; $P$T0$1[89] @ 712
	.bits	3,8			; $P$T0$1[90] @ 720
	.bits	67,8			; $P$T0$1[91] @ 728
	.bits	242,8			; $P$T0$1[92] @ 736
	.bits	240,8			; $P$T0$1[93] @ 744
	.bits	191,8			; $P$T0$1[94] @ 752
	.bits	0,8			; $P$T0$1[95] @ 760
	.bits	35,8			; $P$T0$1[96] @ 768
	.bits	2,8			; $P$T0$1[97] @ 776
	.bits	30,8			; $P$T0$1[98] @ 784
	.bits	20,8			; $P$T0$1[99] @ 792
	.bits	61,8			; $P$T0$1[100] @ 800
	.bits	64,8			; $P$T0$1[101] @ 808
	.bits	68,8			; $P$T0$1[102] @ 816
	.bits	40,8			; $P$T0$1[103] @ 824
	.bits	30,8			; $P$T0$1[104] @ 832
	.bits	67,8			; $P$T0$1[105] @ 840
	.bits	29,8			; $P$T0$1[106] @ 848
	.bits	131,8			; $P$T0$1[107] @ 856
	.bits	14,8			; $P$T0$1[108] @ 864
	.bits	115,8			; $P$T0$1[109] @ 872
	.bits	253,8			; $P$T0$1[110] @ 880
	.bits	35,8			; $P$T0$1[111] @ 888
	.bits	13,8			; $P$T0$1[112] @ 896
	.bits	147,8			; $P$T0$1[113] @ 904
	.bits	251,8			; $P$T0$1[114] @ 912
	.bits	35,8			; $P$T0$1[115] @ 920
	.bits	29,8			; $P$T0$1[116] @ 928
	.bits	22,8			; $P$T0$1[117] @ 936
	.bits	3,8			; $P$T0$1[118] @ 944
	.bits	67,8			; $P$T0$1[119] @ 952
	.bits	242,8			; $P$T0$1[120] @ 960
	.bits	208,8			; $P$T0$1[121] @ 968
	.bits	64,8			; $P$T0$1[122] @ 976
	.bits	0,8			; $P$T0$1[123] @ 984
	.bits	35,8			; $P$T0$1[124] @ 992
	.bits	2,8			; $P$T0$1[125] @ 1000
	.bits	30,8			; $P$T0$1[126] @ 1008
	.bits	20,8			; $P$T0$1[127] @ 1016
	.bits	61,8			; $P$T0$1[128] @ 1024
	.bits	64,8			; $P$T0$1[129] @ 1032
	.bits	68,8			; $P$T0$1[130] @ 1040
	.bits	40,8			; $P$T0$1[131] @ 1048
	.bits	30,8			; $P$T0$1[132] @ 1056
	.bits	67,8			; $P$T0$1[133] @ 1064
	.bits	29,8			; $P$T0$1[134] @ 1072
	.bits	131,8			; $P$T0$1[135] @ 1080
	.bits	14,8			; $P$T0$1[136] @ 1088
	.bits	115,8			; $P$T0$1[137] @ 1096
	.bits	253,8			; $P$T0$1[138] @ 1104
	.bits	35,8			; $P$T0$1[139] @ 1112
	.bits	13,8			; $P$T0$1[140] @ 1120
	.bits	147,8			; $P$T0$1[141] @ 1128
	.bits	251,8			; $P$T0$1[142] @ 1136
	.bits	35,8			; $P$T0$1[143] @ 1144
	.bits	29,8			; $P$T0$1[144] @ 1152
	.bits	22,8			; $P$T0$1[145] @ 1160
	.bits	3,8			; $P$T0$1[146] @ 1168
	.bits	67,8			; $P$T0$1[147] @ 1176
	.bits	242,8			; $P$T0$1[148] @ 1184
	.bits	240,8			; $P$T0$1[149] @ 1192
	.bits	191,8			; $P$T0$1[150] @ 1200
	.bits	0,8			; $P$T0$1[151] @ 1208
	.bits	35,8			; $P$T0$1[152] @ 1216
	.bits	2,8			; $P$T0$1[153] @ 1224
	.bits	226,8			; $P$T0$1[154] @ 1232
	.bits	211,8			; $P$T0$1[155] @ 1240
	.bits	2,8			; $P$T0$1[156] @ 1248
	.bits	2,8			; $P$T0$1[157] @ 1256
	.bits	226,8			; $P$T0$1[158] @ 1264
	.bits	211,8			; $P$T0$1[159] @ 1272
	.bits	6,8			; $P$T0$1[160] @ 1280
	.bits	2,8			; $P$T0$1[161] @ 1288
	.bits	226,8			; $P$T0$1[162] @ 1296
	.bits	211,8			; $P$T0$1[163] @ 1304
	.bits	24,8			; $P$T0$1[164] @ 1312
	.bits	2,8			; $P$T0$1[165] @ 1320
	.bits	226,8			; $P$T0$1[166] @ 1328
	.bits	211,8			; $P$T0$1[167] @ 1336
	.bits	26,8			; $P$T0$1[168] @ 1344
	.bits	2,8			; $P$T0$1[169] @ 1352
	.bits	226,8			; $P$T0$1[170] @ 1360
	.bits	195,8			; $P$T0$1[171] @ 1368
	.bits	28,8			; $P$T0$1[172] @ 1376
	.bits	2,8			; $P$T0$1[173] @ 1384
	.bits	178,8			; $P$T0$1[174] @ 1392
	.bits	64,8			; $P$T0$1[175] @ 1400
	.bits	16,8			; $P$T0$1[176] @ 1408
	.bits	0,8			; $P$T0$1[177] @ 1416
	.bits	66,8			; $P$T0$1[178] @ 1424
	.bits	3,8			; $P$T0$1[179] @ 1432
	.bits	178,8			; $P$T0$1[180] @ 1440
	.bits	64,8			; $P$T0$1[181] @ 1448
	.bits	231,8			; $P$T0$1[182] @ 1456
	.bits	3,8			; $P$T0$1[183] @ 1464
	.bits	82,8			; $P$T0$1[184] @ 1472
	.bits	3,8			; $P$T0$1[185] @ 1480
	.bits	178,8			; $P$T0$1[186] @ 1488
	.bits	64,8			; $P$T0$1[187] @ 1496
	.bits	16,8			; $P$T0$1[188] @ 1504
	.bits	1,8			; $P$T0$1[189] @ 1512
	.bits	64,8			; $P$T0$1[190] @ 1520
	.bits	3,8			; $P$T0$1[191] @ 1528
	.bits	3,8			; $P$T0$1[192] @ 1536
	.bits	67,8			; $P$T0$1[193] @ 1544
	.bits	50,8			; $P$T0$1[194] @ 1552
	.bits	208,8			; $P$T0$1[195] @ 1560
	.bits	216,8			; $P$T0$1[196] @ 1568
	.bits	0,8			; $P$T0$1[197] @ 1576
	.bits	3,8			; $P$T0$1[198] @ 1584
	.bits	67,8			; $P$T0$1[199] @ 1592
	.bits	3,8			; $P$T0$1[200] @ 1600
	.bits	67,8			; $P$T0$1[201] @ 1608
	.bits	12,8			; $P$T0$1[202] @ 1616
	.bits	67,8			; $P$T0$1[203] @ 1624
	.bits	16,8			; $P$T0$1[204] @ 1632
	.bits	1,8			; $P$T0$1[205] @ 1640
	.bits	178,8			; $P$T0$1[206] @ 1648
	.bits	64,8			; $P$T0$1[207] @ 1656
	.bits	222,8			; $P$T0$1[208] @ 1664
	.bits	192,8			; $P$T0$1[209] @ 1672
	.bits	0,8			; $P$T0$1[210] @ 1680
	.bits	28,8			; $P$T0$1[211] @ 1688
	.bits	210,8			; $P$T0$1[212] @ 1696
	.bits	211,8			; $P$T0$1[213] @ 1704
	.bits	2,8			; $P$T0$1[214] @ 1712
	.bits	28,8			; $P$T0$1[215] @ 1720
	.bits	50,8			; $P$T0$1[216] @ 1728
	.bits	194,8			; $P$T0$1[217] @ 1736
	.bits	3,8			; $P$T0$1[218] @ 1744
	.bits	67,8			; $P$T0$1[219] @ 1752
	.bits	178,8			; $P$T0$1[220] @ 1760
	.bits	64,8			; $P$T0$1[221] @ 1768
	.bits	4,8			; $P$T0$1[222] @ 1776
	.bits	165,8			; $P$T0$1[223] @ 1784
	.bits	32,8			; $P$T0$1[224] @ 1792
	.bits	1,8			; $P$T0$1[225] @ 1800
	.bits	255,8			; $P$T0$1[226] @ 1808
	.bits	63,8			; $P$T0$1[227] @ 1816
	.bits	3,8			; $P$T0$1[228] @ 1824
	.bits	67,8			; $P$T0$1[229] @ 1832
	.bits	3,8			; $P$T0$1[230] @ 1840
	.bits	67,8			; $P$T0$1[231] @ 1848
	.bits	255,8			; $P$T0$1[232] @ 1856
	.bits	63,8			; $P$T0$1[233] @ 1864
	.bits	3,8			; $P$T0$1[234] @ 1872
	.bits	67,8			; $P$T0$1[235] @ 1880
	.bits	28,8			; $P$T0$1[236] @ 1888
	.bits	67,8			; $P$T0$1[237] @ 1896
	.bits	16,8			; $P$T0$1[238] @ 1904
	.bits	1,8			; $P$T0$1[239] @ 1912

$C$DW$18	.dwtag  DW_TAG_variable
	.dwattr $C$DW$18, DW_AT_name("$P$T0$1")
	.dwattr $C$DW$18, DW_AT_TI_symbol_name("$P$T0$1")
	.dwattr $C$DW$18, DW_AT_type(*$C$DW$T$43)
	.dwattr $C$DW$18, DW_AT_location[DW_OP_addr $P$T0$1]
	.dwattr $C$DW$18, DW_AT_decl_file("../main.c")
	.dwattr $C$DW$18, DW_AT_decl_line(0x18)
	.dwattr $C$DW$18, DW_AT_decl_column(0x17)

;	D:\ti\ccsv7\tools\compiler\ti-cgt-msp430_16.9.3.LTS\bin\opt430.exe C:\\Users\\MewCa\\AppData\\Local\\Temp\\{2D69C059-D3AD-46CA-A8CC-905F6939034D} C:\\Users\\MewCa\\AppData\\Local\\Temp\\{9562EAFC-8F88-4602-9060-6175A7D2C102}
	.sect	".text:main"
	.clink
	.global	main

$C$DW$19	.dwtag  DW_TAG_subprogram
	.dwattr $C$DW$19, DW_AT_name("main")
	.dwattr $C$DW$19, DW_AT_low_pc(main)
	.dwattr $C$DW$19, DW_AT_high_pc(0x00)
	.dwattr $C$DW$19, DW_AT_TI_symbol_name("main")
	.dwattr $C$DW$19, DW_AT_external
	.dwattr $C$DW$19, DW_AT_TI_begin_file("../main.c")
	.dwattr $C$DW$19, DW_AT_TI_begin_line(0x0b)
	.dwattr $C$DW$19, DW_AT_TI_begin_column(0x06)
	.dwattr $C$DW$19, DW_AT_decl_file("../main.c")
	.dwattr $C$DW$19, DW_AT_decl_line(0x0b)
	.dwattr $C$DW$19, DW_AT_decl_column(0x06)
	.dwattr $C$DW$19, DW_AT_TI_max_frame_size(0x13a)
	.dwpsn	file "../main.c",line 11,column 12,is_stmt,address main,isa 0

	.dwfde $C$DW$CIE, main

;*****************************************************************************
;* FUNCTION NAME: main                                                       *
;*                                                                           *
;*   Regs Modified     : SP,SR,r11,r12,r13,r14,r15                           *
;*   Regs Used         : SP,SR,r11,r12,r13,r14,r15                           *
;*   Local Frame Size  : 6 Args + 304 Auto + 0 Save = 310 byte               *
;*****************************************************************************
main:
;* --------------------------------------------------------------------------*
$C$DW$20	.dwtag  DW_TAG_variable
	.dwattr $C$DW$20, DW_AT_name("App1")
	.dwattr $C$DW$20, DW_AT_TI_symbol_name("App1")
	.dwattr $C$DW$20, DW_AT_type(*$C$DW$T$43)
	.dwattr $C$DW$20, DW_AT_location[DW_OP_breg1 6]

$C$DW$21	.dwtag  DW_TAG_variable
	.dwattr $C$DW$21, DW_AT_name("s")
	.dwattr $C$DW$21, DW_AT_TI_symbol_name("s")
	.dwattr $C$DW$21, DW_AT_type(*$C$DW$T$41)
	.dwattr $C$DW$21, DW_AT_location[DW_OP_breg1 246]

$C$DW$22	.dwtag  DW_TAG_variable
	.dwattr $C$DW$22, DW_AT_name("hashV")
	.dwattr $C$DW$22, DW_AT_TI_symbol_name("hashV")
	.dwattr $C$DW$22, DW_AT_type(*$C$DW$T$41)
	.dwattr $C$DW$22, DW_AT_location[DW_OP_breg1 278]

	.dwcfi	cfa_offset, 4
	.dwcfi	save_reg_to_mem, 16, -4
        SUBA      #310,SP               ; []
	.dwcfi	cfa_offset, 314
	.dwpsn	file "../main.c",line 13,column 9,is_stmt,isa 0
        MOV.W     #23168,&WDTCTL+0      ; [] |13|
	.dwpsn	file "../main.c",line 14,column 9,is_stmt,isa 0
        BIC.W     #1,&PM5CTL0+0         ; [] |14|
	.dwpsn	file "../main.c",line 17,column 9,is_stmt,isa 0
        MOV.B     #165,&CSCTL0_H+0      ; [] |17|
	.dwpsn	file "../main.c",line 18,column 9,is_stmt,isa 0
        MOV.W     #12,&CSCTL1+0         ; [] |18|
	.dwpsn	file "../main.c",line 19,column 9,is_stmt,isa 0
        MOV.W     #307,&CSCTL2+0        ; [] |19|
	.dwpsn	file "../main.c",line 21,column 9,is_stmt,isa 0
        MOV.W     #0,&CSCTL3+0          ; [] |21|
	.dwpsn	file "../main.c",line 22,column 9,is_stmt,isa 0
        MOV.B     #0,&CSCTL0_H+0        ; [] |22|
	.dwpsn	file "../main.c",line 24,column 23,is_stmt,isa 0
        MOVX.A    SP,r12                ; [] |24|
        ADDX.A    #6,r12                ; [] |24|
        MOVX.A    #$P$T0$1+0,r13        ; [] |24|
        MOV.W     #240,r14              ; [] |24|
$C$DW$23	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$23, DW_AT_low_pc(0x00)
	.dwattr $C$DW$23, DW_AT_name("memcpy")
	.dwattr $C$DW$23, DW_AT_TI_call

        CALLA     #memcpy               ; [] |24|
                                          ; [] |24|
	.dwpsn	file "../main.c",line 114,column 9,is_stmt,isa 0
        MOVX.A    SP,0(SP)              ; [] |114|
        ADDX.A    #6,0(SP)              ; [] |114|
        MOV.W     #240,4(SP)            ; [] |114|
        MOVX.A    SP,r12                ; [] |114|
        ADDX.A    #246,r12              ; [] |114|
        MOV.W     #32,r13               ; [] |114|
        MOV.W     #0,r14                ; [] |114|
        MOV.W     #0,r15                ; [] |114|
$C$DW$24	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$24, DW_AT_low_pc(0x00)
	.dwattr $C$DW$24, DW_AT_name("blake2s")
	.dwattr $C$DW$24, DW_AT_TI_call

        CALLA     #blake2s              ; [] |114|
                                          ; [] |114|
	.dwpsn	file "../main.c",line 119,column 9,is_stmt,isa 0
        MOVX.A    SP,r12                ; [] |119|
        ADDX.A    #278,r12              ; [] |119|
        MOVX.A    SP,r13                ; [] |119|
        ADDX.A    #246,r13              ; [] |119|
        MOV.W     #32,r14               ; [] |119|
$C$DW$25	.dwtag  DW_TAG_TI_branch
	.dwattr $C$DW$25, DW_AT_low_pc(0x00)
	.dwattr $C$DW$25, DW_AT_name("memcpy")
	.dwattr $C$DW$25, DW_AT_TI_call

        CALLA     #memcpy               ; [] |119|
                                          ; [] |119|
;* --------------------------------------------------------------------------*
;*   BEGIN LOOP $C$L1
;*
;*   Loop source line                : 121
;*   Loop closing brace source line  : 121
;*   Known Minimum Trip Count        : 1
;*   Known Maximum Trip Count        : 4294967295
;*   Known Max Trip Count Factor     : 1
;* --------------------------------------------------------------------------*
$C$L1:
	.dwpsn	file "../main.c",line 121,column 15,is_stmt,isa 0
        JMP       $C$L1                 ; [] |121|
                                          ; [] |121|
        NOP       ; []
	.dwattr $C$DW$19, DW_AT_TI_end_file("../main.c")
	.dwattr $C$DW$19, DW_AT_TI_end_line(0x7a)
	.dwattr $C$DW$19, DW_AT_TI_end_column(0x01)
	.dwendentry
	.dwendtag $C$DW$19

;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	blake2s
	.global	CSCTL0_H
	.global	CSCTL1
	.global	CSCTL2
	.global	CSCTL3
	.global	PM5CTL0
	.global	WDTCTL
	.global	memcpy

;******************************************************************************
;* BUILD ATTRIBUTES                                                           *
;******************************************************************************
	.battr "TI", Tag_File, 1, Tag_LOCKIO_INFO(2)
	.battr "TI", Tag_File, 1, Tag_WAITSTATE_INFO(1)
	.battr "TI", Tag_File, 1, Tag_HW_MPY_ISR_INFO(1)
	.battr "TI", Tag_File, 1, Tag_HW_MPY_INLINE_INFO(2)
	.battr "mspabi", Tag_File, 1, Tag_enum_size(3)

;******************************************************************************
;* TYPE INFORMATION                                                           *
;******************************************************************************

$C$DW$T$25	.dwtag  DW_TAG_structure_type
	.dwattr $C$DW$T$25, DW_AT_byte_size(0x6c)
$C$DW$26	.dwtag  DW_TAG_member
	.dwattr $C$DW$26, DW_AT_type(*$C$DW$T$20)
	.dwattr $C$DW$26, DW_AT_name("b")
	.dwattr $C$DW$26, DW_AT_TI_symbol_name("b")
	.dwattr $C$DW$26, DW_AT_data_member_location[DW_OP_plus_uconst 0x0]
	.dwattr $C$DW$26, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$26, DW_AT_decl_file("..\blake2s.h")
	.dwattr $C$DW$26, DW_AT_decl_line(0x0c)
	.dwattr $C$DW$26, DW_AT_decl_column(0x0d)

$C$DW$27	.dwtag  DW_TAG_member
	.dwattr $C$DW$27, DW_AT_type(*$C$DW$T$22)
	.dwattr $C$DW$27, DW_AT_name("h")
	.dwattr $C$DW$27, DW_AT_TI_symbol_name("h")
	.dwattr $C$DW$27, DW_AT_data_member_location[DW_OP_plus_uconst 0x40]
	.dwattr $C$DW$27, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$27, DW_AT_decl_file("..\blake2s.h")
	.dwattr $C$DW$27, DW_AT_decl_line(0x0d)
	.dwattr $C$DW$27, DW_AT_decl_column(0x0e)

$C$DW$28	.dwtag  DW_TAG_member
	.dwattr $C$DW$28, DW_AT_type(*$C$DW$T$23)
	.dwattr $C$DW$28, DW_AT_name("t")
	.dwattr $C$DW$28, DW_AT_TI_symbol_name("t")
	.dwattr $C$DW$28, DW_AT_data_member_location[DW_OP_plus_uconst 0x60]
	.dwattr $C$DW$28, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$28, DW_AT_decl_file("..\blake2s.h")
	.dwattr $C$DW$28, DW_AT_decl_line(0x0e)
	.dwattr $C$DW$28, DW_AT_decl_column(0x0e)

$C$DW$29	.dwtag  DW_TAG_member
	.dwattr $C$DW$29, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$29, DW_AT_name("c")
	.dwattr $C$DW$29, DW_AT_TI_symbol_name("c")
	.dwattr $C$DW$29, DW_AT_data_member_location[DW_OP_plus_uconst 0x68]
	.dwattr $C$DW$29, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$29, DW_AT_decl_file("..\blake2s.h")
	.dwattr $C$DW$29, DW_AT_decl_line(0x0f)
	.dwattr $C$DW$29, DW_AT_decl_column(0x0c)

$C$DW$30	.dwtag  DW_TAG_member
	.dwattr $C$DW$30, DW_AT_type(*$C$DW$T$24)
	.dwattr $C$DW$30, DW_AT_name("outlen")
	.dwattr $C$DW$30, DW_AT_TI_symbol_name("outlen")
	.dwattr $C$DW$30, DW_AT_data_member_location[DW_OP_plus_uconst 0x6a]
	.dwattr $C$DW$30, DW_AT_accessibility(DW_ACCESS_public)
	.dwattr $C$DW$30, DW_AT_decl_file("..\blake2s.h")
	.dwattr $C$DW$30, DW_AT_decl_line(0x10)
	.dwattr $C$DW$30, DW_AT_decl_column(0x0c)

	.dwattr $C$DW$T$25, DW_AT_decl_file("..\blake2s.h")
	.dwattr $C$DW$T$25, DW_AT_decl_line(0x0b)
	.dwattr $C$DW$T$25, DW_AT_decl_column(0x10)
	.dwendtag $C$DW$T$25

$C$DW$T$26	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$26, DW_AT_name("blake2s_ctx")
	.dwattr $C$DW$T$26, DW_AT_type(*$C$DW$T$25)
	.dwattr $C$DW$T$26, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$26, DW_AT_decl_file("..\blake2s.h")
	.dwattr $C$DW$T$26, DW_AT_decl_line(0x11)
	.dwattr $C$DW$T$26, DW_AT_decl_column(0x03)

$C$DW$T$2	.dwtag  DW_TAG_unspecified_type
	.dwattr $C$DW$T$2, DW_AT_name("void")

$C$DW$T$3	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$3, DW_AT_type(*$C$DW$T$2)
	.dwattr $C$DW$T$3, DW_AT_address_class(0x14)

$C$DW$31	.dwtag  DW_TAG_TI_far_type
	.dwattr $C$DW$31, DW_AT_type(*$C$DW$T$2)

$C$DW$T$27	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$27, DW_AT_type(*$C$DW$31)

$C$DW$T$28	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$28, DW_AT_type(*$C$DW$T$27)
	.dwattr $C$DW$T$28, DW_AT_address_class(0x14)


$C$DW$T$30	.dwtag  DW_TAG_subroutine_type
	.dwattr $C$DW$T$30, DW_AT_language(DW_LANG_C)
	.dwendtag $C$DW$T$30

$C$DW$T$31	.dwtag  DW_TAG_pointer_type
	.dwattr $C$DW$T$31, DW_AT_type(*$C$DW$T$30)
	.dwattr $C$DW$T$31, DW_AT_address_class(0x14)

$C$DW$T$32	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$32, DW_AT_name("__SFR_FARPTR")
	.dwattr $C$DW$T$32, DW_AT_type(*$C$DW$T$31)
	.dwattr $C$DW$T$32, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$32, DW_AT_decl_file("D:\ti\ccsv7\ccs_base\msp430\include\msp430fr5969.h")
	.dwattr $C$DW$T$32, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$T$32, DW_AT_decl_column(0x11)

$C$DW$T$4	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$4, DW_AT_encoding(DW_ATE_boolean)
	.dwattr $C$DW$T$4, DW_AT_name("bool")
	.dwattr $C$DW$T$4, DW_AT_byte_size(0x01)

$C$DW$T$5	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$5, DW_AT_encoding(DW_ATE_signed_char)
	.dwattr $C$DW$T$5, DW_AT_name("signed char")
	.dwattr $C$DW$T$5, DW_AT_byte_size(0x01)

$C$DW$T$33	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$33, DW_AT_name("int8_t")
	.dwattr $C$DW$T$33, DW_AT_type(*$C$DW$T$5)
	.dwattr $C$DW$T$33, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$33, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$33, DW_AT_decl_line(0x2a)
	.dwattr $C$DW$T$33, DW_AT_decl_column(0x1e)

$C$DW$T$34	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$34, DW_AT_name("int_least8_t")
	.dwattr $C$DW$T$34, DW_AT_type(*$C$DW$T$33)
	.dwattr $C$DW$T$34, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$34, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$34, DW_AT_decl_line(0x37)
	.dwattr $C$DW$T$34, DW_AT_decl_column(0x17)

$C$DW$T$6	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$6, DW_AT_encoding(DW_ATE_unsigned_char)
	.dwattr $C$DW$T$6, DW_AT_name("unsigned char")
	.dwattr $C$DW$T$6, DW_AT_byte_size(0x01)

$C$DW$32	.dwtag  DW_TAG_TI_far_type
	.dwattr $C$DW$32, DW_AT_type(*$C$DW$T$6)

$C$DW$T$35	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$35, DW_AT_type(*$C$DW$32)

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
$C$DW$33	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$33, DW_AT_upper_bound(0x3f)

	.dwendtag $C$DW$T$20


$C$DW$T$41	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$41, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$T$41, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$41, DW_AT_byte_size(0x20)
$C$DW$34	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$34, DW_AT_upper_bound(0x1f)

	.dwendtag $C$DW$T$41

$C$DW$35	.dwtag  DW_TAG_TI_far_type
	.dwattr $C$DW$35, DW_AT_type(*$C$DW$T$19)

$C$DW$T$42	.dwtag  DW_TAG_const_type
	.dwattr $C$DW$T$42, DW_AT_type(*$C$DW$35)


$C$DW$T$43	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$43, DW_AT_type(*$C$DW$T$42)
	.dwattr $C$DW$T$43, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$43, DW_AT_byte_size(0xf0)
$C$DW$36	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$36, DW_AT_upper_bound(0xef)

	.dwendtag $C$DW$T$43

$C$DW$T$44	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$44, DW_AT_name("uint_least8_t")
	.dwattr $C$DW$T$44, DW_AT_type(*$C$DW$T$19)
	.dwattr $C$DW$T$44, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$44, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$44, DW_AT_decl_line(0x38)
	.dwattr $C$DW$T$44, DW_AT_decl_column(0x16)

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

$C$DW$T$47	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$47, DW_AT_name("int16_t")
	.dwattr $C$DW$T$47, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$T$47, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$47, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$47, DW_AT_decl_line(0x2c)
	.dwattr $C$DW$T$47, DW_AT_decl_column(0x1d)

$C$DW$T$48	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$48, DW_AT_name("int_fast16_t")
	.dwattr $C$DW$T$48, DW_AT_type(*$C$DW$T$47)
	.dwattr $C$DW$T$48, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$48, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$48, DW_AT_decl_line(0x47)
	.dwattr $C$DW$T$48, DW_AT_decl_column(0x17)

$C$DW$T$49	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$49, DW_AT_name("int_fast8_t")
	.dwattr $C$DW$T$49, DW_AT_type(*$C$DW$T$47)
	.dwattr $C$DW$T$49, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$49, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$49, DW_AT_decl_line(0x45)
	.dwattr $C$DW$T$49, DW_AT_decl_column(0x17)

$C$DW$T$50	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$50, DW_AT_name("int_least16_t")
	.dwattr $C$DW$T$50, DW_AT_type(*$C$DW$T$47)
	.dwattr $C$DW$T$50, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$50, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$50, DW_AT_decl_line(0x3a)
	.dwattr $C$DW$T$50, DW_AT_decl_column(0x17)

$C$DW$T$51	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$51, DW_AT_name("ptrdiff_t")
	.dwattr $C$DW$T$51, DW_AT_type(*$C$DW$T$10)
	.dwattr $C$DW$T$51, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$51, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stddef.h")
	.dwattr $C$DW$T$51, DW_AT_decl_line(0x36)
	.dwattr $C$DW$T$51, DW_AT_decl_column(0x1c)

$C$DW$T$11	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$11, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$11, DW_AT_name("unsigned int")
	.dwattr $C$DW$T$11, DW_AT_byte_size(0x02)

$C$DW$37	.dwtag  DW_TAG_TI_far_type
	.dwattr $C$DW$37, DW_AT_type(*$C$DW$T$11)

$C$DW$T$52	.dwtag  DW_TAG_volatile_type
	.dwattr $C$DW$T$52, DW_AT_type(*$C$DW$37)

$C$DW$T$24	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$24, DW_AT_name("size_t")
	.dwattr $C$DW$T$24, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$24, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$24, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stddef.h")
	.dwattr $C$DW$T$24, DW_AT_decl_line(0x3a)
	.dwattr $C$DW$T$24, DW_AT_decl_column(0x19)

$C$DW$T$53	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$53, DW_AT_name("uint16_t")
	.dwattr $C$DW$T$53, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$53, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$53, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$53, DW_AT_decl_line(0x2d)
	.dwattr $C$DW$T$53, DW_AT_decl_column(0x1c)

$C$DW$T$54	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$54, DW_AT_name("uint_fast16_t")
	.dwattr $C$DW$T$54, DW_AT_type(*$C$DW$T$53)
	.dwattr $C$DW$T$54, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$54, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$54, DW_AT_decl_line(0x48)
	.dwattr $C$DW$T$54, DW_AT_decl_column(0x16)

$C$DW$T$55	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$55, DW_AT_name("uint_fast8_t")
	.dwattr $C$DW$T$55, DW_AT_type(*$C$DW$T$53)
	.dwattr $C$DW$T$55, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$55, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$55, DW_AT_decl_line(0x46)
	.dwattr $C$DW$T$55, DW_AT_decl_column(0x16)

$C$DW$T$56	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$56, DW_AT_name("uint_least16_t")
	.dwattr $C$DW$T$56, DW_AT_type(*$C$DW$T$53)
	.dwattr $C$DW$T$56, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$56, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$56, DW_AT_decl_line(0x3b)
	.dwattr $C$DW$T$56, DW_AT_decl_column(0x16)

$C$DW$T$57	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$57, DW_AT_name("wchar_t")
	.dwattr $C$DW$T$57, DW_AT_type(*$C$DW$T$11)
	.dwattr $C$DW$T$57, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$57, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stddef.h")
	.dwattr $C$DW$T$57, DW_AT_decl_line(0x41)
	.dwattr $C$DW$T$57, DW_AT_decl_column(0x1a)

$C$DW$T$12	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$12, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$12, DW_AT_name("long")
	.dwattr $C$DW$T$12, DW_AT_byte_size(0x04)

$C$DW$T$58	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$58, DW_AT_name("int32_t")
	.dwattr $C$DW$T$58, DW_AT_type(*$C$DW$T$12)
	.dwattr $C$DW$T$58, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$58, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$58, DW_AT_decl_line(0x2e)
	.dwattr $C$DW$T$58, DW_AT_decl_column(0x1d)

$C$DW$T$59	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$59, DW_AT_name("int_fast32_t")
	.dwattr $C$DW$T$59, DW_AT_type(*$C$DW$T$58)
	.dwattr $C$DW$T$59, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$59, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$59, DW_AT_decl_line(0x4a)
	.dwattr $C$DW$T$59, DW_AT_decl_column(0x17)

$C$DW$T$60	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$60, DW_AT_name("int_least32_t")
	.dwattr $C$DW$T$60, DW_AT_type(*$C$DW$T$58)
	.dwattr $C$DW$T$60, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$60, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$60, DW_AT_decl_line(0x3c)
	.dwattr $C$DW$T$60, DW_AT_decl_column(0x17)

$C$DW$T$61	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$61, DW_AT_name("intptr_t")
	.dwattr $C$DW$T$61, DW_AT_type(*$C$DW$T$12)
	.dwattr $C$DW$T$61, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$61, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$61, DW_AT_decl_line(0x55)
	.dwattr $C$DW$T$61, DW_AT_decl_column(0x1b)

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
$C$DW$38	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$38, DW_AT_upper_bound(0x07)

	.dwendtag $C$DW$T$22


$C$DW$T$23	.dwtag  DW_TAG_array_type
	.dwattr $C$DW$T$23, DW_AT_type(*$C$DW$T$21)
	.dwattr $C$DW$T$23, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$23, DW_AT_byte_size(0x08)
$C$DW$39	.dwtag  DW_TAG_subrange_type
	.dwattr $C$DW$39, DW_AT_upper_bound(0x01)

	.dwendtag $C$DW$T$23

$C$DW$T$62	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$62, DW_AT_name("uint_fast32_t")
	.dwattr $C$DW$T$62, DW_AT_type(*$C$DW$T$21)
	.dwattr $C$DW$T$62, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$62, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$62, DW_AT_decl_line(0x4b)
	.dwattr $C$DW$T$62, DW_AT_decl_column(0x16)

$C$DW$T$63	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$63, DW_AT_name("uint_least32_t")
	.dwattr $C$DW$T$63, DW_AT_type(*$C$DW$T$21)
	.dwattr $C$DW$T$63, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$63, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$63, DW_AT_decl_line(0x3d)
	.dwattr $C$DW$T$63, DW_AT_decl_column(0x16)

$C$DW$T$64	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$64, DW_AT_name("uintptr_t")
	.dwattr $C$DW$T$64, DW_AT_type(*$C$DW$T$13)
	.dwattr $C$DW$T$64, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$64, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$64, DW_AT_decl_line(0x56)
	.dwattr $C$DW$T$64, DW_AT_decl_column(0x1b)

$C$DW$T$14	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$14, DW_AT_encoding(DW_ATE_signed)
	.dwattr $C$DW$T$14, DW_AT_name("long long")
	.dwattr $C$DW$T$14, DW_AT_byte_size(0x08)

$C$DW$T$65	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$65, DW_AT_name("int64_t")
	.dwattr $C$DW$T$65, DW_AT_type(*$C$DW$T$14)
	.dwattr $C$DW$T$65, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$65, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$65, DW_AT_decl_line(0x32)
	.dwattr $C$DW$T$65, DW_AT_decl_column(0x21)

$C$DW$T$66	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$66, DW_AT_name("int_fast64_t")
	.dwattr $C$DW$T$66, DW_AT_type(*$C$DW$T$65)
	.dwattr $C$DW$T$66, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$66, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$66, DW_AT_decl_line(0x4e)
	.dwattr $C$DW$T$66, DW_AT_decl_column(0x17)

$C$DW$T$67	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$67, DW_AT_name("int_least64_t")
	.dwattr $C$DW$T$67, DW_AT_type(*$C$DW$T$65)
	.dwattr $C$DW$T$67, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$67, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$67, DW_AT_decl_line(0x40)
	.dwattr $C$DW$T$67, DW_AT_decl_column(0x17)

$C$DW$T$68	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$68, DW_AT_name("intmax_t")
	.dwattr $C$DW$T$68, DW_AT_type(*$C$DW$T$14)
	.dwattr $C$DW$T$68, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$68, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$68, DW_AT_decl_line(0x5d)
	.dwattr $C$DW$T$68, DW_AT_decl_column(0x20)

$C$DW$T$15	.dwtag  DW_TAG_base_type
	.dwattr $C$DW$T$15, DW_AT_encoding(DW_ATE_unsigned)
	.dwattr $C$DW$T$15, DW_AT_name("unsigned long long")
	.dwattr $C$DW$T$15, DW_AT_byte_size(0x08)

$C$DW$T$69	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$69, DW_AT_name("uint64_t")
	.dwattr $C$DW$T$69, DW_AT_type(*$C$DW$T$15)
	.dwattr $C$DW$T$69, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$69, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$69, DW_AT_decl_line(0x33)
	.dwattr $C$DW$T$69, DW_AT_decl_column(0x20)

$C$DW$T$70	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$70, DW_AT_name("uint_fast64_t")
	.dwattr $C$DW$T$70, DW_AT_type(*$C$DW$T$69)
	.dwattr $C$DW$T$70, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$70, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$70, DW_AT_decl_line(0x4f)
	.dwattr $C$DW$T$70, DW_AT_decl_column(0x16)

$C$DW$T$71	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$71, DW_AT_name("uint_least64_t")
	.dwattr $C$DW$T$71, DW_AT_type(*$C$DW$T$69)
	.dwattr $C$DW$T$71, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$71, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$71, DW_AT_decl_line(0x41)
	.dwattr $C$DW$T$71, DW_AT_decl_column(0x16)

$C$DW$T$72	.dwtag  DW_TAG_typedef
	.dwattr $C$DW$T$72, DW_AT_name("uintmax_t")
	.dwattr $C$DW$T$72, DW_AT_type(*$C$DW$T$15)
	.dwattr $C$DW$T$72, DW_AT_language(DW_LANG_C)
	.dwattr $C$DW$T$72, DW_AT_decl_file("D:/ti/ccsv7/tools/compiler/ti-cgt-msp430_16.9.3.LTS/include/stdint.h")
	.dwattr $C$DW$T$72, DW_AT_decl_line(0x5e)
	.dwattr $C$DW$T$72, DW_AT_decl_column(0x20)

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

$C$DW$40	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$40, DW_AT_name("PC")
	.dwattr $C$DW$40, DW_AT_location[DW_OP_reg0]

$C$DW$41	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$41, DW_AT_name("SP")
	.dwattr $C$DW$41, DW_AT_location[DW_OP_reg1]

$C$DW$42	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$42, DW_AT_name("SR")
	.dwattr $C$DW$42, DW_AT_location[DW_OP_reg2]

$C$DW$43	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$43, DW_AT_name("CG")
	.dwattr $C$DW$43, DW_AT_location[DW_OP_reg3]

$C$DW$44	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$44, DW_AT_name("r4")
	.dwattr $C$DW$44, DW_AT_location[DW_OP_reg4]

$C$DW$45	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$45, DW_AT_name("r5")
	.dwattr $C$DW$45, DW_AT_location[DW_OP_reg5]

$C$DW$46	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$46, DW_AT_name("r6")
	.dwattr $C$DW$46, DW_AT_location[DW_OP_reg6]

$C$DW$47	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$47, DW_AT_name("r7")
	.dwattr $C$DW$47, DW_AT_location[DW_OP_reg7]

$C$DW$48	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$48, DW_AT_name("r8")
	.dwattr $C$DW$48, DW_AT_location[DW_OP_reg8]

$C$DW$49	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$49, DW_AT_name("r9")
	.dwattr $C$DW$49, DW_AT_location[DW_OP_reg9]

$C$DW$50	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$50, DW_AT_name("r10")
	.dwattr $C$DW$50, DW_AT_location[DW_OP_reg10]

$C$DW$51	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$51, DW_AT_name("r11")
	.dwattr $C$DW$51, DW_AT_location[DW_OP_reg11]

$C$DW$52	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$52, DW_AT_name("r12")
	.dwattr $C$DW$52, DW_AT_location[DW_OP_reg12]

$C$DW$53	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$53, DW_AT_name("r13")
	.dwattr $C$DW$53, DW_AT_location[DW_OP_reg13]

$C$DW$54	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$54, DW_AT_name("r14")
	.dwattr $C$DW$54, DW_AT_location[DW_OP_reg14]

$C$DW$55	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$55, DW_AT_name("r15")
	.dwattr $C$DW$55, DW_AT_location[DW_OP_reg15]

$C$DW$56	.dwtag  DW_TAG_TI_assign_register
	.dwattr $C$DW$56, DW_AT_name("CIE_RETA")
	.dwattr $C$DW$56, DW_AT_location[DW_OP_reg16]

	.dwendtag $C$DW$CU



;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack

;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET



