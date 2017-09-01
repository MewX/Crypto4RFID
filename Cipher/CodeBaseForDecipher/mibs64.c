#include <msp430.h>
#include <stdint.h>

typedef uint8_t  u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;

#include "tools.h"

static const unsigned short sBox4[] = {
  0x4, 0xF, 0x3, 0x8, 0xD, 0xA, 0xC, 0x0, 0xB, 0x5, 0x7, 0xE, 0x2, 0x6, 0x1, 0x9
};

static const unsigned short sBox4Inv[] = {
  0x7, 0xE, 0xC, 0x2, 0x0, 0x9, 0xD, 0xA, 0x3, 0xF, 0x5, 0x8, 0x6, 0x4, 0xB, 0x1
};

void
AddRoundKey(u8* state, u8* key)
{
  //    ****************** addRoundkey *************************
  state[3] ^= key[7];
  state[2] ^= key[6];
  state[1] ^= key[5];
  state[0] ^= key[4];
  //    ****************** addRoundkey End *********************
}

void
Substitute(u8* state)
{
    u8 temp_sBox;

    //  ******************* sBox *******************************
    temp_sBox = 0;
    temp_sBox |= sBox4[(state[0] & 0xF)];
    temp_sBox |= (sBox4[(state[0]>>4)]) << 4;
    state[0]=temp_sBox;

    temp_sBox = 0;
    temp_sBox |= sBox4[(state[1] & 0xF)];
    temp_sBox |= (sBox4[(state[1]>>4)]) << 4;
    state[1]=temp_sBox;

    temp_sBox = 0;
    temp_sBox |= sBox4[(state[2] & 0xF)];
    temp_sBox |= (sBox4[(state[2]>>4)]) << 4;
    state[2]=temp_sBox;

    temp_sBox = 0;
    temp_sBox |= sBox4[(state[3] & 0xF)];
    temp_sBox |= (sBox4[(state[3]>>4)]) << 4;
    state[3]=temp_sBox;
    //  ******************* sBox End ***************************
}

void
Mix(u8* state)
{
  u8 n7 = state[0] & 0xF;
  u8 n6 = state[0] >> 4;
  u8 n5 = state[1] & 0xF;
  u8 n4 = state[1] >> 4;
  u8 n3 = state[2] & 0xF;
  u8 n2 = state[2] >> 4;
  u8 n1 = state[3] & 0xF;
  u8 n0 = state[3] >> 4;

  state[3] = ((n1 ^ n2 ^ n3 ^ n4 ^ n5 ^ n6) <<  4) | (n0 ^ n2 ^ n3 ^ n5 ^ n6 ^ n7);
  state[2] = ((n0 ^ n1 ^ n3 ^ n4 ^ n6 ^ n7) << 4) | (n0 ^ n1 ^ n2 ^ n4 ^ n5 ^ n7);
  state[1] = ((n0 ^ n1 ^ n3 ^ n4 ^ n5) << 4) | (n0 ^ n1 ^ n2 ^ n5 ^ n6);
  state[0] = ((n1 ^ n2 ^ n3 ^ n6 ^ n7) << 4) | (n0 ^ n2 ^ n3 ^ n4 ^ n7);
}

void
Permute(u8* state)
{
  u8 n7 = state[0] & 0xF;
  u8 n6 = state[0] >> 4;
  u8 n5 = state[1] & 0xF;
  u8 n4 = state[1] >> 4;
  u8 n3 = state[2] & 0xF;
  u8 n2 = state[2] >> 4;
  u8 n1 = state[3] & 0xF;
  u8 n0 = state[3] >> 4;

  state[3] = (n2 << 4) | n0;
  state[2] = (n3 << 4) | n6;
  state[1] = (n7 << 4) | n4;
  state[0] = (n5 << 4) | n1;
}

void
InvKeySchedule(u8* key, u8 round)
{
  key[1] = ((((key[1] >> 3) & 0x1F) ^ round ) << 3) | (key[1] & 0x7);
  key[7] = (sBox4Inv[(key[7] >> 4) & 0xF] << 4) | (key[7] & 0xF);

  u64 key_64 = *((u64*) key);
  u64 key_64r = ROTATE_LEFT_64(key_64, 15);
  *((u64*) key) = key_64r;
}

void __attribute__ ((noinline)) Decrypt(u8 *state, u8 *key)
{
    int round;

    for(round=32; round >= 1; round--)
      {
        u32 state_L = *((u32*) (state + 4));
        u32 state_R = *((u32*) state);

        AddRoundKey(state, key);
        Substitute(state);
        Mix(state);
        Permute(state);

        *((u32*) state) = (*((u32*) state)) ^ state_L;
        *((u32*) (state + 4)) = state_R;

        InvKeySchedule(key, round);
      }

    return;
}

int main(void)
{
  // Stop WatchDog during initialization
  WDTCTL = WDTPW + WDTHOLD;

  // Input values
  //u8 state[8]={0xfe, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
  u8 state[8]={0x00};

  u8 key[8]={0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff};
  //u8 key[8]={0};

  START_DECRYPT();
  Decrypt(state, key);
  END_EXPE();

  return 0;
}
