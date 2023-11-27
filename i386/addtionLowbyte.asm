section .data
msg1 db "Enter the Number1 : "
len1 equ $-msg1

msg2 db "Enter the Number2 : "
len2 equ $-msg2

msg3 db "Result : "
len3 equ $-msg3
new db 0x0a,0x0d
new1 equ $-new

section .bss
num1 resb 2
num2 resb 2
result resb 1

section .text

;first msg
    mov eax,4
    mov ebx,1
    mov ecx,msg1
    mov edx,len1
    int 0x80

    mov eax,3 ; sysread syscall
    mov ebx,0 ;file discriptor 0 stdin
    mov ecx,num1
    mov edx,2
    int 0x80

;msg2
    mov eax,4
    mov ebx,1
    mov ecx,msg2
    mov edx,len2
    int 0x80

    mov eax,3
    mov ebx,0
    mov ecx,num2
    mov edx,2
    int 0x80

;msg3
    mov eax,4
    mov ebx,1
    mov ecx,msg3
    mov edx,len3
    int 0x80

;add function
    mov eax,[num1]
    mov ebx,[num2]
    sub eax,'0' ;converting asci to number
    sub ebx,'0'
    add eax,ebx
    add eax,'0'
    mov [result],eax

    mov eax,4
    mov ebx,1
    mov ecx,result
    mov edx,1
    int 0x80
  
    mov eax,4
    mov ebx,1
    mov ecx,new
    mov edx,new1
    int 0x80
    call exit

exit:
    mov eax,1
    mov ebx,0
    int 0x80
    

