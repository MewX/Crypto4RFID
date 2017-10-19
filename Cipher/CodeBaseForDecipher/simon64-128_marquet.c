#include <stdint.h>
//#define PC

#include "tools.h"

#ifdef PC
#include <stdio.h>
#endif

#ifndef PC
#include <msp430.h>
#endif

typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;

static u8 z[62] =
{1,1,0,1,1,0,1,1,1,0,1,0,1,1,0,0,0,1,1,0,0,1,0,1,1,1,1,0,0,0,0,0,0,1,0,0,1,0,0,0,1,0,1,0,0,1,1,1,0,0,1,1,0,1,0,0,0,0,1,1,1,1};

void KeyExpansion ( u32 k[] )
{
    u8 i;
    u32 tmp;
    for ( i=4 ; i<44 ; i++ )
    {
        tmp = ROTATE_RIGHT_32(k[i-1],3);
        tmp = tmp ^ k[i-3];
        tmp = tmp ^ ROTATE_RIGHT_32(tmp,1);
        k[i] = ~k[i-4] ^ tmp ^ z[i-4] ^ 3;
    }
}

void Decrypt ( u32 text[], u32 crypt[], u32 key[] )
{
    u8 i;
    u32 tmp;
    crypt[0] = text[0];
    crypt[1] = text[1];

    for ( i=0 ; i<44 ; i++ )
    {
        tmp = crypt[1];
        crypt[1] = crypt[0] ^ ((ROTATE_LEFT_32(crypt[1],1)) & (ROTATE_LEFT_BYTE_32(crypt[1]))) ^ (ROTATE_LEFT_32(crypt[1],2)) ^ key[43-i];
        crypt[0] = tmp;
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
    crypt[0] = 0x656b696c;
    crypt[1] = 0x20646e75;
    u32 k[44];
    k[3] = 0x1b1a1918;
    k[2] = 0x13121110;
    k[1] = 0x0b0a0908;
    k[0] = 0x03020100;

	#ifndef PC
    START_DECRYPT();
	#endif
    KeyExpansion ( k );
    Decrypt ( crypt, text, k );
	#ifndef PC
    END_EXPE();
	#endif
	
	#ifdef PC
	printf("%0X %0X\n", text[0], text[1]);
	#endif

    return 0;
}
