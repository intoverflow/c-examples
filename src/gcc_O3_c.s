	.file	"c.c"
	.text
	.p2align 4
	.globl	iter_accum
	.type	iter_accum, @function
iter_accum:
.LFB14:
	.cfi_startproc
	testq	%rsi, %rsi
	je	.L7
	leaq	-1(%rsi), %rax
	cmpq	$2, %rax
	jbe	.L8
	movq	%rsi, %rdx
	movq	%rdi, %rax
	pxor	%xmm0, %xmm0
	shrq	$2, %rdx
	salq	$4, %rdx
	addq	%rdi, %rdx
	.p2align 4,,10
	.p2align 3
.L4:
	movdqu	(%rax), %xmm2
	addq	$16, %rax
	paddd	%xmm2, %xmm0
	cmpq	%rdx, %rax
	jne	.L4
	movdqa	%xmm0, %xmm1
	movq	%rsi, %rdx
	psrldq	$8, %xmm1
	andq	$-4, %rdx
	paddd	%xmm1, %xmm0
	movdqa	%xmm0, %xmm1
	psrldq	$4, %xmm1
	paddd	%xmm1, %xmm0
	movd	%xmm0, %eax
	testb	$3, %sil
	je	.L11
.L3:
	leaq	1(%rdx), %r8
	leaq	0(,%rdx,4), %rcx
	addl	(%rdi,%rdx,4), %eax
	cmpq	%r8, %rsi
	jbe	.L1
	addq	$2, %rdx
	addl	4(%rdi,%rcx), %eax
	cmpq	%rdx, %rsi
	jbe	.L1
	addl	8(%rdi,%rcx), %eax
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	xorl	%eax, %eax
.L1:
	ret
	.p2align 4,,10
	.p2align 3
.L11:
	ret
.L8:
	xorl	%eax, %eax
	xorl	%edx, %edx
	jmp	.L3
	.cfi_endproc
.LFE14:
	.size	iter_accum, .-iter_accum
	.ident	"GCC: (GNU) 11.2.1 20220127 (Red Hat 11.2.1-9)"
	.section	.note.GNU-stack,"",@progbits
