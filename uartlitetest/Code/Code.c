#include <stdio.h>
#include <string.h>
#include "xparameters.h"
#include "xuartlite.h"
#include "xgpio.h"

int main(void){
    XGpio leds;
    XGpio_Initialize(&leds,XPAR_LEDS_8BIT_DEVICE_ID);
    XUartLite uart;
    XUartLite_Initialize(&uart, XPAR_RS232_DCE_DEVICE_ID);

    char data[] = "Hello World\n";
    int len = sizeof(data);

    XGpio_DiscreteWrite(&leds,1,0xFF);
    while(1){
        if(XUartLite_IsSending(&uart) == FALSE){
            XUartLite_Send(&uart, data, len);
        }
    }

    return 0;
}