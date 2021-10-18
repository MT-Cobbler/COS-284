section .data
	msg1 db "Please input the first number: "
    msg2 db "Please input the second number: "
    blank db '', 0xA
	total dq 0
	num1 dq 0
	num2 dq 0
    divid db 10
    deci db ""
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

    ;calculation
    mov r9, [num1]
    sub r9, 48
    mov r10, [num2]
    sub r10, 48
    mov rax, r9
    mul r10

    mov rdx, 0
    xor r11, r11

    mov r11, 10
    mov [divid], r11
    div dword [divid]

    add rax, 48
    add rdx, 48
    mov r12, rax
    mov r13, rdx
    mov [total],r12
    
    mov  rdx, 1             
    mov  rsi, total   
    mov  rax, 1            
    mov  rdi, 1            
    syscall 

    mov [deci], r13
    mov  rdx, 1            
    mov  rsi, deci    
    mov  rax, 1           
    mov  rdi, 1           
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