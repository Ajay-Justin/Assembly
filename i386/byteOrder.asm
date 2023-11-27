section .text
global _start
_start:
    mov eax,4
    mov ebx,1
    mov ecx,msg
    mov edx,len
    int 0x80
    call byteChange
    mov eax,1
    mov ebx,0
    int 0x80

byteChange:
    mov [msg+11],dword"Ajay"
    mov [msg+15],byte ' '
    mov eax,4 ;write syscall
    mov ebx,1   ;stdout call
    mov ecx,msg ;msg
    mov edx,len ;length of msg
    int 0x80
    ret

section .data

msg db "My name is H3ckr",0x0a,0xad
len equ $-msg
