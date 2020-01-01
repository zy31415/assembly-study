section .data

section .text
    global _start

_start:
    push 10 ; calculate the 10 th fibonacci number
    call sum
    add rsp, 8  ; remove input argument from stack

    ; Note that I am using rbx (return value) to pass results.
    ; Although rbx is 8 bytes, but return value is maximum 255, so large result will not be properly shown
    mov rbx, rax
    mov rax, 1
    int 80h


; Calculate fibonacci value
;       rax - fibonacci return value
;       rbx - store input argument N
;
sum:
    push rbp    ; store base pointer
    mov rbp, rsp    ; move base pointer

    mov rbx, [rbp+10h]
    cmp rbx, 1
    je base_case

    push rbx        ; store N
    dec rbx
    
    push rbx        ; this push as input argument
    call sum  ; recursive call
    add rsp, 8      ; remove input argument from stack

    pop rbx         ; restore N
    add rax, rbx
    jmp return

base_case:
    mov rax, 1
    jmp return

return:
    mov rsp, rbp    ; remove stack
    pop rbp         ; restore rbp
    ret


