
[org 0x0100]  
jmp start
num: dw 2,3, 6, 4, 8, 67, 32
even: dw 0
odd: dw 0
start:
    mov ax,0
    mov bx,0
    mov cx,0

EVEN:
        mov ax,[num+bx]
        add bx,2
        test ax,1
        jnz skip
        add cx,1

    skip:
         cmp bx,14         
        jnz EVEN
    

     mov ax,0
     mov bx,0
     mov dx,0
ODD:
 mov ax,[num+bx]
        add bx,2
        test ax,1
        jz skip2
        add dx,1

    skip2:
         cmp bx,14   
         jnz ODD


 mov [even],cx
 mov [odd],dx

 mov ax,0x4c00
int 0x21	










