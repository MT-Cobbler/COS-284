section .data
              
section .bss
section .text
GLOBAL encryptChar

	
  encryptChar:

      push rbp
      mov rbp,rsp

   val1 equ 0 
    val2 equ 8
    mPtr equ 16

    sub rsp,32
    mov [rsp+val1],rsi  
    mov [rsp+val2],rdx  
    mov [rsp+mPtr],rdi  



    mov r10,0
    mov r15,0
    mov r14,0

    loop1:
            cmp r10,26
            jz end1
        
            mov r15,[rsp+mPtr] 
            mov r15,[r15]
            add r15,r10

            movsx r15,byte [r15]
            cmp r15,[rsp+val1]
            jz end1 
            

            inc r10
            jmp loop1

        end1:
    mov [rsp+val1],r10  
 
    mov r11,0;
    mov r14,0
    mov r15,0

    loop2:
        cmp r11,26
        jz end2

        mov rax,8
        mul r11  
        mov r15,[rsp+mPtr]  
        add r15,rax
        mov r14,[r15]
        movsx r14,byte [r14]
        cmp r14,[rsp+val2]
        jz end2

        inc r11
        jmp loop2
    end2:

    mov [rsp+val2],rax  

        mov r10,[rsp+val1]
        mov r11,[rsp+val2]

         mov r15, [rsp+mPtr]  
         add r15, r11
         mov r15, [r15]
         add r15, r10
         mov rax, [r15]
    mov rax, mPtr 
    leave
    ret

