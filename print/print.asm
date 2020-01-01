section .data
    string1 db  0xa, "  Hello StackOverflow!!!", 0xa, 0xa, 0

section .text
    global _start

_start:
    ; X64  system call table
    ; https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/
    ; Note that x64 is very different from x86
    ;
    mov rdx, 30
    mov rsi, string1
    mov rdi, 1
    mov rax, 1
    syscall

    mov rax, 1
    int 80h