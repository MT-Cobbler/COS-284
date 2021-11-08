section  .data
    name db "inputfile.txt"
    file_name db 'myfile.txt'
section .bss
    buffer_data dw 500
    fd_out resb 1
    fd_in  resb 1
    info resb  26
section .text
  global _start
_start:
    mov  rax, 2
    mov  rdi, name
    mov  rsi, 0
    mov  rdx, 0777
    syscall

    mov  rdi, rax
    mov  rax, 0
    mov  rsi, buffer_data
    mov  rdx, 500
    syscall

    xor r8, r8
    mov r8, buffer_data

    ;create the file
    mov  rax, 8
    mov  rbx, file_name
    mov  rcx, 0777        ;read, write and execute by all
    int  0x80             ;call kernel
        
    mov [fd_out], eax
        
    ; write into the file
    mov	rdx, 800          ;number of bytes
    mov	rcx, r8         ;message to write
    mov	rbx, [fd_out]    ;file descriptor 
    mov	rax,4            ;system call number (sys_write)
    int	0x80             ;call kernel
        
    ; close the file
    mov rax, 6
    mov rbx, [fd_out]

    mov  rdi, 1
    mov  rsi, buffer_data
    mov  rdx, 800
    mov  rax, 1
    syscall

    mov  rdi, 1
    mov  rsi, r8
    mov  rdx, 800
    mov  rax, 1
    syscall

    mov  rax, 60
    mov  rdi, 0
    syscall