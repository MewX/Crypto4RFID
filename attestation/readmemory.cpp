/*
 * readmemory.cpp
 *
 *  Created on: 2017Äê8ÔÂ31ÈÕ
 *      Author: kiven
 */

//#include <readmemory.h>
//#include <msp430.h>
//unsigned int storedVlvOffPosition;
//unsigned int storedVlvOnPosition;
//
//void read_segment(int address)
//{
//    int *Flash_ptr;                           // Flash pointer
//    Flash_ptr = (int *)address;               // Initialize flash pointer
//    storedVlvOffPosition = *Flash_ptr;
//    Flash_ptr = Flash_ptr + 2;                // Increment the flash pointer to next integer
//    storedVlvOnPosition = *Flash_ptr;
//}

/*
 * main.c
 */
//int main(void) {
//    WDTCTL = WDTPW | WDTHOLD;   // stop watchdog timer
//
//    unsigned long *addr = (unsigned long *)0xFF80;  // Address of the flash memory segment starting
//    unsigned long *addr2 = (unsigned long *)0x4400; //Address of the flash memory segment starting
//    unsigned char infMem[256];
//    unsigned char infMem2[256];
//    unsigned int i;
////    unsigned char j;
//    for(i = 0; i < 128; i++)
//    {
//        infMem[i] = *addr;
//        addr = addr + 2;
//    }
//
//    for(i = 0; i < 64512; i++)
//    {
//        infMem2[i] = *addr2;
//        addr2 = addr2 + 2;
//    }
//
////    read_segment(*addr);
////    i = *addr;
////    j = *addr2;
//
//    return 0;
//}
