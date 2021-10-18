extern malloc
section .data
              
section .bss

mPtr  resb 8  


section .text
GLOBAL populateMatrix

	
  populateMatrix:
 
      push rbp
      mov rbp, rsp
 
    value equ 0   
    sub rsp, 16
    mov rdi, 208  
    call malloc  
    mov [mPtr],rax  
 
    mov r15,0
    mov r14,8
    loop1:
        cmp r15,26
        jz end1
 
        mov rdi,26
        call malloc
        mov [rsp + value], rax  
 
        xor rax,rax
        mov rax,8
        mul r15
 
        mov rdi,[rsp + value]
        mov [mPtr + rax], rdi

        mov [rdi], r15
 
        inc r15
        jmp loop1
    end1:
 
        mov r10, 0  
        mov r11, 0  
        mov r12, 0  

  
        
        initial:
            cmp r10, 26
            jz end2
            
        
            mov rax,8
            mul r10  
            mov r15, [mPtr + rax]  
            mov r12, 65
            mov [r15], r12  
            

            inc r10
            jmp initial

        end2:
 

        mov r10, 0   
        mov r11, 0   
        mov r12, 65  
        mov r14, 0   
  
        rowLoop:
            cmp r10, 26
            jz Rend


            

            colLoop:
                cmp r11, 26
                jz Cend


                mov rax, 8
                mul r10  
                mov r15, [mPtr + rax]  
                
                add r15, r11  
                mov [r15], r12
          
                add [r15], r10  

                mov r14, [r15]
                cmp r14, 90
                jg greater

                jmp over

                greater:
                    mov r14, 90
                    sub [r15], r14
                    mov r14, 64
                    add [r15], r14


                over:

                mov r14, [r15]  

                inc r11
                inc r12
                jmp colLoop

            Cend:

            mov r12, 65
            mov r11, 0
            inc r10
            jmp rowLoop
        Rend:

        mov rax, mPtr 
  
      leave
      ret