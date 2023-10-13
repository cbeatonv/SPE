#include "xparameters.h"
#include "xgpio.h"
#include "xuartlite.h"
#include <stdint.h>
#include <stdio.h>
#include <stdbool.h>


int main(void)
{
    XGpio leds, switches;
    XUartLite uart;

    int var, var1;

    var1 = 0;

    XUartLite_Initialize(&uart, XPAR_RS232_DCE_DEVICE_ID);
    XGpio_Initialize(&leds,XPAR_LEDS_8BIT_DEVICE_ID);
    XGpio_Initialize(&switches,XPAR_DIP_SWITCHES_4BIT_DEVICE_ID);

    while (true)
    {
        var = XGpio_DiscreteRead(&switches,1);
        if(var1 != var){
            var1 = var;
            char data = (char)var1;
            XGpio_DiscreteWrite(&leds,1,var);
            if(XUartLite_IsSending(&uart) == FALSE){
                XUartLite_Send(&uart,&data,1);
            }
        }
    }
    
    return 0;
}