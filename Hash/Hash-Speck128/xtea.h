/*
 * lblock.h
 *
 *  Created on: Sep 7, 2017
 *      Author: MewX
 *
 * This version takes 4 bytes as scheduled subkeys from input each time,
 * in the original cipher algorithm, 10-byte key is converted into 128 bytes subkeys,
 * and then run decipher. This is faster than using key schedule function,
 * however, when the input is less than 128 bytes, it's not safe enough.
 */

#ifndef XTEA_H_
#define XTEA_H_

/** @file       main.c
 *  @brief      XTEA encode
 *
 *  @author     Yang Su, Auto-ID Lab, The University of Adelaide
 */

/**
 * as a unique ID.
 */
#include<stdint.h>
#include <msp430.h>

typedef uint32_t u32;
typedef uint16_t u16;
typedef uint8_t u8;

/* XTEA is a version of slightly improved tea.
   The plain or cypher text is in v[0], v[1].
   The key is in k[n], where n = 0 - 3,
   The number of coding cycles is given by N and
   the number of decoding cycles given by -N     */
void tean(uint32_t *v, uint32_t *k,uint32_t ncycles)      /* replaces TEA's code and decode */
{
  register uint32_t
    y = v[0],
    z = v[1],
    DELTA = 0x9e3779b9,
    sum, A,B;
        sum = DELTA * (ncycles);
         sum = 0x9e3779b9 * 64;
         while (sum)
         {   z   -= (y << 4 ^ y >> 5) + y ^ sum + k[sum >> 11 & 3];
            sum -= DELTA;
             y   -= (z << 4 ^ z >> 5) + z ^ sum + k[sum & 3];
         }

    v[0] = y;
    v[1] = z;

    return;
}

void __attribute__ ((noinline)) HASH_XTEA(uint64_t nonce, const u8 firmware[], const uint16_t size, u8 state[8])
{
    // write codes here
    u16 idx = 0;
    u32 key[4];
    u16 residual = size;
    memcpy(state, &nonce, sizeof(uint64_t)); // 16 * 8 = 128 key

#define ROUND_SIZE 16
    for(;idx<size-ROUND_SIZE;idx+=ROUND_SIZE){     //first n blocks
        //printf("Processing idx = %d: ", idx);
        //for (i = 0; i < ROUND_SIZE; i ++) printf("0x%02X ", firmware[idx + i]);
        //printf("\n");
        memcpy(key, (firmware+(idx*sizeof(uint8_t))), ROUND_SIZE);
        tean((uint32_t *)state, key, 64);
    }
    residual = size - idx; //how many bytes left not hashed
    //printf("Last idx = %d; residual = %d.\n", idx, residual);

    //last block if firmware is not whole multiple of 128 bit
    memcpy(key, (firmware+(idx*sizeof(uint8_t))), residual);
    memset(key + residual, 0, ROUND_SIZE - residual);
    tean((uint32_t *)state, key, 64);//fill the missing byte with 0
}

void __attribute__ ((noinline)) HASH_XTEA_MP(uint64_t nonce, const u8 firmware[], const uint16_t size, u8 state[8])
{
    // write codes here: Miyaguchi¨CPreneel
    // input:
    // nonce 8 bytes -> key 16 bytes (copy)
    // message 8 bytes -> message 8 bytes
    u16 idx = 0;
    u32 key[4];
    u16 residual = size;
    u8 nextState[8] = {0};
    memcpy(key, &nonce, sizeof(uint64_t));
    memcpy(&key[2], &nonce, sizeof(uint64_t)); // key from nonce

#define ROUND_SIZE 8 // message size
    for(;idx<size-ROUND_SIZE;idx+=ROUND_SIZE){     //first n blocks
        //printf("Processing idx = %d: ", idx);
        //for (i = 0; i < ROUND_SIZE; i ++) printf("0x%02X ", firmware[idx + i]);
        //printf("\n");
        memcpy(key, state, sizeof(uint64_t));
        memcpy(&key[2], state, sizeof(uint64_t)); // new state is used as key
        memcpy(nextState, firmware+(idx*sizeof(uint8_t)), sizeof(uint64_t));

        tean((uint32_t *)nextState, key, 64);

        *(uint64_t *)nextState ^= *(uint64_t *)key ^ *(uint64_t *)state;
        memcpy(state, nextState, sizeof(uint64_t));
    }
    residual = size - idx; //how many bytes left not hashed
    //printf("Last idx = %d; residual = %d.\n", idx, residual);

    //last block if firmware is not whole multiple of 128 bit
    memcpy(key, state, sizeof(uint64_t));
    memcpy(&key[2], state, sizeof(uint64_t)); // new state is used as key
    memcpy(nextState, (firmware+(idx*sizeof(uint8_t))), residual);
    memset(nextState + residual, 0, ROUND_SIZE - residual);
    tean((uint32_t *)nextState, key, 64);//fill the missing byte with 0
    *(uint64_t *)nextState ^= *(uint64_t *)key ^ *(uint64_t *)state;
    memcpy(state, nextState, sizeof(uint64_t));
}

#endif /* XTEA_H_ */
