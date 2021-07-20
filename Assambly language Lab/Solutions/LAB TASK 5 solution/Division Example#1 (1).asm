[org 0x100]

jmp start 

dividend: db 7
divisor: db 3
remainder: db 0         
Qoutient: db 0
start:
mov dx,0
    mov al,[dividend]  
    mov bl,[divisor]   

    div bx

    mov [Qoutient],al
    mov [remainder],dl

mov ax, 0x4c00 
int 0x21 


