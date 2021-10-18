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
        mov rdx,31                 
        mov rsi, msg1     
        mov rax, 1               
        mov rdi, 1              
        syscall                    

        mov rax, 0               
        mov rdi, 0               
        mov rsi, shift     
        mov rdx, 3              
        syscall  
        
        mov r10,rax 

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
            movsx r9, byte[shift + 1]
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
            mov r10, 0    
            mov r12, 2    

        Start:
            cmp byte[r9], 0
            jz end1

            cmp byte[r9], 32
            jz inc9

            cmp byte[r9], 33
            jz inc9

            cmp byte[r9], 44
            jz inc9
            
            cmp byte[r9], 46
            jz inc9

            cmp byte[r9], 63
            jz inc9

            xor rax, rax
            xor rdx, rdx

            cmp r10, 0 
            jz even

            mov rax, r10
            div r12

            cmp rdx, 1 
            jz odd

            jmp even 

        even:
            cmp byte[r9], 97
            jl upperE

        lowercaseE:     
            add byte[r9], r8b 
            mov al, byte[r9]
            cmp al, 127
            jl overE     

            jmp larger127
	
        larger127: 
            sub byte [r9],122
            add byte [r9],97
            jmp increment

        overE:
            mov r11, rax
            cmp r11, 122
            jle increment

            jmp w

        w:
            sub byte[r9], 26
            jmp increment
  
        upperE:     
            add byte[r9], r8b
            mov al, byte[r9]
            mov r11, rax
            cmp r11, 90
            jle increment
            jmp w2

        w2:
            sub byte[r9] ,26
            jmp increment

        odd:
            cmp byte[r9], 97
            jl upper

        lower:
            sub byte[r9], r8b 
            mov al, byte[r9]
            cmp al, 97
            jl l97     
            jmp overflow
	
        l97:  
            sub byte[r9], 97
            add byte[r9], 122
            movsx r11, byte[r9]
            add r11, r8
            cmp r11, 122
            jge here
            jmp increment

            here:
                add byte[r9], 1  

                jmp increment

        overflow:
            jmp increment

        upper:
            sub byte[r9], r8b
            mov al, byte[r9]
            cmp al, 65
            jl l65 

            jmp overflow2
	
        l65:  
            sub byte[r9], 65
            add byte[r9], 90
            movsx r11, byte[r9]
            add r11, r8
            cmp r11, 90
            jge here2

            jmp increment
            here2:
                add byte[r9], 1  

            jmp increment

        overflow2:
        increment:  
            movsx r14, byte[r9] 
            inc r10
        inc9:            
            inc r9
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

    end:  
        mov rax, 60
        xor rdi, rdi
        syscall