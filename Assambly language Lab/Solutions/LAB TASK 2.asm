[org 0x01000]
jmp start
result: dw 0
start:
mov ax,12
mov cx,20
l1:
   add ax,20
   sub cx,1
   jnz l1

mov [result],ax
mov ax, 0x4c00
int 0x21
