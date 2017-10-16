// blake2s.c
// A simple blake2s Reference Implementation.

#include "blake2s.h"

// Cyclic right rotation.

#ifndef ROTR32
#define ROTR32(x, y)  (((x) >> (y)) ^ ((x) << (32 - (y))))
#endif

// Little-endian byte access.

// actually it is little endian, so I can access it directly
#define B2S_GET32(p) *(uint32_t *)(p)

// Mixing function G.
#define B2S_G(a, b, c, d, x, y) {   \
    v[a] = v[a] + v[b] + x;         \
    v[d] = ROTR32(v[d] ^ v[a], 16); \
    v[c] = v[c] + v[d];             \
    v[b] = ROTR32(v[b] ^ v[c], 12); \
    v[a] = v[a] + v[b] + y;         \
    v[d] = ROTR32(v[d] ^ v[a], 8);  \
    v[c] = v[c] + v[d];             \
    v[b] = ROTR32(v[b] ^ v[c], 7); }

// Initialization Vector.

static const uint32_t blake2s_iv[8] =
{
    0x6A09E667, 0xBB67AE85, 0x3C6EF372, 0xA54FF53A,
    0x510E527F, 0x9B05688C, 0x1F83D9AB, 0x5BE0CD19
};

// TODO: use it
//static const uint16_t blake2s_iv16[8] =
//{
//    0xE667, 0x6A09, 0xAE85, 0xBB67, 0xF372, 0x3C6E, 0xF53A, 0xA54F,
//    0x527F, 0x510E, 0x688C, 0x9B05, 0xD9AB, 0x1F83, 0xCD19, 0x5BE0
//};

// Compression function. "last" flag indicates last block.

static void blake2s_compress(blake2s_ctx *ctx, int last)
{
    const uint8_t sigma[10][16] = {
        { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 },
        { 14, 10, 4, 8, 9, 15, 13, 6, 1, 12, 0, 2, 11, 7, 5, 3 },
        { 11, 8, 12, 0, 5, 2, 15, 13, 10, 14, 3, 6, 7, 1, 9, 4 },
        { 7, 9, 3, 1, 13, 12, 11, 14, 2, 6, 5, 10, 4, 0, 15, 8 },
        { 9, 0, 5, 7, 2, 4, 10, 15, 14, 1, 11, 12, 6, 8, 3, 13 },
        { 2, 12, 6, 10, 0, 11, 8, 3, 4, 13, 7, 5, 15, 14, 1, 9 },
        { 12, 5, 1, 15, 14, 13, 4, 10, 0, 7, 6, 3, 9, 2, 8, 11 },
        { 13, 11, 7, 14, 12, 1, 3, 9, 5, 0, 15, 4, 8, 6, 2, 10 },
        { 6, 15, 14, 9, 11, 3, 0, 8, 12, 2, 13, 7, 1, 4, 10, 5 },
        { 10, 2, 8, 4, 7, 6, 1, 5, 15, 11, 9, 14, 3, 12, 13, 0 }
    };
    uint8_t i;
    uint32_t v[16], m[16];
    uint16_t *v16 = v, *m16 = m; // using pointer for testing first (size would be [32])
    uint16_t *h16 = ctx->h; // using pointer for testing first (size would be [16])
    uint16_t *t16 = ctx->t; // using pointer for testing first (size would be [4])
    const uint16_t *iv16 = blake2s_iv; // because of little-endian, I can't use blake2s_iv16 right now.

    for (i = 0; i < 16; i++) {           // init work variables
        v16[i] = h16[i];
        v16[i + 16] = iv16[i];
    }

    v16[24] ^= t16[0];
    v16[25] ^= t16[1];
    v16[26] ^= t16[2];
    v16[27] ^= t16[3];
    if (last) {                          // last block flag set ?
        v16[28] = ~v16[28];
        v16[29] = ~v16[29];
    }

    for (i = 0; i < 16; i++)            // get little-endian words
        m[i] = B2S_GET32(&ctx->b[i << 2]);
//    for (i = 0; i < 32; i++)            // get little-endian words
//        m16[i] = *(uint16_t *)&ctx->b[i << 1];
//    memcpy(m16, ctx->b, 64);

    for (i = 0; i < 10; i++) {          // ten rounds
        B2S_G( 0, 4,  8, 12, m[sigma[i][ 0]], m[sigma[i][ 1]]);
        B2S_G( 1, 5,  9, 13, m[sigma[i][ 2]], m[sigma[i][ 3]]);
        B2S_G( 2, 6, 10, 14, m[sigma[i][ 4]], m[sigma[i][ 5]]);
        B2S_G( 3, 7, 11, 15, m[sigma[i][ 6]], m[sigma[i][ 7]]);
        B2S_G( 0, 5, 10, 15, m[sigma[i][ 8]], m[sigma[i][ 9]]);
        B2S_G( 1, 6, 11, 12, m[sigma[i][10]], m[sigma[i][11]]);
        B2S_G( 2, 7,  8, 13, m[sigma[i][12]], m[sigma[i][13]]);
        B2S_G( 3, 4,  9, 14, m[sigma[i][14]], m[sigma[i][15]]);
    }

    for( i = 0; i < 8; ++i )
        ctx->h[i] ^= v[i] ^ v[i + 8];
}

// Initialize the hashing context "ctx" with optional key "key".
//      1 <= outlen <= 32 gives the digest size in bytes.
//      Secret key (also <= 32 bytes) is optional (keylen = 0).

int blake2s_init(blake2s_ctx *ctx, size_t outlen,
    const void *key, size_t keylen)     // (keylen=0: no key)
{
    size_t i;

    if (outlen == 0 || outlen > 32 || keylen > 32)
        return -1;                      // illegal parameters

    for (i = 0; i < 8; i++)             // state, "param block"
        ctx->h[i] = blake2s_iv[i];
    ctx->h[0] ^= 0x01010000 ^ (keylen << 8) ^ outlen;

    ctx->t[0] = 0;                      // input count low word
    ctx->t[1] = 0;                      // input count high word
    ctx->c = 0;                         // pointer within buffer
    ctx->outlen = outlen;

    for (i = keylen; i < 64; i++)       // zero input block
        ctx->b[i] = 0;
    if (keylen > 0) {
        blake2s_update(ctx, key, keylen);
        ctx->c = 64;                    // at the end
    }

    return 0;
}

// Add "inlen" bytes from "in" into the hash.

void blake2s_update(blake2s_ctx *ctx,
    const void *in, size_t inlen)       // data bytes
{
    size_t i;

    for (i = 0; i < inlen; i++) {
        if (ctx->c == 64) {             // buffer full ?
            ctx->t[0] += ctx->c;        // add counters
            if (ctx->t[0] < ctx->c)     // carry overflow ?
                ctx->t[1]++;            // high word
            blake2s_compress(ctx, 0);   // compress (not last)
            ctx->c = 0;                 // counter to zero
        }
        ctx->b[ctx->c++] = ((const uint8_t *) in)[i];
    }
}

// Generate the message digest (size given in init).
//      Result placed in "out".

void blake2s_final(blake2s_ctx *ctx, void *out)
{
    size_t i;

    ctx->t[0] += ctx->c;                // mark last block offset
    if (ctx->t[0] < ctx->c)             // carry overflow
        ctx->t[1]++;                    // high word

    while (ctx->c < 64)                 // fill up with zeros
        ctx->b[ctx->c++] = 0;
    blake2s_compress(ctx, 1);           // final block flag = 1

    // little endian convert and store
    for (i = 0; i < ctx->outlen; i++) {
        ((uint8_t *) out)[i] =
            (ctx->h[i >> 2] >> ((i & 3) << 3)) & 0xFF;
    }
}

// Convenience function for all-in-one computation.

int blake2s(void *out, size_t outlen,
    const void *key, size_t keylen,
    const void *in, size_t inlen)
{
    blake2s_ctx ctx;

    if (blake2s_init(&ctx, outlen, key, keylen))
        return -1;
    blake2s_update(&ctx, in, inlen);
    blake2s_final(&ctx, out);

    return 0;
}

