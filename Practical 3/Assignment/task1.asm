section .data
    msg1 dq  "Please input the shift degree: ",
    msg2 dq "Please input the string to encode: "
    msg3 dq "Encoded text: "
       
section .bss
    shift resb 10			
    result resb 10

section .text
    global _start

    _start:
        mov  rax, 1               
        mov  rdi, 1              
        mov  rsi, msg1     
        mov  rdx, 31                 
        syscall                    

        mov  rax, 0               
        mov  rdi, 0               
        mov  rsi, shift     
        mov  rdx, 3              
        syscall  
        
        mov r10, rax 

        mov  rax, 1               
        mov  rdi, 1               
        mov  rdx, 35                 
        mov  rsi, msg2     
        syscall                     

        mov  rax, 0               
        mov  rdi, 0               
        mov  rsi, result     
        mov  rdx, 100              
        syscall  

        mov r15, rax  

        cmp r10, 2
        jg twoD

        movsx r8, byte [shift]
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
          cmp byte [r9], 0 
          jz end1
          
          cmp byte[r9], 32
          jz increment

          add byte [r9], r8b 
          mov al, byte[r9]
          cmp al, 127
          jl end

          jmp greater127
	
        greater127:
          sub byte[r9], 122
          add byte[r9], 97
          jmp increment
        end:
        
        mov r11, rax
        cmp r11, 122
        jle increment

        jmp wrapper

        wrapper:
          sub byte[r9], 26
          jmp increment

        increment:  
          movsx r14, byte[r9]
          add r9, 1
          jmp Start
                    
        end1: 

        mov rax, 1               
        mov rdi, 1              
        mov rsi, msg3     
        mov rdx, 14                 
        syscall 

        sub r15, 1
        mov rax, 1               
        mov rdi, 1               
        mov rsi, result     
        mov rdx, r15                
        syscall
 
      mov rax, 60
      xor rdi, rdi
      syscall