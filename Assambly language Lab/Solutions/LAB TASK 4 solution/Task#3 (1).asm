
[org 0x0100]  
jmp start
num:dw 23, 65, 12, 6, 45, 38, 44, 9, 87, 100
resultEven: dw 0
resultOdd: dw 0
mov cx,0
result: dw 0
start:
    mov ax,0
    mov bx,0
    mov cx,0

loop:
     mov ax,[num+bx]
        add bx,2
        test ax,1
        jnz skip
        add ax,1
    mov [resultEven],ax
    skip:
         cmp bx,14         
        jnz loop


    mov ax,0
     mov bx,0
     mov dx,0
Loop1:
    mov ax,[num+bx]
        add bx,2
        test ax,1
        jz skip2
        add ax,1
    skip2:
        mov [resultOdd],ax
         cmp bx,14   
         jnz Loop1

 mov ax,0x4c00
int 0x21	

