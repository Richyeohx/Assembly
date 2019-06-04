;16位除法计算
;ax为被除数，计算完成后，商放在al中，余数放在ah中
mov al,0x07
mov bl,0x02           
           
div bl
       
;32位除法计算
;由于在16位CPU中无法表示32位数，所以使用DX和AX一起使用，被除数高位放在DX中，地位放在AX中
;计算完成后，商放在AX中，余数放在AX中

mov dx,0x1176
mov ax,0x1164

mov bx,0x1112

div bx
