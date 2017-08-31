#include <MSP430.h>
#include <stdint.h>
#include <stdio.h>

void decode(uint32_t *v, uint32_t *k)
{   uint32_t n = 32,
                  sum,
                  y = v[0],
                  z = v[1],
                  delta = 0x9e3779b9,
                  a = k[0],
                  b = k[1],
                  c = k[2],
                  d = k[3];

    sum = delta << 5;
                        /* start cycle */
    while (n-- > 0)
    {   z   -= (y << 4) + c ^ y + sum ^ (y >> 5) + d;
        y   -= (z << 4) + a ^ z + sum ^ (z >> 5) + b;
        sum -= delta;
    }
                        /* end cycle */
    v[0] = y;
    v[1] = z;
}

/**
 * main.c
 */
int main(void)
{
    // init variables
    int8_t num_rounds = 64;
    uint32_t v[2] = { 0x22668D08, 0x1C34F92D }; // encrypted texts of 2 words
    const uint32_t key[4] = { 0x11111111, 0x22222222, 0x33333333, 0x44444444 };

    asm(" NOP"); // starting position

    for (num_rounds = 64; num_rounds > 0; num_rounds--) {
        decode(v, key);
      }

    asm(" NOP"); // ending position
    printf("%d %d\n", v[0], v[1]);

	return 0;
}
