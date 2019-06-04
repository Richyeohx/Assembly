label1:
	mov ax,0x001
	mov bx,0x002
	mov ds,ax
	jmp label2

noting:
	mov ax,0x01
	mov bx,0x02
	mov ax,0x05
	mov ds,ax
	mov byte [ds:002],0x08

label2:
	mov ax,ax
	mov bx,0002
	mov cx,ax

