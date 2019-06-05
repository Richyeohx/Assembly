jmp near start
	msg db '1+2+3...+100='

start:
	;设置段寄存器
	mov ax,0x7c0
	mov ds,ax
	
	mov ax,0xb800
	mov es,ax
	
	mov si,msg ;设置原址偏移地址
	mov di,0   ;设置目的偏移地址
	mov cx,start-msg ;设置要显示的字符数

show_msg:
	mov byte al,[si]
	mov [es:di],al
	inc di
	mov byte [es:di],0x07
	inc si
	inc di
	loop show_msg
	
	;计算1到100的和
	xor ax,ax
	mov cx,1
	
sum:
	add ax,cx
	inc cx
	cmp cx,100
	jle sum

	xor cx,cx
	mov ss,cx
	mov sp,cx
	
	mov bx,10
	xor cx,cx
pushd:
	inc cx
	xor dx,dx
	div bx
	or dl,0x30 ;div规则，高位存放余数，低位存放商
	push dx
	cmp ax,0 ;如果商为0跳出循环
	jne pushd

show_sum:
	pop dx
	mov [es:di],dl
	inc di
	mov byte [es:di],0x07
	inc di
	loop show_sum

	jmp near $

times 510-($-$$) db 0
	dw 0x55aa

