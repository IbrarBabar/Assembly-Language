[org 0x0100]
add2:
        push    bp
        mov     bp,sp
        mov     [bp-20], di
        mov      [bp-24], si
        mov     [bp-28], dx
        mov     dx, [bp-20]
        mov     ax,  [bp-24]
        add     dx, ax
        mov     ax,  [bp-28]
        add     ax, dx
        mov     [bp-4],ax
        mov     ax, [bp-4]
        pop     bp
        ret
add1:
        push    bp
        mov     bp,sp
        sub     sp, 24
        mov     [bp-20],di
        mov      [bp-24],si
        mov     dx,  [bp-20]
        mov     ax,  [bp-24]
        add     ax, dx
        mov      [bp-4], ax
        mov     dx,  [bp-24]
        mov     cx,  [bp-20]
        mov     ax, [bp-4]
        mov     si, cx
        mov     di, ax
        call    add2
        leave
        ret
main:
        push    bp
        mov     bp,sp
        sub     sp, 16
        mov     si, 12
        mov     di, 12
        call    add1
        mov      [bp-4], ax
        mov     ax, 0
        leave
        ret
        push    bp
        mov     bp,sp
        sub     sp, 16
        mov      [bp-4], di
        mov     [bp-8], si
        cmp      [bp-4], 1
        jne    L9
        cmp      [bp-8], 65535
        jne     L9
        mov     di
        mov     dx 
        mov     si
        mov     di
L9:
        nop
        leave
        ret
        push    bp
        mov     bp,sp
        mov     si, 65535
        mov     di, 1
        pop     bp
        ret
