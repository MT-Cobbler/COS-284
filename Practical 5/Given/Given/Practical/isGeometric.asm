section .data
              
section .bss

number resb 8 

section .text
GLOBAL isGeometric

isGeometric:

    push rbp
    mov rbp, rsp

    ptr equ 0 
    val equ 8 

    sub rsp, 32 ; 
    mov [rsp  +ptr], rdi  

    mov r8, [rsp + ptr]
    movsd xmm2, qword[r8]   

    movsd xmm3, qword[r8 + 8]  
    divsd xmm3, xmm2   

    mov rcx,0 
    sub rsi,1
    for:
        cmp rsi, rcx
        jz end 

        movsd xmm1, qword[r8 + 8 * rcx]
        inc rcx
        movsd xmm2, qword[r8 + 8 * rcx]
        divsd xmm2, xmm1

        ucomisd xmm2, xmm3
        mov rax, 1
        je for

        mov rax, 0

end:
    
    leave
    ret
