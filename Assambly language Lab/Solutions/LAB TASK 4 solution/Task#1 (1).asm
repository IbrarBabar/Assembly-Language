[org 0x0100]  
jmp start

num: db 3
result: dw 0

start:
mov al,[num]
mov cx,0

Right_Loop:
    shr al,1
    add cx,1     
    cmp al,0
    jnz Right_Loop

mov ax,0
mov al, [num]
mov dx,0

Left_Shift:
    shl al,1
    add dx,1     
    cmp al,0
    jnz Left_Shift

    mov [result], cx
    cmp cx,dx
    jnae skip    ;if cx>dx then jump

            mov [result],dx
            
        skip:



 mov ax,0x4c00
int 0x21	

