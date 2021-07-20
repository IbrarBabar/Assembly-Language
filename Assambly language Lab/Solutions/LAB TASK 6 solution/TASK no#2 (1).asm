[org 0x100]
jmp start
num: dw 47, 72, 31
max:dw 0
start:
mov ax,0
mov bx,0
mov cx,0
mov dx,0
    mov ax,[num]     ;al=Qoutient     dl=remainder
    mov bl,10  
    div bx

    add al,dl
    mov cl,al

    mov ax,0
    mov dx,0
    mov ax,[num+2]     ;al=Qoutient     dl=remainder
    mov bl,10  
    div bx

    add al,dl
    mov ch,al

    mov ax,0
    mov dx,0
    mov al,[num+4]     ;al=Qoutient     dl=remainder
    mov bl,10  
    div bx
    mov dx,0
    add al,dl
    mov dh,al

    mov ax,0
    mov bx,0
    mov [max],cl
    cmp cl,ch
    jge skip
        mov [max],ch

skip:

mov ax, 0x4c00 
int 0x21 
