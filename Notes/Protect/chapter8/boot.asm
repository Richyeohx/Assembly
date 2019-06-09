app_lba_start equ 100

section boot align=16 vstart=0x7c00

xor ax,ax
mov ss,ax
mov sp,ax

mov ax,[cs:phy_addr]		;ax is low addr
mov dx,[cs:phy_addr+0x02]	;dx is high addr
mov bx,16
div bx
mov ds,ax			;ds=ax=1000

mov ax,0xb800
mov es,ax			;es=ax=b800

xor di,di
mov si,app_lba_start		;si=100
xor bx,bx

call near rd_dsk

jmp show_str

rd_dsk:
mov dx,0x01f2	;dx-0x01f2
mov al,1
out dx,al

inc dx		;dx=0x01f3
mov ax,si	;si=100,ax=100
out dx,al	

inc dx		;dx=0x01f4
mov al,ah	;ah=0,al=0
out dx,al	

inc dx		;dx=0x01f5
mov ax,di	;di=0,ax=0
out dx,al	

inc dx		;dx=0x01f6
mov al,0x0e0
out dx,al

inc dx		;dx=0x01f7
mov al,0x20
out dx,al

waits:
in al,dx
and al,0x88
cmp al,0x08
jnz waits

mov cx,256
mov dx,0x01f0

rd_data:
in ax,dx
mov [bx],ax
add bx,2
loop rd_data

ret

show_str:
xor si,si
xor di,di
mov cx,6
rep movsw


jmp $

phy_addr dd 0x10000

times 510 - ($ - $$) db 0
db 0x55,0xaa
