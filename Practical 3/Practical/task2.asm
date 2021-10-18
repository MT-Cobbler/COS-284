segment .data
    length db 0
    msg1 db "Please input a string: "
    msg2 db "The new string is: "
    string db "", 0xA
    blank db '', 0xA
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
    mov rsi, string
    mov rdx, 100
    syscall

    mov r8, string
    mov rcx, 0
    Start:
        cmp byte [r8], 0
        jz endLoop

        cmp byte [r8], 32
        jz increment

        cmp byte[r8], 90
        jl toLower
        jmp toUpper

        toUpper:
            sub byte[r8], 32
            jmp increment

        toLower: 
            add byte[r8], 32
            jmp increment
        
        increment: 
            inc rcx
            add r8, 1
            jmp Start

    endLoop:
        sub rcx, 1
        mov [length], rcx

        mov rax, 1
        mov rdi, 1
        mov rsi, msg2
        mov rdx, 19
        syscall
        
        xor rax,rax
        xor rbx,rbx
        mov rax,1
        mov rdi,1
        mov rdx, [length]
        lea rsi, [string]
        syscall 
    
    mov eax, 1
    mov ebx, 0
    int 0x80

