extern malloc
section .data
              
section .bss
    mPtr  resb 8 

section .text
GLOBAL populateMatrix

  populateMatrix:

      push rbp
      mov rbp,rsp

    val equ 0 

    sub rsp, 16

      mov rdi, 208   
      call malloc  
      mov [mPtr], rax 
 
    mov r12, 0
    mov r11, 8
    for:
        cmp r12, 26
        jz end1
 
        mov rdi, 26
        call malloc
        mov [rsp + val], rax 
        xor rax,rax
        mov rax,8
        mul r12
        mov rdi, [rsp + val]
        mov [mPtr + rax], rdi
        mov [rdi], r12
        inc r12
        jmp for
    end1:
        mov r8, 0
        mov r9, 0
        mov r10, 0
        
        initial:
            cmp r8,26
            jz end2
        
            mov rax,8
            mul r8  
            mov r12,[mPtr+rax]  
            mov r10, 65
            mov [r12], r10 
            

            inc r8
            jmp initial

        end2:

        mov r8,0 
        mov r9,0 
        mov r10,65
        mov r11,0 
 
        row:
            cmp r8,26
            jz Rend

            col:
                cmp r9,26
                jz Cend

                mov rax,8
                mul r8  
                mov r12,[mPtr+rax]  
                
                add r12,r9  
                mov [r12],r10
              
                add [r12],r8  

                mov r11,[r12]
                cmp r11,90
                jg greater

                jmp over

                greater:
                    mov r11,90
                    sub [r12], r11
                    mov r11, 64
                    add [r12], r11

                over:

                mov r11,[r12] 

                inc r9
                inc r10
                jmp col
            Cend:

            mov r10,65
            mov r9,0
            inc r8
            jmp row
        Rend:
    

        mov rax,mPtr  
  
      leave
      ret
 