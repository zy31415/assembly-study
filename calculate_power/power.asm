section .data

section .text
    global _start

_start:
    push 3
    push 2
    call power
    add rsp, 10h ; remove input arguments after call, otherwise - memory leak
    push rax ; push result to stack
    push 2
    push 5
    call power
    add rsp, 10h ; remove input arguments after call, otherwise - memory leak
    pop rbx
    add rbx, rax
    mov rax, 1
    int 80h

; Purpose: This function is used to compute the value of a number raised to a power
; Input: First arugument - the base number
;        Second argument - the the power to raise it
;
; Variables:
;       rax - temporary storage
;       rbx - holds the base numver
;       rcx - holds the power
;
;
power:
    push rbp 
    mov rbp, rsp
    sub rsp, 8 ; Need 8 bytes for local stack, 1 variable
    mov rbx, [rbp+10h]  ; 2
    mov rcx, [rbp+18h]  ; 3

    mov [rbp-8], rbx

power_loop_start:
    cmp rcx, 1   ; If the power is 1, we are done
    je  end_power
    mov rax, [rbp-8]
    imul rax, rbx
    mov [rbp-8], rax
    dec rcx
    jmp power_loop_start

end_power:
    mov rax, [rbp-8]
    mov rsp, rbp  ; remove stack
    pop rbp         ; restore base pointer
    ret

