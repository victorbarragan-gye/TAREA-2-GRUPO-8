
_musica_fondo:

;Contro_sonido.c,22 :: 		void musica_fondo() {
;Contro_sonido.c,23 :: 		Sound_Play(262, 100);
	MOVLW      6
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      100
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      0
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;Contro_sonido.c,24 :: 		Sound_Play(330, 100);
	MOVLW      74
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      100
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      0
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;Contro_sonido.c,25 :: 		Sound_Play(392, 100);
	MOVLW      136
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      100
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      0
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;Contro_sonido.c,26 :: 		}
L_end_musica_fondo:
	RETURN
; end of _musica_fondo

_musica_ganar:

;Contro_sonido.c,28 :: 		void musica_ganar() {
;Contro_sonido.c,29 :: 		Sound_Play(392,150);
	MOVLW      136
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      150
	MOVWF      FARG_Sound_Play_duration_ms+0
	CLRF       FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;Contro_sonido.c,30 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_musica_ganar0:
	DECFSZ     R13+0, 1
	GOTO       L_musica_ganar0
	DECFSZ     R12+0, 1
	GOTO       L_musica_ganar0
	NOP
	NOP
;Contro_sonido.c,31 :: 		Sound_Play(440,200);
	MOVLW      184
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      200
	MOVWF      FARG_Sound_Play_duration_ms+0
	CLRF       FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;Contro_sonido.c,32 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_musica_ganar1:
	DECFSZ     R13+0, 1
	GOTO       L_musica_ganar1
	DECFSZ     R12+0, 1
	GOTO       L_musica_ganar1
	NOP
	NOP
;Contro_sonido.c,33 :: 		Sound_Play(494,250);
	MOVLW      238
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      250
	MOVWF      FARG_Sound_Play_duration_ms+0
	CLRF       FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;Contro_sonido.c,34 :: 		}
L_end_musica_ganar:
	RETURN
; end of _musica_ganar

_musica_perder:

;Contro_sonido.c,36 :: 		void musica_perder() {
;Contro_sonido.c,37 :: 		Sound_Play(392,200);
	MOVLW      136
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      200
	MOVWF      FARG_Sound_Play_duration_ms+0
	CLRF       FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;Contro_sonido.c,38 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_musica_perder2:
	DECFSZ     R13+0, 1
	GOTO       L_musica_perder2
	DECFSZ     R12+0, 1
	GOTO       L_musica_perder2
	NOP
	NOP
;Contro_sonido.c,39 :: 		Sound_Play(330,200);
	MOVLW      74
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      200
	MOVWF      FARG_Sound_Play_duration_ms+0
	CLRF       FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;Contro_sonido.c,40 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_musica_perder3:
	DECFSZ     R13+0, 1
	GOTO       L_musica_perder3
	DECFSZ     R12+0, 1
	GOTO       L_musica_perder3
	NOP
	NOP
;Contro_sonido.c,41 :: 		Sound_Play(262,300);
	MOVLW      6
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      44
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;Contro_sonido.c,42 :: 		}
L_end_musica_perder:
	RETURN
; end of _musica_perder

_setup:

;Contro_sonido.c,44 :: 		void setup() {
;Contro_sonido.c,45 :: 		TRISB = 0xFF;
	MOVLW      255
	MOVWF      TRISB+0
;Contro_sonido.c,46 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;Contro_sonido.c,47 :: 		TRISD.F0 = 0;
	BCF        TRISD+0, 0
;Contro_sonido.c,48 :: 		TRISD.F1 = 1;
	BSF        TRISD+0, 1
;Contro_sonido.c,49 :: 		TRISD.F2 = 1;
	BSF        TRISD+0, 2
;Contro_sonido.c,50 :: 		Sound_Init(&SOUND_PORT, SOUND_PIN);
	MOVLW      PORTD+0
	MOVWF      FARG_Sound_Init_snd_port+0
	CLRF       FARG_Sound_Init_snd_pin+0
	CALL       _Sound_Init+0
;Contro_sonido.c,51 :: 		PORTC = 0;
	CLRF       PORTC+0
;Contro_sonido.c,52 :: 		PORTD = 0;
	CLRF       PORTD+0
;Contro_sonido.c,53 :: 		}
L_end_setup:
	RETURN
; end of _setup

_main:

;Contro_sonido.c,55 :: 		void main() {
;Contro_sonido.c,56 :: 		setup();
	CALL       _setup+0
;Contro_sonido.c,58 :: 		while (1) {
L_main4:
;Contro_sonido.c,60 :: 		OUT_SALTO = BTN_SALTO;
	BTFSC      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L__main15
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
	GOTO       L__main16
L__main15:
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
L__main16:
;Contro_sonido.c,61 :: 		OUT_DOBLE = BTN_DOBLE;
	BTFSC      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L__main17
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
	GOTO       L__main18
L__main17:
	BSF        RC1_bit+0, BitPos(RC1_bit+0)
L__main18:
;Contro_sonido.c,62 :: 		OUT_BAJAR = BTN_BAJAR;
	BTFSC      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L__main19
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L__main20
L__main19:
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
L__main20:
;Contro_sonido.c,64 :: 		musica_fondo();
	CALL       _musica_fondo+0
;Contro_sonido.c,66 :: 		if (WIN_FLAG == 1) { musica_ganar(); Delay_ms(500); }
	BTFSS      RD1_bit+0, BitPos(RD1_bit+0)
	GOTO       L_main6
	CALL       _musica_ganar+0
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
	NOP
L_main6:
;Contro_sonido.c,67 :: 		if (LOSE_FLAG == 1) { musica_perder(); Delay_ms(500); }
	BTFSS      RD2_bit+0, BitPos(RD2_bit+0)
	GOTO       L_main8
	CALL       _musica_perder+0
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
	NOP
L_main8:
;Contro_sonido.c,68 :: 		}
	GOTO       L_main4
;Contro_sonido.c,69 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
