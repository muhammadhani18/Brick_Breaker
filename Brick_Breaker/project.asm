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
    brick_col db ? 
Brick ENDS


.model small
.stack 100h
.data
    ball_1 BALL <3,150,185,2,2>
    paddle_1 Paddle <3,50,130,190,6>      
    brick_1 Brick <5,50,10,25,3,2>
    brick_2 Brick <31,50,10,25,3,3>
    brick_3 Brick <57,50,10,25,3,4>
    brick_4 Brick <83,50,10,25,3,5>
    brick_5 Brick <109,50,10,25,3,6>
    brick_6 Brick <135,50,10,25,3,7>
    brick_7 Brick <161,50,10,25,3,8>
    
    flag dw 0
    score db "SCORE: ","$"
    score_count db 0
    Lives db "Lives: ", "$"
    live_count db 0 
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
            mov al,21h
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
            mov al,brick_obj.brick_col
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
        
        draw_1:
            ;draw pixel
            mov ah,0ch
            mov al,0bh
            int 10h 

            ;loop
            inc cx 
            mov ax, cx
            sub ax,paddle_obj.paddle_x
            cmp ax,paddle_obj.paddle_w 
            jng draw_1

            inc dx 
            mov cx, paddle_obj.paddle_x
            mov ax, dx
            sub ax,paddle_obj.paddle_y
            cmp ax,paddle_obj.paddle_h 
            jng draw_1
    ENDM
    
    MoveBall MACRO ball_obj , paddle_obj
        
        ;screen resolution = 320x200, (140h x 08ch)
        ;move ball in x direction
                            
            mov ax,flag 
            .IF ax < 1

                mov ah,01h
                int 16h
                jz e 
                
                mov ah,00h
                int 16h
                
                cmp al, 32 ;space pressed 
                je flag_1
                jmp e
            .ENDIF
            
            mov ax,flag 
            .IF ax > 0
                jmp flag_1
            .ENDIF

            flag_1: 
                inc flag 
                mov ax, ball_obj.ball_vel_x
                add  ball_obj.ball_x, ax
                mov ax,ball_obj.ball_x

                ;collisions on x axis        
                .IF ax < 5 || ax > 315
                    mov ax, ball_obj.ball_vel_x
                    neg ax
                    mov ball_obj.ball_vel_x, ax
                .ENDIF
                
                
                mov ax, ball_obj.ball_vel_y
                add  ball_obj.ball_y, ax
                mov ax,ball_obj.ball_y
                
                ;collisions on y-axis
                .IF ax < 25 || ax > 195
                    mov ax, ball_obj.ball_vel_y
                    neg ax
                    mov ball_obj.ball_vel_y, ax
                .ENDIF

                mov ax, ball_obj.ball_vel_y
                add  ball_obj.ball_y, ax
                mov ax,ball_obj.ball_y
                
                


                ;paddle bounce
                mov ax, ball_obj.ball_x
                add ax, ball_obj.ball_x
                mov ax,ball_obj.ball_x

                .IF ax > paddle_obj.paddle_x
                    mov ax, paddle_obj.paddle_x
                    add ax, paddle_obj.paddle_w 
                    .IF ball_obj.ball_x < ax 
                        mov ax, ball_obj.ball_y
                        add ax,  ball_obj.ball_size
                        mov bx, paddle_obj.paddle_y
                        sub bx,5
                        .IF ax > bx 
                            mov ax,paddle_obj.paddle_y
                            add ax, paddle_obj.paddle_h
                            .IF ball_obj.ball_y < ax 
                                mov ax, ball_obj.ball_vel_y
                                neg ax
                                mov ball_obj.ball_vel_y, ax
                            .ENDIF
                        .ENDIF 
                    .ENDIF
                .ENDIF

                mov ax, ball_obj.ball_y
                add ax, ball_obj.ball_y
                mov ax,ball_obj.ball_y
                .IF ax >195
                    inc live_count
                    inc score
                .ENDIF
            e:
            


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
            ;DrawPaddle paddle_obj
    ENDM

    DetectBrick MACRO ball_obj,brick_obj
        .IF ax > brick_obj.brick_x
                    mov ax, brick_obj.brick_x
                    add ax, brick_obj.brick_w 
                    .IF ball_obj.ball_x < ax 
                        mov ax, ball_obj.ball_y
                        add ax,  ball_obj.ball_size
                        mov bx, brick_obj.brick_y
                        sub bx,5
                        .IF ax > bx 
                            mov ax,brick_obj.brick_y
                            add ax, brick_obj.brick_h
                            .IF ball_obj.ball_y < ax 
                                mov ax, ball_obj.ball_vel_y
                                neg ax
                                mov ball_obj.ball_vel_y, ax
                            .ENDIF
                        .ENDIF 
                    .ENDIF
        .ENDIF

    ENDM

    StatusBar MACRO 
        mov cx, 2
        mov dx, 20
        
        .WHILE cx < 318
            mov ah,0ch
            mov al,0Bh
            int 10h
            inc cx 
        .ENDW
        
        ;print score
        mov dh, 1     ;row
        mov dl, 1     ;column
        
        mov si, offset score
        .WHILE dl < 6
            mov ah, 2
            int 10h

            mov al,[si]    ;ASCII code of Character 
            mov bx,0
            mov bl,0010b   ;Green color
            mov cx,1       ;repetition count
            mov ah,09h
            int 10h
            inc si 
            inc dl

        .ENDW

        


        ;print lives
        mov si, offset Lives
        
        mov dh, 1     ;row
        mov dl, 25     ;column
        
        .WHILE dl < 30
            mov ah, 2
            int 10h

            mov al,[si]    ;ASCII code of Character 
            mov bx,0
            mov bl,0010b   ;Green color
            mov cx,1       ;repetition count
            mov ah,09h
            int 10h
            inc si 
            inc dl

        .ENDW
        
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
            MoveBall ball_1,paddle_1
            DrawBall ball_1  
            ;MakeBrick brick_1
            MakeBrick brick_2
            ; MakeBrick brick_3
            ; MakeBrick brick_4
            ; MakeBrick brick_5
            ; MakeBrick brick_6
            ; MakeBrick brick_7
            
            DetectBrick ball_1,brick_2
            StatusBar    
            
            mov ah,01h
            int 16h
            jz check_time 
            
            mov ah,00h
            int 16h
            
            cmp al, 65h ;if e is pressed exit the game
            je stopGame
            
            
            jmp check_time
    
    stopGame:
        mov ah,4ch
        int 21h
    main endp

end start    
