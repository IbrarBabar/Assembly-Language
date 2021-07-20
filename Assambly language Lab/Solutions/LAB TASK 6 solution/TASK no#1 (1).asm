[org 0x100]        ;Note  (even = cx  &&  odd = dh)
jmp start 
dividend: dw  9, 56, 43, 1, 2, 23
EVEN_NUMBER: dw 0
ODD_NUMBER: db 0
start:
    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0
even:                        
    mov ax,[dividend+bx] 
    mov dx,ax               
    mov dl,2   
    div dl
                                                            
    cmp ah,0
    jne skip
        add cx,1

skip:
    mov ax,0
    mov al,[dividend+bx] 
    add bx,2
    cmp bx,12
    jne even



    mov ax,0
    mov bx,0
    mov dx,0
    mov dl,2  
odd:
    mov ax,[dividend+bx] 
    div dl
                                                            
    cmp ah,0
    je skip2
        add dh,1
skip2:
    mov ax,0
    mov al,[dividend+bx] 
    add bx,2
    cmp bx,12
    jne odd

mov [EVEN_NUMBER],cx
mov [ODD_NUMBER], dh


mov ax, 0x4c00 
int 0x21 
