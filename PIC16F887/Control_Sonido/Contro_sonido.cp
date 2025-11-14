#line 1 "D:/MikroC/Proyectos PIC's/Control_Sonido/Contro_sonido.c"







sbit BTN_SALTO at RB0_bit;
sbit BTN_DOBLE at RB1_bit;
sbit BTN_BAJAR at RB2_bit;

sbit OUT_SALTO at RC0_bit;
sbit OUT_DOBLE at RC1_bit;
sbit OUT_BAJAR at RC2_bit;

sbit WIN_FLAG at RD1_bit;
sbit LOSE_FLAG at RD2_bit;




void musica_fondo() {
 Sound_Play(262, 100);
 Sound_Play(330, 100);
 Sound_Play(392, 100);
}

void musica_ganar() {
 Sound_Play(392,150);
 Delay_ms(50);
 Sound_Play(440,200);
 Delay_ms(50);
 Sound_Play(494,250);
}

void musica_perder() {
 Sound_Play(392,200);
 Delay_ms(50);
 Sound_Play(330,200);
 Delay_ms(50);
 Sound_Play(262,300);
}

void setup() {
 TRISB = 0xFF;
 TRISC = 0x00;
 TRISD.F0 = 0;
 TRISD.F1 = 1;
 TRISD.F2 = 1;
 Sound_Init(& PORTD ,  0 );
 PORTC = 0;
 PORTD = 0;
}

void main() {
 setup();

 while (1) {

 OUT_SALTO = BTN_SALTO;
 OUT_DOBLE = BTN_DOBLE;
 OUT_BAJAR = BTN_BAJAR;

 musica_fondo();

 if (WIN_FLAG == 1) { musica_ganar(); Delay_ms(500); }
 if (LOSE_FLAG == 1) { musica_perder(); Delay_ms(500); }
 }
}
