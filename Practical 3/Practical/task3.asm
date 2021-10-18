segment .data
    message db "The result: "
    num db 0
segment .text
    global _start

_start
    mov rcx, 0
    mov rbx, 5
    mov r8, 0
    Start:
        cmp rbx, 0
        jz End
        inc r8
        add rcx, r8
        dec rbx
        jmp Start

    End:
        sub rcx, 1
        mov [num], rcx
        syscall

        mov rax, 1
        mov rdi, 1
        mov rsi, message
        mov rdx, 12
        syscall

        mov rdx, 6
        lea rsi, [num]
        mov rax, 1
        mov rdi, 1
        syscall
    
        mov eax, 1
        mov ebx, 0
        int 0x80


    

