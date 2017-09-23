/*
Copyright (c) 2016, Moritz Bitsch

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
*/
#include <stdint.h>
#include <msp430.h>

#define MASK24 0xFFFFFF
#define MASK48 0xFFFFFFFFFFFF

#define SPECK_64_128
#ifdef SPECK_64_128
#define SPECK_TYPE uint32_t
#define SPECK_ROUNDS 27
#define SPECK_KEY_LEN 4
#endif

#define ROR(x, r) ((x >> r) | (x << ((sizeof(SPECK_TYPE) * 8) - r)))
#define ROL(x, r) ((x << r) | (x >> ((sizeof(SPECK_TYPE) * 8) - r)))

#define R(x, y, k) (x = ROR(x, 8), x += y, x ^= k, y = ROL(y, 3), y ^= x)
#define RR(x, y, k) (y ^= x, y = ROR(y, 3), x ^= k, x -= y, x = ROL(x, 8))

void speck_expand(SPECK_TYPE const K[SPECK_KEY_LEN], SPECK_TYPE S[SPECK_ROUNDS])
{
  SPECK_TYPE i, b = K[0];
  SPECK_TYPE a[SPECK_KEY_LEN - 1];

  for (i = 0; i < (SPECK_KEY_LEN - 1); i++)
  {
    a[i] = K[i + 1];
  }
  S[0] = b;
  for (i = 0; i < SPECK_ROUNDS - 1; i++) {
    R(a[i % (SPECK_KEY_LEN - 1)], b, i);
    S[i + 1] = b;
  }
}

void speck_decrypt(SPECK_TYPE const ct[2], SPECK_TYPE pt[2], SPECK_TYPE const K[SPECK_ROUNDS])
{
  SPECK_TYPE i;
  pt[0]=ct[0]; pt[1]=ct[1];

  for(i = 0; i < SPECK_ROUNDS; i++){
    RR(pt[1], pt[0], K[(SPECK_ROUNDS - 1) - i]);
  }
}

void speck_decrypt_combined(SPECK_TYPE const ct[2], SPECK_TYPE pt[2], SPECK_TYPE const K[SPECK_KEY_LEN])
{
  int i;
  SPECK_TYPE b = K[0];
  SPECK_TYPE a[SPECK_KEY_LEN - 1];
  pt[0]=ct[0]; pt[1]=ct[1];

  for (i = 0; i < (SPECK_KEY_LEN - 1); i++)
  {
    a[i] = K[i + 1];
  }

  for (i = 0; i < SPECK_ROUNDS - 1; i++)
  {
    R(a[i % (SPECK_KEY_LEN - 1)], b, i);
  }

  for(i = 0; i < SPECK_ROUNDS; i++){
    RR(pt[1], pt[0], b);
    RR(a[((SPECK_ROUNDS - 2) - i) % (SPECK_KEY_LEN - 1)], b, ((SPECK_ROUNDS - 2) - i));
  }
}

int main(int argc, char** argv)
{
    WDTCTL = WDTPW | WDTHOLD;   // Stop watchdog timer
    PM5CTL0 &= ~LOCKLPM5;       // Lock LPM5.

#ifdef SPECK_64_128
  uint32_t key[4] = {0x03020100, 0x0b0a0908, 0x13121110, 0x1b1a1918};
  uint32_t plain[2] = {0x7475432d, 0x3b726574};
  uint32_t enc[2] = {0x454e028b, 0x8c6fa548};
#endif

  SPECK_TYPE buffer[2] = {0};
  SPECK_TYPE exp[SPECK_ROUNDS];

  speck_expand(key, exp);

  speck_decrypt(enc, buffer, exp);
  asm(" NOP");
  return 0;
}
