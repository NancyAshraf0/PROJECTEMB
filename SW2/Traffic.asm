
_manualm:

;Traffic.c,12 :: 		void manualm(){
;Traffic.c,13 :: 		if(manChar==2||manChar==0){
	MOVLW      0
	XORWF      _manChar+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__manualm44
	MOVLW      2
	XORWF      _manChar+0, 0
L__manualm44:
	BTFSC      STATUS+0, 2
	GOTO       L__manualm42
	MOVLW      0
	XORWF      _manChar+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__manualm45
	MOVLW      0
	XORWF      _manChar+0, 0
L__manualm45:
	BTFSC      STATUS+0, 2
	GOTO       L__manualm42
	GOTO       L_manualm2
L__manualm42:
;Traffic.c,14 :: 		portc=leds[manChar];
	MOVF       _manChar+0, 0
	ADDLW      _leds+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;Traffic.c,15 :: 		manChar++;
	INCF       _manChar+0, 1
	BTFSC      STATUS+0, 2
	INCF       _manChar+1, 1
;Traffic.c,17 :: 		for(mm=3;mm>=1;mm--){
	MOVLW      3
	MOVWF      _mm+0
	MOVLW      0
	MOVWF      _mm+1
L_manualm3:
	MOVLW      128
	XORWF      _mm+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__manualm46
	MOVLW      1
	SUBWF      _mm+0, 0
L__manualm46:
	BTFSS      STATUS+0, 0
	GOTO       L_manualm4
;Traffic.c,18 :: 		x=mm%10;     xx=mm/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _mm+0, 0
	MOVWF      R0+0
	MOVF       _mm+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _x+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _mm+0, 0
	MOVWF      R0+0
	MOVF       _mm+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _xx+0
;Traffic.c,19 :: 		for(nn=1;nn<=50;nn++){
	MOVLW      1
	MOVWF      _nn+0
L_manualm6:
	MOVF       _nn+0, 0
	SUBLW      50
	BTFSS      STATUS+0, 0
	GOTO       L_manualm7
;Traffic.c,20 :: 		porte.b0=0;
	BCF        PORTE+0, 0
;Traffic.c,21 :: 		porta.B5=1;
	BSF        PORTA+0, 5
;Traffic.c,22 :: 		porte.b1=1;
	BSF        PORTE+0, 1
;Traffic.c,23 :: 		porta.b2=0;
	BCF        PORTA+0, 2
;Traffic.c,24 :: 		portb=x<<1;     portd=x;
	MOVF       _x+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
	MOVF       _x+0, 0
	MOVWF      PORTD+0
;Traffic.c,26 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_manualm9:
	DECFSZ     R13+0, 1
	GOTO       L_manualm9
	DECFSZ     R12+0, 1
	GOTO       L_manualm9
	NOP
;Traffic.c,28 :: 		porte.b0=1;
	BSF        PORTE+0, 0
;Traffic.c,29 :: 		porta.B5=0;
	BCF        PORTA+0, 5
;Traffic.c,30 :: 		porte.b1=0;
	BCF        PORTE+0, 1
;Traffic.c,31 :: 		porta.b2=1;
	BSF        PORTA+0, 2
;Traffic.c,32 :: 		portb=xx<<1;     portd=xx;
	MOVF       _xx+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
	MOVF       _xx+0, 0
	MOVWF      PORTD+0
;Traffic.c,33 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_manualm10:
	DECFSZ     R13+0, 1
	GOTO       L_manualm10
	DECFSZ     R12+0, 1
	GOTO       L_manualm10
	NOP
;Traffic.c,19 :: 		for(nn=1;nn<=50;nn++){
	INCF       _nn+0, 1
;Traffic.c,34 :: 		}
	GOTO       L_manualm6
L_manualm7:
;Traffic.c,17 :: 		for(mm=3;mm>=1;mm--){
	MOVLW      1
	SUBWF      _mm+0, 1
	BTFSS      STATUS+0, 0
	DECF       _mm+1, 1
;Traffic.c,35 :: 		}
	GOTO       L_manualm3
L_manualm4:
;Traffic.c,37 :: 		}
L_manualm2:
;Traffic.c,38 :: 		portc=leds[manChar];
	MOVF       _manChar+0, 0
	ADDLW      _leds+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;Traffic.c,39 :: 		porte=7;porta=63;
	MOVLW      7
	MOVWF      PORTE+0
	MOVLW      63
	MOVWF      PORTA+0
;Traffic.c,40 :: 		}
L_end_manualm:
	RETURN
; end of _manualm

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Traffic.c,43 :: 		void interrupt(){
;Traffic.c,44 :: 		if(INTF_bit==1 ){
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_interrupt11
;Traffic.c,45 :: 		INTF_bit=0;
	BCF        INTF_bit+0, BitPos(INTF_bit+0)
;Traffic.c,46 :: 		if(portc.b7==0){
	BTFSC      PORTC+0, 7
	GOTO       L_interrupt12
;Traffic.c,47 :: 		if(manChar==3){manChar=0;}
	MOVLW      0
	XORWF      _manChar+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt49
	MOVLW      3
	XORWF      _manChar+0, 0
L__interrupt49:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt13
	CLRF       _manChar+0
	CLRF       _manChar+1
	GOTO       L_interrupt14
L_interrupt13:
;Traffic.c,48 :: 		else{manChar++;}
	INCF       _manChar+0, 1
	BTFSC      STATUS+0, 2
	INCF       _manChar+1, 1
L_interrupt14:
;Traffic.c,49 :: 		manualm();
	CALL       _manualm+0
;Traffic.c,50 :: 		}
L_interrupt12:
;Traffic.c,51 :: 		}
L_interrupt11:
;Traffic.c,52 :: 		}
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

_autoh:

;Traffic.c,55 :: 		void autoh(){
;Traffic.c,56 :: 		while(portc.b7==1){
L_autoh15:
	BTFSS      PORTC+0, 7
	GOTO       L_autoh16
;Traffic.c,57 :: 		manChar=0; k=3;portc=leds[manChar];  //yellw=1;
	CLRF       _manChar+0
	CLRF       _manChar+1
	MOVLW      3
	MOVWF      _k+0
	MOVF       _manChar+0, 0
	ADDLW      _leds+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;Traffic.c,58 :: 		for(i=23;i>0;i--){
	MOVLW      23
	MOVWF      _i+0
L_autoh17:
	MOVF       _i+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_autoh18
;Traffic.c,59 :: 		if(i==20){k=20;manChar++; portc=leds[manChar];}//greenw=1; yellw=0;
	MOVF       _i+0, 0
	XORLW      20
	BTFSS      STATUS+0, 2
	GOTO       L_autoh20
	MOVLW      20
	MOVWF      _k+0
	INCF       _manChar+0, 1
	BTFSC      STATUS+0, 2
	INCF       _manChar+1, 1
	MOVF       _manChar+0, 0
	ADDLW      _leds+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
L_autoh20:
;Traffic.c,60 :: 		for(j=0;j<50;j++){ if(portc.b7==0){return;}
	CLRF       _j+0
L_autoh21:
	MOVLW      50
	SUBWF      _j+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_autoh22
	BTFSC      PORTC+0, 7
	GOTO       L_autoh24
	GOTO       L_end_autoh
L_autoh24:
;Traffic.c,62 :: 		rights=i%10;   rightw=k%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FLOC__autoh+1
	MOVF       FLOC__autoh+1, 0
	MOVWF      _rights+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _k+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FLOC__autoh+0
	MOVF       FLOC__autoh+0, 0
	MOVWF      _rightw+0
;Traffic.c,63 :: 		Ls=i/10;       Lw=k/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      _Ls+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _k+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      _Lw+0
;Traffic.c,65 :: 		porta.B5=1;   portE.B1=1;                       //left segments off
	BSF        PORTA+0, 5
	BSF        PORTE+0, 1
;Traffic.c,66 :: 		porta.b2=0;   portE.B0=0;                       //Right segments on
	BCF        PORTA+0, 2
	BCF        PORTE+0, 0
;Traffic.c,67 :: 		portd=rights;        portb=rightw<<1;
	MOVF       FLOC__autoh+1, 0
	MOVWF      PORTD+0
	MOVF       FLOC__autoh+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Traffic.c,68 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_autoh25:
	DECFSZ     R13+0, 1
	GOTO       L_autoh25
	DECFSZ     R12+0, 1
	GOTO       L_autoh25
	NOP
;Traffic.c,70 :: 		porta.B5=0;   portE.B1=0;                       //left segments on
	BCF        PORTA+0, 5
	BCF        PORTE+0, 1
;Traffic.c,71 :: 		porta.b2=1;    portE.B0=1;                     //Right segments off
	BSF        PORTA+0, 2
	BSF        PORTE+0, 0
;Traffic.c,72 :: 		portd=Ls;     portb=Lw<<1;
	MOVF       _Ls+0, 0
	MOVWF      PORTD+0
	MOVF       _Lw+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Traffic.c,73 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_autoh26:
	DECFSZ     R13+0, 1
	GOTO       L_autoh26
	DECFSZ     R12+0, 1
	GOTO       L_autoh26
	NOP
;Traffic.c,60 :: 		for(j=0;j<50;j++){ if(portc.b7==0){return;}
	INCF       _j+0, 1
;Traffic.c,74 :: 		}
	GOTO       L_autoh21
L_autoh22:
;Traffic.c,75 :: 		k--;    if(k==0){k=1;}
	DECF       _k+0, 1
	MOVF       _k+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_autoh27
	MOVLW      1
	MOVWF      _k+0
L_autoh27:
;Traffic.c,58 :: 		for(i=23;i>0;i--){
	DECF       _i+0, 1
;Traffic.c,76 :: 		}
	GOTO       L_autoh17
L_autoh18:
;Traffic.c,78 :: 		k=3; manChar++;    portc=leds[manChar];// yells=1;
	MOVLW      3
	MOVWF      _k+0
	INCF       _manChar+0, 1
	BTFSC      STATUS+0, 2
	INCF       _manChar+1, 1
	MOVF       _manChar+0, 0
	ADDLW      _leds+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;Traffic.c,79 :: 		for(i=15;i>0;i--){
	MOVLW      15
	MOVWF      _i+0
L_autoh28:
	MOVF       _i+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_autoh29
;Traffic.c,80 :: 		if(i==12){k=12;manChar++;portc=leds[manChar];}//greens=1;yells=0;
	MOVF       _i+0, 0
	XORLW      12
	BTFSS      STATUS+0, 2
	GOTO       L_autoh31
	MOVLW      12
	MOVWF      _k+0
	INCF       _manChar+0, 1
	BTFSC      STATUS+0, 2
	INCF       _manChar+1, 1
	MOVF       _manChar+0, 0
	ADDLW      _leds+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
L_autoh31:
;Traffic.c,81 :: 		for(j=0;j<50;j++){ if(portc.b7==0){return;}
	CLRF       _j+0
L_autoh32:
	MOVLW      50
	SUBWF      _j+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_autoh33
	BTFSC      PORTC+0, 7
	GOTO       L_autoh35
	GOTO       L_end_autoh
L_autoh35:
;Traffic.c,83 :: 		rights=k%10;   rightw=i%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _k+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FLOC__autoh+1
	MOVF       FLOC__autoh+1, 0
	MOVWF      _rights+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FLOC__autoh+0
	MOVF       FLOC__autoh+0, 0
	MOVWF      _rightw+0
;Traffic.c,84 :: 		Ls=K/10;       Lw=i/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _k+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      _Ls+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       _i+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      _Lw+0
;Traffic.c,86 :: 		porta.B5=1;   portE.B1=1;                       //left segments off
	BSF        PORTA+0, 5
	BSF        PORTE+0, 1
;Traffic.c,87 :: 		porta.b2=0;   portE.B0=0;                        //Right segments on
	BCF        PORTA+0, 2
	BCF        PORTE+0, 0
;Traffic.c,88 :: 		portd=rights;        portb=rightw<<1;
	MOVF       FLOC__autoh+1, 0
	MOVWF      PORTD+0
	MOVF       FLOC__autoh+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Traffic.c,89 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_autoh36:
	DECFSZ     R13+0, 1
	GOTO       L_autoh36
	DECFSZ     R12+0, 1
	GOTO       L_autoh36
	NOP
;Traffic.c,91 :: 		porta.B5=0;   portE.B1=0;                       //left segments on
	BCF        PORTA+0, 5
	BCF        PORTE+0, 1
;Traffic.c,92 :: 		porta.b2=1;    portE.B0=1;                      //Right segments off
	BSF        PORTA+0, 2
	BSF        PORTE+0, 0
;Traffic.c,93 :: 		portd=Ls;     portb=Lw<<1;
	MOVF       _Ls+0, 0
	MOVWF      PORTD+0
	MOVF       _Lw+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Traffic.c,94 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_autoh37:
	DECFSZ     R13+0, 1
	GOTO       L_autoh37
	DECFSZ     R12+0, 1
	GOTO       L_autoh37
	NOP
;Traffic.c,81 :: 		for(j=0;j<50;j++){ if(portc.b7==0){return;}
	INCF       _j+0, 1
;Traffic.c,96 :: 		}
	GOTO       L_autoh32
L_autoh33:
;Traffic.c,97 :: 		k--;
	DECF       _k+0, 1
;Traffic.c,79 :: 		for(i=15;i>0;i--){
	DECF       _i+0, 1
;Traffic.c,98 :: 		} manChar=0;//redw=0;  greens=0;
	GOTO       L_autoh28
L_autoh29:
	CLRF       _manChar+0
	CLRF       _manChar+1
;Traffic.c,99 :: 		}
	GOTO       L_autoh15
L_autoh16:
;Traffic.c,101 :: 		}
L_end_autoh:
	RETURN
; end of _autoh

_main:

;Traffic.c,102 :: 		void main() {
;Traffic.c,103 :: 		TRISB=0b00000001;PORTB=0;   GIE_bit=1;
	MOVLW      1
	MOVWF      TRISB+0
	CLRF       PORTB+0
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;Traffic.c,104 :: 		INTE_BIT=1;
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;Traffic.c,105 :: 		INTEDG_bit=1;
	BSF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;Traffic.c,106 :: 		TRISE=0;PORTE=0;
	CLRF       TRISE+0
	CLRF       PORTE+0
;Traffic.c,107 :: 		TRISC=0b10000000;PORTC=0;
	MOVLW      128
	MOVWF      TRISC+0
	CLRF       PORTC+0
;Traffic.c,108 :: 		TRISA=0b000001;//PORTA=0;
	MOVLW      1
	MOVWF      TRISA+0
;Traffic.c,109 :: 		TRISD=0;PORTD=0;
	CLRF       TRISD+0
	CLRF       PORTD+0
;Traffic.c,112 :: 		while(1){
L_main38:
;Traffic.c,113 :: 		if(portc.b7==1){autoh();}
	BTFSS      PORTC+0, 7
	GOTO       L_main40
	CALL       _autoh+0
	GOTO       L_main41
L_main40:
;Traffic.c,115 :: 		manualm();}
	CALL       _manualm+0
L_main41:
;Traffic.c,116 :: 		}}
	GOTO       L_main38
L_end_main:
	GOTO       $+0
; end of _main
