section .data
    msg1 db  "Please enter a string: "  
    msg2 db "The length of the string is: "
    num db 0
    length db 0
    string db  ""
    blank db '', 0xA

section .text
    global _start

    _start:
        mov  rax, 1     
        mov  rdi, 1     
        mov  rsi, msg1    
        mov  rdx, 23       
        syscall           

        mov  rax, 0     
        mov  rdi, 0     
        mov  rsi, string  
        mov  rdx, 1100      
        syscall  

        xor rdx,rdx
        xor rcx,rcx
        mov rdx, string
        mov rsi,rdx            

        Start: 
            cmp byte[rsi], 0         
            je endLoop                
            inc rcx                 
            inc rsi                 
            jmp Start

        endLoop:	  
            ; sub rcx, 1
            mov rax, rcx
            xor rdx,rdx
            mov r10,10
            div r10

        add rax, '0'
        add rdx, '0'
        mov r11, rax
        mov r12, rdx
        mov [num], r11
        mov [length], r12
        add rcx, 1

        mov rax,1
        mov rdi,1
        mov rdx, 29
        lea rsi, [msg2]
        syscall 

        mov rax,1
        mov rdi,1
        mov rdx, 1
        lea rsi, [num]
        syscall  

        mov rax,1
        mov rdi,1
        mov rdx, 1
        lea rsi, [length]
        syscall 

    End:
        mov rax, 1
        mov rdi, 1
        mov rsi, blank
        mov rdx, 1
        syscall

        mov eax, 1
        mov ebx, 0
        int 0x80