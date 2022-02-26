	.text
	.file	"c.c"
	.globl	iter_accum                      # -- Begin function iter_accum
	.p2align	4, 0x90
	.type	iter_accum,@function
iter_accum:                             # @iter_accum
	.cfi_startproc
# %bb.0:
	testq	%rsi, %rsi
	je	.LBB0_1
# %bb.2:
	cmpq	$8, %rsi
	jae	.LBB0_4
# %bb.3:
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	jmp	.LBB0_12
.LBB0_1:
	xorl	%eax, %eax
                                        # kill: def $eax killed $eax killed $rax
	retq
.LBB0_4:
	movq	%rsi, %rcx
	andq	$-8, %rcx
	leaq	-8(%rcx), %rdx
	movq	%rdx, %rax
	shrq	$3, %rax
	addq	$1, %rax
	movl	%eax, %r8d
	andl	$3, %r8d
	cmpq	$24, %rdx
	jae	.LBB0_6
# %bb.5:
	pxor	%xmm0, %xmm0
	xorl	%edx, %edx
	pxor	%xmm1, %xmm1
	jmp	.LBB0_8
.LBB0_6:
	andq	$-4, %rax
	negq	%rax
	pxor	%xmm0, %xmm0
	xorl	%edx, %edx
	pxor	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	movdqu	(%rdi,%rdx,4), %xmm2
	paddd	%xmm0, %xmm2
	movdqu	16(%rdi,%rdx,4), %xmm0
	paddd	%xmm1, %xmm0
	movdqu	32(%rdi,%rdx,4), %xmm1
	movdqu	48(%rdi,%rdx,4), %xmm3
	movdqu	64(%rdi,%rdx,4), %xmm4
	paddd	%xmm1, %xmm4
	paddd	%xmm2, %xmm4
	movdqu	80(%rdi,%rdx,4), %xmm2
	paddd	%xmm3, %xmm2
	paddd	%xmm0, %xmm2
	movdqu	96(%rdi,%rdx,4), %xmm0
	paddd	%xmm4, %xmm0
	movdqu	112(%rdi,%rdx,4), %xmm1
	paddd	%xmm2, %xmm1
	addq	$32, %rdx
	addq	$4, %rax
	jne	.LBB0_7
.LBB0_8:
	testq	%r8, %r8
	je	.LBB0_11
# %bb.9:
	leaq	(%rdi,%rdx,4), %rax
	addq	$16, %rax
	shlq	$5, %r8
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB0_10:                               # =>This Inner Loop Header: Depth=1
	movdqu	-16(%rax,%rdx), %xmm2
	paddd	%xmm2, %xmm0
	movdqu	(%rax,%rdx), %xmm2
	paddd	%xmm2, %xmm1
	addq	$32, %rdx
	cmpq	%rdx, %r8
	jne	.LBB0_10
.LBB0_11:
	paddd	%xmm1, %xmm0
	pshufd	$238, %xmm0, %xmm1              # xmm1 = xmm0[2,3,2,3]
	paddd	%xmm0, %xmm1
	pshufd	$85, %xmm1, %xmm0               # xmm0 = xmm1[1,1,1,1]
	paddd	%xmm1, %xmm0
	movd	%xmm0, %eax
	cmpq	%rsi, %rcx
	je	.LBB0_13
	.p2align	4, 0x90
.LBB0_12:                               # =>This Inner Loop Header: Depth=1
	addl	(%rdi,%rcx,4), %eax
	addq	$1, %rcx
	cmpq	%rcx, %rsi
	jne	.LBB0_12
.LBB0_13:
                                        # kill: def $eax killed $eax killed $rax
	retq
.Lfunc_end0:
	.size	iter_accum, .Lfunc_end0-iter_accum
	.cfi_endproc
                                        # -- End function
	.ident	"clang version 13.0.0 (Fedora 13.0.0-3.fc35)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
