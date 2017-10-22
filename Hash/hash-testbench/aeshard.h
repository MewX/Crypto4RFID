/*
 * aeshard.h
 *
 *  Created on: Sep 11, 2017
 *      Author: MewX
 */

#ifndef AESHARD_H_
#define AESHARD_H_

#include <stdint.h>
#include <msp430.h>
#include "aes256.h" // from Driver Lib

typedef uint32_t u32;
typedef uint16_t u16;
typedef uint8_t u8;

void __attribute__ ((noinline)) HASH_AES256_HARD(uint64_t nonce, const u8 firmware[], const uint16_t size, u8 state[16])
{
    // write codes here
    u16 idx = 0;
    u8 key[16];
    u16 residual = size;
    u8 nextState[16] = {0};
    memcpy(state, &nonce, sizeof(uint64_t)); // 16 * 8 = 128 key
    memcpy(&state[8], &nonce, sizeof(uint64_t));

#define ROUND_SIZE 16
    for(;idx<size-ROUND_SIZE;idx+=ROUND_SIZE){     //first n blocks
        //printf("Processing idx = %d: ", idx);
        //for (i = 0; i < ROUND_SIZE; i ++) printf("0x%02X ", firmware[idx + i]);
        //printf("\n");
        memcpy(key, (firmware+(idx*sizeof(uint8_t))), ROUND_SIZE);

        // Load a cipher key to module
        AES256_setDecipherKey(AES256_BASE, key, 256);
        // Decrypt data
        AES256_decryptData(AES256_BASE, state, nextState);

        memcpy(state, nextState, 16 * sizeof(u8));
    }
    residual = size - idx; //how many bytes left not hashed
    //printf("Last idx = %d; residual = %d.\n", idx, residual);

    //last block if firmware is not whole multiple of 128 bit
    memcpy(key, (firmware+(idx*sizeof(uint8_t))), residual);
    memset(key + residual, 0, ROUND_SIZE - residual);

    // Load a cipher key to module
    AES256_setDecipherKey(AES256_BASE, key, 256);
    // Decrypt data
    AES256_decryptData(AES256_BASE, state, nextState);

    memcpy(state, nextState, 16 * sizeof(u8));
}

#endif /* AESHARD_H_ */
