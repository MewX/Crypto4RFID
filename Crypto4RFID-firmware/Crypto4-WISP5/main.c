/**
 * @file       usr.c
 * @brief      WISP application-specific code set
 * @details    The WISP application developer's implementation goes here.
 *
 * @author     Aaron Parks, UW Sensor Systems Lab
 *
 */



#include "wisp-base.h"

WISP_dataStructInterface_t wispData;

#define LOC_ADDRESS_LIST_TO_READ            0x1000
#define InfoA                               0x1900

#define ADDRESS_TO_READ                     (* (uint16_t *) (InfoA))

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

//    // read Data
//    wispData.readBufPtr[0] = 0xa1;
//    wispData.readBufPtr[1] = 0x68;
//    wispData.readBufPtr[2] = 0x99;
//    wispData.readBufPtr[3] = 0x38;
//    wispData.readBufPtr[4] = 0xDD;

}

/**
 * This function is called by WISP FW after a successful write command
 *  reception
 *
 */
void my_writeCallback (void) {

    // Acknowledge the message.
//    wispData.epcBuf[2] = (wispData.writeBufPtr[0] >> 8)  & 0xFF;
//    wispData.epcBuf[3] = (wispData.writeBufPtr[0])  & 0xFF;
//    wispData.epcBuf[4] = (wispData.writeBufPtr[1] >> 8)  & 0xFF;
//    wispData.epcBuf[5] = (wispData.writeBufPtr[1])  & 0xFF;
}

/** 
 * This function is called by WISP FW after a successful BlockWrite
 *  command decode

 */
void my_blockWriteCallback  (void) {

    (* (uint16_t *) (0x1900)) = 0xB007;
    (* (uint16_t *) (0x1902)) = 0xABCD;
    (* (uint16_t *) (0x1904)) = 0xCCCC;
    (* (uint16_t *) (0x1906)) = 0xCCCC;
    (* (uint16_t *) (0x1908)) = 0x3333;
    (* (uint16_t *) (0x190a)) = 0x4444;
    (* (uint16_t *) (0x190c)) = 0x5555;
    (* (uint16_t *) (0x190e)) = 0xCCCC;
    (* (uint16_t *) (0x1910)) = 0xDDDD;
    (* (uint16_t *) (0x1912)) = 0xaaaa;
    (* (uint16_t *) (0x1914)) = 0x4444;
    (* (uint16_t *) (0x1916)) = 0xbbbb;
    (* (uint16_t *) (0x1918)) = 0xcccc;
    (* (uint16_t *) (0x191a)) = 0xdddd;
    (* (uint16_t *) (0x191c)) = 0xaaaa;
    (* (uint16_t *) (0x191e)) = 0x0000;

    uint8_t offset          = 0x00;
    uint8_t i               = 0;

    uint8_t word_count = (wispData.blockWriteBufPtr[0] >> 8)  & 0xFF;
    uint8_t size = (wispData.blockWriteBufPtr[0])  & 0xFF;
    uint16_t address = wispData.blockWriteBufPtr[1];

    word_count = word_count * 2;

    for (i = 0; i < 32; i+=2){
        wispData.readBufPtr[i] = ((* (uint16_t *) (address + (offset<<1))) >> 8)  & 0xFF;
        offset++;
    }

    offset = 0x00;
    for (i = 1; i < 32; i+=2){
        wispData.readBufPtr[i] = ((* (uint16_t *) (address + (offset<<1))))  & 0xFF;
        offset++;
    }


//
//    wispData.readBufPtr[0] = ((* (uint16_t *) (address+0)) >> 8)  & 0xFF;
//    wispData.readBufPtr[1] = ((* (uint16_t *) (address+0)))  & 0xFF;
//    wispData.readBufPtr[2] = ((* (uint16_t *) (address+1)) >> 8)  & 0xFF;
//    wispData.readBufPtr[3] = ((* (uint16_t *) (address+1)))  & 0xFF;
//    wispData.readBufPtr[4] = ((* (uint16_t *) (address+2)) >> 8)  & 0xFF;
//    wispData.readBufPtr[5] = ((* (uint16_t *) (address+2)))  & 0xFF;
//    wispData.readBufPtr[6] = ((* (uint16_t *) (address+3)) >> 8)  & 0xFF;
//    wispData.readBufPtr[7] = ((* (uint16_t *) (address+3)))  & 0xFF;
//    wispData.readBufPtr[8] = ((* (uint16_t *) (address+4)) >> 8)  & 0xFF;
//    wispData.readBufPtr[9] = ((* (uint16_t *) (address+4)))  & 0xFF;
//    wispData.readBufPtr[10] = ((* (uint16_t *) (address+5)) >> 8)  & 0xFF;
//    wispData.readBufPtr[11] = ((* (uint16_t *) (address+5)))  & 0xFF;
//    wispData.readBufPtr[12] = ((* (uint16_t *) (address+6)) >> 8)  & 0xFF;
//    wispData.readBufPtr[13] = ((* (uint16_t *) (address+6)))  & 0xFF;
//    wispData.readBufPtr[14] = ((* (uint16_t *) (address+7)) >> 8)  & 0xFF;
//    wispData.readBufPtr[15] = ((* (uint16_t *) (address+7)))  & 0xFF;
//    wispData.readBufPtr[16] = ((* (uint16_t *) (address+8)))  & 0xFF;
//    wispData.readBufPtr[17] = ((* (uint16_t *) (address+8)) >> 8)  & 0xFF;
//    wispData.readBufPtr[18] = ((* (uint16_t *) (address+9)))  & 0xFF;
//    wispData.readBufPtr[19] = ((* (uint16_t *) (address+9)) >> 8)  & 0xFF;
//    wispData.readBufPtr[20] = ((* (uint16_t *) (address+10)))  & 0xFF;
//    wispData.readBufPtr[21] = ((* (uint16_t *) (address+10)) >> 8)  & 0xFF;
//    wispData.readBufPtr[22] = ((* (uint16_t *) (address+11)))  & 0xFF;
//    wispData.readBufPtr[23] = ((* (uint16_t *) (address+11)))  & 0xFF;
//    wispData.readBufPtr[24] = ((* (uint16_t *) (address+12)))  & 0xFF;
//    wispData.readBufPtr[25] = ((* (uint16_t *) (address+12)))  & 0xFF;
//    wispData.readBufPtr[26] = ((* (uint16_t *) (address+13)) >> 8)  & 0xFF;
//    wispData.readBufPtr[27] = ((* (uint16_t *) (address+13)))  & 0xFF;
//    wispData.readBufPtr[28] = ((* (uint16_t *) (address+14)) >> 8)  & 0xFF;
//    wispData.readBufPtr[29] = ((* (uint16_t *) (address+14)))  & 0xFF;
//    wispData.readBufPtr[30] = ((* (uint16_t *) (address+15)) >> 8)  & 0xFF;
//    wispData.readBufPtr[31] = ((* (uint16_t *) (address+15)))  & 0xFF;

//    // Read Memory
//    (* (uint16_t *) (0x1900)) = 0xB007;
//    (* (uint16_t *) (0x1902)) = 0xABCD;
//
//    uint16_t address = wispData.blockWriteBufPtr[0];
//
//    readBuff16_t = (uint16_t *) wispData.readBufPtr;
//
//    wispData.epcBuf[2] = ((* (uint16_t *) (address+0)) >> 8)  & 0xFF;
//    wispData.epcBuf[3] = ((* (uint16_t *) (address+0)))  & 0xFF;
//    wispData.epcBuf[4] = ((* (uint16_t *) (address+2)) >> 8)  & 0xFF;
//    wispData.epcBuf[5] = ((* (uint16_t *) (address+2)))  & 0xFF;

//    // blockWriteData
//    wispData.epcBuf[2] = (wispData.blockWriteBufPtr[0] >> 8)  & 0xFF;
//    wispData.epcBuf[3] = (wispData.blockWriteBufPtr[0])  & 0xFF;
//    wispData.epcBuf[4] = (wispData.blockWriteBufPtr[1] >> 8)  & 0xFF;
//    wispData.epcBuf[5] = (wispData.blockWriteBufPtr[1])  & 0xFF;
//    wispData.epcBuf[6] = (wispData.blockWriteBufPtr[2] >> 8)  & 0xFF;
//    wispData.epcBuf[7] = (wispData.blockWriteBufPtr[2])  & 0xFF;
//    wispData.epcBuf[6] = (wispData.blockWriteBufPtr[2] >> 8)  & 0xFF;
//    wispData.epcBuf[7] = (wispData.blockWriteBufPtr[2])  & 0xFF;

}


/**
 * This implements the user application and should never return
 *
 * Must call WISP_init() in the first line of main()
 * Must call WISP_doRFID() at some point to start interacting with a reader
 */
void main(void) {
  WISP_init();

  // Register callback functions with WISP comm routines
  WISP_registerCallback_ACK(&my_ackCallback);
  WISP_registerCallback_READ(&my_readCallback);
  WISP_registerCallback_WRITE(&my_writeCallback);
  WISP_registerCallback_BLOCKWRITE(&my_blockWriteCallback);
  
  // Initialize BlockWrite data buffer.
  uint16_t bwr_array[32] = {0};
  RWData.bwrBufPtr = bwr_array;
  
  // Get access to EPC, READ, and WRITE data buffers
  WISP_getDataBuffers(&wispData);
  
  // Set up operating parameters for WISP comm routines
  WISP_setMode( MODE_READ | MODE_WRITE | MODE_USES_SEL); 
  WISP_setAbortConditions(CMD_ID_READ | CMD_ID_WRITE);
  
  // Set up EPC
  wispData.epcBuf[0] = 0x0B;        // Tag type
  wispData.epcBuf[1] = 0x00;            // Unused data field
  wispData.epcBuf[2] = 0x00;            // Unused data field
  wispData.epcBuf[3] = 0x00;            // Unused data field
  wispData.epcBuf[4] = 0x00;            // Unused data field
  wispData.epcBuf[5] = 0x00;            // Unused data field
  wispData.epcBuf[6] = 0x00;            // Unused data field
  wispData.epcBuf[7] = 0x00;        // Unused data field
  wispData.epcBuf[8] = 0x00;        // Unused data field
  wispData.epcBuf[9] = 0x51;        // Tag hardware revision (5.1)
  wispData.epcBuf[10] = 0x00;      // Unused data field
  wispData.epcBuf[11] = 0x00;        // Tag hardware revision (5.1)
//  wispData.epcBuf[10] = *((uint8_t*)INFO_WISP_TAGID+1); // WISP ID MSB: Pull from INFO seg
//  wispData.epcBuf[11] = *((uint8_t*)INFO_WISP_TAGID); // WISP ID LSB: Pull from INFO seg

//  FRAM_init();
//  uint32_t* myData2 = 0xABCD;
//  FRAM_write_infoA_long(0,1, myData2);

  // Talk to the RFID reader.
  while (FOREVER) {
    WISP_doRFID();
  }
}
