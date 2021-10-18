GLOBAL funct
        funct:
                push rbp
                mov rbp, rsp
                sub rsp, 16
; -------------------------------------
        N   equ 0
        nM1 equ 8

        mov rax, 2         
        cmp rdi, 1
        jz .end      

        mov rax, 1
        cmp rdi, 0
        jz .end

        dec rdi             
        mov [rsp + N], rdi    
        call funct

        mov r8, [rsp + N] 

        mov [rsp + nM1], rax
        mov rdi, [rsp + N]    
        dec rdi

        mov r9, rax
        mov rax, rdi
        mov r8, [rsp + nM1]
        mul r8
        mov [rsp + nM1], rdi
        mov rax, r9
        call funct

        mov r9,[rsp + nM1]

        sub rax, [rsp + nM1]
        .end:

                mov rsp,rbp
                pop rbp
                ret