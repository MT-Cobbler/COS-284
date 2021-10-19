extern malloc
section .data
              
section .bss

string resb 8 ; this is my pointer to return string

section .text
GLOBAL encryptString

	
  encryptString:

     ;start function
  ;=================
      push rbp
      mov rbp,rsp
  ;================
   Parameter1 equ 0 ; input string
    Parameter2 equ 8 ; key string
    matrixPtr equ 16 ;ptr
    length1   equ 24
    length2   equ 32
    Nospaces  equ 40
    String1   equ 48
    String2   equ 56

   

    sub rsp,64
    mov [rsp+String1],rsi  ;put input string on stack
    mov [rsp+String2],rdx  ;put key string on stack
    mov [rsp+matrixPtr],rdi ;put ptr on stack


    mov r10,0
    mov rcx,0 ; lets RCX hold the length
    mov r10,[rsp+String1]
    mov r11,0 ; this holds the length without spaces
    ;find string lenghts
;=========================================
    start1:
        cmp byte [r10] , 0 ; testing endl char
        je endStart1 

        cmp byte[r10],32
        jz space

        inc r11
        inc r10
        inc rcx
        jmp start1

        space:
        inc r10
        inc rcx
        jmp start1
    endStart1:
    mov [rsp+length1],rcx ; this includes spaces
    mov [rsp+Nospaces],r11
    ;this code allocates memory for my return string (length in r11)

     mov rdi,r11 ; this is the amount of bytes needed for return string array
     inc rdi ; add one space for null terminator
      call malloc ; calling malloc from c
      mov [string],rax ; making the value of string mem address the starting 

;====================================
    mov r10,[rsp+String2]
    mov rcx,0 ; counter
    start2:
        cmp byte [r10] , 0 ; testing endl char
        je endStart2 

        inc r10
        inc rcx
        jmp start2
    endStart2:
    mov [rsp+length2],rcx ; this includes spaces


;=========================================
    mov r12,0 ; this will count string 1
    mov rcx,0 ; this will count string 2
    mov r9,0  ; this keeps track of the pos of built string
    mov r13,0 ; general
  

    bigloop:
            cmp r12b , byte [rsp+length1]
            jz bigEnd

            mov r13,[rsp+String1]
            add r13,r12
            movsx r8,byte[r13]
                ;test if r13 is holding a space
            cmp byte [r13],32
            jz  hasSpace
            movsx r13,byte [r13]
            mov [rsp+Parameter1],r13

            mov r13,[rsp+String2]
            add r13,rcx
            movsx r13, byte [r13]
            mov [rsp+Parameter2],r13
                

    ;this code block encrypts a char
;===========================================================================================
    mov r10,0
    mov r15,0
    mov r14,0
        ;find the col
;===================================
    loop1:
            cmp r10,26
            jz end1
        
            mov r15,[rsp+matrixPtr] 
            mov r15,[r15]
            add r15,r10

            movsx r15,byte [r15]
            cmp r15,[rsp+Parameter1]
            jz end1 
            

            inc r10
            jmp loop1

        end1:
    mov [rsp+Parameter1],r10 ; parameter1 now hold the row
;====================================
    mov r11,0;
    mov r14,0
    mov r15,0
        ;find the row
;====================================
    loop2:
        cmp r11,26
        jz end2

        mov rax,8
        mul r11 ;do offset calc
        mov r15,[rsp+matrixPtr] ; this finds correct row by adding offset
        add r15,rax
        mov r14,[r15]
        movsx r14,byte [r14]
        cmp r14,[rsp+Parameter2]
        jz end2

        inc r11
        jmp loop2
    end2:

    mov [rsp+Parameter2],rax ; parameter 2 now olds row*8
;====================================

        ;return correct char
;===================================
        mov r10,[rsp+Parameter1]
        mov r11,[rsp+Parameter2]

         mov r15,[rsp+matrixPtr] ; this finds correct row by adding offset
         add r15,r11
         mov r15,[r15]
         add r15,r10

         mov r13,[string]
         add r13,r9
        ; movsx r13,byte [r13]
         movsx r15, byte [r15]
         mov [r13], r15b

         inc r12
         inc rcx
         mov r13,[rsp+length2]
         
        cmp rcx,r13
        jz doThis

        jmp over
            doThis:
                mov rcx,0

        over:
         inc r9
         jmp bigloop

         ; if it is not then inc r12 and rcx
                ;if rcx is [rsp+length2] - 1 then set it back to zero

;===================================
        hasSpace:
            inc r12
            jmp bigloop
    
;=========================================================================================================
    bigEnd:
    mov r13,[string]
    mov r9,[rsp+Nospaces]
    inc r9
    add r13,r9
    mov r9,0
    mov [r13],r9

    mov r13,[string]
    mov r9,5
    add r13,r9

    movsx r13,byte [r13]



    mov rax,[string]
   ;end function
  ;=================  
      leave
      ret
  ;===============