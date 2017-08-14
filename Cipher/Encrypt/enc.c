#include <stdio.h>
#include <stdint.h>

int main() {
    // init variables
    unsigned int num_rounds = 64;
    uint32_t v[2] = { 0x12345678, 0x87654321 }; // encrypted texts of 2 words
    const uint32_t key[4] = { 0x11111111, 0x22222222, 0x33333333, 0x44444444 };

    // starting the algorithm
    unsigned int i;
    uint32_t v0=v[0], v1=v[1], sum=0, delta=0x9E3779B9;
    for (i=0; i < num_rounds; i++) {
        v0 += (((v1 << 4) ^ (v1 >> 5)) + v1) ^ (sum + key[sum & 3]);
        sum += delta;
        v1 += (((v0 << 4) ^ (v0 >> 5)) + v0) ^ (sum + key[(sum>>11) & 3]);
    }
    v[0]=v0; v[1]=v1;

    printf("0x%08X 0x%08X\n", v[0], v[1]);
    return 0;
}

