<p align="right"><img src="https://github.com/BadenLab/Zebrafish-visual-space-model/blob/master/Images/Logo.png" width="300"/>
<h1 align="center">Multi-Chromatic Stimulator</h1></p>
<h4 align="center">An OpenSource LED stimulator for visual and optogenetics stimulation in combination with 2-photon recording</h4>
<p align="center"><h6 align="right">by M.J.Y. Zimmermann, A.M. Chagas, P. Bartel, T. Baden</h6></p>

This project is licensed under the [GNU General Public License v3.0](https://github.com/MaxZimmer/Multi-Chromatic-Stimulator/blob/master/LICENSE)


The study of colour vision with fluorescence microscopy requires precise control over the spectra of visual stimuli.

Here we describe an effective, low-cost, opensource LED stimulator, designed to be used in combination with a 2-photon microscope. The design is built around an open-source development board and off-the-shelf components. It has been conceived to be assembled and used without the need for advanced electronics skills.


[Instruction Manual](https://github.com/MaxZimmer/Multi-Chromatic-Stimulator/tree/master/Manuscript%20and%20Instruction%20Manual)

***

## Repository structure

```
├───3D Designs                                Contains printed parts for the stimulator and optical components
│   ├───Optical Components
|   |   ├───STL renderings                    - Printing files
|   |   └───SCAD files                        - SCAD files to be modified if need be
│   └───Stimulator
|      ├───STL renderings                    - Printing files
|      └───SCAD files                        - SCAD files to be modified if need be
|
├───Arduino Code                              Stimulator Code
|   ├───Stimulator Code                       - Adaptable C+ code for running the stimulator
|   └───LED driver library                     - Library to run the TLC 5947
|
├───Bill of Materials                         List of necessary components and retailer suggestions
|
├───Datasheets                                - Contains all technical sheet for:
|   ├───Optical Components                    - ...LEDs, Filters, Dichroic Mirrors used in the presented example
|   ├───Stimulator                            - ...micro-controller and LED driver
|   └───Spectrometer                          - ...device used for calibration
|
├───Images                                    Image repository
|
├───Instruction Manual                        Detailed manual to assemble and calibrate the stimulator
|   └───Stimulator Calibration                - Contains calibration recordings and the adaptable jupyter notebook script to calibrate the stimulator
|       ├───Arduino Calibration Code          - Sequence used for the calibration
|       ├───Filters                           - Filters and dicroic mirrors spectra
|       ├───Powermeter Recording              - Recording of the calibration sequence
|       └───Spectrometer Recording            - Recording of the calibration sequence
|
├───PCB                                       KiCad and Gerber files to modified and generate PCB for:
│   ├───Potentiometer mounts                  - ...trimmer potentiometers that set the LED maximum brightness
│   └───Stimulator                            - ...the stimulator itself
|
└───References                                Publication used to design and conceive this model

```

***

The following design can control up to 24 spectral channels with 12 bits linear resolution and 25 μs temporal precision. Our system only requires simple electronics components to be assemble and can be combined.
Built around an ESP32 micro-controller an LED driver (Adafruit model) and off-the-shelf components for a total cost of ~$50

<img align="center" src="https://github.com/MaxZimmer/Multi-Chromatic-Stimulator/blob/master/Images/Stimulator.png" width="1000"/>

***

The stimulator runs synchronous to the recording system using TTL triggers.
TTL signals correspond to scanning mirror retrace periods and are used to turn ON and OFF LEDs, thus avoiding swamping the PMTs by stimulation light.

<img align="center" src="https://github.com/MaxZimmer/Multi-Chromatic-Stimulator/blob/master/Images/Blanking.png" width="1000"/>

***

The following design was adjusted for the tetrachromatic zebrafish.
Stimulating LEDs and optical filters were chosen to match the peak sensitivities of opsin spectra while avoiding overlap with the PMT detection bands.

<img align="center" src="https://github.com/MaxZimmer/Multi-Chromatic-Stimulator/blob/master/Images/Spectra.png" width="1000"/>

***

In this example, light sources are combined and directed through the onjective.

<img align="center" src="https://github.com/MaxZimmer/Multi-Chromatic-Stimulator/blob/master/Images/Schematics.png" width="1000"/>

***
