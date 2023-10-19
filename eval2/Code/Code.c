#include "xparameters.h"
#include "xgpio.h"
#include "xtmrctr.h"
#include <stdint.h>

int main(void){
	XGpio leds;
    XGpio_Initialize(&leds ,XPAR_LEDS_8BIT_DEVICE_ID);
	XTmrCtr timer;
    XTmrCtr_Initialize(&timer,XPAR_XPS_TIMER_0_DEVICE_ID);
    XTmrCtr_SetOptions(&timer,0,XTC_CAPTURE_MODE_OPTION);
    XTmrCtr_Enable(&timer,0);
    XTmrCtr_Start(&timer,0);

    while(1){
        while(XTmrCtr_GetValue(&timer,0) < 50000000){
            XGpio_DiscreteWrite(&leds, 1, 0xFFFF);
        }
        while(XTmrCtr_GetValue(&timer,0) < 100000000){
                XGpio_DiscreteWrite(&leds, 1, 0X0000);
        }
        XTmrCtr_Reset(&timer,0);
    }

    return 0;
}