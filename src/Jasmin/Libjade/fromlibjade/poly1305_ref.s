	.att_syntax
	.text
	.p2align	5
	.globl	_jade_onetimeauth_poly1305_amd64_ref_verify
	.globl	jade_onetimeauth_poly1305_amd64_ref_verify
	.globl	_jade_onetimeauth_poly1305_amd64_ref
	.globl	jade_onetimeauth_poly1305_amd64_ref
_jade_onetimeauth_poly1305_amd64_ref_verify:
jade_onetimeauth_poly1305_amd64_ref_verify:
	movq	%rsp, %rax
	leaq	-72(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rbx, 16(%rsp)
	movq	%rbp, 24(%rsp)
	movq	%r12, 32(%rsp)
	movq	%r13, 40(%rsp)
	movq	%r14, 48(%rsp)
	movq	%r15, 56(%rsp)
	movq	%rax, 64(%rsp)
	movq	%rdx, %rbx
	movq	%rcx, %rbp
	movq	$0, %r14
	movq	$0, %r12
	movq	$0, %rcx
	movq	(%rbp), %r13
	movq	8(%rbp), %r15
	movq	$1152921487695413247, %rax
	andq	%rax, %r13
	movq	$1152921487695413244, %rax
	andq	%rax, %r15
	movq	%r15, %r8
	shrq	$2, %r8
	addq	%r15, %r8
	addq	$16, %rbp
	jmp 	Ljade_onetimeauth_poly1305_amd64_ref_verify$4
Ljade_onetimeauth_poly1305_amd64_ref_verify$5:
	addq	(%rsi), %r14
	adcq	8(%rsi), %r12
	adcq	$1, %rcx
	movq	%r8, %r11
	imulq	%rcx, %r11
	imulq	%r13, %rcx
	movq	%r13, %rax
	mulq	%r14
	movq	%rax, %r9
	movq	%rdx, %r10
	movq	%r13, %rax
	mulq	%r12
	addq	%rax, %r10
	adcq	%rdx, %rcx
	movq	%r8, %rax
	mulq	%r12
	movq	%rdx, %r12
	addq	%r11, %r12
	movq	%rax, %r11
	movq	%r15, %rax
	mulq	%r14
	addq	%r11, %r9
	adcq	%rax, %r10
	adcq	%rdx, %rcx
	movq	$-4, %r14
	movq	%rcx, %rax
	shrq	$2, %rax
	andq	%rcx, %r14
	addq	%rax, %r14
	andq	$3, %rcx
	addq	%r9, %r14
	adcq	%r10, %r12
	adcq	$0, %rcx
	addq	$16, %rsi
	addq	$-16, %rbx
Ljade_onetimeauth_poly1305_amd64_ref_verify$4:
	cmpq	$16, %rbx
	jnb 	Ljade_onetimeauth_poly1305_amd64_ref_verify$5
	cmpq	$0, %rbx
	jbe 	Ljade_onetimeauth_poly1305_amd64_ref_verify$1
	movq	$0, (%rsp)
	movq	$0, 8(%rsp)
	movq	$0, %rax
	jmp 	Ljade_onetimeauth_poly1305_amd64_ref_verify$2
Ljade_onetimeauth_poly1305_amd64_ref_verify$3:
	movb	(%rsi,%rax), %dl
	movb	%dl, (%rsp,%rax)
	incq	%rax
Ljade_onetimeauth_poly1305_amd64_ref_verify$2:
	cmpq	%rbx, %rax
	jb  	Ljade_onetimeauth_poly1305_amd64_ref_verify$3
	movb	$1, (%rsp,%rax)
	addq	(%rsp), %r14
	adcq	8(%rsp), %r12
	adcq	$0, %rcx
	movq	%r8, %r9
	imulq	%rcx, %r9
	imulq	%r13, %rcx
	movq	%r13, %rax
	mulq	%r14
	movq	%rax, %rsi
	movq	%rdx, %r10
	movq	%r13, %rax
	mulq	%r12
	addq	%rax, %r10
	adcq	%rdx, %rcx
	movq	%r8, %rax
	mulq	%r12
	movq	%rdx, %r12
	addq	%r9, %r12
	movq	%rax, %r8
	movq	%r15, %rax
	mulq	%r14
	addq	%r8, %rsi
	adcq	%rax, %r10
	adcq	%rdx, %rcx
	movq	$-4, %r14
	movq	%rcx, %rax
	shrq	$2, %rax
	andq	%rcx, %r14
	addq	%rax, %r14
	andq	$3, %rcx
	addq	%rsi, %r14
	adcq	%r10, %r12
	adcq	$0, %rcx
Ljade_onetimeauth_poly1305_amd64_ref_verify$1:
	movq	%r14, %rax
	movq	%r12, %rdx
	addq	$5, %rax
	adcq	$0, %rdx
	adcq	$0, %rcx
	shrq	$2, %rcx
	negq	%rcx
	xorq	%r14, %rax
	xorq	%r12, %rdx
	andq	%rcx, %rax
	andq	%rcx, %rdx
	xorq	%r14, %rax
	xorq	%r12, %rdx
	movq	(%rbp), %rcx
	movq	8(%rbp), %rsi
	addq	%rcx, %rax
	adcq	%rsi, %rdx
	movq	%rax, %rcx
	xorq	(%rdi), %rcx
	xorq	8(%rdi), %rdx
	orq 	%rdx, %rcx
	xorq	%rax, %rax
	subq	$1, %rcx
	adcq	$0, %rax
	addq	$-1, %rax
	movq	16(%rsp), %rbx
	movq	24(%rsp), %rbp
	movq	32(%rsp), %r12
	movq	40(%rsp), %r13
	movq	48(%rsp), %r14
	movq	56(%rsp), %r15
	movq	64(%rsp), %rsp
	ret
_jade_onetimeauth_poly1305_amd64_ref:
jade_onetimeauth_poly1305_amd64_ref:
	movq	%rsp, %rax
	leaq	-72(%rsp), %rsp
	andq	$-8, %rsp
	movq	%rbx, 16(%rsp)
	movq	%rbp, 24(%rsp)
	movq	%r12, 32(%rsp)
	movq	%r13, 40(%rsp)
	movq	%r14, 48(%rsp)
	movq	%r15, 56(%rsp)
	movq	%rax, 64(%rsp)
	movq	%rdi, %r14
	movq	%rsi, %r8
	movq	%rdx, %rbx
	movq	$0, %r15
	movq	$0, %r13
	movq	$0, %rbp
	movq	(%rcx), %r12
	movq	8(%rcx), %rsi
	movq	$1152921487695413247, %rax
	andq	%rax, %r12
	movq	$1152921487695413244, %rax
	andq	%rax, %rsi
	movq	%rsi, %rdi
	shrq	$2, %rdi
	addq	%rsi, %rdi
	addq	$16, %rcx
	jmp 	Ljade_onetimeauth_poly1305_amd64_ref$4
Ljade_onetimeauth_poly1305_amd64_ref$5:
	addq	(%r8), %r15
	adcq	8(%r8), %r13
	adcq	$1, %rbp
	movq	%rdi, %r11
	imulq	%rbp, %r11
	imulq	%r12, %rbp
	movq	%r12, %rax
	mulq	%r15
	movq	%rax, %r9
	movq	%rdx, %r10
	movq	%r12, %rax
	mulq	%r13
	addq	%rax, %r10
	adcq	%rdx, %rbp
	movq	%rdi, %rax
	mulq	%r13
	movq	%rdx, %r13
	addq	%r11, %r13
	movq	%rax, %r11
	movq	%rsi, %rax
	mulq	%r15
	addq	%r11, %r9
	adcq	%rax, %r10
	adcq	%rdx, %rbp
	movq	$-4, %r15
	movq	%rbp, %rax
	shrq	$2, %rax
	andq	%rbp, %r15
	addq	%rax, %r15
	andq	$3, %rbp
	addq	%r9, %r15
	adcq	%r10, %r13
	adcq	$0, %rbp
	addq	$16, %r8
	addq	$-16, %rbx
Ljade_onetimeauth_poly1305_amd64_ref$4:
	cmpq	$16, %rbx
	jnb 	Ljade_onetimeauth_poly1305_amd64_ref$5
	cmpq	$0, %rbx
	jbe 	Ljade_onetimeauth_poly1305_amd64_ref$1
	movq	$0, (%rsp)
	movq	$0, 8(%rsp)
	movq	$0, %rax
	jmp 	Ljade_onetimeauth_poly1305_amd64_ref$2
Ljade_onetimeauth_poly1305_amd64_ref$3:
	movb	(%r8,%rax), %dl
	movb	%dl, (%rsp,%rax)
	incq	%rax
Ljade_onetimeauth_poly1305_amd64_ref$2:
	cmpq	%rbx, %rax
	jb  	Ljade_onetimeauth_poly1305_amd64_ref$3
	movb	$1, (%rsp,%rax)
	addq	(%rsp), %r15
	adcq	8(%rsp), %r13
	adcq	$0, %rbp
	movq	%rdi, %r9
	imulq	%rbp, %r9
	imulq	%r12, %rbp
	movq	%r12, %rax
	mulq	%r15
	movq	%rax, %r8
	movq	%rdx, %r10
	movq	%r12, %rax
	mulq	%r13
	addq	%rax, %r10
	adcq	%rdx, %rbp
	movq	%rdi, %rax
	mulq	%r13
	movq	%rdx, %r13
	addq	%r9, %r13
	movq	%rax, %rdi
	movq	%rsi, %rax
	mulq	%r15
	addq	%rdi, %r8
	adcq	%rax, %r10
	adcq	%rdx, %rbp
	movq	$-4, %r15
	movq	%rbp, %rax
	shrq	$2, %rax
	andq	%rbp, %r15
	addq	%rax, %r15
	andq	$3, %rbp
	addq	%r8, %r15
	adcq	%r10, %r13
	adcq	$0, %rbp
Ljade_onetimeauth_poly1305_amd64_ref$1:
	movq	%r15, %rax
	movq	%r13, %rdx
	addq	$5, %rax
	adcq	$0, %rdx
	adcq	$0, %rbp
	shrq	$2, %rbp
	negq	%rbp
	xorq	%r15, %rax
	xorq	%r13, %rdx
	andq	%rbp, %rax
	andq	%rbp, %rdx
	xorq	%r15, %rax
	xorq	%r13, %rdx
	movq	(%rcx), %rsi
	movq	8(%rcx), %rcx
	addq	%rsi, %rax
	adcq	%rcx, %rdx
	movq	%rax, (%r14)
	movq	%rdx, 8(%r14)
	xorq	%rax, %rax
	movq	16(%rsp), %rbx
	movq	24(%rsp), %rbp
	movq	32(%rsp), %r12
	movq	40(%rsp), %r13
	movq	48(%rsp), %r14
	movq	56(%rsp), %r15
	movq	64(%rsp), %rsp
	ret
