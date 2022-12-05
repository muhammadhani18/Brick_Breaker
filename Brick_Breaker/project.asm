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
    brick_life dw 1
Brick ENDS


.model small
.stack 100h
.data
    ball_1 BALL <3,150,185,2,2>
    paddle_1 Paddle <3,50,130,190,6>      
    ball_x_copy dw 150
    ball_y_copy dw 185
    paddle_x_copy dw 130
    ;ball_x_copy dw ?

    
    brick_1 Brick <5,40,10,25,3,2>
    brick_2 Brick <31,40,10,25,3,7>
    brick_3 Brick <57,40,10,25,3,4>
    brick_4 Brick <83,40,10,25,3,5>
    brick_5 Brick <109,40,10,25,3,6>
    brick_6 Brick <135,40,10,25,3,7>
    brick_7 Brick <161,40,10,25,3,8>
    brick_8 Brick <187,40,10,25,3,9>
    brick_9 Brick <213,40,10,25,3,10>
    brick_10 Brick <238,40,10,25,3,11>
    brick_11 Brick <263,40,10,25,3,12>
    brick_12 Brick <288,40,10,25,3,13>
    brick_13 Brick <5,25,10,25,3,13>
    brick_14 Brick <31,25,10,25,3,12>
    brick_15 Brick <57,25,10,25,3,11>
    brick_16 Brick <83,25,10,25,3,10>
    brick_17 Brick <109,25,10,25,3,9>
    brick_18 Brick <135,25,10,25,3,8>
    brick_19 Brick <161,25,10,25,3,7>
    brick_20 Brick <187,25,10,25,3,6>
    brick_21 Brick <213,25,10,25,3,5>
    brick_22 Brick <238,25,10,25,3,4>
    brick_23 Brick <263,25,10,25,3,2>
    brick_24 Brick <288,25,10,25,3,1>
  
    ;level2
    brick_25 Brick <145,120,10,25,3,2>
    brick_26 Brick <132,105,10,25,3,7>
    brick_27 Brick <158,105,10,25,3,4>
    brick_28 Brick <119,90,10,25,3,5>
    brick_29 Brick <145,90,10,25,3,6>
    brick_30 Brick <171,90,10,25,3,7>
    brick_31 Brick <106,75,10,25,3,8>
    brick_32 Brick <132,75,10,25,3,9>
    brick_33 Brick <158,75,10,25,3,10>
    brick_34 Brick <184,75,10,25,3,11>
    brick_35 Brick <93,60,10,25,3,12>
    brick_36 Brick <119,60,10,25,3,13>
    brick_37 Brick <145,60,10,25,3,13>
    brick_38 Brick <171,60,10,25,3,12>
    brick_39 Brick <197,60,10,25,3,11>
    brick_40 Brick <80,45,10,25,3,10>
    brick_41 Brick <106,45,10,25,3,9>
    brick_42 Brick <132,45,10,25,3,8>
    brick_43 Brick <158,45,10,25,3,7>
    brick_44 Brick <186,45,10,25,3,6>    
    brick_45 Brick <212,45,10,25,3,5>
    brick_46 Brick <238,45,10,25,3,4>
    brick_47 Brick <54,45,10,25,3,2>
    brick_48 Brick <264,45,10,25,3,1>

    brick_49 Brick <54,30,10,25,3,2>
    brick_50 Brick <54,45,10,25,3,7>
    brick_51 Brick <54,60,10,25,3,4>
    brick_52 Brick <54,75,10,25,3,5>
    brick_53 Brick <54,90,10,25,3,6>
    brick_54 Brick <54,105,10,25,3,7>
    brick_55 Brick <80,30,10,25,3,8>
    brick_56 Brick <80,45,10,25,3,9>
    brick_57 Brick <80,60,10,25,3,10>
    brick_58 Brick <80,75,10,25,3,11>
    brick_59 Brick <80,90,10,25,3,12>
    brick_60 Brick <80,105,10,25,3,13> 
    brick_61 Brick <186,30,10,25,3,13>
    brick_62 Brick <186,45,10,25,3,12>
    brick_63 Brick <186,60,10,25,3,11>
    brick_64 Brick <186,75,10,25,3,10>
    brick_65 Brick <186,90,10,25,3,9>
    brick_66 Brick <186,105,10,25,3,8>
    brick_67 Brick <212,30,10,25,3,7>
    brick_68 Brick <212,45,10,25,3,6>
    brick_69 Brick <212,60,10,25,3,5>
    brick_70 Brick <212,75,10,25,3,4>
    brick_71 Brick <212,90,10,25,3,2>
    brick_72 Brick <212,105,10,25,3,1>
   
    flag dw 0
    score db " SCORE: ","$"
    score_count dw 0
    Lives db "Lives: ", "$"
    live_count db 3 
    level_1 db 1
    level_2 db 0
    level_3 db 0
    clear_flag db 0
    clear_flag_3 db 0
    Welcome_Str db "Press Space To Start $"  ;20
    EnterName_Str db "Enter your name: $"    ;16
    YourName_Str db "Your Name: $"           ;10 
    Title_Str db "BRICK BREAKER $"           ;13
    NewGame_Str db "New Game $"              ;8
    Instructions_Str db "Instructions $"     ;12
    HighScore_Str db "High Score $"          ;10
    Exit_Str db "Exit $"                     ;4
    Instructions_Str_Heading db "Instructions: $"     ;13
    Instructions_Str_1 db "Use the left and right arrow $" ;28 
    Instructions_Str_2 db "keys to control the paddle $";26
    Instructions_Str_Exit db "Press Backspace to go back. $" ;27
    YouWin_Str db "You Win! $" ;8
    YouWin2_Str db "Press Space To Continue $" ;25
    Name_Str db 100 dup(?)
    Name_Str_Size db 0
    Original_Name_Str_Size db 0
    Menu_Cursor db 1
    Ball_Radius db 5
    Ball_New_Radius db 5
    counter db 0
.code
jmp entry

Enter_Str_Output MACRO 
    mov si, offset EnterName_Str
        
    mov dh, 12     ;row
    mov dl, 10     ;column
    .WHILE dl < 26    ; starting poistion + size of string
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
endm


InputName MACRO
    mov si, offset Name_Str
    mov dh,13 ; row
    mov dl,10 ; coulmn
    INPUTLOOP:
        INPUTLOOP1:
            mov ah, 2
            int 10h
            mov ah,0h
            int 16h
        putou1:
            cmp al,32
            jne PRESSED_CHARACTER
            jmp InputName_Exit
            jmp loop1

    PRESSED_CHARACTER:
        mov [si],al
        mov bx,0
        mov bl,71h   ;Green color
        mov cx,1       ;repetition count
        mov ah,09h
        int 10h
        inc si 
        inc dl
        inc Name_Str_Size
    jmp INPUTLOOP1
    InputName_Exit:
    mov al,Name_Str_Size
    mov Original_Name_Str_Size,al
endm

Welcome_Str_Output MACRO 
    mov si, offset Welcome_Str
        
    mov dh, 13     ;row
    mov dl, 10     ;column
    .WHILE dl < 30    ; starting poistion + size of string
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
endm
MakeScreen MACRO ;for refreshing screen to blank
    mov ah, 00h
    mov al,13h
    int 10h

    mov ah,00h
    mov bh,00h
    mov bl,00h
    int 10h
ENDM


OutputName MACRO 
    mov si, offset Name_Str
        
    mov dh, 12     ;row
    mov dl, 10     ;column
    add Name_Str_Size,10
    .WHILE dl < Name_Str_Size   ; starting poistion + size of string
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
endm

Menu MACRO                                          ;MENU AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    ;    MAKING BOX AROUND TITLE AAAAAAAAAAAAA
    rectangle:
        mov bx,118
        MOV CX, 80   ;(column)
        MOV DX, 27    ;(row)
        row1:
        cmp bx,0
        je coulmn1
        MOV AL, 1110b  ;yellow color
        MOV AH, 0CH
        INT 10H
        inc cx
        dec bx
        jmp row1

    coulmn1:
        mov bx,18
        loop01:
        cmp bx,0
        je row2
        MOV AL, 1110b  ;yellow color
        MOV AH, 0CH
        INT 10H
        inc dx
        dec bx
        jmp loop01

    row2:
        mov bx,118
        loop02:
        cmp bx,0
        je coulmn2
        mov AL, 1110b
        mov AH, 0CH
        INT 10H
        dec cx
        dec bx
        jmp loop02

    coulmn2:
        mov bx,18
        loop03:
        cmp bx,0
        je func_exit
        mov AL,1110b
        mov AH, 0Ch
        INT 10h
        dec dx
        dec bx
        jmp loop03

    func_exit:


    mov si, offset YourName_Str
        
    mov dh, 0     ;row
    mov dl, 29     ;column
    .WHILE dl < 39    ; starting poistion + size of string
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


    mov si, offset Name_Str
    
    mov dh, 1     ;row
    mov dl, 39     ;column
    sub dl,Original_Name_Str_Size
    add Name_Str_Size,dl
    .WHILE dl < Name_Str_Size   ; starting poistion + size of string
        mov ah, 2
        int 10h

        mov al,[si]    ;ASCII code of Character 
        mov bx,0
        mov bl,71h   ;Green color
        mov cx,1       ;repetition count
        mov ah,09h
        int 10h
        inc si 
        inc dl
        .ENDW
    mov al,Original_Name_Str_Size
    mov Name_Str_Size,al

    mov si, offset Title_Str
        
    mov dh, 4     ;row
    mov dl, 11     ;column
    .WHILE dl < 24    ; starting poistion + size of string
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

        mov si, offset NewGame_Str
        
    mov dh, 9     ;row
    mov dl, 14     ;column
    .WHILE dl < 23    ; starting poistion + size of string
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

        mov si, offset Instructions_Str
        
    mov dh, 11     ;row
    mov dl, 12     ;column
    .WHILE dl < 24    ; starting poistion + size of string
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

            mov si, offset HighScore_Str
        
    mov dh, 13     ;row
    mov dl, 13     ;column
    .WHILE dl < 23    ; starting poistion + size of string
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


            mov si, offset Exit_Str
        
    mov dh, 15     ;row
    mov dl, 15     ;column
    .WHILE dl < 19    ; starting poistion + size of string
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

    

    mov al,Menu_Cursor
    cmp al,1
    jne SECOND_RECTANGLE

    ;NORMAL BALL FOR MENU AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    MOV CX, 93   ;(column)
    MOV DX, 70   ;(row)

    mov bl,Ball_Radius
    TOP_BASE:
        line1:
        cmp bx,0
        je NEXTLINE
        MOV AL, 1110b  ;yellow color
        MOV AH, 0CH
        INT 10H
        inc cx
        dec bx
        jmp line1
        NEXTLINE:
        dec Ball_Radius
        mov bx,0
        cmp Ball_Radius,bl
        je TOP_BASE_EXIT
        inc dx
        sub cl,Ball_New_Radius
        dec cx
        add Ball_New_Radius,2
        mov bl,Ball_New_Radius
        jmp line1
        TOP_BASE_EXIT:
        mov bl,Ball_New_Radius
        sub cl,Ball_New_Radius
        inc dx
        .WHILE bx > 0
        MOV AL, 1110b  ;yellow color
        MOV AH, 0CH
        INT 10H
        inc cx
        dec bx
        .ENDW

        BOTTOM_BASE:
        inc dx
        sub cl,Ball_New_Radius
        mov bx,5
        mov Ball_Radius, bl
        mov bl,Ball_New_Radius
        line2:
        cmp bx,0
        je NEXTLINE_1
        MOV AL, 1110b  ;yellow color
        MOV AH, 0CH
        INT 10H
        inc cx
        dec bx
        jmp line2
        NEXTLINE_1:
        dec Ball_Radius
        mov bx,0
        cmp Ball_Radius,bl
        je BOTTOM_BASE_EXIT
        inc dx
        sub cl,Ball_New_Radius
        inc cx
        sub Ball_New_Radius,2
        mov bl,Ball_New_Radius
        jmp line2
    BOTTOM_BASE_EXIT:
        mov bl,5
        mov Ball_Radius, bl
        mov Ball_New_Radius, bl
                            ; FIRST RECTANGLE AAAAAAAAAAAAAAAAAAAA
    rectangle1:
        mov bx, 70
        MOV CX, 107   ;(column)
        MOV DX, 68    ;(row)
        row11:
        cmp bx,0
        je coulmn11
        MOV AL, 1110b  ;yellow color
        MOV AH, 0CH
        INT 10H
        inc cx
        dec bx
        jmp row11

        coulmn11:
        mov bx,15
        loop011:
        cmp bx,0
        je row21
        MOV AL, 1110b  ;yellow color
        MOV AH, 0CH
        INT 10H
        inc dx
        dec bx
        jmp loop011

        row21:
        mov bx,70
        loop021:
        cmp bx,0
        je coulmn21
        mov AL, 1110b
        mov AH, 0CH
        INT 10H
        dec cx
        dec bx
        jmp loop021

        coulmn21:
        mov bx,15
        loop031:
        cmp bx,0
        je func_exit1
        mov AL,1110b
        mov AH, 0Ch
        INT 10h
        dec dx
        dec bx
        jmp loop031



    SECOND_RECTANGLE:

    mov al,Menu_Cursor
    cmp al,2
    jne THIRD_RECTANGLE
    
    ;NORMAL BALL FOR MENU AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    MOV CX, 80   ;(column)
    MOV DX, 85   ;(row)
    mov bl,Ball_Radius
    TOP_BASE2:
        line12:
        cmp bx,0
        je NEXTLINE2
        MOV AL, 1110b  ;yellow color
        MOV AH, 0CH
        INT 10H
        inc cx
        dec bx
        jmp line12
        NEXTLINE2:
        dec Ball_Radius
        mov bx,0
        cmp Ball_Radius,bl
        je TOP_BASE_EXIT2
        inc dx
        sub cl,Ball_New_Radius
        dec cx
        add Ball_New_Radius,2
        mov bl,Ball_New_Radius
        jmp line12
        TOP_BASE_EXIT2:
        mov bl,Ball_New_Radius
        sub cl,Ball_New_Radius
        inc dx
        .WHILE bx > 0
        MOV AL, 1110b  ;yellow color
        MOV AH, 0CH
        INT 10H
        inc cx
        dec bx
        .ENDW

        BOTTOM_BASE2:
        inc dx
        sub cl,Ball_New_Radius
        mov bx,5
        mov Ball_Radius, bl
        mov bl,Ball_New_Radius
        line22:
        cmp bx,0
        je NEXTLINE_12
        MOV AL, 1110b  ;yellow color
        MOV AH, 0CH
        INT 10H
        inc cx
        dec bx
        jmp line22
        NEXTLINE_12:
        dec Ball_Radius
        mov bx,0
        cmp Ball_Radius,bl
        je BOTTOM_BASE_EXIT2
        inc dx
        sub cl,Ball_New_Radius
        inc cx
        sub Ball_New_Radius,2
        mov bl,Ball_New_Radius
        jmp line22
    BOTTOM_BASE_EXIT2:
        mov bl,5
        mov Ball_Radius, bl
        mov Ball_New_Radius, bl


    rectangle2:
        mov bx, 100
        MOV CX, 92   ;(column)
        MOV DX, 83    ;(row)
        row12:
        cmp bx,0
        je coulmn12
        MOV AL, 1110b  ;yellow color
        MOV AH, 0CH
        INT 10H
        inc cx
        dec bx
        jmp row12

        coulmn12:
        mov bx,15
        loop012:
        cmp bx,0
        je row22
        MOV AL, 1110b  ;yellow color
        MOV AH, 0CH
        INT 10H
        inc dx
        dec bx
        jmp loop012

        row22:
        mov bx,100
        loop022:
        cmp bx,0
        je coulmn22
        mov AL, 1110b
        mov AH, 0CH
        INT 10H
        dec cx
        dec bx
        jmp loop022

        coulmn22:
        mov bx,15
        loop032:
        cmp bx,0
        je func_exit1
        mov AL,1110b
        mov AH, 0Ch
        INT 10h
        dec dx
        dec bx
        jmp loop032






    
    THIRD_RECTANGLE:

    mov al,Menu_Cursor
    cmp al,3
    jne FOURTH_RECTANGLE

    MOV CX, 85   ;(column)
    MOV DX, 100   ;(row)
    mov bl,Ball_Radius
    TOP_BASE3:
        line13:
        cmp bx,0
        je NEXTLINE3
        MOV AL, 1110b  ;yellow color
        MOV AH, 0CH
        INT 10H
        inc cx
        dec bx
        jmp line13
        NEXTLINE3:
        dec Ball_Radius
        mov bx,0
        cmp Ball_Radius,bl
        je TOP_BASE_EXIT3
        inc dx
        sub cl,Ball_New_Radius
        dec cx
        add Ball_New_Radius,2
        mov bl,Ball_New_Radius
        jmp line13
        TOP_BASE_EXIT3:
        mov bl,Ball_New_Radius
        sub cl,Ball_New_Radius
        inc dx
        .WHILE bx > 0
        MOV AL, 1110b  ;yellow color
        MOV AH, 0CH
        INT 10H
        inc cx
        dec bx
        .ENDW

        BOTTOM_BASE3:
        inc dx
        sub cl,Ball_New_Radius
        mov bx,5
        mov Ball_Radius, bl
        mov bl,Ball_New_Radius
        line23:
        cmp bx,0
        je NEXTLINE_13
        MOV AL, 1110b  ;yellow color
        MOV AH, 0CH
        INT 10H
        inc cx
        dec bx
        jmp line23
        NEXTLINE_13:
        dec Ball_Radius
        mov bx,0
        cmp Ball_Radius,bl
        je BOTTOM_BASE_EXIT3
        inc dx
        sub cl,Ball_New_Radius
        inc cx
        sub Ball_New_Radius,2
        mov bl,Ball_New_Radius
        jmp line23
    BOTTOM_BASE_EXIT3:
        mov bl,5
        mov Ball_Radius, bl
        mov Ball_New_Radius, bl

    
    rectangle3:
        mov bx, 84
        MOV CX, 100   ;(column)
        MOV DX, 98    ;(row)
        row13:
        cmp bx,0
        je coulmn13
        MOV AL, 1110b  ;yellow color
        MOV AH, 0CH
        INT 10H
        inc cx
        dec bx
        jmp row13

        coulmn13:
        mov bx,15
        loop013:
        cmp bx,0
        je row23
        MOV AL, 1110b  ;yellow color
        MOV AH, 0CH
        INT 10H
        inc dx
        dec bx
        jmp loop013

        row23:
        mov bx,84
        loop023:
        cmp bx,0
        je coulmn23
        mov AL, 1110b
        mov AH, 0CH
        INT 10H
        dec cx
        dec bx
        jmp loop023

        coulmn23:
        mov bx,15
        loop033:
        cmp bx,0
        je func_exit1
        mov AL,1110b
        mov AH, 0Ch
        INT 10h
        dec dx
        dec bx
        jmp loop033
        

    FOURTH_RECTANGLE:

    MOV CX, 102   ;(column)
    MOV DX, 118   ;(row)
    mov bl,Ball_Radius
    TOP_BASE4:
        line14:
        cmp bx,0
        je NEXTLINE4
        MOV AL, 1110b  ;yellow color
        MOV AH, 0CH
        INT 10H
        inc cx
        dec bx
        jmp line14
        NEXTLINE4:
        dec Ball_Radius
        mov bx,0
        cmp Ball_Radius,bl
        je TOP_BASE_EXIT4
        inc dx
        sub cl,Ball_New_Radius
        dec cx
        add Ball_New_Radius,2
        mov bl,Ball_New_Radius
        jmp line14
        TOP_BASE_EXIT4:
        mov bl,Ball_New_Radius
        sub cl,Ball_New_Radius
        inc dx
        .WHILE bx > 0
        MOV AL, 1110b  ;yellow color
        MOV AH, 0CH
        INT 10H
        inc cx
        dec bx
        .ENDW

        BOTTOM_BASE4:
        inc dx
        sub cl,Ball_New_Radius
        mov bx,5
        mov Ball_Radius, bl
        mov bl,Ball_New_Radius
        line24:
        cmp bx,0
        je NEXTLINE_14
        MOV AL, 1110b  ;yellow color
        MOV AH, 0CH
        INT 10H
        inc cx
        dec bx
        jmp line24
        NEXTLINE_14:
        dec Ball_Radius
        mov bx,0
        cmp Ball_Radius,bl
        je BOTTOM_BASE_EXIT4
        inc dx
        sub cl,Ball_New_Radius
        inc cx
        sub Ball_New_Radius,2
        mov bl,Ball_New_Radius
        jmp line24
    BOTTOM_BASE_EXIT4:
        mov bl,5
        mov Ball_Radius, bl
        mov Ball_New_Radius, bl
    rectangle4:
        mov bx, 40
        MOV CX, 115   ;(column)
        MOV DX, 116    ;(row)
        row14:
        cmp bx,0
        je coulmn14
        MOV AL, 1110b  ;yellow color
        MOV AH, 0CH
        INT 10H
        inc cx
        dec bx
        jmp row14

        coulmn14:
        mov bx,15
        loop014:
        cmp bx,0
        je row24
        MOV AL, 1110b  ;yellow color
        MOV AH, 0CH
        INT 10H
        inc dx
        dec bx
        jmp loop014

        row24:
        mov bx,40
        loop024:
        cmp bx,0
        je coulmn24
        mov AL, 1110b
        mov AH, 0CH
        INT 10H
        dec cx
        dec bx
        jmp loop024

        coulmn24:
        mov bx,15
        loop034:
        cmp bx,0
        je func_exit1
        mov AL,1110b
        mov AH, 0Ch
        INT 10h
        dec dx
        dec bx
        jmp loop034
        
     func_exit2:
     func_exit1:
endm

Instructions_Func MACRO
    mov si, offset Instructions_Str_Heading
        
    mov dh, 02     ;row
    mov dl, 02     ;column
    .WHILE dl < 15    ; starting poistion + size of string
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


    mov si, offset Instructions_Str_1
        
    mov dh, 06     ;row
    mov dl, 5     ;column
    .WHILE dl < 33    ; starting poistion + size of string
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

    mov si, offset Instructions_Str_2
        
    mov dh, 07     ;row
    mov dl, 5     ;column
    .WHILE dl < 31    ; starting poistion + size of string
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

    mov si, offset Instructions_Str_Exit

    mov dh, 20     ;row
    mov dl, 5     ;column
    .WHILE dl < 32    ; starting poistion + size of string
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

    loop51:
    mov ah,0h
    int 16h
    putout41:
    cmp al,8
    je PRESSED_BACKSPACE
    jmp loop51

    PRESSED_BACKSPACE:

endm


beep proc
        push ax
        push bx
        push cx
        push dx
        mov     al, 182         ; Prepare the speaker for the
        out     43h, al         ;  note.
        mov     ax, 4560        ; Frequency number (in decimal)
                                ;  for middle C.
        out     42h, al         ; Output low byte.
        mov     al, ah          ; Output high byte.
        out     42h, al 
        in      al, 61h         ; Turn on note (get value from
                                ;  port 61h).
        or      al, 00000011b   ; Set bits 1 and 0.
        out     61h, al         ; Send new value.
        mov     bx, 2          ; Pause for duration of note.
    pause1:
        mov     cx, 65535
    pause2:
        dec     cx
        jne     pause2
        dec     bx
        jne     pause1
        in      al, 61h         ; Turn off note (get value from
                                ;  port 61h).
        and     al, 11111100b   ; Reset bits 1 and 0.
        out     61h, al         ; Send new value.

        pop dx
        pop cx
        pop bx
        pop ax

    ret
beep endp



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
            mov al,1000b
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
        DrawBall01 MACRO ball_obj
        mov cx, ball_obj.ball_x
        mov dx, ball_obj.ball_y 
        
        draw1:
            ;draw pixel
            mov ah,0ch
            mov al,1000b
            int 10h 

            ;loop
            inc cx 
            mov ax, cx
            sub ax,ball_obj.ball_x
            cmp ax,ball_obj.ball_size 
            jng draw1

            inc dx 
            mov cx, ball_obj.ball_x
            mov ax, dx
            sub ax,ball_obj.ball_y
            cmp ax,ball_obj.ball_size 
            jng draw1
    ENDM
    
    DrawBallBlack MACRO ball_obj
        mov cx, ball_obj.ball_x
        mov dx, ball_obj.ball_y 
        
        draw_5:
            ;draw pixel
            mov ah,0ch
            mov al,0000b
            int 10h 

            ;loop
            inc cx 
            mov ax, cx
            sub ax,ball_obj.ball_x
            cmp ax,ball_obj.ball_size 
            jng draw_5

            inc dx 
            mov cx, ball_obj.ball_x
            mov ax, dx
            sub ax,ball_obj.ball_y
            cmp ax,ball_obj.ball_size 
            jng draw_5
    ENDM

    
    MakeBrick MACRO brick_obj
        mov ax, brick_obj.brick_life
        .IF ax > 0

            mov cx,brick_obj.brick_x
            mov dx,brick_obj.brick_y
            
            mov bx, cx
            add bx, 25
            .WHILE cx < bx 
                mov ah,0ch
                mov al,brick_obj.brick_col
                int 10h
                inc cx 
            .ENDW

            mov bx, dx
            add bx, 13
            .WHILE dx < bx
                mov ah,0ch
                mov al,brick_obj.brick_col
                int 10h
                inc dx
            .ENDW

            mov cx,brick_obj.brick_x
            mov dx,brick_obj.brick_y
            
            mov bx, dx
            add bx, 12
            .WHILE dx < bx 
                mov ah,0ch
                mov al,brick_obj.brick_col
                int 10h
                inc dx
            .ENDW
            
            mov cx,brick_obj.brick_x
            mov bx, cx
            add bx, 25
            .WHILE cx < bx
                mov ah,0ch
                mov al,brick_obj.brick_col
                int 10h
                inc cx 
            .ENDW
        .ELSE   
            MakeBrickBlack brick_obj 
        .ENDIF    
    ENDM
    
    MakeBrickBlack MACRO brick_obj
        mov cx,brick_obj.brick_x
        mov dx,brick_obj.brick_y
        
        mov bx, cx
        add bx, 25
        .WHILE cx < bx 
            mov ah,0ch
            mov al,0h
            int 10h
            inc cx 
        .ENDW

        mov bx, dx
        add bx, 13
        .WHILE dx < bx
            mov ah,0ch
            mov al,0
            int 10h
            inc dx
        .ENDW

        mov cx,brick_obj.brick_x
        mov dx,brick_obj.brick_y
        
        mov bx, dx
        add bx, 12
        .WHILE dx < bx 
            mov ah,0ch
            mov al,0
            int 10h
            inc dx
        .ENDW
        
        mov cx,brick_obj.brick_x
        mov bx, cx
        add bx, 25
        .WHILE cx < bx
            mov ah,0ch
            mov al,0
            int 10h
            inc cx 
        .ENDW

    ENDM

    DrawPaddle MACRO paddle_obj
        mov cx, paddle_obj.paddle_x
        mov dx, paddle_obj.paddle_y 
        
        draw_1:
            ;draw pixel
            mov ah,0ch
            mov al,0100b
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

     DrawPaddle01 MACRO paddle_obj
        mov cx, paddle_obj.paddle_x
        mov dx, paddle_obj.paddle_y 
        
        draw_01:
            ;draw pixel
            mov ah,0ch
            mov al,0100b
            int 10h 

            ;loop
            inc cx 
            mov ax, cx
            sub ax,paddle_obj.paddle_x
            cmp ax,paddle_obj.paddle_w 
            jng draw_01

            inc dx 
            mov cx, paddle_obj.paddle_x
            mov ax, dx
            sub ax,paddle_obj.paddle_y
            cmp ax,paddle_obj.paddle_h 
            jng draw_01
    ENDM
    
   
    DrawPaddleBlack MACRO paddle_obj
        mov cx, paddle_obj.paddle_x
        mov dx, paddle_obj.paddle_y 
        
        draw_2:
            ;draw pixel
            mov ah,0ch
            mov al,0000b
            int 10h 

            ;loop
            inc cx 
            mov ax, cx
            sub ax,paddle_obj.paddle_x
            cmp ax,paddle_obj.paddle_w 
            jng draw_2

            inc dx 
            mov cx, paddle_obj.paddle_x
            mov ax, dx
            sub ax,paddle_obj.paddle_y
            cmp ax,paddle_obj.paddle_h 
            jng draw_2
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

                
                


                ;paddle bounce
                mov ax, ball_obj.ball_x
                add ax, ball_obj.ball_size
                .IF ax > paddle_obj.paddle_x
                    mov ax, paddle_obj.paddle_x
                    add ax, paddle_obj.paddle_w 
                    .IF ball_obj.ball_x < ax 
                        mov ax, ball_obj.ball_y
                        add ax,  ball_obj.ball_size
                        mov bx, paddle_obj.paddle_y
                        sub bx,4
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

                mov ax, ball_obj.ball_vel_y
                add  ball_obj.ball_y,ax  
                mov ax,ball_obj.ball_y
                .IF ax > 195
                    dec live_count
                    mov ax, ball_obj.ball_vel_y
                    neg ax
                    mov ball_obj.ball_vel_y, ax
                    
                    
                    mov ax, ball_x_copy
       
                    mov ball_obj.ball_x, ax      
                    
                    mov ax, ball_y_copy
                    mov ball_obj.ball_y, ax      
                    
                    mov ax, paddle_x_copy
                    mov paddle_obj.paddle_x, ax
                    mov ax,0
                    mov flag,ax 

                    cmp live_count,0
                    je stopGame
                    ;mov ax,live_count

                .ENDIF
            e:     
    
    ENDM

    RestFlag MACRO ball_obj,paddle_obj
        mov ax, ball_x_copy
        mov ball_obj.ball_x, ax      
        
        mov ax, ball_y_copy
        mov ball_obj.ball_y, ax      
        
        mov ax, paddle_x_copy
        mov paddle_obj.paddle_x, ax      
    ENDM

    MovePaddle MACRO paddle_obj
        mov ah,01h
        int 16h
        jz exit 
        
        mov ah,00h
        int 16h
        
        cmp al,112
        jne NOT_INFINITE_LOOP
        loop001:
        DrawPaddle01 paddle_1
        DrawBall01 ball_1
        mov ah,0h
        int 16h
        cmp al,112
        je check_time
        jmp loop001
        NOT_INFINITE_LOOP:

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

    DisplayBrick MACRO 
        mov ah, level_1
        .IF ah == 1
            MakeBrick brick_1
            MakeBrick brick_2
            MakeBrick brick_3
            MakeBrick brick_4
            MakeBrick brick_5
            MakeBrick brick_6
            MakeBrick brick_7
            MakeBrick brick_8
            MakeBrick brick_9
            MakeBrick brick_10
            MakeBrick brick_11
            MakeBrick brick_12        
            MakeBrick brick_13
            MakeBrick brick_14
            MakeBrick brick_15
            MakeBrick brick_16
            MakeBrick brick_17
            MakeBrick brick_18
            MakeBrick brick_19
            MakeBrick brick_20
            MakeBrick brick_21
            MakeBrick brick_22
            MakeBrick brick_23
            MakeBrick brick_24
        .ENDIF     
        
        mov ah,level_2
        .IF ah  == 1
            MakeBrick brick_25
            MakeBrick brick_26
            MakeBrick brick_27
            MakeBrick brick_28
            MakeBrick brick_29
            MakeBrick brick_30
            MakeBrick brick_31
            MakeBrick brick_32
            MakeBrick brick_33
            MakeBrick brick_34
            MakeBrick brick_35
            MakeBrick brick_36
            MakeBrick brick_37
            MakeBrick brick_38
            MakeBrick brick_39
            MakeBrick brick_40
            MakeBrick brick_41
            MakeBrick brick_42
            MakeBrick brick_43
            MakeBrick brick_44
            MakeBrick brick_45
            MakeBrick brick_46
            MakeBrick brick_47
            MakeBrick brick_48
            
        .ENDIF

        mov ah,level_3
        .IF ah==1
            MakeBrick brick_49
            MakeBrick brick_50
            MakeBrick brick_51
            MakeBrick brick_52
            MakeBrick brick_53
            MakeBrick brick_54
            MakeBrick brick_55
            MakeBrick brick_56
            MakeBrick brick_57
            MakeBrick brick_58
            MakeBrick brick_59
            MakeBrick brick_60
            MakeBrick brick_61
            MakeBrick brick_62
            MakeBrick brick_63
            MakeBrick brick_64
            MakeBrick brick_65
            MakeBrick brick_66
            MakeBrick brick_67
            MakeBrick brick_68
            MakeBrick brick_69
            MakeBrick brick_70
            MakeBrick brick_71
            MakeBrick brick_72
        .ENDIF
    ENDM

    DetectBrick MACRO ball_obj, brick_obj
		
        .IF brick_obj.brick_x != 0 
        mov ax, ball_obj.ball_x
        add ax, ball_obj.ball_size
        add ax, 4
        .IF ax > brick_obj.brick_x
            mov ax, brick_obj.brick_x
            add ax, brick_obj.brick_w 
            .IF ball_obj.ball_x < ax 
                mov ax, ball_obj.ball_y
                add ax,  ball_obj.ball_size
                add ax,5
                mov bx, brick_obj.brick_y
                .IF ax > bx 
                    mov ax,brick_obj.brick_y
                    add ax, brick_obj.brick_h
                    add ax,5
                    .IF ball_obj.ball_y < ax 
                        mov ax, ball_obj.ball_vel_y
                        neg ax
                        mov ball_obj.ball_vel_y, ax
                        inc score_count  
                        dec brick_obj.brick_life
                    .ENDIF
                    .IF brick_obj.brick_life == 0
                        MakeBrickBlack brick_obj 
                        mov brick_obj.brick_x, 0
                        mov brick_obj.brick_y, 0
                    .ENDIF
                .ENDIF
            .ENDIF 
        .ENDIF
        .ENDIF
        mov ax,score_count
        .IF score_count >= 5
            mov ah,1
            mov level_2,ah
            mov ah,0
            mov level_1,ah 
        .ENDIF
        
        mov ax,score_count
        .IF score_count >=10 
            mov ah,1
            mov level_3,ah
            mov ah,0
            mov level_2,ah 
        .ENDIF
         mov ax,score_count
    .IF score_count >=15
            mov ah,0
            mov level_3,ah
            mov ah,0
            mov level_2,ah
            MakeScreen
        mov si, offset YouWin_Str
        
        mov dh, 12     ;row
        mov dl, 15    ;column
        .WHILE dl < 23    ; starting poistion + size of string
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

                mov si, offset YouWin2_Str
        
        mov dh, 13     ;row
        mov dl, 7     ;column
        .WHILE dl < 30    ; starting poistion + size of string
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
    .WHILE ah < 30
    mov ah,0h
    int 16h
    cmp al,32
    je stopGame
    .ENDW



    .ENDIF
    ENDM



    DetectBrickCollision MACRO
        mov ah,level_1
        .IF ah == 1
            DetectBrick ball_1,brick_1
            DetectBrick ball_1,brick_2
            DetectBrick ball_1,brick_3 
            DetectBrick ball_1,brick_4 
            DetectBrick ball_1,brick_5
            DetectBrick ball_1,brick_6 
            DetectBrick ball_1,brick_7 
            DetectBrick ball_1,brick_8
            DetectBrick ball_1,brick_9
            DetectBrick ball_1,brick_10
            DetectBrick ball_1,brick_11
            DetectBrick ball_1,brick_12
            DetectBrick ball_1,brick_13
            DetectBrick ball_1,brick_14 
            DetectBrick ball_1,brick_15 
            DetectBrick ball_1,brick_16 
            DetectBrick ball_1,brick_17 
            DetectBrick ball_1,brick_18 
            DetectBrick ball_1,brick_19 
            DetectBrick ball_1,brick_20  
            DetectBrick ball_1,brick_21  
            DetectBrick ball_1,brick_22  
            DetectBrick ball_1,brick_23  
            DetectBrick ball_1,brick_24 
        .ENDIF
        
        ;level 2
        mov ah,level_2
        .IF ah==1
            mov ah,clear_flag
            .IF ah ==0
                MakeScreen
                mov ax,3
                mov ball_1.ball_vel_x,ax 
                mov ball_1.ball_vel_y,ax 
                mov ax,40
                mov paddle_1.paddle_w,ax
                mov ax,8
                mov paddle_1.paddle_vel,ax
                
                mov ax, ball_1.ball_vel_y
                    neg ax
                    mov ball_1.ball_vel_y, ax
                    
                    
                    mov ax, ball_x_copy
       
                    mov ball_1.ball_x, ax      
                    
                    mov ax, ball_y_copy
                    mov ball_1.ball_y, ax      
                    
                    mov ax, paddle_x_copy
                    mov paddle_1.paddle_x, ax
                    mov ax,0
                    mov flag,ax 
            .ENDIF
            mov ah,1
            mov clear_flag,ah

            DetectBrick ball_1,brick_25
            DetectBrick ball_1,brick_26
            DetectBrick ball_1,brick_27
            DetectBrick ball_1,brick_28
            DetectBrick ball_1,brick_29
            DetectBrick ball_1,brick_30
            DetectBrick ball_1,brick_31
            DetectBrick ball_1,brick_32
            DetectBrick ball_1,brick_33
            DetectBrick ball_1,brick_34
            DetectBrick ball_1,brick_35
            DetectBrick ball_1,brick_36
            DetectBrick ball_1,brick_37
            DetectBrick ball_1,brick_38
            DetectBrick ball_1,brick_39
            DetectBrick ball_1,brick_40
            DetectBrick ball_1,brick_41
            DetectBrick ball_1,brick_42
            DetectBrick ball_1,brick_43
            DetectBrick ball_1,brick_44
            DetectBrick ball_1,brick_45
            DetectBrick ball_1,brick_46
            DetectBrick ball_1,brick_47
            DetectBrick ball_1,brick_48
        .ENDIF

        mov ah,level_3
        .IF ah==1
            mov ah,clear_flag_3
            .IF ah ==0
                MakeScreen

                mov ax, ball_1.ball_vel_y
                    neg ax
                    mov ball_1.ball_vel_y, ax
                    
                    
                    mov ax, ball_x_copy
       
                    mov ball_1.ball_x, ax      
                    
                    mov ax, ball_y_copy
                    mov ball_1.ball_y, ax      
                    
                    mov ax, paddle_x_copy
                    mov paddle_1.paddle_x, ax
                    mov ax,0
                    mov flag,ax
            .ENDIF
            mov ah,1
            mov clear_flag_3,ah

                DetectBrick ball_1,brick_49
                DetectBrick ball_1,brick_50
                DetectBrick ball_1,brick_51
                DetectBrick ball_1,brick_52
                DetectBrick ball_1,brick_53
                DetectBrick ball_1,brick_54
                DetectBrick ball_1,brick_55
                DetectBrick ball_1,brick_56
                DetectBrick ball_1,brick_57
                DetectBrick ball_1,brick_58
                DetectBrick ball_1,brick_59
                DetectBrick ball_1,brick_60
                DetectBrick ball_1,brick_61
                DetectBrick ball_1,brick_62
                DetectBrick ball_1,brick_63
                DetectBrick ball_1,brick_64
                DetectBrick ball_1,brick_65
                DetectBrick ball_1,brick_66
                DetectBrick ball_1,brick_67
                DetectBrick ball_1,brick_68
                DetectBrick ball_1,brick_69
                DetectBrick ball_1,brick_70
                DetectBrick ball_1,brick_71
                DetectBrick ball_1,brick_72
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
        .WHILE dl <= 11
            mov ah, 2
            int 10h
            .IF dl < 9 
                mov al,[si]    ;ASCII code of Character 
                mov bx,0
                mov bl,0111b   ;Green color
                mov cx,1       ;repetition count
                mov ah,09h
                int 10h
                inc si 
                inc dl
            .ENDIF 
            .IF dl >= 9
                
                mov al,3    ;ASCII code of Character 
                mov bx,0
                mov bl,0100b   ;Green color
                mov cx,1       ;repetition count
                mov ah,09h
                int 10h
                inc dl  
            .ENDIF
        .ENDW


        
        ;print lives
        mov si, offset Lives
        
        mov dh, 1     ;row
        mov dl, 30     ;column
        
        .WHILE dl < 37
            mov ah, 2
            int 10h

            mov al,[si]    ;ASCII code of Character 
            mov bx,0
            mov bl,0111b   ;Green color
            mov cx,1       ;repetition count
            mov ah,09h
            int 10h
            inc si 
            inc dl
            .IF dl > 36
                mov ah,live_count
                ; .IF ah == 3
                ;     mov al,'x'   ;ASCII code of Character 
                ;     mov bx,0
                ;     mov bl,1110b   ;Green color
                ;     mov cx,1       ;repetition count
                ;     mov ah,09h
                ;     int 10h
                ;     inc dl 
                ; .ENDIF
                .IF ah == 2
                    mov al,'x'    ;ASCII code of Character 
                    mov bx,0
                    mov bl,1110b   ;Green color
                    mov cx,1       ;repetition count
                    mov ah,09h
                    int 10h
                    inc dl 
                .ENDIF
                .IF ah == 1
                    mov al,'x'    ;ASCII code of Character 
                    mov bx,0
                    mov bl,1110b   ;Green color
                    mov cx,1       ;repetition count
                    mov ah,09h
                    int 10h
                .ENDIF
            .ENDIF
        .ENDW
        
    ENDM
start:
entry:

        mov ax,@data
        mov ds,ax
        
        ;video mode (graphic) 
        mov ah, 0
        mov al, 13h    ;320x200
        int 10h
        Welcome_Str_Output 


loop1:
mov ah,0h
int 16h
putout:
cmp al,32
je PRESSED_SPACE
jmp loop1



PRESSED_SPACE:
MakeScreen
Enter_Str_Output
InputName
MakeScreen
OutputName
MakeScreen

loop41:
MakeScreen
Menu
mov ah,0h
int 16h
putout1:
call beep
cmp ah,048h
je PRESSED_UP
cmp ah,050h
je PRESSED_DOWN
cmp al,32
je PRESSED_SPACE_2
jmp loop41
PRESSED_UP:
mov al,0
dec Menu_Cursor
cmp Menu_Cursor,al
jne NOT_BOTTOM
add Menu_Cursor,4
NOT_BOTTOM:
jmp loop41
PRESSED_DOWN:
mov al,5
inc Menu_Cursor
cmp Menu_Cursor,al
jne NOT_TOP
sub Menu_Cursor,4
NOT_TOP:
jmp loop41

PRESSED_SPACE_2:
mov al,1
cmp Menu_Cursor,al
jne SECOND_OPTION
;NEW GAME AAAAAAAAAAAAAAAAAAAAA
 MakeScreen
        check_time: ;infinite loop to keep the game going
    
            mov ah,2ch ;get time of laptop
            int 21h
            cmp dl , ball_1.ball_time
            jz check_time
            mov ball_1.ball_time,dl


            DrawBallBlack ball_1
            DrawPaddleBlack paddle_1
            MovePaddle paddle_1
            DrawPaddle paddle_1
            MoveBall ball_1,paddle_1
            DrawBall ball_1  
            DisplayBrick
            DetectBrickCollision 
            StatusBar    
            
            
            
            mov ah,01h
            int 16h
            jz check_time 
            
            mov ah,00h
            int 16h
            
           
            
            
            jmp check_time
;NEW GAME AAAAAAAAAAAAAAAAAAAAA
SECOND_OPTION:
mov al,2
cmp Menu_Cursor,al
jne THIRD_OPTION
MakeScreen
Instructions_Func
jmp loop41
;INSTRUCTIONS AAAAAAAAAAAAAAAAA
THIRD_OPTION:

stopGame:
mov ah,4ch
int 21h
end start

           
