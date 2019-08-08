/* 
 
        The Multi Chroatic Stimulator is an open hardware LED stimulator that can individually
control up to 24 LEDs.

This Arduino file is designed to be uploaded on an Adafruit_HUZZAH ESP32 Feather or an Arduino Nano
Source : https://github.com/BadenLab/Multi_Chromatic_Stimulator

The script relies on an incoming blanking signal, generated by a TTL, which updates the LEDs.
The stimulus speed has to be adjusted to the scan logic (scanning mirrors speed that corresponds to 
the blanking signal generated by the TTL): 1kHz/1ms, 500Hz/2ms, etc.
A trigger signal is generated at the begining of the stimulus and then every 1.0 seconds.

Library "Adafruit TLC5947" needs to be installed.
 
The default script is parametered for 4 LEDs (connected to pin 0 to 3), and their respective proxy LEDs 
(connected to pin 4 to 7)


This project is Open Source licensed, released under CERN OHL v1.2

by  M.J.Y. Zimmermann, 2019.02.05
Baden Lab, CRPC, School of Life Sciences, University of Sussex, United Kingdom
*/


/* ------------------------------------------------------------------------------------
                           Stimulus parameters
-------------------------------------------------------------------------------------*/                                                                                             

int           nLoops           = 5;     //  Number of repeats of the arrays (i.e. Loops)
const int     nArrayEntries    = 405;      //  Number of entries in the arrays, including preadaption at position 0
const int     Scan_Logic      =  1;      //  Scanning logic (1 for 1ms scans, 2 for 2ms scans, etc.)



// // // // // // // // // // // // // // // // // // // // // // // // // // //
// // // // // // // // // STIMULUS SEQUENCE START // // // // // // // // // //
// // // // // // // // // // // // // // // // // // // // // // // // // // // 

// The array_LED# values are expressed in percentage and should only be expressed from 0-100
const int8_t array_LED1[] PROGMEM = {
0,
0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
};
const int8_t array_LED2[] PROGMEM = {    
0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
};
const int8_t array_LED3[] PROGMEM = {    
0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
};
const int8_t array_LED4[] PROGMEM = {
0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100
};

// The array_Time values are expressed in milliseconds
const int16_t array_Time[] PROGMEM = {      
5000,
1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,
1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,
1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,
1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000,1000
};

// // // // // // // // // // // // // // // // // // // // // // // // // // //
// // // // // // //  STIMULUS SEQUENCE END  // // // // // // // // // // // //
// // // // // // // // // // // // // // // // // // // // // // // // // // //


/* ------------------------------------------------------------------------------------
                           Microcontroller Board Selection
-------------------------------------------------------------------------------------*/

      //#define Arduino_Nano
      #define Adafruit_ESP32

      
/* ------------------------------------------------------------------------------------
                    Internal Definitions (Change at your own risk)
-------------------------------------------------------------------------------------*/

#include "LED_Values.h"                     // Include LED Values defined in the second tab
#include <SPI.h>                            // Include the arduino serial port interface library
#include "Adafruit_TLC5947.h"               // Include the Adafruit TLC5947 libvrary. For better result one may change the number of channel defined in the Adafruit_TLC5947.cpp library


#ifdef Arduino_Nano
    #define   data            4             // SPI connection, DIN connected to pin D4
    #define   clock           5             // SPI connection, CLK connected to pin D5
    #define   latch           6             // SPI connection, LAT connected to pin D6
    //#define   oe              2           // Optional feature to prevent LED to light up when powering up the TLC board connected to pin D2
    const int      pSyncOut      =   A0;    // Trigger channel must be connected to pin A0
    const int      pBlank        =   3;     // Blanking signal channel must be connected to pin D3
#endif

#ifdef Adafruit_ESP32
    #define   data           18             // SPI connection, DIN connected to pin MOSI/18
    #define   clock           5             // SPI connection, CLK connected to pin SCK/5
    #define   latch          21             // SPI connection, LAT connected to pin 21
    //#define   oe            25            // Optional feature to prevent LED to light up when powering up the TLC board connected to pin A1/DAC1
    const int      pSyncOut      =   26;    // Trigger channel must be connected to pin A0/DAC2
    const int      pBlank        =   36;    // Blanking signal channel must be connected to pin A4/36
#endif

    Adafruit_TLC5947 tlc = Adafruit_TLC5947(1, clock, data, latch);

    

/* Global variables */  
char           sCmd;                        // Serial monitor 
int            i;                           // iteration loop factor
word           BaudRate      = 115200;      // Baud Rate
int            led1          = 0;           // Define 1st Channel       
int            led2          = 1;           // Define 2nd Channel
int            led3          = 2;           // Define 3rd Channel
int            led4          = 3;           // Define 4th Channel
int            proxy_led1    = 4;           // Define 1st Channel marker        
int            proxy_led2    = 5;           // Define 2nd Channel marker
int            proxy_led3    = 6;           // Define 3rd Channel marker
int            proxy_led4    = 7;           // Define 4th Channel marker
  
/* Global LED variables */
volatile word   stled1;                     // First LED value   
volatile word   stled2;                     // Second LED value
volatile word   stled3;                     // Third LED value
volatile word   stled4;                     // Fourth LED value
word            array1[nArrayEntries];      // First LED Array
word            array2[nArrayEntries];      // Second LED Array
word            array3[nArrayEntries];      // Third LED Array
word            array4[nArrayEntries];      // Fourth LED Array

/* Timing variables */
volatile word  pulse;                                             // Pulse number
word           Time[nArrayEntries];                               // Time Array
float          x_Logic            =   1.0/Scan_Logic;             // Factor applied to the timing according to the scanning logic

/* Trigger variables */
int     Trigger_Duration            =   25;                       // Length of the Trigger signal in ms
int     TriggerCounter_Duration     =   1000;                     // Lenght of the Trigger loop in ms
word    Trigger_dur        =   Trigger_Duration * x_Logic;        // Trigger signal duration adjusted
word    TriggerCounter_dur =   TriggerCounter_Duration * x_Logic; // Trigger loop duration adjusted  
    
/* Reset Parameters */
volatile word  iLoop                = 0;       // Actual loop number = iLoop + 1
volatile word  PulseCount           = 0;       // Count the number of pulses delivered by the blanking signal
volatile int   PulseCount_Trigger   = 0;       // Count the number of pulses generated for the trigger channel (A0 pin)
volatile int   ArrayPosition        = 0;       // Position array within the current loop

/* Flags */
bool   SettingFlag   =  true;
bool   BlankingFlag  =  true;


/* -----------------------------------------------------------------------------------
                                 Internal methods
 ------------------------------------------------------------------------------------*/

void setup(){

// Initialise the serial communication with PC
  Serial.begin(BaudRate);

// Initialise the Adafruit TLC driver 
  tlc.begin();
  tlc.write();  

// Set pins
  pinMode(pSyncOut, OUTPUT);  
  digitalWrite(pSyncOut, LOW);  
  pinMode(pBlank, INPUT);
  digitalWrite(pBlank, HIGH);
}

/* ----------------------------------------------------------------------------------*/
/* -------------------------------- Turn all LED off --------------------------------*/

void Play0(){
      tlc.setPWM(led1,0);                                // Set First LED to 0
      tlc.setPWM(led2,0);                                // Set Second LED to 0
      tlc.setPWM(led3,0);                                // Set Third LED to 0 
      tlc.setPWM(led4,0);                                // Set Fourth LED to 0
      tlc.setPWM(proxy_led1,0);                          // Set First proxy LED to 0
      tlc.setPWM(proxy_led2,0);                          // Set Second proxy LED to 0
      tlc.setPWM(proxy_led3,0);                          // Set Third proxy LED to 0 
      tlc.setPWM(proxy_led4,0);                          // Set Fourth proxy LED to 0
      tlc.write();   
      Serial.println("-> All LEDs off"); 
      
      PulseCount = 0;                                    // Reset Pulse counter
      PulseCount_Trigger = 0;                            // Reset Trigger pulse counter
      ArrayPosition = 0;                                 // Reset Array counter
      
      SettingFlag = true;                                // Return to initial condition
      BlankingFlag = true;                               // Return to initial condition
}



/* ----------------------------------------------------------------------------------*/
/* ------------------------------ Play Stimulus Array -------------------------------*/

void PlayArrays() {

/* Defining timing according to the current array position */
    pulse = Time[ArrayPosition];
    
/* Trigger ------------------------------------------------------------------------*/

    /* Keep Trigger on for the trigger duration */
    if(PulseCount_Trigger <= Trigger_dur && ArrayPosition > 0){
        PulseCount_Trigger += 1;                         // Trigger Pulse Counter, move to the next pulse
    } 
    /* Keep Trigger off for the rest of the trigger duration */
    if(PulseCount_Trigger > Trigger_dur && ArrayPosition > 0){
        digitalWrite(pSyncOut, LOW);                     // Turn Trigger off
        PulseCount_Trigger += 1;                         // Trigger Pulse Counter, move to the next pulse
    }

    /* Once Trigger duration is reached, reset counter and turn trigger on */
    if(PulseCount_Trigger == TriggerCounter_dur+1 && ArrayPosition > 0){
        PulseCount_Trigger = 0;                          // Reset Trigger pulse counter
        digitalWrite(pSyncOut, HIGH);                    // Turn Trigger on
    }

/* Moving Through the stimulus ----------------------------------------------------*/

    if(PulseCount == pulse){                             // When the pulse counter reaches the current position array duration ...
        
        if(ArrayPosition == 0){                                // Only at the very end of pre-adaptation ...
            Serial.println("   Loop 1");                       // ... Print the first loop
            digitalWrite(pSyncOut, HIGH);                      // ... Turn Trigger on
        }

        ArrayPosition += 1;                              // ... Move to the next position array
        PulseCount = 0;                                  // ... Reset the pulse counter
        
        

        if(0 < ArrayPosition <= nArrayEntries){
           /* Defining LED values according to the current array position */
               stled1      =   array1[ArrayPosition];     // Set First LED value according to its position within the array
               stled2      =   array2[ArrayPosition];     // Set Second LED value according to its position within the array
               stled3      =   array3[ArrayPosition];     // Set Third LED value according to its position within the array
               stled4      =   array4[ArrayPosition];     // Set Fourth LED value according to its position within the array  
        
           /* Feeding LED values according to the current position array */    
              tlc.setPWM(led1,stled1);                    // Update First LED value according to its position within the array
              tlc.setPWM(led2,stled2);                    // Update Second LED value according to its position within the array
              tlc.setPWM(led3,stled3);                    // Update Third LED value according to its position within the array
              tlc.setPWM(led4,stled4);                    // Update Fourt LED value according to its position within the array
              tlc.setPWM(proxy_led1,stled1);              // Update First LED marker value according to its position within the array
              tlc.setPWM(proxy_led2,stled2);              // Update Second LED marker value according to its position within the array
              tlc.setPWM(proxy_led3,stled3);              // Update Third LED marker value according to its position within the array
              tlc.setPWM(proxy_led4,stled4);              // Update Fourth LED marker value according to its position within the array
              tlc.write();
        }

        if(ArrayPosition == nArrayEntries){
            ArrayPosition = 1;                          // Reset the position array and skip the preadaptation (ArrayPosition = 0)
               
            tlc.setPWM(led1,array1[1]);                 // Update First LED to its firs array position value
            tlc.setPWM(led2,array2[1]);                 // Update Second LED to its firs array position value
            tlc.setPWM(led3,array3[1]);                 // Update Third LED to its firs array position value
            tlc.setPWM(led4,array4[1]);                 // Update Fourth LED to its firs array position value
            tlc.setPWM(proxy_led1,array1[1]);           // Update First LED marker to its firs array position value
            tlc.setPWM(proxy_led2,array2[1]);           // Update Second LED marker to its firs array position value
            tlc.setPWM(proxy_led3,array3[1]);           // Update Third LED marker to its firs array position value
            tlc.setPWM(proxy_led4,array4[1]);           // Update Fourth LED marker to its firs array position value
            tlc.write();       

            iLoop += 1;                                 // Move to the next loop      
            if(iLoop < nLoops){                         // If Stimulus hasn't finish its last loop...
                Serial.print("   Loop ");               // ... Print new loop value
                Serial.println(iLoop+1);  
            } 
        }
    }

    if(iLoop == nLoops){                                // When Array has completed its last loop 
      tlc.setPWM(led1,0);                               // Set First LED to 0
      tlc.setPWM(led2,0);                               // Set Second LED to 0
      tlc.setPWM(led3,0);                               // Set Third LED to 0 
      tlc.setPWM(led4,0);                               // Set Fourth LED to 0
      tlc.setPWM(proxy_led1,0);                         // Set First LED marker to 0
      tlc.setPWM(proxy_led2,0);                         // Set Second LED marker to 0
      tlc.setPWM(proxy_led3,0);                         // Set Third LED marker to 0 
      tlc.setPWM(proxy_led4,0);                         // Set Fourth LED marker to 0
      tlc.write();   
      
      PulseCount = 0;                                   // Reset Pulse counter
      PulseCount_Trigger = 0;                           // Reset Trigger pulse counter
      ArrayPosition = 0;                                // Reset Array counter
      digitalWrite(pSyncOut, LOW);                      // Turn Trigger off
  
      Serial.println(" ...Done");                       // End of stimulus print 
      Serial.println("-> All LEDs off");
      
      SettingFlag = true;                               // Return to initial condition
      BlankingFlag = true;                              // Return to initial condition
    }
}

/* ----------------------------------------------------------------------------------*/
/* ----------------------------------- Main Loop ------------------------------------*/

void loop(){

// Check if command received from PC
  if(Serial.available()) {
    sCmd = Serial.read();

// Execute command
    switch (sCmd) {

      case 'a':                                         // Array Stimulus at "Full power"

          if(SettingFlag==true){
            digitalWrite(pSyncOut,LOW);
            Serial.println("Playing Arrays, LEDs set at maximum intensities (press '0' to abort)");  
            Serial.print(nLoops);
            Serial.println(" Loops");
            PulseCount = 0;                             // Reset pulse counter
            PulseCount_Trigger = 0;                     // Reset trigger pulse counter
            ArrayPosition = 0;                          // Reset position array
            iLoop = 0;                                  // Reset loop counter 
        
            for(i=0; i<nArrayEntries; i++){             // Fetch LED Values from the attached library
              array1[i] = array_LED1[i] * max1_LED1/100;
              array2[i] = array_LED2[i] * max1_LED2/100;
              array3[i] = array_LED3[i] * max1_LED3/100;
              array4[i] = array_LED4[i] * max1_LED4/100;
              Time[i]   = array_Time[i] / Scan_Logic;
            }        
          
            Serial.println("Preadapt...");              // Set all LEDs to their preadaptation value
            tlc.setPWM(led1,array_LED1[0]);
            tlc.setPWM(led2,array_LED2[0]);
            tlc.setPWM(led3,array_LED3[0]);
            tlc.setPWM(led4,array_LED4[0]);
            tlc.setPWM(proxy_led1,array_LED1[0]);
            tlc.setPWM(proxy_led2,array_LED2[0]);
            tlc.setPWM(proxy_led3,array_LED3[0]);
            tlc.setPWM(proxy_led4,array_LED4[0]);
            tlc.write();
          
            SettingFlag = false;
          }
          
         while (iLoop<nLoops){
          
            while(digitalRead(pBlank)==LOW){
                if(BlankingFlag==true){
                    PlayArrays();
                    PulseCount += 1;
                    BlankingFlag = false;          
                }
            }
            
            BlankingFlag = true;

            // Option to interrupt // MAY BE TOO SLOW
            if(Serial.available()) {
                sCmd = Serial.read(); 
                switch (sCmd) {
                    case '0':
                    Serial.println("...aborted!");
                    Play0();
                    return;
                }
            }
        
        }
      break;


      case 'b':                                         // Array Stimulus at "Nat Stat"

          if(SettingFlag==true){
            digitalWrite(pSyncOut,LOW);
            Serial.println("Playing Arrays, LEDs set at minimum intensities (press '0' to abort)");  
            Serial.print(nLoops);
            Serial.println(" Loops");
            PulseCount = 0;                             // Reset pulse counter
            PulseCount_Trigger = 0;                     // Reset trigger pulse counter
            ArrayPosition = 0;                          // Reset position array
            iLoop = 0;                                  // Reset loop counter 
        
            for(i=0; i<nArrayEntries; i++){             // Fetch LED Values from the attached library 
                array1[i] = array_LED1[i] * max2_LED1/100;
                array2[i] = array_LED2[i] * max2_LED2/100;
                array3[i] = array_LED3[i] * max2_LED3/100;
                array4[i] = array_LED4[i] * max2_LED4/100;
                Time[i]   = array_Time[i] / Scan_Logic;
            }        
          
            Serial.println("Preadapt...");              // Set all LEDs to their preadaptation value
            tlc.setPWM(led1,array_LED1[0]);
            tlc.setPWM(led2,array_LED2[0]);
            tlc.setPWM(led3,array_LED3[0]);
            tlc.setPWM(led4,array_LED4[0]);
            tlc.setPWM(proxy_led1,array_LED1[0]);
            tlc.setPWM(proxy_led2,array_LED2[0]);
            tlc.setPWM(proxy_led3,array_LED3[0]);
            tlc.setPWM(proxy_led4,array_LED4[0]);
            tlc.write();
          
            SettingFlag = false;
          }
          
         while (iLoop<nLoops){
          
            while(digitalRead(pBlank)==LOW){
                if(BlankingFlag==true){
                    PlayArrays();
                    PulseCount += 1;
                    BlankingFlag = false;          
                }
            }
            
            BlankingFlag = true;

            // Option to interrupt // MAY BE TOO SLOW
            if(Serial.available()) {
                sCmd = Serial.read(); 
                switch (sCmd) {
                    case '0':
                    Serial.println("...aborted!");
                    Play0();
                    return;
                }
            }
        
        }
      break;


      case '0':
        // All LEDs off
        Play0();                                        // All LED to 0
        digitalWrite(pSyncOut,LOW);                  
      break;

  
      case '+':
        // ALL LEDs at max value
        tlc.setPWM(led1, max1_LED1);
        tlc.setPWM(led2, max1_LED2);
        tlc.setPWM(led3, max1_LED3);
        tlc.setPWM(led4, max1_LED4);
        tlc.setPWM(proxy_led1, max1_LED1);
        tlc.setPWM(proxy_led2, max1_LED2);
        tlc.setPWM(proxy_led3, max1_LED3);
        tlc.setPWM(proxy_led4, max1_LED4);
        tlc.write();
        Serial.println("-> First LED to maximum power");                                        
        Serial.println("-> Second LED to maximum power");                                        
        Serial.println("-> Third LED to maximum power");                                        
        Serial.println("-> Fourth LED to maximum power");                                                                        
      break;     

      case '-':
        // ALL LEDs at min value
        tlc.setPWM(led1, max2_LED1);
        tlc.setPWM(led2, max2_LED2);
        tlc.setPWM(led3, max2_LED3);
        tlc.setPWM(led4, max2_LED4);
        tlc.setPWM(proxy_led1, max2_LED1);
        tlc.setPWM(proxy_led2, max2_LED2);
        tlc.setPWM(proxy_led3, max2_LED3);
        tlc.setPWM(proxy_led4, max2_LED4);
        tlc.write();
        Serial.println("-> First LED to minimum power");                                        
        Serial.println("-> Second LED to minimum power");                                        
        Serial.println("-> Third LED to minimum power");                                        
        Serial.println("-> Fourth LED to minimum power");                                                                      
      break;  

      case '1':
        // First LEDs at max value
        tlc.setPWM(led1, max1_LED1);
        tlc.setPWM(proxy_led1, max1_LED1);
        tlc.write();
        Serial.println("-> First LED to full power");                                                                                                              
      break; 

      case '2':
        // First LEDs at minimum value
        tlc.setPWM(led1, max2_LED1);
        tlc.setPWM(proxy_led1, max2_LED1);
        tlc.write();
        Serial.println("-> First LED to minimum power");                                                                                                              
      break; 

      case '3':
        // Second LEDs at max value
        tlc.setPWM(led2, max1_LED2);
        tlc.setPWM(proxy_led2, max1_LED2);
        tlc.write();
        Serial.println("-> Second LED to full power");                                                                                                              
      break; 

      case '4':
        // Second LEDs at minimum value
        tlc.setPWM(led2, max2_LED2);
        tlc.setPWM(proxy_led2, max2_LED2);
        tlc.write();
        Serial.println("-> Second LED to minimum power");                                                                                                              
      break; 

      case '5':
        // Third LEDs at max value
        tlc.setPWM(led3, max1_LED3);
        tlc.setPWM(proxy_led3, max1_LED3);
        tlc.write();
        Serial.println("-> Third LED to full power");                                                                                                              
      break; 

      case '6':
        // Third LEDs at minimum value
        tlc.setPWM(led3, max2_LED3);
        tlc.setPWM(proxy_led3, max2_LED3);
        tlc.write();
        Serial.println("-> Third LED to minimum power");                                                                                                              
      break; 

      case '7':
        // Fourth LEDs at max value
        tlc.setPWM(led4, max1_LED4);
        tlc.setPWM(proxy_led4, max1_LED4);
        tlc.write();
        Serial.println("-> Fourth LED to full power");                                                                                                              
      break; 

      case '8':
        // Fourth LEDs at minimum value
        tlc.setPWM(led4, max2_LED4);
        tlc.setPWM(proxy_led4, max2_LED4);
        tlc.write();
        Serial.println("-> UV LED to minimum power");                                                                                                              
      break;
   
    }
  
  } 
  
}
