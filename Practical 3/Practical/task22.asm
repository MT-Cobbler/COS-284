segment .data
    msg1 db "Please input a number: "
    num db 0
    msg2 db "The result: "
    total db 0
    msg3 db "Damn"
segment .text
    global _start
_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg1
    mov rdx, 23
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, num
    mov rdx, 1000
    syscall

    xor rcx, rcx
    mov rcx, 0
    xor rbx, rbx
    mov rbx, 0
    mov rbx, num
    sub rbx, 48
    mov r8, 0
    mov r9, 1
    Start:
        cmp rbx, 0
        jz End
        add r9, 1
        add r8, r9
        dec rbx
        jmp Start
    End:
        mov rbx, 0
        add rbx, r8
        add rbx, 48
        mov [num], rbx
        
        mov rax, 1
        mov rdi, 1
        mov rsi, num
        mov rdx, 1
        syscall

        mov eax, 1
        mov ebx, 0
        int 0x80
        

