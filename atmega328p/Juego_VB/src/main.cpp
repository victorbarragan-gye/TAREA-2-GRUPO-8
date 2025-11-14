#define F_CPU 8000000UL
#include <avr/io.h>
#include <util/delay.h>

// =========================================================
// MATRIZ DE LEDs 8x8 CONTROLADA POR ATMEGA328P
// Recibe del PIC (PORTC):
//   PC0 = salto simple
//   PC1 = salto doble
//   PC2 = bajar
//
// Envía al PIC:
//   PC4 = gana
//   PC5 = pierde
// =========================================================

unsigned char FILAS[8] = {1, 2, 4, 8, 16, 32, 64, 128};

unsigned char MAPA[120] = {
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x80, 0x80, 0xC0, 0xC0, 0xE0, 0xE0, 0x80, 0x80,
    0x80, 0xC0, 0xC0, 0x80, 0xE0, 0xE0, 0x80, 0x80,
    0x00, 0x80, 0xC0, 0xC0, 0x80, 0x80, 0x00, 0x80};

unsigned char JUGADOR_SUELO[8] = {0x00, 0x10, 0x78, 0x10, 0x00, 0x00, 0x00, 0x00};
unsigned char JUGADOR_SALTO[8] = {0x00, 0x10, 0x28, 0x1C, 0x28, 0x04, 0x00, 0x00};
unsigned char JUGADOR_SALTO2[8] = {0x00, 0x08, 0x14, 0x0E, 0x14, 0x02, 0x00, 0x00};
unsigned char CARA_GANAR[8] = {0x00, 0x2C, 0x4C, 0x40, 0x40, 0x4C, 0x2C, 0x00};
unsigned char CARA_PERDER[8] = {0x00, 0x4C, 0x2C, 0x20, 0x20, 0x2C, 0x4C, 0x00};

int jugador_y = 4;
int salto = 0;
int altura = 0;
int mapa_index = 0;
char vivo = 1;

void limpiar_matriz(void)
{
  PORTB = 0x00;
  PORTD = 0x00;
}

void dibujar_frame(unsigned char *sprite, int mapa_index)
{
  for (int rep = 0; rep < 15; rep++)
  {
    for (int f = 0; f < 8; f++)
    {
      PORTD = FILAS[f];
      unsigned char mapa = MAPA[mapa_index + f];
      unsigned char jugador = sprite[f];
      PORTB = ~(mapa | jugador);
      _delay_us(500);
    }
  }
}

void mostrar_cara(unsigned char *cara)
{
  for (int t = 0; t < 600; t++)
  {
    for (int f = 0; f < 8; f++)
    {
      PORTD = FILAS[f];
      PORTB = ~cara[f];
      _delay_us(700);
    }
  }
}

int main(void)
{
  DDRB = 0xFF;                               // columnas
  DDRD = 0xFF;                               // filas
  DDRC &= ~(1 << PC0 | 1 << PC1 | 1 << PC2); // entradas del PIC
  DDRC |= (1 << PC4 | 1 << PC5);             // PC4=Gana, PC5=Pierde

  limpiar_matriz();

  while (1)
  {

    // --- Reinicia el juego automáticamente ---
    vivo = 1;
    mapa_index = 0;
    salto = 0;
    altura = 0;
    jugador_y = 4;

    while (vivo)
    {

      // Lectura de botones
      char salto_simple = (PINC & (1 << PC0));
      char salto_doble = (PINC & (1 << PC1));
      char bajar = (PINC & (1 << PC2));

      if (salto_simple && salto == 0)
      {
        salto = 1;
        altura = 0;
      }
      if (salto_doble && salto == 0)
      {
        salto = 2;
        altura = 0;
      }
      if (bajar && (salto == 1 || salto == 2))
      {
        jugador_y = 4;
        salto = 0;
        altura = 0;
      }

      // Física
      if (salto == 1)
      {
        if (altura < 3)
          jugador_y--;
        else if (altura < 6)
          jugador_y++;
        else
          salto = 0;
        altura++;
      }
      else if (salto == 2)
      {
        if (altura < 5)
          jugador_y--;
        else if (altura < 10)
          jugador_y++;
        else
          salto = 0;
        altura++;
      }

      if (jugador_y < 0)
        jugador_y = 0;
      if (jugador_y > 4)
        jugador_y = 4;

      unsigned char *sprite;
      if (salto == 1)
        sprite = JUGADOR_SALTO;
      else if (salto == 2)
        sprite = JUGADOR_SALTO2;
      else
        sprite = JUGADOR_SUELO;

      dibujar_frame(sprite, mapa_index);

      // Colisión
      for (int f = 0; f < 8; f++)
      {
        if (MAPA[mapa_index + f] & sprite[f])
          vivo = 0;
      }

      mapa_index++;
      if (mapa_index > sizeof(MAPA) - 8)
      {
        PORTC |= (1 << PC4); // Señal "gana"
        mostrar_cara(CARA_GANAR);
        PORTC &= ~(1 << PC4);
        break;
      }

      _delay_ms(60);
    }

    if (!vivo)
    {
      PORTC |= (1 << PC5); // Señal "pierde"
      mostrar_cara(CARA_PERDER);
      PORTC &= ~(1 << PC5);
    }

    limpiar_matriz();
    _delay_ms(500); // pequeña pausa antes de reiniciar
  }
}
