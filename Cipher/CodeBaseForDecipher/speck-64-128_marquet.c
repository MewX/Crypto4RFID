#include <stdint.h>
//#define PC

#ifdef PC
#include <stdio.h>
#endif

#include "tools.h"

#ifndef PC
#include <msp430.h>
#endif

typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;

void KeyExpansion ( u32 l[], u32 k[] )
{
    u8 i;
    for ( i=0 ; i<26 ; i++ )
    {
        l[i+3] = ( k[i] + ROTATE_RIGHT_32(l[i], 8) ) ^ i;
        k[i+1] = ROTATE_LEFT_32(k[i], 3) ^ l[i+3];
    }
}

void
#ifndef PC
__attribute__ ((noinline))
#endif
Decrypt ( u32 text[], u32 crypt[], u32 key[] )
{
    u8 i;
    crypt[0] = text[0];
    crypt[1] = text[1];

    for ( i=0 ; i<27 ; i++ )
    {
        crypt[1] = ROTATE_RIGHT_32( crypt[0] ^ crypt[1], 3);
        crypt[0] = ROTATE_LEFT_32( (crypt[0] ^ key[25-i]) - crypt[1], 8 );
    }
}

int main ()
{
	#ifndef PC
    WDTCTL = WDTPW | WDTHOLD;   // Stop watchdog timer
    PM5CTL0 &= ~LOCKLPM5;       // Lock LPM5.
	#endif

    u32 text[2];
    u32 crypt[2] = {0};
    crypt[0] = 0x3b726574;
    crypt[1] = 0x7475432d;
    u32 l[28] = {0};
    u32 k[27] = {0};
    l[2] = 0x1b1a1918;
    l[1] = 0x13121110;
    l[0] = 0x0b0a0908;
    k[0] = 0x03020100;

    #ifndef PC
    START_DECRYPT();
    #endif
    KeyExpansion ( l, k );
    Decrypt ( crypt, text, k );
    #ifndef PC
    END_EXPE();
    #endif
	
    #ifdef PC
    printf("%0X %0X\n", text[0], text[1]);
    #endif

    return 0;
}

