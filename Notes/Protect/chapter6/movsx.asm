;movsb一次移动一个字节
;movsw一次移动一个字
;初次之外还需要设置移动的方向Direction Flag，cld清除方向标志,std设置方向标志,cld设置方向标志为0,std设置方向标志为1
;DF标志为0时f传送方向为正，DF标志位为1时方向为负，除此之外方向为正h时SI,DI加1或者加2，方向为反时SI，DI减1或者减2
;因为movsb,movsw只执行一次，如果需要重复N次,只需要在CX中指明次数，然后使用rep(repeat)指令 即可

jmp near start
data1: db 'a',0x07,'b',0x07,'c',0x07,'d',0x07
data2: db 0,0,0,0,0

start:
	cld
	mov si,data1
	mov di,0
			
	mov cx,(data2-data1)/2 ;在Nasm语法中编译器允许在代码中使用除法，因为movsw一次移动一个字，所以需要处以2
	
	rep movsw
