org 0x7c00
jmp 0x0000: main

data: 
img db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 8, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 7, 8, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 8, 7, 8, 8, 8, 8, 0, 0, 0, 0, 8, 8, 0, 0, 0, 0, 8, 8, 8, 8, 3, 1, 8, 8, 8, 8, 1, 8, 0, 0, 0, 0, 0, 0, 8, 8, 1, 3, 9, 9, 8, 1, 9, 8, 0, 0, 0, 0, 0, 0, 8, 8, 9, 9, 15, 15, 9, 9, 9, 8, 0, 0, 0, 0, 8, 0, 8, 9, 9, 9, 9, 3, 9, 9, 9, 1, 0, 0, 0, 0, 8, 8, 8, 9, 15, 15, 15, 3, 9, 9, 9, 1, 0, 0, 0, 0, 8, 0, 8, 9, 9, 9, 15, 15, 9, 9, 3, 8, 0, 0, 0, 0, 8, 8, 8, 8, 8, 9, 9, 9, 9, 8, 8, 0, 0, 0, 0, 0, 8, 8, 8, 0, 0, 8, 1, 9, 9, 0, 0, 0, 0, 0, 0, 0, 8, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 8, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ;reserva espaço na memória para a string


main:
    xor ax, ax
    mov cx, ax ; int j for 1 (y do pixel)
    mov dx, ax ; int i for2 (x do pixel)
    mov ds, ax

    ; modo video => cx e dx ditam a pos do pixel no modo video
    mov al, 13h
    mov ah, 0
    int 10h

    mov si, img

    for1: 
        cmp dx, 16 ; se a linha chegou ao fim
        je finish_for1
        mov cx, 0 ; zero a coluna para a pŕóx linha
        for2:
            cmp cx, 16
            je finish_for2
            ; print pixel
            lodsb ; move os conteúdos das cores para al
            mov ah, 0ch
            int 10h
            inc cx
            jmp for2
        finish_for2:
            inc dx
            jmp for1
    finish_for1:
        jmp finish

finish:
    jmp $

times 510 - ($ - $$) db 0
dw 0xaa55