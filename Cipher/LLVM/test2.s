	.file	"test2.bc"
	.text
	.globl	main
	.align	2
	.type	main,@function
main:                                   ; @main
; BB#0:
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	push.w	r9
	push.w	r8
	sub.w	#48, r1
	mov.w	#0, -10(r4)
	mov.w	#0, -12(r4)
	mov.b	#64, -13(r4)
	mov.w	&.Lmain.v+6, -18(r4)
	mov.w	&.Lmain.v+4, -20(r4)
	mov.w	&.Lmain.v+2, -22(r4)
	mov.w	&.Lmain.v, -24(r4)
	mov.w	#0, -26(r4)
	jmp	.LBB0_2
.LBB0_1:                                ;   in Loop: Header=BB0_2 Depth=1
	add.w	#1, -26(r4)
.LBB0_2:                                ; =>This Inner Loop Header: Depth=1
	mov.w	-26(r4), r13
	cmp.w	#100, r13
	mov.w	r2, r12
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	mov.w	#1, r14
	cmp.w	#1, r13
	jge	.LBB0_4
; BB#3:                                 ;   in Loop: Header=BB0_2 Depth=1
	mov.w	#0, r14
.LBB0_4:                                ;   in Loop: Header=BB0_2 Depth=1
	cmp.w	#0, r13
	jeq	.LBB0_6
; BB#5:                                 ;   in Loop: Header=BB0_2 Depth=1
	mov.w	r14, r12
	jmp	.LBB0_7
.LBB0_6:                                ;   in Loop: Header=BB0_2 Depth=1
	and.w	#1, r12
.LBB0_7:                                ;   in Loop: Header=BB0_2 Depth=1
	bit.w	#1, r12
	jeq	.LBB0_1
; BB#8:
	;APP
	 NOP
	;NO_APP
	mov.b	#0, -27(r4)
	mov.w	-24(r4), r12
	mov.w	-22(r4), -30(r4)
	mov.w	r12, -32(r4)
	mov.w	-20(r4), r12
	mov.w	-18(r4), -34(r4)
	mov.w	r12, -36(r4)
	mov.w	#-25033, -38(r4)
	mov.w	#31161, -40(r4)
	mov.w	#-29218, -42(r4)
	mov.w	#28224, -44(r4)
	mov.b	#0, -27(r4)
	jmp	.LBB0_10
.LBB0_9:                                ;   in Loop: Header=BB0_10 Depth=1
	mov.w	-32(r4), r12
	mov.w	r12, r13
	clrc
	rrc.w	r13
	rra.w	r13
	mov.w	-30(r4), r14
	mov.w	r14, r15
	rla.w	r15
	rla.w	r15
	rla.w	r15
	rla.w	r15
	rra.w	r13
	rra.w	r13
	mov.w	r12, r11
	rla.w	r11
	rla.w	r11
	rla.w	r11
	rla.w	r11
	rra.w	r13
	mov.w	r15, r10
	rla.w	r10
	rla.w	r10
	rla.w	r10
	rla.w	r10
	rla.w	r10
	rla.w	r10
	rla.w	r10
	bis.w	r13, r10
	xor.w	r11, r10
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	bis.w	r15, r13
	mov.w	r14, r15
	clrc
	rrc.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	xor.w	r13, r15
	add.w	r12, r10
	addc.w	r14, r15
	mov.w	-44(r4), r12
	mov.w	r12, r13
	clrc
	rrc.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	and.w	#12, r13
	mov.w	-42(r4), r14
	add.w	main.key(r13), r12
	addc.w	main.key+2(r13), r14
	xor.w	r10, r12
	xor.w	r15, r14
	mov.w	-34(r4), r13
	sub.w	r12, -36(r4)
	subc.w	r14, r13
	mov.w	r13, -34(r4)
	mov.w	-44(r4), r12
	mov.w	-38(r4), r13
	mov.w	-42(r4), r14
	sub.w	-40(r4), r12
	subc.w	r13, r14
	mov.w	r14, -42(r4)
	mov.w	r12, -44(r4)
	mov.w	-36(r4), r13
	mov.w	r13, r15
	clrc
	rrc.w	r15
	rra.w	r15
	mov.w	-34(r4), r11
	mov.w	r11, r10
	rla.w	r10
	rla.w	r10
	rla.w	r10
	rla.w	r10
	rra.w	r15
	rra.w	r15
	mov.w	r13, r9
	rla.w	r9
	rla.w	r9
	rla.w	r9
	rla.w	r9
	rra.w	r15
	mov.w	r10, r8
	rla.w	r8
	rla.w	r8
	rla.w	r8
	rla.w	r8
	rla.w	r8
	rla.w	r8
	rla.w	r8
	bis.w	r15, r8
	xor.w	r9, r8
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	bis.w	r10, r15
	mov.w	r11, r10
	clrc
	rrc.w	r10
	rra.w	r10
	rra.w	r10
	rra.w	r10
	rra.w	r10
	xor.w	r15, r10
	add.w	r13, r8
	addc.w	r11, r10
	mov.w	r12, r13
	and.w	#3, r13
	rla.w	r13
	rla.w	r13
	add.w	main.key(r13), r12
	addc.w	main.key+2(r13), r14
	xor.w	r8, r12
	xor.w	r10, r14
	mov.w	-30(r4), r13
	sub.w	r12, -32(r4)
	subc.w	r14, r13
	mov.w	r13, -30(r4)
	add.b	#1, -27(r4)
.LBB0_10:                               ; =>This Inner Loop Header: Depth=1
	mov.b	-27(r4), r12
	cmp.w	#64, r12
	jlo	.LBB0_9
; BB#11:
	mov.w	-32(r4), r12
	mov.w	-30(r4), -22(r4)
	mov.w	r12, -24(r4)
	mov.w	-36(r4), r12
	mov.w	-34(r4), -18(r4)
	mov.w	r12, -20(r4)
	;APP
	 NOP
	;NO_APP
	mov.w	-24(r4), r12
	mov.w	-22(r4), r13
	mov.w	-20(r4), r14
	mov.w	-18(r4), r15
	mov.w	r15, 8(r1)
	mov.w	r14, 6(r1)
	mov.w	r13, 4(r1)
	mov.w	r12, 2(r1)
	mov.w	#.L.str, 0(r1)
	call	#printf
	mov.w	#0, r14
	mov.w	#0, r15
	add.w	#48, r1
	pop.w	r8
	pop.w	r9
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Ltmp0:
	.size	main, .Ltmp0-main

	.type	.Lmain.v,@object        ; @main.v
	.section	.rodata.cst8,"aM",@progbits,8
	.align	2
.Lmain.v:
	.long	577146120               ; 0x22668d08
	.long	473233709               ; 0x1c34f92d
	.size	.Lmain.v, 8

	.type	main.key,@object        ; @main.key
	.section	.rodata,"a",@progbits
	.align	4
main.key:
	.long	286331153               ; 0x11111111
	.long	572662306               ; 0x22222222
	.long	858993459               ; 0x33333333
	.long	1145324612              ; 0x44444444
	.size	main.key, 16

	.type	.L.str,@object          ; @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d %d\n"
	.size	.L.str, 7


	.ident	"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)"
