/*
Copyright (c) 2016, Moritz Bitsch

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
*/
#include <stdint.h>
#include <stdio.h>

  #define ROR(x, r) ((x >> r) | (x << ((sizeof(uint32_t) * 8) - r)))
  #define ROL(x, r) ((x << r) | (x >> ((sizeof(uint32_t) * 8) - r)))


  #define R(x, y, k) (x = ROR(x, 8), x += y, x ^= k, y = ROL(y, 3), y ^= x)
  #define RR(x, y, k) (y ^= x, y = ROR(y, 3), x ^= k, x -= y, x = ROL(x, 8))



void SPECK_CORE(uint32_t  pt[2], uint32_t ct[2], uint32_t  K[4])
{
  uint32_t i, b = K[0];
  uint32_t a[3];
  ct[0]=pt[0]; ct[1]=pt[1];

  a[0] = K[1];
  a[1] = K[2];
  a[2] = K[3];

  R(ct[1], ct[0], b);
  for(i = 0; i < 24; i+=3){
    R(a[0], b, i);
    R(ct[1], ct[0], b);
    R(a[1], b, i + 1);
    R(ct[1], ct[0], b);
    R(a[2], b, i + 2);
    R(ct[1], ct[0], b);
  }
    R(a[0], b, 24);// rest term out side multiple of 3
    R(ct[1], ct[0], b);
    R(a[1], b, 25);
    R(ct[1], ct[0], b);
}


void HASH_SPECK128(uint64_t nonce,uint8_t firmware[], uint16_t size, uint32_t state[2]){
    uint16_t idx = 0;
    uint8_t i=0;
    state[0] = (nonce & 0xffffffff);
    state[1] = (nonce >> 32);
    state[3] = 0;
    state[4] = 0;
    uint32_t nextState[4] = {0,0,0,0};
    uint32_t block[2];
    uint16_t residual = size;
    uint32_t prevState[4];
    for(i=0;i<4;i++){
        prevState[i] = state[i];
    }
    if(size > 8){
        for(idx = 0;idx<size-8;idx+=8){     //first n blocks
            memcpy(block,(firmware+(idx*sizeof(uint8_t))),8);
            SPECK_CORE(block,nextState,state);
            state[0] = nextState[0];
            state[1] = nextState[1];
            state[3] = 0;
            state[4] = 0;
            state[0] ^= block[0];
            state[1] ^= block[1];
            state[0] ^= prevState[0];
            state[1] ^= prevState[1];
            state[2] ^= prevState[2];
            state[3] ^= prevState[3];
            for(i=0;i<4;i++){
                prevState[i] = state[i];
            }
        }
        residual = size - idx;//how many bytes left not hashed
    }else{
        residual = size;
        idx = 0;
    }
    //last block if firmware is not whole multiple of 64 bit
    memcpy(block,(firmware+(idx*sizeof(uint8_t))),residual);
    memset(block+residual,0,8-residual);
    SPECK_CORE(block,nextState,state);//fill the missing byte with 0
    state[0] = nextState[0];
    state[1] = nextState[1];
    state[3] = 0;
    state[4] = 0;
    state[0] ^= block[0];
    state[1] ^= block[1];
    state[0] ^= prevState[0];
    state[1] ^= prevState[1];
    state[2] ^= prevState[2];
    state[3] ^= prevState[3];
}

#include <stdio.h>


int main(int argc, char** argv)
{

    const uint8_t App1[] = {
    0x81,0x00,0x00,0x24,0xb0,0x13,0xf0,0x44,0x0c,0x43,0xb0,0x13,0x34,0x44,0xb0,0x13,
    0xea,0x44,0x4f,0x14,0xc2,0x43,0x1c,0x02,0xb0,0x13,0xd2,0x44,0x4b,0x16,0x00,0x13,
    0xf2,0xe0,0x40,0x00,0x23,0x02,0x92,0xc3,0x42,0x03,0x00,0x13,0xff,0x3f,0x03,0x43,
    0xb2,0x40,0x80,0x5a,0x5c,0x01,0xf2,0xd0,0x40,0x00,0x25,0x02,0xf2,0xd0,0x40,0x00,
    0x23,0x02,0x92,0xc3,0x30,0x01,0x1e,0x14,0x3d,0x40,0x44,0x28,0x1e,0x43,0x1d,0x83,
    0x0e,0x73,0xfd,0x23,0x0d,0x93,0xfb,0x23,0x1d,0x16,0x03,0x43,0xf2,0xf0,0xbf,0x00,
    0x23,0x02,0x1e,0x14,0x3d,0x40,0x44,0x28,0x1e,0x43,0x1d,0x83,0x0e,0x73,0xfd,0x23,
    0x0d,0x93,0xfb,0x23,0x1d,0x16,0x03,0x43,0xf2,0xd0,0x40,0x00,0x23,0x02,0x1e,0x14,
    0x3d,0x40,0x44,0x28,0x1e,0x43,0x1d,0x83,0x0e,0x73,0xfd,0x23,0x0d,0x93,0xfb,0x23,
    0x1d,0x16,0x03,0x43,0xf2,0xf0,0xbf,0x00,0x23,0x02,0xe2,0xd3,0x02,0x02,0xe2,0xd3,
    0x06,0x02,0xe2,0xd3,0x18,0x02,0xe2,0xd3,0x1a,0x02,0xe2,0xc3,0x1c,0x02,0xb2,0x40,
    0x10,0x00,0x42,0x03,0xb2,0x40,0xe7,0x03,0x52,0x03,0xb2,0x40,0x10,0x01,0x40,0x03,
    0x03,0x43,0x32,0xd0,0xd8,0x00,0x03,0x43,0x03,0x43,0x0c,0x43,0x10,0x01,0xb2,0x40,
    0xde,0xc0,0x00,0x1c,0xd2,0xd3,0x02,0x1c,0x32,0xc2,0x03,0x43,0xb2,0x40,0x04,0xa5,
    0x20,0x01,0xff,0x3f,0x03,0x43,0x03,0x43,0xff,0x3f,0x03,0x43,0x1c,0x43,0x10,0x01,
    };
    uint16_t App1_size = 240;
    uint64_t nonce = 0x0102030405060708;
    uint64_t s[1];
    HASH_SPECK128(nonce,(uint8_t *)App1,App1_size,s);
	
	printf("The hash value is:");
	while (*s) {
    if (*s & 1)
        printf("1");
    else
        printf("0");

    *s >>= 1;
}
printf("\n");
	
	
    return 0;
}
