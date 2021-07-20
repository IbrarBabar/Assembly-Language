[org 0x100]

jmp start 

multiplicant: db 11   ; 4 bit number, save space of 8-bit numbers
multiplier: db 6      ; 4 bit number
result: db 0          ; final result should be 8 bit (final answer=66 || hexa 42) 

start:
    mov al,[multiplicant]  ;total 8-bits., (first multiplicant 4 bits ma jay ga then shift hpty hoty 8 bits tk pohanch jay ga)
    mov bl,[multiplier]    ;4 bit ma jay ga and girty girty khatam ho jay ga
    mov cl,4

    checking:
    shr bl,1
    jnc skip               ;if CF=1 then add otherwise goto skip
        add [result],al 

skip:
    shl al,1             ;al*2
    dec cl               ;cl-1
    jne checking

    mov ax, 0x4c00 
    int 0x21 


