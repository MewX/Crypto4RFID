#include <stdint.h>
#include <msp430.h>

// Install DriverLib first! http://www.ti.com/tool/MSPDRIVERLIB
#include "aes256.h"

int main(int argc, char** argv)
{
    // Stop WatchDog during initialization
    WDTCTL = WDTPW + WDTHOLD;

    uint8_t akey[16]={0xED,0xED,0xED,0xED,0xED,0xED,0xED,0xED,0xED,0xED,0xED,0xED,0xED,0xED,0xED,0xED};
    uint8_t adata[16]={0xED,0xED,0xED,0xED,0xED,0xED,0xED,0xED,0xED,0xED,0xED,0xED,0xED,0xED,0xED,0xED};
    uint8_t digest[16];
    uint8_t decrypt[16];

    // Load a cipher key to module
    //AES256_setCipherKey(AES256_BASE, CipherKey, AES256_KEYLENGTH_256BIT);
    // Encrypt data with preloaded cipher key
    //AES256_encryptData(AES256_BASE, Data, DataAESencrypted);

    // Load a cipher key to module
    AES256_setDecipherKey(AES256_BASE, akey, AES256_KEYLENGTH_128BIT);
    // Decrypt data
    AES256_decryptData(AES256_BASE, adata, decrypt);

    asm(" NOP");
    return 0;
}
