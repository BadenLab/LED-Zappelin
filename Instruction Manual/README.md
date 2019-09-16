<p align="right"><img src="https://github.com/BadenLab/Zebrafish-visual-space-model/blob/master/Images/Logo.png" width="300"/>
<h1 align="center">Instruction Manual</h1></p>
<h1 align="center">Multi-Chromatic Stimulator</h1>

***

## Overview

<img align="right" width="600" height="300" src="https://github.com/MaxZimmer/Multi-Chromatic-Stimulator/blob/master/Images/Stimulator.png">

This document contains detailed assembly instructions, a software guideline to customize stimuli, and includes a parts list.

 The Arduino code and 3D printing files (SCAD and STL) can be downloaded [here](https://github.com/BadenLab/Tetra-Chromatic-Stimulator/tree/master/3D%20Designs), and further modified to fit customise purposes. The aim of this device is to finely control LEDs used in combination with a 2-photon microscope.

The device consists of a custom-designed PCB, an [ESP32 development board](https://learn.adafruit.com/adafruit-huzzah32-esp32-feather) (or an Arduino Nano if the stimulator does not need to be combined with a 2 photon microscope), a [LED driver](https://learn.adafruit.com/tlc5947-tlc59711-pwm-led-driver-breakout/overview) and various off-the-shelf components.

***

- [Assembling the Stimulator](#Assembling-the-Stimulator)
- [Programming the Stimulator](#Programming-the-ESP32)
- [Operating the Stimulator](#Operating-the-Stimulator)
- [Calibrating the Stimulator](#Calibrating-the-Stimulator)

***

## Assembling the stimulator

<img align="right" width="350" height="225" src="https://github.com/MaxZimmer/Multi-Chromatic-Stimulator/blob/master/Images/Circuit%20Drawing.png">

<p align="center"><h4 align="left">1 – Obtaining the custom-designed PCB</h4></p>

From the GitHub repository, one can find the [gerber.zip folder](https://github.com/BadenLab/Tetra-Chromatic-Stimulator/tree/master/PCB/Stimulator) needed to order the PCB to any manufacturer company (i.e. https://jlcpcb.com).

Ordering a minimum of five units should not cost more than £10. Gerber files were designed with [KiCad 5.0](http://kicad-pcb.org/).


Schematics and PCB footprint can be downloaded and modified from the same repository if need be.


****

<p align="center"><h4 align="left">2 – Soldering the custom-designed PCB</h4></p>
<img align="left" width="375" height="225" src="https://github.com/MaxZimmer/Multi-Chromatic-Stimulator/blob/master/Images/Board.png">

The board is self-explanatory. On the left, two options are available, one for the Arduino (close rows) the other for the ESP (spread rows). There is no need to solder more JST pins that the number of LED required for the desired stimulator.

The jumper on the top (Signal Inverter) allows the inversion of the TTL "Blanking" signals. For ScanImage users, the jumper should be placed at the upper position.

The jumper at the bottom of the board (Voltage Divider) allows to tune down the voltage from 5 to 3.3V if the ESP is used instead of an Arduino. ESP32 unlike Arduino Nano, works on a 3.3V logic; no higher tension should be sent to this board. Since most TTL deliver 5V pulses, we selected a 220/470Ω divider to bring a 5V blanking signal into a 3.3V input. Depending on the blanking signal generator used, this divider can be modified to fit one’s personal design or bypassed by only bridging the 220Ω resistor.

<img align="right" width="500" height="200" src="https://github.com/MaxZimmer/Multi-Chromatic-Stimulator/blob/master/Images/reference%20resistor%20vs%20output%20current.png">

The Adafruit TLC5947 LED driver is a constant current driver configured by default to set the current level at 15mA per channel, which is virtually safe for any LED. However, one can operate at different current by replacing the on-board reference resistor with a through hole resistor. The driver is capable to deliver up to 30mA, the graph below shows the relationship between resistance and output current.



****

<p align="center"><h4 align="left">3 – Mounting the potentiometer</h4></p>
<img align="right" width="200" src="https://github.com/MaxZimmer/Multi-Chromatic-Stimulator/blob/master/Images/Potentiometer%20PCB.png">

In order to finely adjust each LED power, we added multiple-turn trimmer potentiometers to our design. A simple solution is to manufacture the appropriate PCB board (We provide multiple options on the [GitHub repository](https://github.com/BadenLab/Tetra-Chromatic-Stimulator/tree/master/PCB/Potentiometer%20Mounts)).

Otherwise, one can make its own little PCB by using a solderable board.
Each potentiometer connects its ClockWise (pin 3) to the LED (+) stimulator JST pin; and its Base (pin 2) to the LED (+) leg. The LED (-) stimulator JST pin connects the LED (-) leg directly.

***

<p align="center"><h4 align="left">4 – Printing the Stimulator box</h4></p>
<img align="left" width="300" height="250" src="https://github.com/MaxZimmer/Multi-Chromatic-Stimulator/blob/master/Images/Box.png">

[STL files](https://github.com/BadenLab/Tetra-Chromatic-Stimulator/tree/master/3D%20Designs/Stimulator/STL%20Files) can be found on the GitHub repository and print directly if the user wishes to go for the default design (4 stimulation LEDs + 4 proxy LEDs) and [BoM](https://github.com/BadenLab/Tetra-Chromatic-Stimulator/blob/master/Bills%20of%20Materials/BOM%20-%20Stimulator.ods).

However, [SCAD files](https://github.com/BadenLab/Tetra-Chromatic-Stimulator/blob/master/3D%20Designs/Stimulator/MultiChromatic%20Stimulator%20v2.1.scad) are also available and easily adjustable for personalised design.

We used [OpenSCAD](www.openscad.com) to design the stimulator box. The tolerance of the printer can be adjusted in the “USER Parameters” section of the script (tol =0.1; by default, this value is used for Prusa MK3 and Ultimaker 2). Each component can be displayed/design individually in the “Switches” section. Variables such as LED number (4 by default) and the potentiometer board dimensions can be adjusted in the “Component Parameters” section.

The PCB is screwed to the “Bottom” part of the box by using M3 screws and nuts. The potentiometer board adjusts itself with the “Back” part of the box, and the trimmers should adapt to their respective holes exactly.
All part should fit tightly together and are maintained together by 4 M3*50mm socket screws.


***

<p align="center"><h4 align="left">5 – Adjusting the proxy LED</h4></p>
The proxy LED are markers for the experimenter to have a ready visualisation of the stimulus being displayed under the objective. If this option is selected, 3mm LEDs are to be mounted at the back of the LED holder using 3mm LED mounts.

Finally, any translucid material could be placed in the LED holder slot in order to diffuse the proxy LED light (In our example, we used a piece of thin Teflon)

***

<p align="center"><h4 align="left">6 – Connecting the Stimulator</h4></p>
The stimulator can be powered from 5 to 30v. The Adafruit TLC5947 being a constant current LED driver, the voltage selection is not critical, however it has to be slightly higher than the LED forward voltage (LED datasheet). Multiple LEDs can be connected to the same channel; however, the voltage supply has to be adjusted in consequence. For example, if an LED has 3.2v forward voltage, then a power supply => 3.2v will be enough, however if 5 of those LEDs are connected in series to the same channel, then the power supply has to be => 3.2v * 5 => 16v.

Blanking signal BNC has to be connected to a TTL (pulse generator), that delivers 5V pulses (if voltage is different, refer yourself to the soldering paragraph). Here we called blanking signal the pulse synchronised with the scanning mirror (scanning retrace), the laser Pockels cell and the PMTs. On our setup, when blanking signal is HIGH, the scanning mirror starts a new scanning line, the Pockels cell let the laser beam through, the PMT records the emitting fluorescence and the stimulating LEDs are turned off. When the blanking signal is LOW, the opposite occurs.

The trigger channel is an output signal generated by the stimulator that by default sends a 3.3v pulse (if ESP32 is used, 5v for Arduino nano) at the start of the stimulus and then at every 1.00000s. This trigger is used during the analysis to correlate the displayed stimulus to the fluorescence trace recordings.

Finally, the board is connected to a computer via micro USB cable (for ESP32, mini USB for Arduino Nano), and ready to be used.

<img align="center" src="https://github.com/MaxZimmer/Multi-Chromatic-Stimulator/blob/master/Images/Schematics.png" width="1000"/>

***

## Programming the ESP32


1-	Download and install [Arduino environment](www.arduino.org) on the computer.

2-	To use the ESP32, a couple of steps are necessary
Install the latest SiLabs [CP2104 driver](https://www.silabs.com/products/development-tools/software/usb-to-uart-bridge-vcp-drivers).
Follow the installation instructions from the [Espressif repository](https://github.com/espressif/arduino-esp32/blob/master/docs/arduino-ide/boards_manager.md).

3-	Install the TLC5947 library:	Start Arduino and from the “Sketch” tab, select “Include Library” and open “ Manage Libraries”.	From the search bar enter “TLC5947”. Select and Install the library

4-	Close Arduino and open the Multi-Chromatic-Stimulator arduino file from the [Arduino Code folder](https://github.com/BadenLab/Tetra-Chromatic-Stimulator/tree/master/Arduino%20code/2-Photon_Mutli_Chromatic_Stimulator).


5-	From the “Tools” tab: Select from “Boards” the “Adafruit ESP32 Feather”.	From “Upload Speed”, select 921600.	From “Flash Frequency”, select 80Hz. From “Port”, select the computer port to which the ESP is connected (if doubt, unplug, replug and observe the choices differences). If the ESP is not recognised, check the driver installation (2), then check the micro USB cable.

6-	Compile and Upload the code by clicking on the arrow button on the top left.

7-	The stimulator is ready to be used.

***

## Operating the Stimulator
<p align="center"><h4 align="left">The code is organised in five distinct part:</h4></p>

  Stimulus Parameters

Here, users determine the sequence of their looping stimulus.

–	The *array_LED#* corresponds to the sequence of each LED#. The value corresponds to the LED power and CAN ONLY TAKE A VALUE FROM 0 TO 100, where 0 corresponds to no light and 100 to max light intensity

–	The *array_Time* corresponds to the duration of each entry in ms; the first entry being the pre-adaptation that will only be played at the start of the stimulus, the sequence will then loop starting at the second position.

–	The number of Loops is determined by *nLoops*. The stimulus will stop after finishing the n Loop.

–	IMPORTANT, for the code to work flawlessly, the number of entries within the arrays has to be the same and manually entered in nArrayEntries (including the pre-adaptation at position 1).

***

  Microcontroller Board Selection

This is where the user defines if he is using an ESP32 or an Arduino Nano

***

  Internal Definitions

This is the main definition part of the code which can be modified to:

-	Add more LEDs than the 4 main and 4 proxy defined by default. (Global variables, the LED pins correspond to the pin number on the TLC5947).

-	Adjust the Trigger duration (25ms by default). This value corresponds to the amount of time the trigger marker will remain on in order to be detected by i.e. a DAQ.

-	Adjust the Trigger interval (1000 ms by default). Value between two successive triggers.

***

  Internal Methods

This is the main core of the code and should not be structurally changed apart from adding more LEDs (straight forward)

***

  Main Loop

This is where the stimuli controls are defined. By default, when compile window is open (magnifying glass on the top right corner) and the baud rate at the bottom right of the window has be changed to 115200, a manual command will trigger a stimulus:

By default:

-	*a* –> Play stimulus at max power 1

-	*b* –> Play stimulus at max power 2

-	*0* –> Turn off all LEDs stop any stimulus being played and reset the loop

-	*+* –> Turn on all LED to max power 1

-	*-* –> Turn on all LED to max power 2

-	*1* –> Turn First LED to max power 1

-	*2* –> Turn First LED to max power 2

-	*3* –> Turn Second LED to max power 1

-	*4* –> Turn Second LED to max power 2

-	*5* –> Turn Third LED to max power 1

-	*6* –> Turn Third LED to max power 2

-	*7* –> Turn Fourth LED to max power 1

-	*8* –> Turn Fourth LED to max power 2

Important to note, obviously the stimulation will only be played if a blanking signal is sent to the board.

***

## Calibrating the Stimulator

The TLC5947 is a 12 bits PWM grayscale driver, meaning that it offers a 4096 degree of freedom to adjust each LED power.
On the arduino code there is a second tab called “LED_values” which hard-codes the maximum power a LED can get. Those values range from 0 (no current) to 4095 (max current, 15mA by default).

On the default script we proposed 2 distinct max values (named here max1 and max2 power) that can be called individually. The purpose here is to have the opportunity to use the same stimulus sequence at two different light intensities. Off course more can be added manually by the user.

For the calibration, we suggest setting the max_LED# value at 4095 (Full power), play the stimulus (while the board receives a blanking signal it sees its LED average light intensity decrease (LED off while blanking)) and jointly use a spectrometer and a powermeter.


### Visual Stimulator Calibration

For the visual stimulator, we used the [ThorLabs Compact CCD Spectrometer](https://www.thorlabs.com/newgrouppage9.cfm?objectgroup_ID=3482) CCS200/M in combination with the [ThorLabs OSA software](https://www.thorlabs.com/software_pages/ViewSoftwarePage.cfm?Code=OSA).
We placed the spectrometer fiber patch cable at the sample position and played the calibration code on the stimulator. This calibration sequence plays each LED individually from 0 to 100% for 1 second and loops 5 times. This stimulus sequence is quite tedious so we encourage users to adapt it to their needs.
Recordings were made using the inbuilt trigger mode of the spectrometer (connected to the stimulator trigger output). We used an integration time of 1 second and applied the inbuilt spectrum correction in the OSA software. Data was extracted as .csv files and analysed using our [iPython analysis script](https://github.com/BadenLab/Tetra-Chromatic-Stimulator/blob/master/Instruction%20Manual/Stimulator%20Calibration/Stimulator_Calibration.ipynb).


<img align="right" width="500" height="350" src="https://github.com/BadenLab/Tetra-Chromatic-Stimulator/blob/master/Images/Notebook_01.png">

For analysis purposes, we designed an [iPython notebook](https://jupyter.readthedocs.io/en/latest/install.html).
In this script, one has to first modify the global parameters:
  - Opsin maximum absorbance: *PeakWavelength* This array contains the peak asorbance for each opsin considered. For the zebrafish, we use the value defined by [Allison et al, 2004 - Visual pigment composition in Zebrafish](https://github.com/BadenLab/Tetra-Chromatic-Stimulator/blob/master/References/Allison%202004%20-%20Visual%20pigment%20composition%20in%20zebrafish.pdf)
  - Number of LEDs to be considered
  - Figure parameters: Figure sizes, spectra range to considered, etc.

<img align="left" width="650" height="325" src="https://github.com/BadenLab/Tetra-Chromatic-Stimulator/blob/master/Instruction%20Manual/Stimulator%20Calibration/Filtered%20Spectrometer%20Recordings.png">

.

.

The script then run a couple of slides to extract and smooth (Savitzky–Golay filter) the recording data.

From this recording, the peak wavelength of each LED is extracted and assigned to the *Peaks[ ]* array.

|                     |   Red LED  |  Green LED |  Blue LED  |   UV LED   |
| --------------------|:----------:|:----------:|:----------:|:----------:|
| Peak Wavelength (nm)|    586.9   |    487.5   |    427.9   |    372.8   |

Depending on the LEDs used or on the extra resistors that a user might want to connect in series to substantially tune down the LEDs, a powermeter shall be used to bring the LEDs to their desired max values. Here we suggest to set the potentiometers at mid-range and replace the spectrometer sensor by the powermeter's. In our case, we used a [ThorLabs Digital Handheld Optical Power](https://www.thorlabs.de/newgrouppage9.cfm?objectgroup_id=3341) coupled with a [ThorLabs Photodiode Power Sensor S130VC](https://www.thorlabs.de/thorproduct.cfm?partnumber=S130VC), 200 - 1100 nm, 50 mW. Each LED is then successively brought to their desired maximum power (here 40nW) and the powermeter configured to the LED peak wavelengths (λmax). Once this value has been reached, the *max_LED* value in the LED Values part of the Arduino code has to be decreased until a change is oberved. The max_LED value is then hard-coded and fine tuning can be achieved with the potentiometers.
At this stage, one might retake measurements with the spectrometer with this new power (in our case equalised amongst LEDs), and rerun the first part of this script to obtain more precise curves.

To establish the LEDs performance we then plotted their normalised intensities (LED relative brightness) against the PWM (*array_LED#*) used in the Arduino code to drive them. A Linear fit along with the Sum of Square Error (SSE), demonstrates that the TLC5947 LED driver controls the LED in an optimal linear manner.

<img align="center" width="800" height="200" src="https://github.com/BadenLab/Tetra-Chromatic-Stimulator/blob/master/Instruction%20Manual/Stimulator%20Calibration/Normalised%20Intensity%20VS%20Forward%20Current.png">

***

We then used the absorbance spectrum fitting template for visual pigment defined by [Govardoskii et al, 2000 - In Search of Visual Pigment Template](https://github.com/BadenLab/Tetra-Chromatic-Stimulator/blob/master/References/Govardovskii%202000%20-%20In%20search%20of%20the%20visual%20pigment%20template.pdf). Using the Opsin maximal absorbance defined earlier, this nomogram template describes the predicted shape of the absorbance spectra of all visual pigment. Here we obtained the following specra for the zebrafish cone photoreceptors that we plotted along the human visible spectrum as comparison.

<img align="center" width="900" height="600" src="https://github.com/BadenLab/Tetra-Chromatic-Stimulator/blob/master/Instruction%20Manual/Stimulator%20Calibration/Cone%20Absoprtion%20Spectra.png">

***

Using the same display we plotted the LEDs spectra that we obtained from the spectrometer recordings.

Then, we plotted the LED spectra along the cone opsin absorbance, and each LED’s spectral cross-section with respective target conein solid colours. Grey boxes indicate the positions of the two PMT detector bands. The Red-LED’s long-wavelength emission spectrum was chosen to limit spectral overlap with the red-fluorescence detection channel. Any loss in excitation efficiency of the red opsin was compensated for by increasing this LED’s power accordingly.

<img align="center" width="900" height="600" src="https://github.com/BadenLab/Tetra-Chromatic-Stimulator/blob/master/Instruction%20Manual/Stimulator%20Calibration/Opsin-LED%20Spectra.png">


***

With the previous spectra, we estimate the relative co-excitation of photoreceptors by the LEDs:
<img align="center" width="900" height="600" src="https://github.com/BadenLab/Tetra-Chromatic-Stimulator/blob/master/Instruction%20Manual/Stimulator%20Calibration/LED-Opsin%20Co-Excitation.png">
<img align="center" width="900" height="600" src="https://github.com/BadenLab/Tetra-Chromatic-Stimulator/blob/master/Instruction%20Manual/Stimulator%20Calibration/Opsin-LED%20Co-Excitation.png">

***

This project is licensed under the [GNU General Public License v3.0](https://github.com/MaxZimmer/Multi-Chromatic-Stimulator/blob/master/LICENSE)

***
