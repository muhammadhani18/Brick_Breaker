Ball STRUCT
    ball_size dw ?
    ball_x dw ?
    ball_y dw ?
    ball_vel_x dw ?
    ball_vel_y dw ?
    ball_time db ?
Ball ENDS

Paddle STRUCT
    paddle_h dw ?
    paddle_w dw ?
    paddle_x dw ?
    paddle_y dw ?
    paddle_vel dw ?
Paddle ENDS

Brick STRUCT
    brick_x dw ?
    brick_y dw ?
    brick_h dw ?
    brick_w dw ?
    brick_size dw ?
Brick ENDS


.model small
.stack 100h
.data
    ball_1 BALL <3,150,185,2,2>
    paddle_1 Paddle <3,50,130,190,6>      
    brick_1 Brick <10,10,10,25,3>
.code

    MakeScreen MACRO ;for refreshong screen to blank
        mov ah, 00h
        mov al,13h
        int 10h

        mov ah,00h
        mov bh,00h
        mov bl,00h
        int 10h
    ENDM

    DrawBall MACRO ball_obj
        mov cx, ball_obj.ball_x
        mov dx, ball_obj.ball_y 
        
        draw:
            ;draw pixel
            mov ah,0ch
            mov al,0ch
            int 10h 

            ;loop
            inc cx 
            mov ax, cx
            sub ax,ball_obj.ball_x
            cmp ax,ball_obj.ball_size 
            jng draw

            inc dx 
            mov cx, ball_obj.ball_x
            mov ax, dx
            sub ax,ball_obj.ball_y
            cmp ax,ball_obj.ball_size 
            jng draw 
    ENDM

    MakeBrick MACRO brick_obj
        mov cx,brick_obj.brick_x
        mov dx,brick_obj.brick_y

        l2:
            ;draw pixel
            mov ah,0ch
            mov al,0ch
            int 10h 

            ;loop
            inc cx 
            mov ax, cx
            sub ax,brick_obj.brick_x
            cmp ax,brick_obj.brick_w 
            jng l2

            inc dx 
            mov cx, brick_obj.brick_x
            mov ax, dx
            sub ax,brick_obj.brick_y
            cmp ax,brick_obj.brick_h 
            jng l2
    ENDM

    DrawPaddle MACRO paddle_obj
        mov cx, paddle_obj.paddle_x
        mov dx, paddle_obj.paddle_y 
        
        draw1:
            ;draw pixel
            mov ah,0ch
            mov al,0bh
            int 10h 

            ;loop
            inc cx 
            mov ax, cx
            sub ax,paddle_obj.paddle_x
            cmp ax,paddle_obj.paddle_w 
            jng draw1

            inc dx 
            mov cx, paddle_obj.paddle_x
            mov ax, dx
            sub ax,paddle_obj.paddle_y
            cmp ax,paddle_obj.paddle_h 
            jng draw1
    ENDM

    MoveBall MACRO ball_obj
        
        ;screen resolution = 320x200, (140h x 08ch)
        ;move ball in x direction
        mov ax, ball_obj.ball_vel_x
        add  ball_obj.ball_x, ax
        
        ;move ball in rght direction
        mov ax,ball_obj.ball_vel_y
        sub ball_obj.ball_y, ax
        
        collisions:
            cmp ball_obj.ball_x, 10h
            je negative
            cmp ball_obj.ball_x, 140h
            je positive

            cmp ball_obj.ball_y, 10h
            je negative2

            cmp ball_obj.ball_y, 08ch
            je positive2

        
        
            negative:
                mov ax, ball_obj.ball_vel_x
                add ball_obj.ball_x, ax
               
            negative2:    
                mov ax, ball_obj.ball_vel_y
                add ball_obj.ball_y, ax
            
            positive:
                mov ax, ball_obj.ball_vel_x
                sub ball_obj.ball_x, ax
            
            positive2:   
                mov ax, ball_obj.ball_vel_y
                add ball_obj.ball_y, ax

        l1:   
    ENDM

    MovePaddle MACRO paddle_obj
        mov ah,01h
        int 16h
        jz exit 
        
        mov ah,00h
        int 16h
        
        cmp ah, 4Bh
        je left 
        
        cmp ah, 4Dh
        je right

        
        jmp exit
       
        left:
            mov ax,paddle_obj.paddle_vel
            sub paddle_obj.paddle_x,ax 
            jmp exit
        right:
            mov ax,paddle_obj.paddle_vel
            add paddle_obj.paddle_x,ax 
        exit:    
    ENDM

    

start:

    main proc 
        mov ax,@data
        mov ds,ax
        
        check_time: ;infinite loop to keep the game going
    
            mov ah,2ch ;get time of laptop
            int 21h
            cmp dl , ball_1.ball_time
            jz check_time
            mov ball_1.ball_time,dl 
    
            MakeScreen
            MovePaddle paddle_1
            DrawPaddle paddle_1
            ;MoveBall ball_1
            DrawBall ball_1  
            MakeBrick brick_1
    
            mov ah,01h
            int 16h
            jz check_time 
            
            mov ah,00h
            int 16h
            
            cmp al, 20h ;if space is pressed lauch the ball 
            je Move
            
            cmp al, 65h ;if e is pressed exit the game
            je stopGame
            
            Move:
                MoveBall ball_1
            
            jmp check_time
    
    stopGame:
        mov ah,4ch
        int 21h
    main endp

end start    