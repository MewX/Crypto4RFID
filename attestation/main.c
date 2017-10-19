#include <msp430.h>
#include "wisp-base.h"
WISP_dataStructInterface_t wispData;
//#define init_address   0xFF80

/**
 * This function is called by WISP FW after a successful ACK reply
 *
 */
void my_ackCallback (void) {
    asm(" NOP");
}

/**
 * This function is called by WISP FW after a successful read command
 *  reception
 *
 */
void my_readCallback (void) {
    asm(" NOP");
}

/**
 * This function is called by WISP FW after a successful write command
 *  reception
 *
 */
void my_writeCallback (void) {
    asm(" NOP");
}

/**
 * This function is hidden within the process time of the wisp BEFORE responding to the reader!
 */
void main (void) {
//    uint16_t ran_num = (wispData.blockWriteBufPtr[2]);
//    uint16_t address = (wispData.blockWriteBufPtr[3]);
//    uint16_t length = (wispData.blockWriteBufPtr[4]);
    uint16_t ran_num = 0x0004;
    uint16_t address = 0xFF80;
    uint16_t initaddress = 0xFF80;
    uint16_t codeend =0xFFFF;
    uint16_t temp;
    uint8_t memorystate;
    uint16_t checksum = 0x00;
//    uint8_t i = 0;
    uint8_t count = 0;
    uint64_t infoMem;

//    for(; i < 50; i+=1)
    while(count <= 8)
    {
        //Gen function
        ran_num += ((ran_num * ran_num) | 5) % pow(2,4);
        address = ((address ^ ran_num) & 0xFF) + initaddress;
        //read memory state if this address is within the FRAM
        if (0xFF80 < address < 0xFFFF){
            memorystate = wispData.readBufPtr[address];
            if(memorystate != 0x00){
                infoMem = infoMem << 8 + memorystate;
                count += 1;
            }
        }
    }
    // Calculate checksum.
    checksum = infoMem;

    // Send ACK.
    wispData.epcBuf[2]  = checksum;
}

/**
 * main.c
 */
void my_blockWriteCallback(void)
{
//	WDTCTL = WDTPW | WDTHOLD;	// stop watchdog timer
    WISP_init();
    // Register callback functions with WISP comm routines
    WISP_registerCallback_ACK(&my_ackCallback);
    WISP_registerCallback_READ(&my_readCallback);
    WISP_registerCallback_WRITE(&my_writeCallback);
    WISP_registerCallback_BLOCKWRITE(&my_blockWriteCallback);

    // Initialize BlockWrite data buffer.
    uint16_t bwr_array[6] = {0};
    RWData.bwrBufPtr = bwr_array;

    // Get access to EPC, READ, and WRITE data buffers
    WISP_getDataBuffers(&wispData);

    // Set up operating parameters for WISP comm routines
    WISP_setMode( MODE_READ | MODE_WRITE | MODE_USES_SEL);
    WISP_setAbortConditions(CMD_ID_READ | CMD_ID_WRITE /*| CMD_ID_BLOCKWRITE*/ );

    // Set up EPC
    wispData.epcBuf[0] = 0x0B;        // Tag type
    wispData.epcBuf[1] = 0;           // Unused data field
    wispData.epcBuf[2] = 0;           // Unused data field
    wispData.epcBuf[3] = 0;           // Unused data field
    wispData.epcBuf[4] = 0;           // Unused data field
    wispData.epcBuf[5] = 0;           // Unused data field
    wispData.epcBuf[6] = 0;           // Unused data field
    wispData.epcBuf[7] = 0x00;        // Unused data field
    wispData.epcBuf[8] = 0x00;        // Unused data field
    wispData.epcBuf[9] = 0x51;        // Tag hardware revision (5.1)
    wispData.epcBuf[10] = *((uint8_t*)INFO_WISP_TAGID+1); // WISP ID MSB: Pull from INFO seg
    wispData.epcBuf[11] = *((uint8_t*)INFO_WISP_TAGID); // WISP ID LSB: Pull from INFO seg

    // Talk to the RFID reader.
    while (FOREVER) {
        WISP_doRFID();
    }
}

