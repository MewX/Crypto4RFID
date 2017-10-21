/**
 * @file       usr.c
 * @brief      WISP application-specific code set
 * @details    The WISP application developer's implementation goes here.
 *
 * @author     Aaron Parks, UW Sensor Systems Lab
 *
 */



#include "wisp-base.h"
#include "xtea.h"
WISP_dataStructInterface_t wispData;


/** 
 * This function is called by WISP FW after a successful ACK reply
 *
 */
void my_ackCallback (void) {
  asm("NOP");
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
 * This function is called by WISP FW after a successful BlockWrite
 *  command decode

 */
void my_blockWriteCallback  (void) {

    uint8_t word_count      = (wispData.blockWriteBufPtr[0] >> 8)  & 0xFF;
    uint16_t address        = wispData.blockWriteBufPtr[1];

    if (word_count == 0x1F){
        uint8_t offset          = 0x00;
        uint8_t i               = 0;

        for (i = 0; i < 32; i+=2){
            wispData.readBufPtr[i] = ((* (uint16_t *) (address + (offset<<1))) >> 8)  & 0xFF;
            offset++;
        }

        offset                  = 0x00;
        for (i = 1; i < 32; i+=2){
            wispData.readBufPtr[i] = ((* (uint16_t *) (address + (offset<<1))))  & 0xFF;
            offset++;
        }
    }else if (word_count == 0x2F){
        WDTCTL = WDTPW + WDTHOLD;

        uint16_t LOF         = (wispData.blockWriteBufPtr[0])  & 0xFF;
//        uint64_t ran_num     = ((uint64_t)wispData.blockWriteBufPtr[2] << 48) | ((uint64_t)wispData.blockWriteBufPtr[3] << 32) |  ((uint64_t)wispData.blockWriteBufPtr[4] << 16) | (uint64_t)wispData.blockWriteBufPtr[5];
        uint8_t j            = 0;
//        uint64_t checksum    = 0x4159ffbeba74ab97;
        uint64_t checksum;
        uint64_t ran_num     = 0x1234567891234567;

//         ran_num += ((ran_num * ran_num) | 5) % pow(2,4);
//         address = ((address ^ ran_num) & 0xFF) + 0xFF80;

//         //Calculate checksum.
         HASH_XTEA_PFMD(ran_num, (uint8_t *)0x1800, (uint16_t)80, (uint8_t *)&checksum);

//
//         do wispData.readBufPtr[j++] = checksum  & 0xFF;
//                 while (checksum>>=8);

//         for(j = 0; j < 8; j += 1){
//             wispData.readBufPtr[j] = ((* (uint64_t *) checksum >> 8))  & 0xFF;
//           }
        wispData.epcBuf[2] = (wispData.blockWriteBufPtr[2]  >> 8) & 0xFF;
        wispData.epcBuf[3] = (wispData.blockWriteBufPtr[2]);
        wispData.epcBuf[4] = (checksum >> 56) & 0xFF;
        wispData.epcBuf[5] = (checksum >> 48) & 0xFF;
        wispData.epcBuf[6] = (checksum >> 40)  & 0xFF;
        wispData.epcBuf[7] = (checksum >> 32)  & 0xFF;
        wispData.epcBuf[8] = (checksum >> 24)  & 0xFF;        // Unused data field
        wispData.epcBuf[9] = (checksum >> 16)  & 0xFF;        // Unused data field
        wispData.epcBuf[10] = (checksum >> 8)  & 0xFF;      // Unused data field
        wispData.epcBuf[11] = checksum  & 0xFF;        // Checksum

    }else {
        uint8_t size            = (wispData.blockWriteBufPtr[0])  & 0xFF;
        uint8_t checksum        = (wispData.blockWriteBufPtr[word_count]) & 0xFF;
        uint8_t calcsum         = 0x00;
        uint8_t offset          = 0x00;

        // Calculate checksum.
        for (offset = word_count; offset > 0; offset--) {
            calcsum += (wispData.blockWriteBufPtr[offset-1] >> 8) & 0xff;
            calcsum += wispData.blockWriteBufPtr[offset-1] & 0xff;
        }

        if(checksum == calcsum){
            checksum = word_count + size + ((address >> 8) & 0xFF) + (address & 0xFF);
            for(offset = 0x00; offset < size; offset+= 0x02){
                (* (uint16_t *) (address + offset)) = wispData.blockWriteBufPtr[2 + (offset >> 1)];
                checksum += (* (uint8_t *) (address + offset));
                checksum += (* (uint8_t *) (address + offset + 0x01));
            }
            wispData.epcBuf[11] = 0x00;
        }else{
            wispData.epcBuf[11] = 0xFF;
        }
    }


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
  wispData.epcBuf[0] = 0x16;            // Tag ID
  wispData.epcBuf[1] = 0x89;            // Tag ID
  wispData.epcBuf[2] = 0x93;            // Tag ID
  wispData.epcBuf[3] = 0x80;            // Tag ID
  wispData.epcBuf[4] = 0x00;            // Unused data field
  wispData.epcBuf[5] = 0x00;            // Unused data field
  wispData.epcBuf[6] = 0x00;            // Unused data field
  wispData.epcBuf[7] = 0x00;        // Unused data field
  wispData.epcBuf[8] = 0x00;        // Unused data field
  wispData.epcBuf[9] = 0x00;        // Unused data field
  wispData.epcBuf[10] = 0x00;      // Unused data field
  wispData.epcBuf[11] = 0x00;        // Checksum
//  wispData.epcBuf[10] = *((uint8_t*)INFO_WISP_TAGID+1); // WISP ID MSB: Pull from INFO seg
//  wispData.epcBuf[11] = *((uint8_t*)INFO_WISP_TAGID); // WISP ID LSB: Pull from INFO seg

  // Talk to the RFID reader.

  while (FOREVER) {
    WISP_doRFID();
  }
}
