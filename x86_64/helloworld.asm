section .data
msg db "Hello World",0x0a,0x0d
len equ $-msg

section .text
    global _start
_start:
    mov rax,1
    mov rdi,1
    mov rsi,msg
    mov rdx,len
    syscall

    mov rax,60
    syscall
