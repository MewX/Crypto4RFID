//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Implementation of LEA Block Cipher on 8-bit AVR Processors (Balanced Optimization)                           //
// Copyright (C) 2015 KISA <http://www.kisa.or.kr>                                                              //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#include <stdlib.h>
#include <msp430.h>
#include <stdint.h>

#include "tools.h"

typedef uint32_t DWORD;
typedef uint8_t BYTE;

#define ROR(W,i) (((W)>>(i)) | ((W)<<(32-(i))))
#define ROL(W,i) (((W)<<(i)) | ((W)>>(32-(i))))

#define DWORD_in(x)            (*(DWORD*)(x))
#define DWORD_out(x, v)        {*((DWORD*)(x)) = (v);}

static inline uint32_t rot32l1(uint32_t x) {
    return (x << 1) | (x >> 31);
}

static inline uint32_t rot32r1(uint32_t x) {
    return (x >> 1) | (x << 31);
}

static inline uint32_t rot32l8(uint32_t x) {
    return (x << 8) | (x >> 24);
}

static inline uint32_t rot32r8(uint32_t x) {
    return (x >> 8) | (x << 24);
}

static inline uint32_t rot32l3(uint32_t x) {
    return rot32l1(rot32l1(rot32l1(x)));
}

static inline uint32_t rot32r3(uint32_t x) {
    return rot32r1(rot32r1(rot32r1(x)));
}

static inline uint32_t rot32l5(uint32_t x) {
    return rot32r3(rot32l8(x));
}

static inline uint32_t rot32l9(uint32_t x) {
    return rot32l1(rot32l8(x));
}

static inline uint32_t rot32r5(uint32_t x) {
    return rot32l3(rot32r8(x));
}

static inline uint32_t rot32r9(uint32_t x) {
    return rot32r1(rot32r8(x));
}

static inline uint32_t rot32l2(uint32_t x) {
    return rot32l1(rot32l1(x));
}

static inline uint32_t rot32l4(uint32_t x) {
    return rot32l2(rot32l2(x));
}

static inline uint32_t rot32l6(uint32_t x) {
    return rot32r1(rot32r1(rot32l8(x)));
}

static inline uint32_t rot32l11(uint32_t x) {
    return rot32l3(rot32l8(x));
}

const static uint32_t DELTA[4] = {0xc3efe9db, 0x88c4d604, 0xe789f229, 0xc6f98763};

void LEA_Key(const uint8_t* userkey, uint8_t* roundkey){

    uint32_t* rk = (uint32_t*) roundkey;
    uint32_t* t = (uint32_t*) userkey;
    uint32_t delta[4] = {DELTA[0], DELTA[1], DELTA[2], DELTA[3]};
    uint32_t tmp;
    int ridx = 0;
    int i;

    uint32_t t0 = t[0];
    uint32_t t1 = t[1];
    uint32_t t2 = t[2];
    uint32_t t3 = t[3];

    for (i = 0; i < 24; ++i) {
        tmp = delta[i & 3];

        t0 = rot32l1(t0 + tmp);
        t1 = rot32l3(t1 + rot32l1(tmp));
        t2 = rot32l6(t2 + rot32l2(tmp));
        t3 = rot32l11(t3 + rot32l3(tmp));
        delta[i & 3] = rot32l4(tmp);

        rk[ridx++] = t1;
        rk[ridx++] = t3;
        rk[ridx++] = t2;
        rk[ridx++] = t0;
    }
}

void LEA_Enc(const uint8_t* roundkey, uint8_t* data) {
    uint32_t* block = (uint32_t*) data;
    const uint32_t* rk = (const uint32_t*) roundkey;
    uint8_t i;

    uint32_t b0 = block[0];
    uint32_t b1 = block[1];
    uint32_t b2 = block[2];
    uint32_t b3 = block[3];

    for (i = 0; i < 6; ++i) {
        b3 = rot32r3(((b2 ^ rk[1]) + (b3 ^ rk[0])));
        b2 = rot32r5(((b1 ^ rk[2]) + (b2 ^ rk[0])));
        b1 = rot32l9(((b0 ^ rk[3]) + (b1 ^ rk[0])));
        rk += 4;

        b0 = rot32r3(((b3 ^ rk[1]) + (b0 ^ rk[0])));
        b3 = rot32r5(((b2 ^ rk[2]) + (b3 ^ rk[0])));
        b2 = rot32l9(((b1 ^ rk[3]) + (b2 ^ rk[0])));
        rk += 4;

        b3 = rot32r3(((b0 ^ rk[1]) + (b1 ^ rk[0])));
        b2 = rot32r5(((b3 ^ rk[2]) + (b0 ^ rk[0])));
        b1 = rot32l9(((b2 ^ rk[3]) + (b3 ^ rk[0])));
        rk += 4;

        b3 = rot32r3(((b1 ^ rk[1]) + (b2 ^ rk[0])));
        b2 = rot32r5(((b0 ^ rk[2]) + (b1 ^ rk[0])));
        b1 = rot32l9(((b3 ^ rk[3]) + (b0 ^ rk[0])));
        rk += 4;
    }

    block[0] = b0;
    block[1] = b1;
    block[2] = b2;
    block[3] = b3;
}

void LEA_Dec(const uint8_t* roundkey, uint8_t* data)
{
    uint32_t* block = (uint32_t*) data;
    const uint32_t* rk = (const uint32_t*) roundkey;
    uint8_t i;

    uint32_t b0 = block[0];
    uint32_t b1 = block[1];
    uint32_t b2 = block[2];
    uint32_t b3 = block[3];

    rk += 92;
    for (i = 0; i < 6; ++i) {
        b0 = (rot32r9(b0) - (b3 ^ rk[3])) ^ rk[0];
        b1 = (rot32l5(b1) - (b0 ^ rk[2])) ^ rk[0];
        b2 = (rot32l3(b2) - (b1 ^ rk[1])) ^ rk[0];
        rk -= 4;

        b3 = (rot32r9(b3) - (b2 ^ rk[3])) ^ rk[0];
        b0 = (rot32l5(b0) - (b3 ^ rk[2])) ^ rk[0];
        b1 = (rot32l3(b1) - (b0 ^ rk[1])) ^ rk[0];
        rk -= 4;

        b2 = (rot32r9(b2) - (b1 ^ rk[3])) ^ rk[0];
        b3 = (rot32l5(b3) - (b2 ^ rk[2])) ^ rk[0];
        b0 = (rot32l3(b0) - (b3 ^ rk[1])) ^ rk[0];
        rk -= 4;

        b1 = (rot32r9(b1) - (b0 ^ rk[3])) ^ rk[0];
        b2 = (rot32l5(b2) - (b1 ^ rk[2])) ^ rk[0];
        b3 = (rot32l3(b3) - (b2 ^ rk[1])) ^ rk[0];
        rk -= 4;
    }

    block[0] = b0;
    block[1] = b1;
    block[2] = b2;
    block[3] = b3;
}

int main(int argc, char* argv[])
{
    WDTCTL = WDTPW | WDTHOLD;   // Stop watchdog timer
    PM5CTL0 &= ~LOCKLPM5;       // Lock LPM5.

    // ************ Declarations ************
    uint16_t text[8]={0xeeff, 0xccdd, 0xaabb, 0x8899, 0x6677, 0x4455, 0x4455, 0x0011};
    uint16_t ptext[8]={0};
    uint16_t k128[8] = {0x0011, 0x4455, 0x4455, 0x6677, 0x8899, 0xaabb, 0xccdd, 0xeeff};
    uint8_t roundKey[384] = {0};

    START_DECRYPT();
    LEA_Key((uint8_t *)k128, roundKey);
    LEA_Dec(roundKey, (uint8_t)ptext);
    END_EXPE();
    return 0;
}
