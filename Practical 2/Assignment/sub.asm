section .data
	msg1 db "Please input the first number: "
    msg2 db "Please input the second number: "
    blank db '', 0xA
	total dq 0
	num1 dq 0
	num2 dq 0
    addZero db 0

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
    
    ; do the calculation
    mov rbx, [num1]
	sub rbx, 48
	mov rax, [num2]
	sub rax, 48
	sub rbx, rax
	mov [total], rbx
	xor rbx, rbx
	syscall

    ; print the 0
    mov rax, 1
    mov rdi, 1
    mov rbx, [addZero]
    add rbx, 48
    mov [addZero], rbx
    mov rsi, addZero
    mov rdx, 1
    syscall

    ; print value
    mov rax, 1
	mov rdi, 1
	mov rbx, [total]
	add rbx, 48
	mov [total], rbx
	mov rsi, total
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