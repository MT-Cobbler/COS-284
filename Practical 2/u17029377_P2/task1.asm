section .data
    pMsg:           db 'Please input a 5 digit number: ', 31
    outMsg:         db 'This is the number you are looking for: ',40
    numOne:         db 0
section .text
	global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, pMsg
    mov edx, 31
    int 0x80

    mov eax, 3
    mov ebx, 1
    mov ecx, numOne
    mov edx, 6
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, outMsg
    mov edx, 40
    int 0x80

	mov eax, 4	
	mov ebx, 1
	mov ecx, numOne	
	mov edx, 6	
	int 0x80
    
    mov eax, 1
    mov ebx, 0
    int 0x80