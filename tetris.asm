[org 0x0100]
jmp start
stscreen:dw 'Press Any Key to Start The Game'
sc: dw 'SCORE'
coming1:	 dw 'NEXT'
coming2: 	dw 'SHAPE'
time:	dw 'TIME'
endText:	 dw 'GAME OVER',0
gameOver:dw 0
your:	dw 'YOUR SCORE: ',0
t:	dw'03:59'
lensc:	dw 5
lenco1:	dw 4
lenco2:	dw 5
lenga:	dw 9
score: 	dw 0
ticks: dw 0
seconds:dw 0
min:dw 0
oldISR: dd 0
keyISR: dd 0
currPos: dw 398
prevPos: dw 0
ticks2: dw 0
currColor: dw 1
currShape: dw 1
moveCount: dw 0
incomingShape: dw 1
seed: db 0

shape1:

	push bp
	mov bp,sp
	push di
	push cx
	push es
	push ax
	
	mov cx,0xb800
	mov es,cx
	mov di,[bp+4]	;loc
	
	
	;sub di,160
	mov cx, 4
	mov ax, 1
	cmp ax, [currColor]
	jne blackshape1


	mov word[es:di],0x6020
	mov word[es:di+2],0x6020
	add di,160
	mov word[es:di],0x6020
	mov word[es:di+2],0x6020
	add di,160
	mov word[es:di],0x6020
	mov word[es:di+2],0x6020
	add di,160
	mov word[es:di],0x6020
	mov word[es:di+2],0x6020
	
	
jmp endshape1
	blackshape1:
		mov word[es:di],0x0020
		mov word[es:di+2],0x0020
		add di,160
		mov word[es:di],0x0020
		mov word[es:di+2],0x0020
		add di,160
		mov word[es:di],0x0020
		mov word[es:di+2],0x0020
		add di,160
		mov word[es:di],0x0020
		mov word[es:di+2],0x0020
	
	endshape1:
	pop ax
	pop es
	pop cx
	pop di
	pop bp
	Ret 2
shape2:
	
		push bp
	mov bp,sp
	push di
	push cx
	push es
	push ax
	push bx

	mov bx,2
	mov cx,0xb800
	mov es,cx
	mov di,[bp+4]
	
	mov cx,4
	mov ax, 1
	cmp ax, [currColor]
	jne blackshape21
	
	mov word[es:di],0x4020
	mov word[es:di+bx],0x4020
	add di,160
	mov word[es:di],0x4020
	mov word[es:di+bx],0x4020
	add di,160
	mov word[es:di],0x4020
	mov word[es:di+bx],0x4020
	add di,160
	mov word[es:di],0x4020
	mov word[es:di+bx],0x4020
	
	add di,2
	mov word[es:di],0x4020
	add di,2
	mov word[es:di],0x4020
	add di,2
	mov word[es:di],0x4020
;	add di,2
;	mov word[es:di],0x4020
;;	add di,2
;	mov word[es:di],0x4020
	
	jmp endshape2
	
	blackshape21:
		
		mov word[es:di],0x0020
	mov word[es:di+bx],0x0020
	add di,160
	mov word[es:di],0x0020
	mov word[es:di+bx],0x0020
	add di,160
	mov word[es:di],0x0020
	mov word[es:di+bx],0x0020
	add di,160
	mov word[es:di],0x0020
	mov word[es:di+bx],0x0020
	
	add di,2
	mov word[es:di],0x0020
	add di,2
	mov word[es:di],0x0020
	add di,2
	mov word[es:di],0x0020
;	add di,2
;	mov word[es:di],0x0020
;	add di,2
;	mov word[es:di],0x0020
		endshape2:
	pop bx
	pop ax
	pop es
	pop cx
	pop di
	pop bp
	Ret 2
shape3:
	push bp
	mov bp,sp
	push di
	push cx
	push es
	push ax
	mov cx,0xb800
	mov es,cx

	mov di,[bp+4]
	mov cx,4
	mov ax, 1
	cmp ax, [currColor]
	jne blackshape31
	
	mov word[es:di],0x2020
	add di,2
	mov word[es:di],0x2020
	add di,2
	mov word[es:di],0x2020
	add di,2
	mov word[es:di],0x2020
	
	
	sub di,10
	add di,160
	mov word[es:di],0x2020
	add di,2
	mov word[es:di],0x2020
	add di,2
	mov word[es:di],0x2020
	add di,2
	mov word[es:di],0x2020

	
	jmp endshape3
	blackshape31:
		mov word[es:di],0x0020
		add di,2
		mov word[es:di],0x0020
		add di,2
		mov word[es:di],0x0020
		add di,2
		mov word[es:di],0x0020
	
	
		sub di,10
		add di,160
		mov word[es:di],0x0020
		add di,2
		mov word[es:di],0x0020
		add di,2
		mov word[es:di],0x0020
		add di,2
		mov word[es:di],0x0020
		
	endshape3
	pop ax
	pop es
	pop cx
	pop di
	pop bp
	Ret 2
shape4:
	
	push bp
	mov bp,sp
	push di
	push cx
	push es
	push ax
	mov cx,0xb800
	mov es,cx

	mov di,[bp+4]
	mov cx,3
	mov ax, 1
	cmp ax, [currColor]
	jne blackshape41

	
	mov word [es:di],0x5020
	mov word [es:di+2],0x5020
	add di,160
	mov word [es:di],0x5020
	mov word [es:di+2],0x5020
	add di,160
	mov word [es:di],0x5020
	mov word [es:di+2],0x5020

	sub di,160
	add di,4
	
	mov word [es:di],0x5020
	add di,2
	mov word [es:di],0x5020
	;add di,2
	;mov word [es:di],0x5020
		jmp endshape4
	blackshape41:
		mov word [es:di],0x0020
	mov word [es:di+2],0x0020
	add di,160
	mov word [es:di],0x0020
	mov word [es:di+2],0x0020
	add di,160
	mov word [es:di],0x0020
	mov word [es:di+2],0x0020

	sub di,160
	add di,4
	
	mov word [es:di],0x0020
	add di,2
	mov word [es:di],0x0020
	;add di,2
	;mov word [es:di],0x0020
	endshape4:
	pop ax
	pop es
	pop cx
	pop di
	pop bp
	Ret 2
shape5:
	push bp
	mov bp,sp
	push di
	push cx
	push es
	push ax
	
	mov cx,0xb800
	mov es,cx
	mov di,[bp+4]
	
	mov cx,3	
	mov ax, 1
	cmp ax, [currColor]
	jne blackshape51

	mov word[es:di],0x7020
	add di,2
	mov word[es:di],0x7020
	add di,2
	mov word[es:di],0x7020
	
	sub di,4
	add di,160
	
	mov word[es:di],0x7020
	add di,2
	mov word[es:di],0x7020
	add di,2
	mov word[es:di],0x7020

		jmp endshape5
		
	blackshape51:
		mov word[es:di],0x0020
	add di,2
	mov word[es:di],0x0020
	add di,2
	mov word[es:di],0x0020
	
	sub di,4
	add di,160
	
	mov word[es:di],0x0020
	add di,2
	mov word[es:di],0x0020
	add di,2
	mov word[es:di],0x0020

	endshape5:
	pop ax
	pop es
	pop cx
	pop di
	pop bp
	Ret 2
shape6:
	push bp
	mov bp,sp
	push di
	push cx
	
	push es
	push ax
	
	mov cx,0xb800
	mov es,cx
	mov di,[bp+4]
	mov cx,5
	mov ax, 1
	cmp ax, [currColor]
	jne blackshape6

	mov word[es:di],0x3020
	add di,2
	mov word[es:di],0x3020
	add di,2
	mov word[es:di],0x3020
	add di,2
	mov word[es:di],0x3020
	add di,2
	mov word[es:di],0x3020

	
		jmp endshape6
	
	blackshape6:
		mov word[es:di],0x0020
	add di,2
	mov word[es:di],0x0020
	add di,2
	mov word[es:di],0x0020
	add di,2
	mov word[es:di],0x0020
	add di,2
	mov word[es:di],0x0020
	endshape6:
	pop ax
	pop es
	pop cx
	pop di
	pop bp
	Ret 2
calculate:
	push bp
	mov bp,sp
	push ax
	mov al,80
	mul byte[bp+4]
	add ax,[bp+6]
	shl ax,1
	mov [bp+6],ax
	pop ax
	pop bp
	Ret 2
clrscr:
	push ax
	push es
	push di
	mov ax,0xb800
	mov es,ax
	mov di,0
	loop1:
		mov word [es:di],0x6020
		add di,2
		cmp di,4000
		jnz loop1
	pop di
	pop es
	pop ax
	Ret
DrawRect:
	push bp
	mov bp,sp
	push ax
	push di
	push dx
	push bx
	push cx
	push es
	
	mov ax,0xb800
	mov es,ax
	mov dx,[bp+8]		;y start...3rd parameter
	
	mov bx,[bp+4]		;height of game block...5th parameter
	outerloop:
		mov cx,[bp+6]		;x value...width of background block...4th parameter
		mov ax,[bp+10]	;x start...2nd parameter
		push ax
		add dx,1
		push dx
		Call calculate		
		pop di
		sub bx,1
		jz exit
	innerloop:
		push ax
		mov ax,[bp+12]	;charater to be placed...1st parameter
		mov word[es:di],ax
		pop ax
		add di,2
		sub cx,1
		jnz innerloop
		jmp outerloop
	exit:
		pop es
		pop cx
		pop bx
		pop dx
		pop di
		pop ax
		pop bp
		Ret 10

PrintText:
	push bp
	mov bp,sp
	push ax
	push cx
	push di
	push si
	push es
	
	mov ax,0xb800
	mov es,ax
	mov di,[bp+4]		;loc of printintg
	mov cx,[bp+6]		;len of word
	mov si,[bp+8]		;address of array
	mov ah,[bp+10]		;attribute
	nextchar:
		mov al,[si]
		mov [es:di],ax
		add si,1
		add di,2
		sub cx,1
		jnz nextchar

	pop es
	pop si
	pop di
	pop cx 
	pop ax
	pop bp
	Ret 8
PrintInt:
	push bp
	mov bp,sp
	push ax
	push bx
	push dx
	push cx
	push di
	push es
	
	mov ax,0xb800
	mov es,ax
	mov dx,0
	mov bl,10
	mov cx,0
	mov ax,[bp+4]
loopprint1:
	div bl
	mov dl,ah
	add dx,0x30
	push dx
	mov dx,0
	mov dl,al
	mov ax,dx
	add cx,1
	cmp ax,0
	jne loopprint1
	
	mov di,[bp+6]
loopprint2:
	pop ax
	mov ah,[bp+8]
	mov word [es:di],ax
	add di,2	
	sub cx,1
	jnz loopprint2
	
	pop es
	pop di
	pop cx
	pop dx
	pop bx
	pop ax
	pop bp
	Ret 6

animate:
	push es
	push di
	push cx
	push si
	push ax

	mov cx,0xb800
	mov es,cx

	mov di,0
	mov ax,79
	push ax
	mov ax,25
	push ax
	Call calculate
	pop si
	mov ch,25
	animateloop1:
		mov cl,40
		Call Delay
		Call Delay
		dec ch
		jz endanimateloop1
		animateloop2:
			mov word[es:di],0x0020
			mov word[es:si],0x0020
			add di,4
			sub si,4
			dec cl
			jnz animateloop2
			jmp animateloop1
endanimateloop1:
	pop ax
	pop si
	pop cx
	pop di
	pop es
	Ret

gameoverscreen:			;printing the gameover screen
	pusha 

Call Delay
	Call animate
	;Call scrolldown
	Call Delay
call  clrscr
	
	mov ax,0x0020			;making the larger black rectangle
	push ax
	mov ax,20
	push ax
	mov ax,8
	push ax
	mov ax,30
	push ax
	mov ax,7
	push ax
	Call DrawRect

	mov ax,0x3020			;making the hollow blue rectangle
	push ax
	mov ax,21
	push ax
	mov ax,9
	push ax
	mov ax,28
	push ax
	mov ax,5
	push ax
	Call DrawRect

	mov ax,27				;printing 'GameOver'  and 'Your Score' in red
	push ax
	mov ax,11
	push ax
	call calculate
	pop di
	
	mov word[es:di],0x0720
	add di,2
	mov word[es:di],0x0720

	add di,2

	mov ax,0x84
	push ax
	mov ax,endText
	push ax
	mov ax,[lenga]
	push ax
	push di
	
	call PrintText
	add di,18
	mov word[es:di],0x0720
	add di,2
	mov word[es:di],0x0720
	add di,2
	mov word[es:di],0x0720
	
	mov ax,27
	push ax
	mov ax,12
	push ax
	call calculate
	pop di

	mov ax,0x84
	push ax
	mov ax,your
	push ax
	mov ax,12
	push ax
	push di
	
	call PrintText
	
	mov ax,39		;Prinitng the score
	push ax
	mov ax,12
	push ax
	call calculate
	pop di
	mov ax,0x84
	push ax
	push di
	mov ax,[score]
	push ax
	call PrintInt
	popa
	Ret
	
StartGameScreen:			;printing the starting screen for game
	pusha
	
	
	

	


	Call clrscr
				;printing rectangle
	mov ax,0x1020
	push ax
	mov ax,10
	push ax
	mov ax,1
	push ax
	mov ax,60
	push ax
	mov ax,21
	push ax
	Call DrawRect
	
	mov ax,0x1020			;border
	push ax
	mov ax,9
	push ax
	mov ax,0
	push ax
	mov ax,61
	push ax
	mov ax,23
	push ax
	Call DrawRect
	
				;printing gamebox
	mov ax,0x0020
	push ax
	mov ax,25
	push ax
	mov ax,1
	push ax
	mov ax,30
	push ax
	mov ax,21
	push ax
	Call DrawRect

				;printing score
	mov ax,60	;x
	push ax
	mov ax,8		;y
	push ax
	Call calculate
	pop di		;loc
	mov ax,0x17		;attribute of text
	push ax
	mov ax,sc		;parameter1
	push ax
	mov ax,[lensc]	;parameter2
	push ax
	push di			;parameter3
	Call PrintText
	
				;printing time
	mov ax,60	;x
	push ax
	mov ax,12	;y
	push ax
	Call calculate
	pop di		;loc
	mov ax,0x17		;attribute of text
	push ax
	mov ax,time		;parameter1
	push ax
	mov ax,[lenco1]	;parameter2
	push ax
	push di			;parameter3
	Call PrintText
	
	
			;printing next
	mov ax,15
	push ax
	mov ax,8
	push ax
	Call calculate
	pop di
	mov ax,0x17
	push ax
	mov ax,coming1
	push ax
	mov ax,[lenco1]
	push ax
	push di
	Call PrintText
	
			;printing shape
	mov ax,15
	push ax
	mov ax,9
	push ax
	Call calculate
	pop di
	mov ax,0x17
	push ax
	mov ax,coming2
	push ax
	mov ax,[lenco2]
	push ax
	push di
	Call PrintText
	
	mov ax,60
	push ax
	mov ax,9
	push ax
	call calculate
	pop di
	mov ax,0x17
	push ax
	push di
	mov ax,[score]
	push ax
	call PrintInt


	popa
	Ret
erase:
	push bp
	mov bp,sp
	push ax
	push es
	push di
	push cx
	mov cx,30
	
	add word [score],10
	
	mov ax,60
	push ax
	mov ax,9
	push ax
	call calculate
	pop di
	mov ax,0x17
	push ax
	push di
	mov ax,[score]
	push ax
	call PrintInt

	mov ax,0xb800
	mov es,ax
	mov di,[bp+4]

	push di
	mov ax,0x0020
	cld
	rep stosw
	call scrolldown

	pop cx
	pop di
	pop es
	pop ax
	pop bp
	Ret
checkgamebox:

	push bp
	mov bp,sp
	sub sp,2
	push ax
	push bx
	push cx
	push dx
	push di
	push es
	
	mov ax,25
	push ax
	mov ax,2
	push ax
	Call calculate
	pop di
	mov ax,0xb800
	mov es,ax
	

	;mov ax,0x0720
	mov ch,20

outerC:
push di
mov cl, 30

innerCheck:
cmp word [es:di], 0x0020
je skipErase
add di, 2
dec cl
jnz innerCheck

call erase
skipErase:
pop di
add di, 160
dec ch
jnz outerC
	mov ax,25
	push ax
	mov ax,2
	push ax
	Call calculate
	pop di
	mov cx,30

	topcheck:
		cmp word [es:di],0x0020
		jne topreached
		add di,2
		dec cx
		jnz topcheck
		jmp endGameCheck
		je endGameCheck
		topreached:
			mov word [gameOver], 1
	endGameCheck:
	pop es
	pop di
	pop dx
	pop cx
	pop bx
	pop ax
	mov sp, bp
	pop bp
	Ret

printshapeatloc:
	push bp
	mov bp,sp 
	push es
	push di
	push dx
	push ax
	mov di,[bp+6]	;loc
	mov dx,[bp+4]	;shape number
	
	
	
	
	cmp dx,1
	jne nextshape1
	push di
	Call shape1
	jmp endprintatloc

	nextshape1:
	cmp dx,2
	jne nextshape2
	push di
	Call shape2
	jmp endprintatloc

	nextshape2:
	cmp dx,3
	jne nextshape3
	push di
	Call shape3
	jmp endprintatloc

	nextshape3:
	cmp dx,4
	jne nextshape4
	push di
	Call shape4
	jmp endprintatloc

	nextshape4:
	cmp dx,5
	jne nextshape5
	push di
	Call shape5
	jmp endprintatloc

	nextshape5:
	cmp dx,6
	jne endprintatloc
	push di
	Call shape6
	
endprintatloc:
	pop ax
	pop dx
	pop di
	pop es
	pop bp
	Ret 4

printNum:
push bp
mov bp, sp
push es
push ax
push bx
push cx
push dx
push di

mov ax, 0xb800
mov es, ax
mov ax, [bp + 4]
mov bx, 10
mov cx, 0

nxtDig:
mov dx, 0
div bx
add dl, 0x30
push dx
inc cx
cmp ax, 0
jne nxtDig
mov di, 160

nxtPos:
pop dx
mov dh, 0x07
mov [es:di], dx
add di, 2
loop nxtPos

pop di
pop dx
pop cx
pop bx
pop ax
pop es
pop bp
ret 2

getRand:
	push bp
	mov bp,sp
	push ax
	push bx
	push cx
	mov bx,[bp+4]
	mov bh,0
	mov cx,[ticks]
	mov ax,[ticks]
	add ax, [moveCount]
	add al, [seed]
	
	div bl
	mov bh,0
	mov bl,ah
	add bx, 1
	mov [bp+4],bx
	
	pop cx
	pop bx
	pop ax
	pop bp
Ret

scrolldown:
	push bp
	mov bp,sp
	push ax
	push es
	push ds
	push di
	push si
	push cx
	push bx

	mov ax,25
	push ax
	mov ax,1
	push ax
	Call calculate
	pop bx
	
	mov ax,0xb800
	mov es,ax
	mov ds,ax
	mov di,[bp+4]
	mov si,di
	sub si,160
	scrolloop:
		mov cx,30
		push si
		push di
		cld
		innerscrolloop:
			movsw
			;add si,1
			;add di,1
			dec cx
			jnz innerscrolloop
		pop di
		pop si
		sub di,160
		sub si,160
		cmp si,bx
		jne scrolloop
	cld
	mov ax,0x0020
	mov cx,30
	repnz stosw

	pop bx
	pop cx
	pop si
	pop di
	pop ds
	pop es
	pop ax
	pop bp
	Ret 2

collisionCheckV1:
push bp
mov bp, sp
push di
push es
push ax

mov ax, 0xb800
mov es, ax

mov word [bp + 6], 0
mov di, [bp + 4]
add di, 480
cmp word [es:di], 0x0020
je nxt1
mov word [bp + 6], 1
jmp endCheck1

nxt1:
add di, 2
cmp word [es:di], 0x0020
je endCheck1
mov word [bp + 6], 1

endCheck1:
pop ax
pop es
pop di
pop bp
ret 2

collisionCheckV2:
push bp
mov bp, sp
push di
push es
push ax

mov ax, 0xb800
mov es, ax

mov word [bp + 6], 0
mov di, [bp + 4]
add di, 480
cmp word [es:di], 0x0020
jne detectedV2
add di, 2
cmp word [es:di], 0x0020
jne detectedV2
add di, 2
cmp word [es:di], 0x0020
jne detectedV2
add di, 2
cmp word [es:di], 0x0020
jne detectedV2
jmp endColCheckV2

detectedV2:
mov word [bp + 6], 1
endColCheckV2:
pop ax
pop es
pop di
pop bp
ret 2

collisionCheckV3:
push bp
mov bp, sp
push di
push es
push ax

mov ax, 0xb800
mov es, ax

mov word [bp + 6], 0
mov di, [bp + 4]

add di, 160
sub di, 4
cmp word [es:di], 0x0020
jne detectedV3
add di, 2
cmp word [es:di], 0x0020
jne detectedV3
add di, 2
cmp word [es:di], 0x0020
jne detectedV3
add di, 2
cmp word [es:di], 0x0020
jne detectedV3
sub di, 160
add di, 2
cmp word [es:di], 0x0020
jne detectedV3
add di, 2
cmp word [es:di], 0x0020
jne detectedV3
jmp endColCheckV3

detectedV3:
mov word [bp + 6], 1
endColCheckV3:
pop ax
pop es
pop di
pop bp
ret 2

collisionCheckV4:
push bp
mov bp, sp
push di
push es
push ax

mov ax, 0xb800
mov es, ax

mov word [bp + 6], 0
mov di, [bp + 4]

add di, 320
cmp word [es:di], 0x0020
jne detectedV4
add di, 2
cmp word [es:di], 0x0020
jne detectedV4
sub di, 160
add di, 2
cmp word [es:di], 0x0020
jne detectedV4
add di, 2
cmp word [es:di], 0x0020
jne detectedV4
jmp endColCheckV4

detectedV4:
mov word [bp + 6], 1
endColCheckV4:
pop ax
pop es
pop di
pop bp
ret 2

collisionCheckV5:
push bp
mov bp, sp
push di
push es
push ax

mov ax, 0xb800
mov es, ax

mov word [bp + 6], 0
mov di, [bp + 4]

add di, 160
cmp word [es:di], 0x0020
jne detectedV5
add di, 2
cmp word [es:di], 0x0020
jne detectedV5
add di, 2
cmp word [es:di], 0x0020
jne detectedV5
jmp endColCheckV5


detectedV5:
mov word [bp + 6], 1
endColCheckV5:
pop ax
pop es
pop di
pop bp
ret 2

collisionCheckH1:
push bp
mov bp, sp
push di
push es
push ax
push bx

mov ax, 0xb800
mov es, ax

mov bx, [bp + 6]	;left or right movement
mov word [bp + 8], 0	;bool to return
mov di, [bp + 4]	;changed position to reset

cmp bx, 1		;1 for right
jne leftCheck1

add di, 2
cmp word [es:di], 0x0020
je nxtR11
mov word [bp + 8], 1
jmp endCheck11

nxtR11:
add di, 160
cmp word [es:di], 0x0020
je nxtR12
mov word [bp + 8], 1
jmp endCheck11

nxtR12:
add di, 160
cmp word [es:di], 0x0020
je nxtR13
mov word [bp + 8], 1
jmp endCheck11

nxtR13:
add di, 160
cmp word [es:di], 0x0020
je endCheck11
mov word [bp + 8], 1
jmp endCheck11

leftCheck1:
cmp word [es:di], 0x0020
je nxtL11
mov word [bp + 8], 1
jmp endCheck11

nxtL11:
add di, 160
cmp word [es:di], 0x0020
je nxtL12
mov word [bp + 8], 1
jmp endCheck11

nxtL12:
add di, 160
cmp word [es:di], 0x0020
je nxtL13
mov word [bp + 8], 1
jmp endCheck11

nxtL13:
add di, 160
cmp word [es:di], 0x0020
je endCheck11
mov word [bp + 8], 1
jmp endCheck11

endCheck11:
pop bx
pop ax
pop es
pop di
pop bp
ret 4

collisionCheckH2:
push bp
mov bp, sp
push di
push es
push ax
push bx

mov ax, 0xb800
mov es, ax

mov bx, [bp + 6]	;left or right movement
mov word [bp + 8], 0	;bool to return
mov di, [bp + 4]	;changed position to reset

cmp bx, 1		;1 for right
jne leftCheck2

add di, 2
cmp word [es:di], 0x0020
jne detectedColH2
add di, 160
cmp word [es:di], 0x0020
jne detectedColH2
add di, 160
cmp word [es:di], 0x0020
jne detectedColH2
add di, 164
cmp word [es:di], 0x0020
jne detectedColH2
jmp endCheck21

leftCheck2:
cmp word [es:di], 0x0020
jne detectedColH2
add di, 160
cmp word [es:di], 0x0020
jne detectedColH2
add di, 160
cmp word [es:di], 0x0020
jne detectedColH2
add di, 160
cmp word [es:di], 0x0020
jne detectedColH2
jmp endCheck21

detectedColH2:
mov word [bp + 8], 1
endCheck21:
pop bx
pop ax
pop es
pop di
pop bp
ret 4

collisionCheckH3:
push bp
mov bp, sp
push di
push es
push ax
push bx

mov ax, 0xb800
mov es, ax

mov bx, [bp + 6]	;left or right movement
mov word [bp + 8], 0	;bool to return
mov di, [bp + 4]	;changed position to reset

cmp bx, 1		;1 for right
jne leftCheck3
add di, 6
cmp word [es:di], 0x0020
jne detectedColH3
sub di, 4
add di, 160
cmp word [es:di], 0x0020
jne detectedColH3
jmp endCheck31

leftCheck3:
cmp word [es:di], 0x0020
jne detectedColH3
sub di, 4
add di, 160
cmp word [es:di], 0x0020
jne detectedColH3
jmp endCheck31

detectedColH3:
mov word [bp + 8], 1
endCheck31:
pop bx
pop ax
pop es
pop di
pop bp
ret 4

collisionCheckH4:
push bp
mov bp, sp
push di
push es
push ax
push bx

mov ax, 0xb800
mov es, ax

mov bx, [bp + 6]	;left or right movement
mov word [bp + 8], 0	;bool to return
mov di, [bp + 4]	;changed position to reset

cmp bx, 1		;1 for right
jne leftCheck4

add di, 2
cmp word [es:di], 0x0020
jne detectedColH4
add di, 4
add di, 160
cmp word [es:di], 0x0020
jne detectedColH4
add di, 160
sub di, 4
cmp word [es:di], 0x0020
jne detectedColH4
jmp endCheck41

leftCheck4:
cmp word [es:di], 0x0020
jne detectedColH4
add di, 160
cmp word [es:di], 0x0020
jne detectedColH4
add di, 160
cmp word [es:di], 0x0020
jne detectedColH4
jmp endCheck41

detectedColH4:
mov word [bp + 8], 1
endCheck41:
pop bx
pop ax
pop es
pop di
pop bp
ret 4

collisionCheckH5:
push bp
mov bp, sp
push di
push es
push ax
push bx

mov ax, 0xb800
mov es, ax

mov bx, [bp + 6]	;left or right movement
mov word [bp + 8], 0	;bool to return
mov di, [bp + 4]	;changed position to reset

cmp bx, 1		;1 for right
jne leftCheck5
add di, 4
cmp word [es:di], 0x0020
jne detectedColH5
add di, 160
cmp word [es:di], 0x0020
jne detectedColH5
jmp endCheck51

leftCheck5:
cmp word [es:di], 0x0020
jne detectedColH5
add di, 160
cmp word [es:di], 0x0020
jne detectedColH5
jmp endCheck51

detectedColH5:
mov word [bp + 8], 1
endCheck51:
pop bx
pop ax
pop es
pop di
pop bp
ret 4

detectCollisionV:
push bp
mov bp, sp
push ax

cmp word [bp + 6], 1		;shape no
jne nxtShape2
push word 0			;bool
push word [bp + 4]		;loc
call collisionCheckV1
pop ax
mov [bp + 8], ax		;bool
jmp endCollisionCheck

nxtShape2:
cmp word [bp + 6], 2
jne nxtShape3
push word 0
push word [bp + 4]
call collisionCheckV2
pop ax
mov [bp + 8], ax
jmp endCollisionCheck

nxtShape3:
cmp word [bp + 6], 3
jne nxtShape4
push word 0
push word [bp + 4]
call collisionCheckV3
pop ax
mov [bp + 8], ax
jmp endCollisionCheck

nxtShape4:
cmp word [bp + 6], 4
jne nxtShape5
push word 0
push word [bp + 4]
call collisionCheckV4
pop ax
mov [bp + 8], ax
jmp endCollisionCheck

nxtShape5:
cmp word [bp + 6], 5
jne endCollisionCheck
push word 0
push word [bp + 4]
call collisionCheckV5
pop ax
mov [bp + 8], ax
jmp endCollisionCheck

endCollisionCheck:
pop ax
pop bp
ret 4

detectCollisionH:
push bp
mov bp, sp
push bx
push ax
push cx

inc word [moveCount]
mov bx, [bp + 8]	;l or r
mov ax, [bp + 4]	;position

cmp word [bp + 6], 1	;shape no
jne nxtShapeH2
push word 0	;bool
push bx
push ax
call collisionCheckH1
pop cx
mov [bp + 10], cx
jmp endCollisionCheckH

nxtShapeH2:
cmp word [bp + 6], 2
jne nxtShapeH3
push word 0
push bx
push ax
call collisionCheckH2
pop cx
mov [bp + 10], cx
jmp endCollisionCheckH

nxtShapeH3:
cmp word [bp + 6], 3
jne nxtShapeH4
push word 0
push bx
push ax
call collisionCheckH3
pop cx
mov [bp + 10], cx
jmp endCollisionCheckH

nxtShapeH4:
cmp word [bp + 6], 4
jne nxtShapeH5
push word 0
push bx
push ax
call collisionCheckH4
pop cx
mov [bp + 10], cx
jmp endCollisionCheckH

nxtShapeH5:
cmp word [bp +6], 5
jne endCollisionCheckH
push word 0
push bx
push ax
call collisionCheckH5
pop cx
mov [bp + 10], cx
jmp endCollisionCheckH

endCollisionCheckH:
pop cx
pop ax
pop bx
pop bp
ret 6

updateNextShape:
push ax

mov ax, 0x1020
push ax
mov ax, 12
push ax
mov ax, 10
push ax
mov ax, 11
push ax
mov ax, 9
push ax
call DrawRect
mov word [cs:currColor], 1
push word 2110
push word [cs:incomingShape]
call printshapeatloc

pop ax
ret

printtimer:

						;prints the time in the format 'mm:ss'
	push bp
	mov bp,sp
	push ax
	push es
	push di

	
				;prints the time

	mov ax,60
	push ax
	mov ax,13
	push ax
	Call calculate		;calculating loc of printing
	pop di

	mov ax,0xb800
	mov es,ax
	add di,4
	mov al,':'				;placing ':' at the loc
	mov ah,0x17
	mov [es:di],ax
	sub di,6
	
	mov al,'0'			;placing '0' for min ex: 04:33 ,the zero is fixed
	mov [es:di],ax
	add di,2
	
	mov ax,0x17		;pushing attribute
	push ax
	
	push di			;pushing location

	mov ax,[bp+6]
	push ax			;pushing min for printing

	Call PrintInt

	add di,8					;loc for printing sec
	cmp word[bp+4],10	;comparing to append 0 at start in case of single digit
	jb singledigit

	mov ax,0x17			;printing sec
	push ax
	
	mov ax,di
	
	push ax
	
	mov ax,[bp+4]
	push ax
	Call PrintInt

	jmp nextdigit2

	singledigit:				;if sec is in single digit it will be printed by this label
		mov ax,0xb800
		mov es,ax
		
		mov al,0x30			;placing zero at first pos ex: 09
		mov ah,0x17
		mov [es:di],ax

		mov ax,0x17		;attribute
		push ax
		add di,2			;loc
		push di
		mov ax,[bp+4]		;sec
		push ax
		Call PrintInt		;priniting
	
nextdigit2:
	pop di
	pop es
	pop ax
	pop bp
Ret 4

timer:
push ax
push bx
push di
push es

inc word [cs:ticks]
inc word [cs:ticks2]

cmp word [cs:ticks2], 6
jne jmpToNxtCmp
jmp notJmp
jmpToNxtCmp:
jmp nxtCmp

notJmp:
mov bx, [cs:currPos]
mov [cs:prevPos], bx
add word [cs:currPos], 160
mov word [cs:ticks2], 0

push word 0
push word [cs:currShape]
push word [cs:currPos]
call detectCollisionV
pop bx
cmp bx, 0
je updateScreen
sub word [cs:currPos], 160

call checkgamebox

mov word [cs:prevPos], 398
mov word [cs:currPos], 398
mov bx, [cs:incomingShape]
mov [cs:currShape], bx
	
push word 5
call getRand 
pop bx
mov word [cs:incomingShape], bx
call updateNextShape

updateScreen:
mov word [cs:currColor], 0
push word [cs:prevPos]
push word [cs:currShape]
call printshapeatloc

mov word [cs:currColor], 1
push word [cs:currPos]
push word [cs:currShape]
call printshapeatloc

nxtCmp:
cmp word [cs:ticks], 18
jne end
inc word [cs:seconds]
mov word [cs:ticks], 0

cmp word [cs:seconds], 60
jne printCurrTime

inc word [cs:min]
mov word [cs:seconds], 0
cmp word [cs:min], 5
jb printCurrTime

mov word [cs:gameOver], 1

printCurrTime:
push word [cs:min]
push word [cs:seconds]
call printtimer

end:
mov al, 0x20
out 0x20, al

pop es
pop di
pop bx
pop ax
iret

keyBoardISR:
push ax
push bx
push di
push es

in al, 0x60

cmp al, 0x4D
jne nxtComp
mov bx, [cs:currPos]
mov [cs:prevPos], bx
add word [cs:currPos], 2

push word 0
push word 1
push word [cs:currShape]
push word [cs:currPos]
call detectCollisionH
pop bx
cmp bx, 0
je updateScreen2
sub word [cs:currPos], 2 	;reset if intersection detected

updateScreen2:

mov word [cs:currColor], 0
push word [cs:prevPos]
push word [cs:currShape]
call printshapeatloc

mov word [cs:currColor], 1
push word [cs:currPos]
push word [cs:currShape]
call printshapeatloc

jmp endInput

nxtComp:
cmp al, 0x4B
jne endInput
mov bx, [cs:currPos]
mov [cs:prevPos], bx
sub word [cs:currPos], 2

push word 0
push word 0
push word [cs:currShape]
push word [cs:currPos]
call detectCollisionH
pop bx
cmp bx, 0
je updateScreen3
add word [cs:currPos], 2	;reset if intersection detected. Reset only in ISR

updateScreen3:

mov word [cs:currColor], 0
push word [cs:prevPos]
push word [cs:currShape]
call printshapeatloc

mov word [cs:currColor], 1
push word [cs:currPos]
push word [cs:currShape]
call printshapeatloc

endInput:
mov al, 0x20
out 0x20, al

pop es
pop di
pop bx
pop ax
iret

Delay:
push cx
mov cx, 0xffff

delayLoop:
loop delayLoop

pop cx
Ret


tetris:
	pusha
	mov cx,10
	mov ax,0xb800
	mov es,ax
	mov ax,5	;x
	push ax
	mov ax,4	;y
	push ax
	Call calculate
	pop di	
	push di
	loopt11:
		Call Delay
		mov word[es:di],0x9020
		add di,2
		dec cx
		jnz loopt11
	pop di
	add di,8
	mov cx,5
	loopt12:
		Call Delay
		mov word[es:di],0x9020
		mov word[es:di+2],0x9020
		add di,160
		dec cx
		jnz loopt12

	mov cx,10
	mov ax,17	;x
	push ax
	mov ax,4	;y
	push ax
	Call calculate
	pop di	
	
	push di
	loope1:
		Call Delay
		mov word[es:di],0x9020
		mov word[es:di+320],0x9020
		mov word[es:di+640],0x9020
		add di,2
		dec cx
		jnz loope1

	pop di
	mov cx,5
	loope2:
		Call Delay
		mov word[es:di],0x9020
		mov word[es:di+2],0x9020
		add di,160
		dec cx
		jnz loope2

	mov cx,10
	mov ax,29	;x
	push ax
	mov ax,4	;y
	push ax
	Call calculate
	pop di	
	push di
	loopt21:
		Call Delay
		mov word[es:di],0x9020
		add di,2
		dec cx
		jnz loopt21
	pop di
	add di,8
	mov cx,5
	loopt22:
		Call Delay
		mov word[es:di],0x9020
		mov word[es:di+2],0x9020
		add di,160
		dec cx
		jnz loopt22

	
	mov ax,41	;x
	push ax
	mov ax,4	;y
	push ax
	Call calculate
	pop di	
	
	
	mov cx,9
	push di
	loopr1:
		Call Delay
		mov word[es:di],0x9020
		mov word[es:di+320],0x9020
		add di,2
		dec cx
		jnz loopr1
	mov word[es:di+160],0x9020
	mov word[es:di+320],0x9020
	mov word[es:di+320+2],0x9020
	add di,322
	
	mov cx,3
	loopr3:
		Call Delay
		mov word[es:di],0x9020
		mov word[es:di+2],0x9020
		add di,160
		dec cx
		jnz loopr3
	pop di
	
	mov cx,5
	loopr2:
		Call Delay
		mov word[es:di],0x9020
		mov word[es:di+2],0x9020
		add di,160
		dec cx
		jnz loopr2
	

	mov ax,54	;x
	push ax
	mov ax,4	;y
	push ax
	Call calculate
	pop di	
	mov cx,5
	loopi1:
		Call Delay
		mov word[es:di],0x9020
		mov word[es:di+2],0x9020
		add di,160
		dec cx
		jnz loopi1
	
	mov ax,58	;x
	push ax
	mov ax,4	;y
	push ax
	Call calculate
	pop di	
	push di
	mov cx,2
	loops1:
		Call Delay
		mov word[es:di],0x9020
		mov word[es:di+2],0x9020
		add di,160
		dec cx
		jnz loops1
	pop di
	mov cx,10
	loops2:
		Call Delay
		mov word[es:di],0x9020
		mov word[es:di+320],0x9020
		mov word[es:di+640],0x9020
		add di,2
		dec cx
		jnz loops2
	add di,318
	mov cx,3
	loops3:
		Call Delay
		mov word[es:di],0x9020
		mov word[es:di+2],0x9020
		add di,160
		dec cx
		jnz loops3
	
	popa
	Ret
start:

	Call clrscr
	Call tetris
mov ax,25	;x
	push ax
	mov ax,12	;y
	push ax
	Call calculate
	pop di		;loc
	mov ax,0x84		;attribute of text
	push ax
	mov ax,stscreen
	push ax
	mov ax,31
	push ax
	push di			;parameter3
	Call PrintText


mov ah, 00h
int 16h
mov [seed], al
push word 5
call getRand
pop bx
mov word [incomingShape], bx

Call StartGameScreen
call updateNextShape

xor ax, ax
mov es, ax

mov ax, [es:8*4]
mov [oldISR], ax

mov ax, [es:8*4+2]
mov [oldISR+2], ax

mov ax, [es:9*4]
mov [keyISR], ax

mov ax, [es:9*4+2]
mov [keyISR+2], ax

cli
mov word [es:9*4], keyBoardISR
mov [es:9*4+2], cs

mov word [es:8*4], timer
mov [es:8*4+2], cs
sti

mov ax, 0xb800
mov es, ax

gameLoop:
cmp word [gameOver], 1
jne gameLoop

call gameoverscreen

xor ax, ax
mov es, ax

mov cx, [keyISR]
mov dx, [keyISR+2]

mov ax, [oldISR]
mov bx, [oldISR+2]

cli
mov [es:9*4], cx
mov [es:9*4+2], dx

mov [es:8*4], ax
mov [es:8*4+2], bx
sti

mov ax,0x4c00
int 21h