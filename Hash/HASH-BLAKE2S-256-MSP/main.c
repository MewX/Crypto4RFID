/*
 * main.c
 *
 *  Created on: Oct 3, 2017
 *      Author: User
 */
#include "blake2s.h"
#include <stdint.h>
#include <msp430.h>

void main(){

        WDTCTL = WDTPW | WDTHOLD;   // Stop watchdog timer
        PM5CTL0 &= ~LOCKLPM5;       // Lock LPM5.

        // Clock System Setup
        CSCTL0_H = CSKEY >> 8;                    // Unlock CS registers
        CSCTL1 = DCOFSEL_6;                       // Set DCO to 8MHz
        CSCTL2 = SELA__VLOCLK | SELS__DCOCLK | SELM__DCOCLK;  // Set SMCLK = MCLK = DCO
                                                  // ACLK = VLOCLK
        CSCTL3 = DIVA__1 | DIVS__1 | DIVM__1;     // Set all dividers to 1
        CSCTL0_H = 0;                             // Lock CS registers

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
        uint16_t App1_size = 240;// make sure the firmware is continuous and you know its size
        // correct hash in this 240 bit input:
//        0x61    0xE3    0xDA    0x34    0x39    0x43    0x94    0xF5
//        0xAD    0x3F    0x0F    0xA1    0x68    0x4F    0x94    0x5A
//        0xD0    0xD5    0x19    0x0F    0xF9    0x67    0xB4    0x60
//        0xFC    0xA9    0x55    0xCE    0x9B    0x38    0x5B    0xBA


//        const uint8_t AppLED[] = {
//              0x80,0x5A,0x10,0x04,0x44,0x00,0xD2,0xD3,0x23,0x02,0x1E,0x14,0x3D,0x40,0x99,0x6F,
//              0x0E,0x43,0x1D,0x83,0x0E,0x73,0xFD,0x23,0x0D,0x93,0xFB,0x23,0x1D,0x16,0x00,0x3C,
//              0xD2,0xC3,0x23,0x02,0x1E,0x14,0x3D,0x40,0x8C,0x10,0x3E,0x40,0x03,0x00,0x1D,0x83,
//              0x0E,0x73,0xFD,0x23,0x0D,0x93,0xFB,0x23,0x1D,0x16,0xE5,0x3F,0x03,0x43,0x03,0x43,
//              0xFF,0x3F,0x03,0x43,0x1C,0x43,0x10,0x01,0x81,0x00,0x00,0x24,0xB0,0x13,0x42,0x44,
//              0x0C,0x43,0xB0,0x13,0x04,0x44,0xB0,0x13,0x3C,0x44,0x00,0x13,0x80,0x38,0x10,0xCC,
//              0xA1,0x00,0x58,0x44,0x58,0x44,0x58,0x44,0x58,0x44,0x58,0x44,0x58,0x44,0x58,0x44,
//              0x58,0x44,0x58,0x44,0x58,0x44,0x58,0x44,0x58,0x44,0x58,0x44,0x58,0x44,0x58,0x44,
//              0x58,0x44,0x58,0x44,0x58,0x44,0x58,0x44,0x58,0x44,0x58,0x44,0x58,0x44,0x58,0x44,
//              0x58,0x44,0x58,0x44,0x46,0x44,0x80,0x01,0x1C
//              };
//        uint16_t AppLED_size = 153;
//        const uint8_t AppTHE[] = {
//                0x80,0xC2,0x10,0x04,0x44,0x00,0x0A,0x14,0x3C,0x40,0x10,0x00,0x3D,0x40,0x10,0x00,
//                0x0E,0x43,0xB0,0x13,0x44,0xE9,0x8C,0x00,0xE4,0x1D,0xB0,0x13,0x0C,0xEA,0x2F,0x00,
//                0xE4,0x1D,0xFF,0x40,0x0B,0x00,0x00,0x00,0x2F,0x00,0xE4,0x1D,0xFF,0x40,0xA0,0x00,
//                0x01,0x00,0xCF,0x43,0x02,0x00,0xCF,0x43,0x03,0x00,0xCF,0x43,0x04,0x00,0xCF,0x43,
//                0x05,0x00,0xCF,0x43,0x06,0x00,0xCF,0x43,0x07,0x00,0xCF,0x43,0x08,0x00,0xFF,0x40,
//                0x51,0x00,0x09,0x00,0xDF,0x42,0x01,0x18,0x0A,0x00,0xDF,0x42,0x00,0x18,0x0B,0x00,
//                0xB0,0x13,0x2E,0xE7,0x3A,0x40,0x9C,0xFF,0xB0,0x13,0x2C,0xEC,0xB0,0x13,0xD8,0xDE,
//                0x2E,0x00,0xE4,0x1D,0xCF,0x0C,0x8F,0x10,0x8F,0x11,0xCE,0x4F,0x07,0x00,0xCE,0x4C,
//                0x08,0x00,0x0A,0x93,0x06,0x24,0x7C,0x40,0x07,0x00,0xB0,0x13,0x66,0xED,0x1A,0x53,
//                0x06,0x3C,0x7C,0x40,0x16,0x00,0xB0,0x13,0x66,0xED,0x3A,0x40,0x9C,0xFF,0xB0,0x13,
//                0x26,0xD1,0xE2,0x3F,0x03,0x43,0x03,0x43,0xFF,0x3F,0x03,0x43,0x1C,0x43,0x10,0x01,
//                0x81,0x00,0x00,0x24,0xB0,0x13,0xAA,0x44,0x0C,0x43,0xB0,0x13,0x04,0x44,0xB0,0x13,
//                0xA4,0x44,0x00,0x13,0x80,0x38,0x10,0xCC,0xA1,0x00,0xC0,0x44,0xC0,0x44,0xC0,0x44,
//                0xC0,0x44,0xC0,0x44,0xC0,0x44,0xC0,0x44,0xC0,0x44,0xC0,0x44,0xC0,0x44,0xC0,0x44,
//                0xC0,0x44,0xC0,0x44,0xC0,0x44,0xC0,0x44,0xC0,0x44,0xC0,0x44,0xC0,0x44,0xC0,0x44,
//                0xC0,0x44,0xC0,0x44,0xC0,0x44,0xC0,0x44,0xC0,0x44,0xC0,0x44,0xAE,0x44,0x80,0x01,
//                0x1C
//              };
//        uint16_t AppTHE_size = 257;
//        const uint8_t AppACC[] = {
//               0x80,0xFE,0x10,0x04,0x44,0x00,0x0A,0x14,0xE2,0xD2,0x23,0x02,0xD2,0x43,0x08,0x1C,0xD2,
//               0x43,0x09,0x1C,0xD2,0x43,0x0A,0x1C,0xF2,0xD0,0x70,0x00,0x0D,0x02,0xF2,0xF0,0x8F,0x00,
//               0x0B,0x02,0x00,0x3C,0x00,0x3C,0x03,0x43,0xB0,0x13,0x66,0xE8,0x00,0x3C,0x00,0x3C,0x03,
//               0x43,0xB0,0x13,0x88,0xEA,0x00,0x3C,0x00,0x3C,0x03,0x43,0xB0,0x13,0x60,0xEA,0x00,0x3C,
//               0x00,0x3C,0x03,0x43,0x00,0x3C,0x00,0x3C,0x03,0x43,0x8C,0x00,0xE4,0x1D,0xB0,0x13,0x0C,
//               0xEA,0x2F,0x00,0xE4,0x1D,0xFF,0x40,0x0B,0x00,0x00,0x00,0x2F,0x00,0xE4,0x1D,0xFF,0x40,
//               0xA1,0x00,0x01,0x00,0xCF,0x43,0x02,0x00,0xCF,0x43,0x03,0x00,0xCF,0x43,0x04,0x00,0xCF,
//               0x43,0x05,0x00,0xCF,0x43,0x06,0x00,0xCF,0x43,0x07,0x00,0xCF,0x43,0x08,0x00,0xFF,0x40,
//               0x51,0x00,0x09,0x00,0xDF,0x42,0x01,0x18,0x0A,0x00,0xDF,0x42,0x00,0x18,0x0B,0x00,0xB0,
//               0x13,0x2E,0xE7,0x3A,0x40,0x9C,0xFF,0xF2,0x40,0xA5,0x00,0x61,0x01,0x82,0x43,0x62,0x01,
//               0xB2,0x40,0x33,0x01,0x64,0x01,0x82,0x43,0x66,0x01,0xB2,0xF0,0xF1,0xFF,0x6C,0x01,0x92,
//               0xD3,0x6C,0x01,0x8C,0x00,0x08,0x1C,0xB0,0x13,0x10,0xE9,0x5F,0x42,0x08,0x1C,0x3F,0xF0,
//               0xC1,0xFF,0x3F,0x90,0x41,0x00,0x25,0x20,0x0D,0x14,0x3D,0x40,0x03,0x00,0x1D,0x83,0xFE,
//               0x23,0x0D,0x16,0x03,0x43,0x8C,0x00,0x08,0x1C,0xB0,0x13,0xEE,0xE6,0x2F,0x00,0xE4,0x1D,
//               0xCF,0x43,0x03,0x00,0x5E,0x42,0x09,0x1C,0x7E,0x80,0x80,0x00,0xCF,0x4E,0x04,0x00,0xCF,
//               0x43,0x80,0x64,0x10,0xFE,0x44,0x00,0x05,0x00,0x5E,0x42,0x08,0x1C,0x7E,0x80,0x80,0x00,
//               0xCF,0x4E,0x06,0x00,0xCF,0x43,0x07,0x00,0x5E,0x42,0x0A,0x1C,0x7E,0x80,0x80,0x00,0xCF,
//               0x4E,0x08,0x00,0x0A,0x93,0x06,0x24,0x7C,0x40,0x07,0x00,0xB0,0x13,0x66,0xED,0x1A,0x53,
//               0x06,0x3C,0x7C,0x40,0x16,0x00,0xB0,0x13,0x66,0xED,0x3A,0x40,0x9C,0xFF,0xB0,0x13,0x26,
//               0xD1,0xB0,0x3F,0x03,0x43,0x03,0x43,0xFF,0x3F,0x03,0x43,0x1C,0x43,0x10,0x01,0x81,0x00,
//               0x00,0x24,0xB0,0x13,0x46,0x45,0x0C,0x43,0xB0,0x13,0x04,0x44,0xB0,0x13,0x40,0x45,0x00,
//               0x13,0x80,0x38,0x10,0xCC,0xA1,0x00,0x5C,0x45,0x5C,0x45,0x5C,0x45,0x5C,0x45,0x5C,0x45,
//               0x5C,0x45,0x5C,0x45,0x5C,0x45,0x5C,0x45,0x5C,0x45,0x5C,0x45,0x5C,0x45,0x5C,0x45,0x5C,
//               0x45,0x5C,0x45,0x5C,0x45,0x5C,0x45,0x5C,0x45,0x5C,0x45,0x5C,0x45,0x5C,0x45,0x5C,0x45,
//               0x5C,0x45,0x5C,0x45,0x5C,0x45,0x4A,0x45,0x80,0x01,0x1C
//              };
//        uint16_t AppACC_size = 419;
        uint64_t nonce = 0x0102030405060708;// nonce know by both side, protect reply attack
        uint8_t s[32];


        blake2s(s,32,NULL,0,App1,App1_size);



        uint8_t hashV[32]; // hash value
        memcpy(hashV, s, 32);

        while(1) { }
}
