﻿<p align="right"><img src="https://github.com/BadenLab/Zebrafish-visual-space-model/blob/master/Images/Logo.png" width="300"/>
<h1 align="center">Instruction Manual</h1></p>

***

## Overview

<img align="right" width="600" height="300" src="https://github.com/BadenLab/LED-Zappelin/blob/master/Images/Stimulator_Board.png">

<p align="justify">This document contains detailed assembly instructions, a software guideline to customize stimuli, and includes a parts list.</p>

 The Arduino code and 3D printing files (SCAD and STL) can be downloaded [here](https://github.com/BadenLab/LED-Zappelin/tree/master/3D%20Designs), and further modified to fit customise purposes. The aim of this device is to finely control LEDs used in combination with a 2-photon microscope.

The device consists of a custom-designed PCB, an [ESP32 development board](https://learn.adafruit.com/adafruit-huzzah32-esp32-feather) (or an Arduino Nano if the stimulator does not need to be combined with a 2 photon microscope), a [LED driver](https://learn.adafruit.com/tlc5947-tlc59711-pwm-led-driver-breakout/overview) and various off-the-shelf components.

***

- [Assembling the Stimulator](#Assembling-the-Stimulator)
- [Programming the Stimulator](#Programming-the-ESP32)
- [Operating the Stimulator](#Operating-the-Stimulator)
- [Calibrating the Stimulator](#Calibrating-the-Stimulator)

***

## Assembling the stimulator

<img align="right" width="350" height="225" src="https://github.com/BadenLab/LED-Zappelin/blob/master/Images/Circuit%20Drawing.png">

<p align="center"><h4 align="left">1 – Obtaining the custom-designed PCB</h4></p>

From the GitHub repository, one can find the [gerber.zip folder](https://github.com/BadenLab/LED-Zappelin/tree/master/PCB/Stimulator) needed to order the PCB to any manufacturer company (i.e. https://jlcpcb.com).

Ordering a minimum of five units should not cost more than £10. Gerber files were designed with [KiCad 5.0](http://kicad.org/).


Schematics and PCB footprint can be downloaded and modified from the same repository if need be.


****

<p align="center"><h4 align="left">2 – Soldering the custom-designed PCB</h4></p>
<img align="left" width="375" height="225" src="https://github.com/BadenLab/LED-Zappelin/blob/master/Images/PCB_Board.png">

<p align="justify">The board is self-explanatory. On the left, two options are available, one for the Arduino (close rows) the other for the ESP (spread rows). There is no need to solder more JST pins that the number of LED required for the desired stimulator.

<p align="justify">The jumper on the top (Signal Inverter) allows the inversion of the TTL "Blanking" signals. For ScanImage users, the jumper should be placed at the upper position.

<p align="justify">The jumper at the bottom of the board (Voltage Divider) allows to tune down the voltage from 5 to 3.3V if the ESP is used instead of an Arduino. ESP32 unlike Arduino Nano, works on a 3.3V logic; no higher tension should be sent to this board. Since most TTL deliver 5V pulses, we selected a 220/470Ω divider to bring a 5V blanking signal into a 3.3V input. Depending on the blanking signal generator used, this divider can be modified to fit one’s personal design or bypassed by only bridging the 220Ω resistor.

</br>
</br>

<img align="right" width="500" height="200" src="https://github.com/BadenLab/LED-Zappelin/blob/master/Images/reference%20resistor%20vs%20output%20current.png">

<p align="justify">The Adafruit TLC5947 LED driver is a constant current driver configured by default to set the current level at 15mA per channel, which is virtually safe for any LED. However, one can operate at different current by replacing the on-board reference resistor with a through hole resistor. The driver is capable to deliver up to 30mA, the graph below shows the relationship between resistance and output current. </p>



****

<p align="center"><h4 align="left">3 – Mounting the potentiometer</h4></p>
<img align="right" width="250" src="https://github.com/BadenLab/LED-Zappelin/blob/master/Images/Fig4.png">

In order to finely adjust each LED power, we added multiple-turn trimmer potentiometers to our design. A simple solution is to manufacture the appropriate PCB board (We provide multiple options on the [GitHub repository](https://github.com/BadenLab/LED-Zappelin/tree/master/PCB/Potentiometer%20Mounts)).

<p align="justify">Otherwise, one can make its own little PCB by using a solderable board.
Each potentiometer connects its ClockWise (pin 3) to the LED (+) stimulator JST pin; and its Base (pin 2) to the LED (+) leg. The LED (-) stimulator JST pin connects the LED (-) leg directly.</p>

***

<p align="center"><h4 align="left">4 – Printing the Stimulator box</h4></p>

[STL files](https://github.com/BadenLab/LED-Zappelin/tree/master/3D%20Designs/Stimulator/STL%20Files) can be found on the GitHub repository and print directly if the user wishes to go for the default design (4 stimulation LEDs + 4 proxy LEDs) and [BoM](https://github.com/BadenLab/LED-Zappelin/blob/master/Bills%20of%20Materials/BOM%20-%20Stimulator.ods).

However, [SCAD files](https://github.com/BadenLab/LED-Zappelin/blob/master/3D%20Designs/Stimulator/MultiChromatic%20Stimulator%20v2.1.scad) are also available and easily adjustable for personalised design.

We used [OpenSCAD](www.openscad.com) to design the stimulator box. The tolerance of the printer can be adjusted in the “USER Parameters” section of the script (tol =0.1; by default, this value is used for Prusa MK3 and Ultimaker 2). Each component can be displayed/design individually in the “Switches” section. Variables such as LED number (4 by default) and the potentiometer board dimensions can be adjusted in the “Component Parameters” section.

<img src="https://github.com/BadenLab/LED-Zappelin/blob/master/Images/Fig5.png">

<h5 align="justify">a) Rendering of the stimulator box 3D files set here by default for 4 LED channels and 4 proxy LEDs. b) Rendering of the fully mounted stimulator with all PCBs and components tightly fitting their respective space. </h5>

<p align="justify">The PCB is screwed to the “Bottom” part of the box by using M3 screws and nuts. The potentiometer board adjusts itself with the “Back” part of the box, and the trimmers should adapt to their respective holes exactly.
All part should fit tightly together and are maintained together by 4 M3*50mm socket screws. </p>


***

<p align="center"><h4 align="left">5 – Adjusting the proxy LED</h4></p>
<p align="justify">The proxy LED are markers for the experimenter to have a ready visualisation of the stimulus being displayed under the objective. If this option is selected, 3mm LEDs are to be mounted at the back of the LED holder using 3mm LED mounts.

<p align="justify">Finally, any translucid material could be placed in the LED holder slot in order to diffuse the proxy LED light (In our example, we used a piece of thin Teflon)</p>

***

<p align="center"><h4 align="left">6 – Mounting the stimulating LEDs</h4></p>
<p align="justify">Each stimulating LED must be connected to its respective channel, taking note of their polarity (long LED leg should be connected to the positive pin).

<p align="justify">For our visual stimulation setup, we combined all LED light sources into one beam which is projected through the objective to our model retina. We therefore constructed an optical cage system using a mixture of Thorlabs parts and 3D-printed objects to hold all filters and dichroic mirrors.

<p align="justify">For the optogenetics experiment we 3D-designed arenas where the sample sits, surrounded by  four LEDs. </p>

<img align="center"src="https://github.com/BadenLab/LED-Zappelin/blob/master/Images/Fig6.png">
<h5 align="justify">a) SCAD files for adapting 3mm LEDs and dichroic mirrors to standard 30mm optomechanical system. b) Rendering of the LED illumination system for the visual experiment. c) For optogenetics experiment, we designed a mounting platform that holds four 3mm LEDs and can fit a RC-40HP chamber (SmartEphys, Warner Instrument).  d) Same as c) but designed to fit a small petri dish (ø 35mm) lid. </h5>

***

<p align="center"><h4 align="left">7 – Connecting the stimulator to LEDs, the microscope’s DAQ and a computer</h4></p>
<p align="justify">The stimulator can be externally powered anywhere between 5-30V via the power port. Since the TLC5947 is constant current LED driver, the voltage selection is not critical, however it should be slightly higher than the LED forward voltage (cf. LED driver datasheet). If desired, multiple LEDs can be connected to the same channel, however in this case the voltage supply must be adjusted accordingly (cf. LED driver datasheet).

<p align="justify">For the standard line-synched stimulator version with an ESP32, a line-synched 5V TTL blanking signal BNC must be fed into the stimulator from the microscope’s DAQ (if the TTL is different from 5V, this can still be accepted provided the associated resistor is changed accordingly – see soldering paragraph). Note: Since for the default ESP32 version the blanking signal is used as the external clock, the stimulator will not execute any stimuli without it. If such line-synching is not required, consult the “simple” non-synchronised version using the Arduino Nano.

<p align="justify">If required, connect the output trigger channel to the microscope’s DAQ. This signal generated by the stimulator by default sends a 3.3V pulse (if ESP32 is used, 5V for Arduino Nano) once at the start of the stimulus and then again every 1,000 ms (1 Hz exactly). The trigger signal can for example be used to time-align acquired imaging data with the stimulus in postprocessing.

<p align="justify">Finally, the board is connected to a computer via USB (micro USB for ESP32, mini USB for Arduino Nano). </p>

<img src="https://github.com/BadenLab/LED-Zappelin/blob/master/Images/Setup_schematics.png" width="1000"/>

***

## Programming the ESP32


1-	Download and install [Arduino environment](www.arduino.org) on the computer.

2-	To use the ESP32, a couple of steps are necessary
Install the latest SiLabs [CP2104 driver](https://www.silabs.com/products/development-tools/software/usb-to-uart-bridge-vcp-drivers).
Follow the installation instructions from the [Espressif repository](https://github.com/espressif/arduino-esp32/blob/master/docs/arduino-ide/boards_manager.md).

3-	Install the TLC5947 library:	Start Arduino and from the “Sketch” tab, select “Include Library” and open “ Manage Libraries”.	From the search bar enter “TLC5947”. Select and Install the library

4-	Close Arduino and open the Multi-Chromatic-Stimulator arduino file from the [Arduino Code folder](https://github.com/BadenLab/LED-Zappelin/tree/master/Arduino%20code/2-Photon_Mutli_Chromatic_Stimulator).


<p align="justify">5-	From the “Tools” tab: Select from “Boards” the “Adafruit ESP32 Feather”.	From “Upload Speed”, select 921600.	From “Flash Frequency”, select 80Hz. From “Port”, select the computer port to which the ESP is connected (if doubt, unplug, replug and observe the choices differences). If the ESP is not recognised, check the driver installation (2), then check the micro USB cable. </p>

6-	Compile and Upload the code by clicking on the arrow button on the top left.

7-	The stimulator is ready to be used.

***

## Operating the Stimulator
<p align="center"><h4 align="left">The code is organised in five distinct part:</h4></p>

  <h4>Stimulus Parameters</h4>

<p align="justify">The code is designed to iteratively loop a pre-programmed stimulus sequence after an initial one-off optional preadaptation period

<p align="justify">- The number of loops is determined by *nLoops*. The stimulus will stop after finishing the nth  loop.

<p align="justify">–	IMPORTANT,  the number of entries within the arrays must be the same and manually entered in *nArrayEntries* (including the pre-adaptation at position 1, see below).

<p align="justify">–	The *Scan_Logic* parameter corresponds to the x-mirror scan rate in ms (i.e. = 1.0 if line speed is 1 ms per line). This value must be changed if a different scan logic is used. This value defines the tempo of the entire stimulus (Each time a blanking signal is counted, the code advances by an internal time-counter of Scan_Logic in milliseconds.)

<p align="justify">–	The *array_LED#* arrays correspond to the stimulus sequence for each LED number. Here the number of arrays must be adjusted to the number of stimulating LEDs. All array positions will be read in synchrony, based on the timing array detailed below. IMPORTANT: The first entry is not part of the to-be-looped stimulus sequence, but instead defines the LED’s brightness for the preadaptation period. Note also that the first trigger output will start with the second entry (= the first entry of the stimulation sequence). The value entered at each position is the light intensity where 0 corresponds to no light and 100 to maximal light intensity. The value entered must range between 0 and 100.

<p align="justify">–	The *array_Time* array corresponds to the duration of each entry in ms; the first entry being the pre-adaptation that will only be played at the start of the stimulus, the sequence will then loop starting at the second position. </p>

<img src="https://github.com/BadenLab/LED-Zappelin/blob/master/Images/Arduino%20Code.png"/>

For example, if …

nLoops = 3;

nArrayEntries = 3;

Scan_Logic = 1.0;

Array_LED1 = {50,100,0};

Array_LED2 = {50,0,100};

Array_Time = {5000,1000,1000};

… the resultant stimulus will start with 5 seconds of both LEDs being set to 50% intensity (preadaptation) and will thereafter switch back and forth every 1 second between 100% and 0% power for the two LEDs in antiphase, for 3 repetitions.

<img src="https://github.com/BadenLab/LED-Zappelin/blob/master/Images/Fig7.png">


***

  <h4>Microcontroller Board Selection</h4>

This is where the user defines if he is using an ESP32 or an Arduino Nano

***

  <h4>Internal Definitions</h4>

This is the main definition part of the code which can be modified to:

-	Add more LEDs than the 4 main and 4 proxy defined by default. (Global variables, the LED pins correspond to the pin number on the TLC5947).

-	Adjust the Trigger duration (25 ms by default). This value corresponds to the amount of time the trigger marker will remain on in order to be detected by i.e. a DAQ.

-	Adjust the Trigger interval (1000 ms by default). Value between two successive triggers.

***

  <h4>Internal Methods</h4>

This is the main core of the code and should not be structurally changed (apart from adding more LEDs, as required).

***

  <h4>Main Loop</h4>

This is where the stimuli controls are defined. By default, when compile window is open (magnifying glass on the top right corner) and the baud rate at the bottom right of the window has be changed to 115200, a manual command will trigger a stimulus:

By default:

This is where the serial user controls are defined. By default, when the serial monitor is open (magnifying glass on the top right corner in the Arduino IDE) and the baud rate at the bottom right of the window has be changed to 115,200, a manual command followed by pressing “enter” will trigger a stimulus:
      By default:

-	When *a* is entered in the serial monitor, the stimulator will play the sequence with intensity scaled relative to the predefine “max1_LED#” powers (see below)

-	When *b* is entered, the same stimulus sequence will be played, but this time at the intensities defined by “max2_LED#” powers (see below)

-	If *0* is entered during a stimulus sequence, all LEDs will be turned off and all loop countered will be reset.

-	Further commands can easily be programmed by the user from the “Main Loop” part of the Arduino code.


It is important to note that the stimulation will only be played if a blanking signal is sent to the board.


Important to note, obviously the stimulation will only be played if a blanking signal is sent to the board.

***

## Calibrating the Stimulator

<p align="justify">Stimulating LEDs can be approximately brought into a desired intensity regime by adding a serial resistor to limit the current they receive (c.f. 5.2). They can also be further calibrated within the code:

<p align="justify">The TLC5947 is a 12-bit PWM grayscale driver, meaning that it offers up to 4,096 grey levels to adjust each LED power.

<p align="justify">On the Arduino code there is a second tab called “LED_values” which hard-codes the maximum power an LED can get. Those values range from 0 (no current) to 4095 (max current, 15 mA by default with potentiometer tuned all the way down).

<p align="justify">On the default script we defined two distinct max values (max1 & max2) that can be called individually. The purpose here is to have the opportunity to use the same stimulus sequence at two different regimes of light intensities. More can be added manually by the user. </p>

<img src="https://github.com/BadenLab/LED-Zappelin/blob/master/Images/LED%20Values.png">

<p align="justify">For the calibration, we suggest setting the max_LED# value to 4095 (full power) and use successively a spectrometer and a powermeter to adjust the LED brightness by finely turning the trimmer potentiometer at the back of the stimulator.

<p align="justify">As the LED output is linear relative to the values entered here (Fig. 3), any max_LED# value will be proportional to the LED power set up for the 4095 value. The LED value (0-100%) entered in the stimulus sequence is linearly mapped to 0-max_LED#.</p>

We also provide a calibration script in the form of an [iPyhton jupyter notebook](https://github.com/BadenLab/LED-Zappelin/blob/master/Instruction%20Manual/Stimulator%20Calibration/Stimulator_Calibration.ipynb). This script was designed to calibarte a 4 LEDs system for experiment on the zebrafish retina.

### Visual Stimulator Calibration

For the visual stimulator, we used the [ThorLabs Compact CCD Spectrometer](https://www.thorlabs.com/newgrouppage9.cfm?objectgroup_ID=3482) CCS200/M in combination with the [ThorLabs OSA software](https://www.thorlabs.com/software_pages/ViewSoftwarePage.cfm?Code=OSA).
We placed the spectrometer fiber patch cable at the sample position and played the calibration code on the stimulator. This calibration sequence plays each LED individually from 0 to 100% for 1 second and loops 5 times. This stimulus sequence is quite tedious so we encourage users to adapt it to their needs.
Recordings were made using the inbuilt trigger mode of the spectrometer (connected to the stimulator trigger output). We used an integration time of 1 second and applied the inbuilt spectrum correction in the OSA software. Data was extracted as .csv files and analysed using our [iPython analysis script](https://github.com/BadenLab/LED-Zappelin/blob/master/Instruction%20Manual/Stimulator%20Calibration/Stimulator_Calibration.ipynb).


<img align="right" width="500" height="350" src="https://github.com/BadenLab/LED-Zappelin/blob/master/Images/Notebook_01.png">

For analysis purposes, we designed an [iPython notebook](https://jupyter.readthedocs.io/en/latest/install.html).
In this script, one has to first modify the global parameters:
  - Opsin maximum absorbance: *PeakWavelength* This array contains the peak asorbance for each opsin considered. For the zebrafish, we use the value defined by [Allison et al, 2004 - Visual pigment composition in Zebrafish](https://github.com/BadenLab/LED-Zappelin/blob/master/References/Allison%202004%20-%20Visual%20pigment%20composition%20in%20zebrafish.pdf)
  - Number of LEDs to be considered
  - Figure parameters: Figure sizes, spectra range to considered, etc.

<img align="left" width="650" height="325" src="https://github.com/BadenLab/LED-Zappelin/blob/master/Instruction%20Manual/Stimulator%20Calibration/Calibration_Figures/Filtered%20Spectrometer%20Recordings.png">

.

.

The script then run a couple of slides to extract and smooth (Savitzky–Golay filter) the recording data.

From this recording, the peak wavelength of each LED is extracted and assigned to the *Peaks[ ]* array.

|                     |   Red LED  |  Green LED |  Blue LED  |   UV LED   |
| --------------------|:----------:|:----------:|:----------:|:----------:|
| Peak Wavelength (nm)|    586.9   |    487.5   |    427.9   |    372.8   |

Depending on the LEDs used or on the extra resistors that a user might want to connect in series to substantially tune down the LEDs, a powermeter shall be used to bring the LEDs to their desired max values. Here we suggest to set the potentiometers at mid-range and replace the spectrometer sensor by the powermeter's. In our case, we used a [ThorLabs Digital Handheld Optical Power](https://www.thorlabs.de/newgrouppage9.cfm?objectgroup_id=3341) coupled with a [ThorLabs Photodiode Power Sensor S130VC](https://www.thorlabs.de/thorproduct.cfm?partnumber=S130VC), 200 - 1100 nm, 50 mW. Each LED is then successively brought to their desired maximum power (here 40nW) and the powermeter configured to the LED peak wavelengths (λmax). Once this value has been reached, the *max_LED* value in the LED Values part of the Arduino code has to be decreased until a change is oberved. The max_LED value is then hard-coded and fine tuning can be achieved with the potentiometers.
At this stage, one might retake measurements with the spectrometer with this new power (in our case equalised amongst LEDs), and rerun the first part of this script to obtain more precise curves.

<p align="justify">To establish the LEDs performance we then plotted their normalised intensities (LED relative brightness) against the PWM (*array_LED#*) used in the Arduino code to drive them. A Linear fit along with the Sum of Square Error (SSE), demonstrates that the TLC5947 LED driver controls the LED in an optimal linear manner.</p>

<img align="center" width="800" height="200" src="https://github.com/BadenLab/LED-Zappelin/blob/master/Instruction%20Manual/Stimulator%20Calibration/Calibration_Figures/Normalised%20Intensity%20VS%20Forward%20Current.png">

***

We then used the absorbance spectrum fitting template for visual pigment defined by [Govardoskii et al, 2000 - In Search of Visual Pigment Template](https://github.com/BadenLab/LED-Zappelin/blob/master/References/Govardovskii%202000%20-%20In%20search%20of%20the%20visual%20pigment%20template.pdf). Using the Opsin maximal absorbance defined earlier, this nomogram template describes the predicted shape of the absorbance spectra of all visual pigment. Here we obtained the following specra for the zebrafish cone photoreceptors that we plotted along the human visible spectrum as comparison.

<img align="center" width="900" height="600" src="https://github.com/BadenLab/LED-Zappelin/blob/master/Instruction%20Manual/Stimulator%20Calibration/Calibration_Figures/Cone%20Absoprtion%20Spectra.png">

***

<p align="justify">Using the same display we plotted the LEDs spectra that we obtained from the spectrometer recordings.

<p align="justify">Then, we plotted the LED spectra along the cone opsin absorbance, and each LED’s spectral cross-section with respective target conein solid colours. Grey boxes indicate the positions of the two PMT detector bands. The Red-LED’s long-wavelength emission spectrum was chosen to limit spectral overlap with the red-fluorescence detection channel. Any loss in excitation efficiency of the red opsin was compensated for by increasing this LED’s power accordingly. </p>

<img align="center" width="900" height="600" src="https://github.com/BadenLab/LED-Zappelin/blob/master/Instruction%20Manual/Stimulator%20Calibration/Calibration_Figures/Opsin-LED%20Spectra.png">


***

With the previous spectra, we estimate the relative co-excitation of photoreceptors by the LEDs:
<img align="center" width="900" height="600" src="https://github.com/BadenLab/LED-Zappelin/blob/master/Instruction%20Manual/Stimulator%20Calibration/Calibration_Figures/LED-Opsin%20Co-Excitation.png">
<img align="center" width="900" height="600" src="https://github.com/BadenLab/LED-Zappelin/blob/master/Instruction%20Manual/Stimulator%20Calibration/Calibration_Figures//Opsin-LED%20Co-Excitation.png">

***
