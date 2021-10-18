section .data
    pMsg          db 'Please input a 5 digit number: ', 31
    outMsg         db 'This is the number you are looking for: ',40
    numOne         db 12345
    blank           db '', 0xA
section .text
	global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, pMsg
    mov edx, 31
    syscall

    mov eax, 3
    mov ebx, 1
    mov ecx, numOne
    mov edx, 6
    syscall

    mov eax, 4
    mov ebx, 1
    mov ecx, outMsg
    mov edx, 40
    syscall

	mov eax, 4	
	mov ebx, 1
	mov ecx, numOne	
	mov edx, 9	
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