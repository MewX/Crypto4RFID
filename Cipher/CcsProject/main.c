#include <msp430.h>

/**
 * main.c
 */
int main(void)
{
    // init variables
    int num_rounds = 64;
    long v[2] = { 0x22668D08, 0x1C34F92D }; // encrypted texts of 2 words
    const long key[4] = { 0x11111111, 0x22222222, 0x33333333, 0x44444444 };

    __asm nop; // starting position

    // starting the algorithm
    long v0 = v[0], v1 = v[1], delta = 0x9E3779B9, sum = delta*num_rounds;
    for (int i = 0; i < num_rounds; i++) {
        v1 -= (((v0 << 4) ^ (v0 >> 5)) + v0) ^ (sum + key[(sum>>11) & 3]);
        sum -= delta;
        v0 -= (((v1 << 4) ^ (v1 >> 5)) + v1) ^ (sum + key[sum & 3]);
    }
    v[0] = v0; v[1] = v1;

    __asm nop; // ending position

	return 0;
}
