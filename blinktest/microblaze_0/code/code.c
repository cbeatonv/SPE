#include "xparameters.h"
#include "xgpio.h"
#include <stdint.h>

int main(void){

    XGpio leds;
    XGpio_Initialize(&leds ,XPAR_LEDS_8BIT_DEVICE_ID);
	 
	uint32_t i;

    while(1){
        
        for (i = 0; i < 1000000; i++)
        {
            XGpio_DiscreteWrite(&leds, 1, 0xFFFF);
        }
		  for (i = 0; i < 1000000; i++)
        {
            XGpio_DiscreteWrite(&leds, 1, 0x0000);
        }
    }

    return 0;
}