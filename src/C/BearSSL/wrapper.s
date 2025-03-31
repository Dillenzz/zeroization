	.file	"wrapper.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	bearssl_secure_erase
	.type	bearssl_secure_erase, @function
bearssl_secure_erase:
.LFB128:
	.cfi_startproc
	endbr64
	test	rsi, rsi
	je	.L1
	add	rsi, rdi
	.p2align 4,,10
	.p2align 3
.L3:
	mov	rax, rdi
	add	rdi, 1
	mov	BYTE PTR [rax], 0
	cmp	rsi, rdi
	jne	.L3
.L1:
	ret
	.cfi_endproc
.LFE128:
	.size	bearssl_secure_erase, .-bearssl_secure_erase
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"SHA-256 computed."
	.text
	.p2align 4
	.globl	bearssl_sha256
	.type	bearssl_sha256, @function
bearssl_sha256:
.LFB127:
	.cfi_startproc
	endbr64
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	mov	r12, rsi
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	mov	rbx, rdi
	sub	rsp, 160
	.cfi_def_cfa_offset 192
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 152[rsp], rax
	xor	eax, eax
	mov	rbp, rsp
	mov	rdi, rbp
	call	br_sha256_init@PLT
	mov	rdx, r12
	mov	rsi, rbx
	mov	rdi, rbp
	call	br_sha224_update@PLT
	mov	rdi, rbp
	lea	rsi, 112[rsp]
	call	br_sha256_out@PLT
	movdqa	xmm0, XMMWORD PTR 112[rsp]
	movdqa	xmm1, XMMWORD PTR 128[rsp]
	lea	rdi, .LC0[rip]
	movups	XMMWORD PTR [rbx], xmm0
	movups	XMMWORD PTR 16[rbx], xmm1
	call	puts@PLT
	mov	rax, QWORD PTR 152[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L12
	add	rsp, 160
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
.L12:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE127:
	.size	bearssl_sha256, .-bearssl_sha256
	.section	.rodata.str1.1
.LC1:
	.string	"\n=== Testing: %s ===\n"
.LC2:
	.string	"Before operation: %s\n"
.LC3:
	.string	"After operation: %s\n"
	.text
	.p2align 4
	.globl	test_crypto
	.type	test_crypto, @function
test_crypto:
.LFB129:
	.cfi_startproc
	endbr64
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	mov	rbp, rdi
	mov	edi, 2
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	mov	rbx, rsi
	lea	rsi, .LC1[rip]
	sub	rsp, 48
	.cfi_def_cfa_offset 80
	movdqa	xmm0, XMMWORD PTR .LC4[rip]
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 40[rsp], rax
	xor	eax, eax
	mov	r12, rsp
	mov	QWORD PTR 16[rsp], 1702060402
	mov	QWORD PTR 24[rsp], 0
	movaps	XMMWORD PTR [rsp], xmm0
	call	__printf_chk@PLT
	xor	eax, eax
	mov	rdx, r12
	mov	edi, 2
	lea	rsi, .LC2[rip]
	call	__printf_chk@PLT
	test	rbp, rbp
	je	.L14
	mov	esi, 32
	mov	rdi, r12
	call	rbp
.L14:
	xor	eax, eax
	mov	rdx, r12
	mov	edi, 2
	lea	rsi, .LC3[rip]
	call	__printf_chk@PLT
	test	rbx, rbx
	je	.L13
	mov	esi, 32
	mov	rdi, r12
	call	rbx
.L13:
	mov	rax, QWORD PTR 40[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L24
	add	rsp, 48
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
.L24:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE129:
	.size	test_crypto, .-test_crypto
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC5:
	.string	"BearSSL SHA-256 & Secure Erase"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB130:
	.cfi_startproc
	endbr64
	sub	rsp, 8
	.cfi_def_cfa_offset 16
	lea	rdx, .LC5[rip]
	lea	rsi, bearssl_secure_erase[rip]
	lea	rdi, bearssl_sha256[rip]
	call	test_crypto
	xor	eax, eax
	add	rsp, 8
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE130:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC4:
	.quad	8532478965287118163
	.quad	5003310488573002853
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
