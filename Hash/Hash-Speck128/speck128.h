/*
 * speck128.h
 *
 *  Created on: Sep 7, 2017
 *      Author: MewX
 */

#ifndef SPECK128_H_
#define SPECK128_H_

#define ROR(x, r) ((x >> r) | (x << ((sizeof(uint32_t) * 8) - r)))
#define ROL(x, r) ((x << r) | (x >> ((sizeof(uint32_t) * 8) - r)))

#define R(x, y, k) (x = ROR(x, 8), x += y, x ^= k, y = ROL(y, 3), y ^= x)
#define RR(x, y, k) (y ^= x, y = ROR(y, 3), x ^= k, x -= y, x = ROL(x, 8))

#include <stdint.h>

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


void __attribute__ ((noinline)) HASH_SPECK128(uint64_t nonce, const uint8_t firmware[], uint16_t size, uint32_t state[2]) {
    uint16_t idx = 0;
    //uint16_t i = 0;
    state[0] = (nonce & 0xffffffff); // low 32 bits
    state[1] = (nonce >> 32); // high 32 bits
    uint32_t nextState[2] = {0,0};
    uint32_t block[4]; // key
    uint16_t residual = size;

    for(;idx<size-16;idx+=16){     //first n blocks
        //printf("Processing idx = %d: ", idx);
        //for (i = 0; i < 16; i ++) printf("0x%02X ", firmware[idx + i]);
        //printf("\n");
        //uint32_t* input = (firmware+(idx*sizeof(uint8_t)));
        memcpy(block,(firmware+(idx*sizeof(uint8_t))),16); // 16 * 8 = 128 key
        SPECK_CORE(state,nextState,block);
        state[0] = nextState[0];
        state[1] = nextState[1];
    }
    residual = size - idx; //how many bytes left not hashed
    //printf("Last idx = %d; residual = %d.\n", idx, residual);

    //last block if firmware is not whole multiple of 128 bit
    memcpy(block,(firmware+(idx*sizeof(uint8_t))),residual);
    memset(block+residual,0,16-residual);
    SPECK_CORE(state,nextState,block);//fill the missing byte with 0
    state[0] = nextState[0];
    state[1] = nextState[1];
}

void __attribute__ ((noinline)) HASH_SPECK128_MP(uint64_t nonce,const uint8_t firmware[], uint16_t size, uint32_t state[4]){
    uint16_t idx = 0;
    uint8_t i=0;
    state[0] = (nonce & 0xffffffff);
    state[1] = (nonce >> 32);
    state[2] = 0;
    state[3] = 0;
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
            state[2] = 0;
            state[3] = 0;
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
    state[2] = 0;
    state[3] = 0;
    state[0] ^= block[0];
    state[1] ^= block[1];
    state[0] ^= prevState[0];
    state[1] ^= prevState[1];
    state[2] ^= prevState[2];
    state[3] ^= prevState[3];
}

void __attribute__ ((noinline)) HASH_SPECK128_MMO(uint64_t nonce,const uint8_t firmware[], uint16_t size, uint32_t state[4]){
    uint16_t idx = 0;
    uint8_t i=0;
    state[0] = (nonce & 0xffffffff);
    state[1] = (nonce >> 32);
    state[2] = 0;
    state[3] = 0;
    uint32_t nextState[4] = {0,0,0,0};
    uint32_t block[2];
    uint16_t residual = size;
    if(size > 8){
        for(idx = 0;idx<size-8;idx+=8){     //first n blocks
            memcpy(block,(firmware+(idx*sizeof(uint8_t))),8);
            SPECK_CORE(block,nextState,state);
            state[0] = nextState[0];
            state[1] = nextState[1];
            state[2] = 0;
            state[3] = 0;
            state[0] ^= block[0];
            state[1] ^= block[1];
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
    state[2] = 0;
    state[3] = 0;
    state[0] ^= block[0];
    state[1] ^= block[1];
}

#endif /* SPECK128_H_ */
