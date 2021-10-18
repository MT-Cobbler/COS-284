section .data
    msg1 dq  "Please input the shift degree: ",
    msg2 dq "Please input the string to decode: "
    msg3 dq "Decoded text: "
section .bss
    shift resb 10
    result resb 10
section .text
    global _start

    _start:
        mov rax, 1               
        mov rdi, 1              
        mov rsi, msg1     
        mov rdx, 31                 
        syscall                    

        mov rax, 0               
        mov rdi, 0               
        mov rsi, shift     
        mov rdx, 3              
        syscall  
        
        mov r10, rax
        mov rax, 1               
        mov rdi, 1               
        mov rsi, msg2     
        mov rdx, 35                 
        syscall                     

        mov rax, 0               
        mov rdi, 0               
        mov rsi, result     
        mov rdx, 1000              
        syscall  

        mov r15,rax
        cmp r10, 2
        jg twoD
        movsx r8, byte[shift]
        sub r8, '0'
        jmp oneD

        twoD: 
          movsx r8, byte[shift]
          movsx r9, byte[shift+1]
          sub r8, '0'
          sub r9, '0'
          mov rax, 10
          mul r8
          mov r8, rax
          add r8, r9
          xor r9, r9 
          xor r10, r10 
        oneD:
          mov r9, result

        Start:
          cmp byte[r9], 0 
          jz end1
          cmp byte [r9], 32
          jz increment
          sub byte[r9], r8b
          mov al, byte[r9]
          cmp al, 97
          jl lower
          jmp over

        lower:  
          sub byte [r9],97
          add byte [r9],122
          movsx r11,byte [r9]
          add r11,r8
          cmp r11,122
          jge here

          jmp increment
            here:
          add byte [r9],1  

          jmp increment

        over:
        
        increment:  
          movsx r14, byte[r9] 
          add r9,1
          jmp Start

        end1: 
          mov  rax, 1               
          mov  rdi, 1              
          mov  rsi, msg3     
          mov  rdx, 14                 
          syscall 

          sub r15,1
          mov rax, 1               
          mov rdi, 1               
          mov rsi, result     
          mov rdx, r15                
          syscall

      end:  
        mov rax, 60
        xor rdi,rdi
        syscall