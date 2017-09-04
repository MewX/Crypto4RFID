	.file	"test2opt.bc"
	.text
	.globl	main
	.align	2
	.type	main,@function
main:                                   ; @main
; BB#0:                                 ; %.preheader
	push.w	r4
	mov.w	r1, r4
	mov.w	#0, r14
	mov.w	#0, r15
	pop.w	r4
	ret
.Ltmp0:
	.size	main, .Ltmp0-main


	.ident	"Ubuntu clang version 3.4-1ubuntu3 (tags/RELEASE_34/final) (based on LLVM 3.4)"
