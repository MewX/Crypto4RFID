#include <msp430.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include "tools.h"

typedef uint16_t u16;
typedef uint8_t u8;

#define NBROUND 32

#define KSIZE 80

static const u8 S0[16] = {14, 9, 15, 0, 13, 4, 10, 11, 1, 2, 8, 3, 7, 6, 12, 5};
static const u8 S1[16] = {4, 11, 14, 9, 15, 13, 0, 10, 7, 12, 5, 6, 2, 8, 1, 3};
static const u8 S2[16] = {1, 14, 7, 12, 15, 13, 0, 6, 11, 5, 9, 3, 2, 4, 8, 10};
static const u8 S3[16] = {7, 6, 8, 11, 0, 15, 3, 14, 9, 10, 12, 13, 5, 2, 4, 1};
static const u8 S4[16] = {14, 5, 15, 0, 7, 2, 12, 13, 1, 8, 4, 9, 11, 10, 6, 3};
static const u8 S5[16] = {2, 13, 11, 12, 15, 14, 0, 9, 7, 10, 6, 3, 1, 8, 4, 5};
static const u8 S6[16] = {11, 9, 4, 14, 0, 15, 10, 13, 6, 12, 5, 7, 3, 8, 1, 2};
static const u8 S7[16] = {13, 10, 15, 0, 14, 4, 9, 11, 2, 1, 8, 3, 7, 5, 12, 6};
static const u8 S8[16] = {8, 7, 14, 5, 15, 13, 0, 6, 11, 12, 9, 10, 2, 4, 1, 3};
static const u8 S9[16] = {11, 5, 15, 0, 7, 2, 9, 13, 4, 8, 1, 12, 14, 10, 3, 6};


void Swap(u8 block[8])
{
    u8 tmp[4];

    tmp[0] = block[0];
    tmp[1] = block[1];
    tmp[2] = block[2];
    tmp[3] = block[3];

    block[0] = block[4];
    block[1] = block[5];
    block[2] = block[6];
    block[3] = block[7];

    block[4] = tmp[0];
    block[5] = tmp[1];
    block[6] = tmp[2];
    block[7] = tmp[3];
}

 void OneRound_Inv(u8 y[8], u8 k[4])
{
     u8 t[4],tmp[4];

     // FAIRE PASSER Y_0, Y_1, Y_2, Y_3 dans F
    // AJOUT CLE
    tmp[0]=y[4]^k[0];
    tmp[1]=y[5]^k[1];
    tmp[2]=y[6]^k[2];
    tmp[3]=y[7]^k[3];


     // PASSAGE DANS LES BOITES S
    tmp[0] = ((S1[((tmp[0])>>4) & 0x0F])<<4)^S0[(tmp[0] & 0x0F)];
    tmp[1] = ((S3[((tmp[1])>>4) & 0x0F])<<4)^S2[(tmp[1] & 0x0F)];
    tmp[2] = ((S5[((tmp[2])>>4) & 0x0F])<<4)^S4[(tmp[2] & 0x0F)];
    tmp[3] = ((S7[((tmp[3])>>4) & 0x0F])<<4)^S6[(tmp[3] & 0x0F)];

   // PASSAGE DE LA PERMUTATION P
    t[0] =((tmp[0]>>4) & 0x0F)^(tmp[1] & 0xF0);
    t[1] = (tmp[0] & 0x0F) ^ ((tmp[1]& 0x0F)<<4);
    t[2] = ((tmp[2]>>4) & 0x0F)^(tmp[3] & 0xF0);
    t[3] = (tmp[2] & 0x0F) ^ ((tmp[3]& 0x0F)<<4);
    // FIN DE LA FONCTION F

        // PARTIE DROITE AVEC DECALAGE DE 8 SUR LA DROITE
    tmp[0]= y[0]^t[0];
    tmp[1]= y[1]^t[1];
    tmp[2]= y[2]^t[2];
    tmp[3]= y[3]^t[3];

    // PARTIE GAUCHE
    y[0]=tmp[1];
    y[1]=tmp[2];
    y[2]=tmp[3];
    y[3]=tmp[0];

}

 void __attribute__ ((noinline)) Decrypt(u8 x[8], u8 subkey[NBROUND][4])
{
     int i;

     OneRound_Inv(x, subkey[31]);
     for(i=30; i>=0; i--)
     {
        Swap(x);
        OneRound_Inv(x, subkey[i]);
     }
}


int main()
{
    // Stop WatchDog during initialization
    WDTCTL = WDTPW + WDTHOLD;

    u8 mkey[10];
    u8 rkey[NBROUND][4];

     mkey[0] = 0xdc;
    mkey[1] = 0xfe;
    mkey[2] = 0xef;
    mkey[3] = 0xcd;
    mkey[4] = 0xab;
    mkey[5] = 0x89;
    mkey[6] = 0x67;
    mkey[7] = 0x45;
    mkey[8] = 0x23;
    mkey[9] = 0x01;

   u8 state[8]={0xef, 0xcd, 0xab, 0x89, 0x67, 0x45, 0x23, 0x01};

 START_DECRYPT();
 Decrypt(state,rkey);
 END_EXPE();

return 0;
}
