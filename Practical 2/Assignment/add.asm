section .data
	msg1 db "Please input the first number: "
    msg2 db "Please input the second number: "
    blank db '', 0xA
	dividand db 10
	integ dq 0
	res dq 0
	remain dq 0
	num1 dq 0
	num2 dq 0

section .text
	global _start
    
_start
    mov rax, 1
	mov rdi, 1
	mov rsi, msg1
	mov rdx, 31
	syscall
	
    mov rax, 0
	mov rdi, 0
	mov rsi, num1
	mov rdx, 2
	syscall

    mov rax, 1
	mov rdi, 1
	mov rsi, msg2
	mov rdx, 32
	syscall

    mov rax, 0
	mov rdi, 0
	mov rsi, num2
	mov rdx, 2
	syscall
    
    mov rbx, [num1]
	sub rbx, 48
	mov rax, [num2]
	sub rax, 48
	add rbx, rax
	mov [res], rbx

	mov rax, [res]              ; this needs to be divided
	mov rdx, 0                  ; 0 out rdx, so rdx:rax == rax
	idiv qword [dividand]       ; divide by y
	mov [integ], rax            ; store the integient
	mov [remain], rdx
	xor rbx, rbx
	syscall

    ; print a 0
    mov rax, 1
	mov rdi, 1
	mov rbx, [integ]
	add rbx, 48
	mov [integ], rbx
	mov rsi, integ
	mov rdx, 2
	syscall

    ; print value
    mov rax, 1
	mov rdi, 1
	mov rbx, [remain]
	add rbx, 48
	mov [remain], rbx
	mov rsi, remain
	mov rdx, 1
	syscall

    ; print new line
    mov rax, 1
    mov rdi, 1
    mov rsi, blank
    mov rdx, 1

    syscall
    mov eax, 1
    mov ebx, 0
    int 0x80