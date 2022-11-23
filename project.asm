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

.model small
.stack 100h
.data
    ball_1 BALL <3,150,185,2,2>
    paddle_1 Paddle <3,50,130,190,6>      
.code

    MakeScreen MACRO 
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
        
        cmp ball_obj.ball_x, 10
        jl negative

        cmp ball_obj.ball_y, 10
        jl negative2

        ;cmp ball_obj.ball_y, 08ch 
        
        
        negative:
            neg ball_obj.ball_vel_x
        negative2:    
            neg ball_obj.ball_vel_y 
             
    ENDM

    MovePaddle MACRO paddle_obj
        mov ah,01h
        int 16h
        jz exit 
        
        mov ah,00h
        int 16h
        cmp ah, 4Dh
        je right

        cmp ah, 4Bh
        je left 
        jmp exit 
       
        left:
            mov ax,paddle_obj.paddle_vel
            sub paddle_obj.paddle_x,ax 
        right:
            mov ax,paddle_obj.paddle_vel
            add paddle_obj.paddle_x,ax 
        exit:    
    ENDM
start:

    main proc 
        mov ax,@data
        mov ds,ax
    
        check_time:
    
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
        jmp check_time
    
    main endp

end start    