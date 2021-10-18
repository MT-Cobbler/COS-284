section .data
	msg1 db 'Please input the first number: '
    msg2 db 'Please input the second number: '
    blank db '', 0xA
section .bss
	num1 resb 1
	num2 resb 1
	total  resb 1

section .text
	global _start
_start:
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

    mov rbx, [num1]         ; move value to rbx
	sub rbx, 48             ; add 48
	mov rax, [num2]         ; move vaule to rax
	sub rax, 48             ; add 48
	add rbx, rax            ; add num1 and num2
	mov [total], rbx        ; move the result into total
	xor rbx, rbx            ; keep it under 10
    syscall

    mov rax, 1
	mov rdi, 1
	mov rbx, [total]
	add rbx, 48
	mov [total], rbx
	mov rsi, total
	mov rdx, 1
    syscall
    
    mov rax, 1
    mov rdi, 1
    mov rsi, blank
    mov rdx, 1
    syscall
    int 80h
	


	