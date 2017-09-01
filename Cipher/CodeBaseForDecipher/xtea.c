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

//void XTEAdec(uint32_t * v,uint32_t *k,int N){
//     uint32_t y=v[0],z=v[1],DELTA=0x9e3779b9;
//    if(N>0){
//         uint32_t sum = DELTA*N;
//         int i = 0;
//        for(i = 0;i < N;i++){
//            z -= ((y<<4 ^ y>>5) + y) ^ (sum + k[sum>>11 &3]);
//            sum -= DELTA;
//            y -= ((z<<4 ^ z>>5) + z) ^ (sum + k[sum&3]);
//        }
//    }
//    v[0] = y, v[1] = z;
//}

/* XTEA is a version of slightly improved tea.
   The plain or cypher text is in v[0], v[1].
   The key is in k[n], where n = 0 - 3,
   The number of coding cycles is given by N and
   the number of decoding cycles given by -N     */
void
tean(uint32_t *v, uint32_t *k,uint32_t ncycles)      /* replaces TEA's code and decode */
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

void main(void)
{
    WDTCTL = WDTPW | WDTHOLD;   // Stop watchdog timer
    PM5CTL0 &= ~LOCKLPM5;       // Lock LPM5.

     uint32_t text[2];
    text[0] = 0x4853224D;
    text[1] = 0x5F50DB40;

     uint32_t key[4];
    key[0] = 0x17485418;
    key[1] = 0x42465615;
    key[2] = 0x90872153;
    key[3] = 0x99887765;

    tean(text,key,64);

    asm(" NOP");
}
