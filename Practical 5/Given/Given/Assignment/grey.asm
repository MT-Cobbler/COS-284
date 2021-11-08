segment .data
    fd : dd 0
    name : db "sample.txt", 0
    msg db "Nothing"
segment .text
    extern open
    lea rdi , [name];pathname
    mov rsi , 1 ;read-write create
    mov rdx , 1 ;read-write for me
    call open
    cmp eax , 0
    jl error ; failed to open
    mov [fd], eax
    call end
open:
    mov rax, 1
    mov rbx, 1
    mov rsi, msg
    mov rdi, 7
    syscall
    ret
error:
    mov rax, 1
    mov rbx, 1
    mov rsi, msg
    mov rdi, 7
    syscall
    ret

end:
    mov	eax,1             ;system call number (sys_exit)
    int	0x80              ;call kernel
