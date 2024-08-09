
_display:

;flasher.c,5 :: 		void display(char count){
;flasher.c,6 :: 		int right =0, left =0;
	CLRF       display_right_L0+0
	CLRF       display_right_L0+1
	CLRF       display_left_L0+0
	CLRF       display_left_L0+1
;flasher.c,7 :: 		left =count/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_display_count+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      display_left_L0+0
	CLRF       display_left_L0+1
;flasher.c,8 :: 		right =count%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_display_count+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      display_right_L0+0
	CLRF       display_right_L0+1
;flasher.c,9 :: 		portb.b2 =1;
	BSF        PORTB+0, 2
;flasher.c,10 :: 		Portb.b3 =0;
	BCF        PORTB+0, 3
;flasher.c,11 :: 		portc =right;
	MOVF       display_right_L0+0, 0
	MOVWF      PORTC+0
;flasher.c,12 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_display0:
	DECFSZ     R13+0, 1
	GOTO       L_display0
	DECFSZ     R12+0, 1
	GOTO       L_display0
	NOP
;flasher.c,13 :: 		portb.b2 =0;
	BCF        PORTB+0, 2
;flasher.c,14 :: 		portb.b3 =1;
	BSF        PORTB+0, 3
;flasher.c,15 :: 		portc =left;
	MOVF       display_left_L0+0, 0
	MOVWF      PORTC+0
;flasher.c,16 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_display1:
	DECFSZ     R13+0, 1
	GOTO       L_display1
	DECFSZ     R12+0, 1
	GOTO       L_display1
	NOP
;flasher.c,17 :: 		}
L_end_display:
	RETURN
; end of _display

_Manual:

;flasher.c,19 :: 		void  Manual(){
;flasher.c,20 :: 		signed char count =0; char s=0;
	CLRF       Manual_count_L0+0
	CLRF       Manual_s_L0+0
;flasher.c,21 :: 		for(;;){
L_Manual2:
;flasher.c,22 :: 		portd =0b010001;
	MOVLW      17
	MOVWF      PORTD+0
;flasher.c,23 :: 		for( count =3; count>=0; count--){
	MOVLW      3
	MOVWF      Manual_count_L0+0
L_Manual5:
	MOVLW      128
	XORWF      Manual_count_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Manual6
;flasher.c,24 :: 		for(s =0; s <=50; s++){
	CLRF       Manual_s_L0+0
L_Manual8:
	MOVF       Manual_s_L0+0, 0
	SUBLW      50
	BTFSS      STATUS+0, 0
	GOTO       L_Manual9
;flasher.c,25 :: 		display(count);
	MOVF       Manual_count_L0+0, 0
	MOVWF      FARG_display_count+0
	CALL       _display+0
;flasher.c,26 :: 		if(flag ==0){
	BTFSC      PORTB+0, 4
	GOTO       L_Manual11
;flasher.c,27 :: 		return;
	GOTO       L_end_Manual
;flasher.c,28 :: 		}
L_Manual11:
;flasher.c,24 :: 		for(s =0; s <=50; s++){
	INCF       Manual_s_L0+0, 1
;flasher.c,29 :: 		}
	GOTO       L_Manual8
L_Manual9:
;flasher.c,23 :: 		for( count =3; count>=0; count--){
	DECF       Manual_count_L0+0, 1
;flasher.c,30 :: 		}
	GOTO       L_Manual5
L_Manual6:
;flasher.c,31 :: 		portd =0b100001;
	MOVLW      33
	MOVWF      PORTD+0
;flasher.c,32 :: 		while(portb.b1 !=1){
L_Manual12:
	BTFSC      PORTB+0, 1
	GOTO       L_Manual13
;flasher.c,33 :: 		if(flag ==0){ return; }
	BTFSC      PORTB+0, 4
	GOTO       L_Manual14
	GOTO       L_end_Manual
L_Manual14:
;flasher.c,34 :: 		}
	GOTO       L_Manual12
L_Manual13:
;flasher.c,35 :: 		portd =0b001010;
	MOVLW      10
	MOVWF      PORTD+0
;flasher.c,36 :: 		for( count =3; count>=0; count--){
	MOVLW      3
	MOVWF      Manual_count_L0+0
L_Manual15:
	MOVLW      128
	XORWF      Manual_count_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Manual16
;flasher.c,37 :: 		for(s =0; s <=50; s++){
	CLRF       Manual_s_L0+0
L_Manual18:
	MOVF       Manual_s_L0+0, 0
	SUBLW      50
	BTFSS      STATUS+0, 0
	GOTO       L_Manual19
;flasher.c,38 :: 		display(count);
	MOVF       Manual_count_L0+0, 0
	MOVWF      FARG_display_count+0
	CALL       _display+0
;flasher.c,39 :: 		if(flag ==0){
	BTFSC      PORTB+0, 4
	GOTO       L_Manual21
;flasher.c,40 :: 		return;
	GOTO       L_end_Manual
;flasher.c,41 :: 		}
L_Manual21:
;flasher.c,37 :: 		for(s =0; s <=50; s++){
	INCF       Manual_s_L0+0, 1
;flasher.c,42 :: 		}
	GOTO       L_Manual18
L_Manual19:
;flasher.c,36 :: 		for( count =3; count>=0; count--){
	DECF       Manual_count_L0+0, 1
;flasher.c,43 :: 		}
	GOTO       L_Manual15
L_Manual16:
;flasher.c,44 :: 		portd =0b001100;
	MOVLW      12
	MOVWF      PORTD+0
;flasher.c,45 :: 		while(portb.b1 !=1){
L_Manual22:
	BTFSC      PORTB+0, 1
	GOTO       L_Manual23
;flasher.c,46 :: 		if(flag ==0){ return; }
	BTFSC      PORTB+0, 4
	GOTO       L_Manual24
	GOTO       L_end_Manual
L_Manual24:
;flasher.c,47 :: 		}
	GOTO       L_Manual22
L_Manual23:
;flasher.c,48 :: 		}
	GOTO       L_Manual2
;flasher.c,50 :: 		}
L_end_Manual:
	RETURN
; end of _Manual

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;flasher.c,52 :: 		void interrupt(){
;flasher.c,53 :: 		if(INTF_bit ==1){
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_interrupt25
;flasher.c,54 :: 		INTF_bit =0;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;flasher.c,55 :: 		flag =~flag;
	MOVLW      16
	XORWF      PORTB+0, 1
;flasher.c,56 :: 		}
L_interrupt25:
;flasher.c,57 :: 		}
L_end_interrupt:
L__interrupt48:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;flasher.c,59 :: 		void main(){
;flasher.c,60 :: 		trisb =0b00000011; portb.B2 =0; portb.B3 =0; flag =0;
	MOVLW      3
	MOVWF      TRISB+0
	BCF        PORTB+0, 2
	BCF        PORTB+0, 3
	BCF        PORTB+0, 4
;flasher.c,61 :: 		trisc =0; portc =0;
	CLRF       TRISC+0
	CLRF       PORTC+0
;flasher.c,62 :: 		trisd =0; portd =0;
	CLRF       TRISD+0
	CLRF       PORTD+0
;flasher.c,63 :: 		GIE_bit =1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;flasher.c,64 :: 		INTE_bit =1;
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;flasher.c,65 :: 		INTEDG_bit =1;
	BSF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;flasher.c,67 :: 		for(;;){
L_main26:
;flasher.c,68 :: 		char s =0; signed char count =0;
	CLRF       main_s_L1+0
	CLRF       main_count_L1+0
;flasher.c,69 :: 		portd =0b010001;
	MOVLW      17
	MOVWF      PORTD+0
;flasher.c,70 :: 		for( count =23; count>=0; count--){
	MOVLW      23
	MOVWF      main_count_L1+0
L_main29:
	MOVLW      128
	XORWF      main_count_L1+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main30
;flasher.c,71 :: 		if(count ==20){
	MOVF       main_count_L1+0, 0
	XORLW      20
	BTFSS      STATUS+0, 2
	GOTO       L_main32
;flasher.c,72 :: 		portd =0b100001;
	MOVLW      33
	MOVWF      PORTD+0
;flasher.c,73 :: 		}
L_main32:
;flasher.c,74 :: 		for(s =0; s <=50; s++){
	CLRF       main_s_L1+0
L_main33:
	MOVF       main_s_L1+0, 0
	SUBLW      50
	BTFSS      STATUS+0, 0
	GOTO       L_main34
;flasher.c,75 :: 		display(count);
	MOVF       main_count_L1+0, 0
	MOVWF      FARG_display_count+0
	CALL       _display+0
;flasher.c,76 :: 		if(flag ==1){
	BTFSS      PORTB+0, 4
	GOTO       L_main36
;flasher.c,77 :: 		Manual();
	CALL       _Manual+0
;flasher.c,78 :: 		}
L_main36:
;flasher.c,74 :: 		for(s =0; s <=50; s++){
	INCF       main_s_L1+0, 1
;flasher.c,79 :: 		}
	GOTO       L_main33
L_main34:
;flasher.c,70 :: 		for( count =23; count>=0; count--){
	DECF       main_count_L1+0, 1
;flasher.c,80 :: 		}
	GOTO       L_main29
L_main30:
;flasher.c,81 :: 		portd =0b001010;
	MOVLW      10
	MOVWF      PORTD+0
;flasher.c,82 :: 		for( count =15; count>=0; count--){
	MOVLW      15
	MOVWF      main_count_L1+0
L_main37:
	MOVLW      128
	XORWF      main_count_L1+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main38
;flasher.c,83 :: 		if(count ==12){
	MOVF       main_count_L1+0, 0
	XORLW      12
	BTFSS      STATUS+0, 2
	GOTO       L_main40
;flasher.c,84 :: 		portd =0b001100;
	MOVLW      12
	MOVWF      PORTD+0
;flasher.c,85 :: 		}
L_main40:
;flasher.c,86 :: 		for(s =0; s <=50; s++){
	CLRF       main_s_L1+0
L_main41:
	MOVF       main_s_L1+0, 0
	SUBLW      50
	BTFSS      STATUS+0, 0
	GOTO       L_main42
;flasher.c,87 :: 		display(count);
	MOVF       main_count_L1+0, 0
	MOVWF      FARG_display_count+0
	CALL       _display+0
;flasher.c,88 :: 		if(flag ==1){
	BTFSS      PORTB+0, 4
	GOTO       L_main44
;flasher.c,89 :: 		Manual();
	CALL       _Manual+0
;flasher.c,90 :: 		}
L_main44:
;flasher.c,86 :: 		for(s =0; s <=50; s++){
	INCF       main_s_L1+0, 1
;flasher.c,91 :: 		}
	GOTO       L_main41
L_main42:
;flasher.c,82 :: 		for( count =15; count>=0; count--){
	DECF       main_count_L1+0, 1
;flasher.c,92 :: 		}
	GOTO       L_main37
L_main38:
;flasher.c,93 :: 		}
	GOTO       L_main26
;flasher.c,95 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
