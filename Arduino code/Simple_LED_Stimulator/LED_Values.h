/* -----------------------------------------------------------------------------------------------------------------------
 LED maximum values need to be defined here. TLC5947 has 12bit PWM channels, meaning the LED values range from 0 to 4095.

 Here we defined two maximum values: maxLED and maxLEDNat, respectively called in the serial monitor by "a" and "b".
 Ideally, one would set up maxLED values to equalise their brithness amonsgt them by the us of a power-meter.
----------------------------------------------------------------------------------------------------------------------- */



const  int  max1_LED1            = 4095;  // First LED maximum intensity 1
const  int  max2_LED1            = 2000;  // First LED maximum intensity 2

const  int  max1_LED2            = 4095;  // Second LED maximum intensity 1
const  int  max2_LED2            = 2000;  // Second LED maximum intensity 2

const  int  max1_LED3            = 4095;  // Third LED maximum intensity 1
const  int  max2_LED3            = 2000;  // Third LED maximum intensity 2

const  int  max1_LED4            = 4095;  // Fourth LED maximum intensity 1
const  int  max2_LED4            = 2000;  // Fourth LED maximum intensity 2
