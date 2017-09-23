#include <stdint.h>
#include "tools.h"
#include <msp430.h>

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

void __attribute__ ((noinline)) Decrypt ( u16 text[], u16 crypt[], u16 key[] )
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
    WDTCTL = WDTPW | WDTHOLD;   // Stop watchdog timer
    PM5CTL0 &= ~LOCKLPM5;       // Lock LPM5.

    u32 text[2];
    text[0] = 0x3b726574;
    text[1] = 0x7475432d;
    u32 crypt[2] = {0};
    u32 l[28] = {0};
    u32 k[27] = {0};
    l[2] = 0x1b1a1918;
    l[1] = 0x13121110;
    l[0] = 0x0b0a0908;
    k[0] = 0x03020100;

    START_DECRYPT();
    KeyExpansion ( l, k );
    Decrypt ( crypt, text, k );
    END_EXPE();

    return 0;
}

