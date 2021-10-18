segment .data
    msg1 db 'Please input a lowercase character: '
    msg2 db 'In uppercase: '
    blank db '', 0xA
    value db 1
    upCase db ''
; segment .bss
;     value resb 1

segment .text   
    global _start

_start
    ;print message
    mov rax, 1
    mov rdi, 1
    mov rsi, msg1
    mov rdx, 36
    syscall

    ;get the value
    mov rax, 0 
    mov rdi, 0
    mov rsi, value
    mov rdx, 1
    syscall

    ; Print message 2
    mov rax, 1
    mov rdi, 1
    mov rsi, msg2
    mov rdx, 14
    syscall

    ;to uppercase
    mov rbx, [value]
    sub rbx, '0'
    sub rbx, 32
    add rbx, '0'
    mov [value], rbx
    syscall

    ; print new value
    mov rax, 1
    mov rdi, 1
    mov rsi, value
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