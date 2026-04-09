bits 16
org 0x7c00

jmp setup
string db "Hexis' First Boot", 0 ; 0 is terminator bit we check it with compare in loop

setup:
    mov si, string ; move the string to si
    mov ah, 0x0E ; print code
    jmp loop

loop:
    lodsb
    cmp al, 0
    je exit
    int 0x10 ; i realized this must be before the exit else we render 0 too
    jne loop

exit:
    jmp $ ; inf loop

times 510 - ($ - $$) db 0
dw 0xAA55