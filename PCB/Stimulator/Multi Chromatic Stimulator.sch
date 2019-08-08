EESchema Schematic File Version 4
LIBS:Multi Chromatic Stimulator-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Multi Chormatic Stimulator"
Date "2018-10-04"
Rev "1.0"
Comp "Baden Lab"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L maxi_MCU_Module:Arduino_Nano_v3.x A1
U 1 1 5BB625C1
P 4900 2350
F 0 "A1" V 4950 2350 50  0000 R CNN
F 1 "Arduino_Nano_v3.x" V 4850 2700 50  0000 R CNN
F 2 "Module:Arduino_Nano" H 5050 1400 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 4900 1350 50  0001 C CNN
	1    4900 2350
	0    1    1    0   
$EndComp
$Comp
L Driver_LED:TLC5947DAP U1
U 1 1 5BB63603
P 5300 3900
F 0 "U1" V 5250 4400 50  0000 L CNN
F 1 "TLC5947DAP" V 5350 4250 50  0000 L CNN
F 2 "Package_SO:HTSSOP-32-1EP_6.1x11mm_P0.65mm_EP5.2x11mm_Mask4.11x4.36mm_ThermalVias" H 4750 5500 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/tlc5947.pdf" H 5300 3900 50  0001 C CNN
	1    5300 3900
	0    1    1    0   
$EndComp
$Comp
L Connector:Barrel_Jack J25
U 1 1 5BB69714
P 7850 1100
F 0 "J25" H 7905 1425 50  0000 C CNN
F 1 "Barrel_Jack" H 7905 1334 50  0000 C CNN
F 2 "" H 7900 1060 50  0001 C CNN
F 3 "~" H 7900 1060 50  0001 C CNN
	1    7850 1100
	0    1    1    0   
$EndComp
$Comp
L power:GNDREF #PWR0101
U 1 1 5BB6A0FC
P 2250 3850
F 0 "#PWR0101" H 2250 3600 50  0001 C CNN
F 1 "GNDREF" H 2400 3650 50  0000 R CNN
F 2 "" H 2250 3850 50  0001 C CNN
F 3 "" H 2250 3850 50  0001 C CNN
	1    2250 3850
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J16
U 1 1 5BB6A363
P 4650 5700
F 0 "J16" H 4677 5676 50  0000 L CNN
F 1 "Conn_01x02_Female" H 4677 5585 50  0000 L CNN
F 2 "" H 4650 5700 50  0001 C CNN
F 3 "~" H 4650 5700 50  0001 C CNN
	1    4650 5700
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J15
U 1 1 5BB6A628
P 4900 5700
F 0 "J15" H 4927 5676 50  0000 L CNN
F 1 "Conn_01x02_Female" H 4927 5585 50  0000 L CNN
F 2 "" H 4900 5700 50  0001 C CNN
F 3 "~" H 4900 5700 50  0001 C CNN
	1    4900 5700
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J14
U 1 1 5BB6A753
P 5150 5700
F 0 "J14" H 5177 5676 50  0000 L CNN
F 1 "Conn_01x02_Female" H 5177 5585 50  0000 L CNN
F 2 "" H 5150 5700 50  0001 C CNN
F 3 "~" H 5150 5700 50  0001 C CNN
	1    5150 5700
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J13
U 1 1 5BB6A87F
P 5400 5700
F 0 "J13" H 5427 5676 50  0000 L CNN
F 1 "Conn_01x02_Female" H 5427 5585 50  0000 L CNN
F 2 "" H 5400 5700 50  0001 C CNN
F 3 "~" H 5400 5700 50  0001 C CNN
	1    5400 5700
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J12
U 1 1 5BB6AA1B
P 5650 5700
F 0 "J12" H 5677 5676 50  0000 L CNN
F 1 "Conn_01x02_Female" H 5677 5585 50  0000 L CNN
F 2 "" H 5650 5700 50  0001 C CNN
F 3 "~" H 5650 5700 50  0001 C CNN
	1    5650 5700
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J11
U 1 1 5BB6AA22
P 5900 5700
F 0 "J11" H 5927 5676 50  0000 L CNN
F 1 "Conn_01x02_Female" H 5927 5585 50  0000 L CNN
F 2 "" H 5900 5700 50  0001 C CNN
F 3 "~" H 5900 5700 50  0001 C CNN
	1    5900 5700
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J10
U 1 1 5BB6AA29
P 6150 5700
F 0 "J10" H 6177 5676 50  0000 L CNN
F 1 "Conn_01x02_Female" H 6177 5585 50  0000 L CNN
F 2 "" H 6150 5700 50  0001 C CNN
F 3 "~" H 6150 5700 50  0001 C CNN
	1    6150 5700
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J9
U 1 1 5BB6AA30
P 6400 5700
F 0 "J9" H 6427 5676 50  0000 L CNN
F 1 "Conn_01x02_Female" H 6427 5585 50  0000 L CNN
F 2 "" H 6400 5700 50  0001 C CNN
F 3 "~" H 6400 5700 50  0001 C CNN
	1    6400 5700
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J8
U 1 1 5BB6ABAD
P 6650 5700
F 0 "J8" H 6677 5676 50  0000 L CNN
F 1 "Conn_01x02_Female" H 6677 5585 50  0000 L CNN
F 2 "" H 6650 5700 50  0001 C CNN
F 3 "~" H 6650 5700 50  0001 C CNN
	1    6650 5700
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J7
U 1 1 5BB6ABB4
P 6900 5700
F 0 "J7" H 6927 5676 50  0000 L CNN
F 1 "Conn_01x02_Female" H 6927 5585 50  0000 L CNN
F 2 "" H 6900 5700 50  0001 C CNN
F 3 "~" H 6900 5700 50  0001 C CNN
	1    6900 5700
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J6
U 1 1 5BB6ABBB
P 7150 5700
F 0 "J6" H 7177 5676 50  0000 L CNN
F 1 "Conn_01x02_Female" H 7177 5585 50  0000 L CNN
F 2 "" H 7150 5700 50  0001 C CNN
F 3 "~" H 7150 5700 50  0001 C CNN
	1    7150 5700
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J5
U 1 1 5BB6ABC2
P 7400 5700
F 0 "J5" H 7427 5676 50  0000 L CNN
F 1 "Conn_01x02_Female" H 7427 5585 50  0000 L CNN
F 2 "" H 7400 5700 50  0001 C CNN
F 3 "~" H 7400 5700 50  0001 C CNN
	1    7400 5700
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J20
U 1 1 5BB6ADA3
P 3650 5700
F 0 "J20" H 3677 5676 50  0000 L CNN
F 1 "Conn_01x02_Female" H 3677 5585 50  0000 L CNN
F 2 "" H 3650 5700 50  0001 C CNN
F 3 "~" H 3650 5700 50  0001 C CNN
	1    3650 5700
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J19
U 1 1 5BB6ADAA
P 3900 5700
F 0 "J19" H 3927 5676 50  0000 L CNN
F 1 "Conn_01x02_Female" H 3927 5585 50  0000 L CNN
F 2 "" H 3900 5700 50  0001 C CNN
F 3 "~" H 3900 5700 50  0001 C CNN
	1    3900 5700
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J18
U 1 1 5BB6ADB1
P 4150 5700
F 0 "J18" H 4177 5676 50  0000 L CNN
F 1 "Conn_01x02_Female" H 4177 5585 50  0000 L CNN
F 2 "" H 4150 5700 50  0001 C CNN
F 3 "~" H 4150 5700 50  0001 C CNN
	1    4150 5700
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J17
U 1 1 5BB6ADB8
P 4400 5700
F 0 "J17" H 4427 5676 50  0000 L CNN
F 1 "Conn_01x02_Female" H 4427 5585 50  0000 L CNN
F 2 "" H 4400 5700 50  0001 C CNN
F 3 "~" H 4400 5700 50  0001 C CNN
	1    4400 5700
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J4
U 1 1 5BB6AF3D
P 7650 5700
F 0 "J4" H 7677 5676 50  0000 L CNN
F 1 "Conn_01x02_Female" H 7677 5585 50  0000 L CNN
F 2 "" H 7650 5700 50  0001 C CNN
F 3 "~" H 7650 5700 50  0001 C CNN
	1    7650 5700
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J3
U 1 1 5BB6AF44
P 7900 5700
F 0 "J3" H 7927 5676 50  0000 L CNN
F 1 "Conn_01x02_Female" H 7927 5585 50  0000 L CNN
F 2 "" H 7900 5700 50  0001 C CNN
F 3 "~" H 7900 5700 50  0001 C CNN
	1    7900 5700
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J2
U 1 1 5BB6AF4B
P 8150 5700
F 0 "J2" H 8177 5676 50  0000 L CNN
F 1 "Conn_01x02_Female" H 8177 5585 50  0000 L CNN
F 2 "" H 8150 5700 50  0001 C CNN
F 3 "~" H 8150 5700 50  0001 C CNN
	1    8150 5700
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J1
U 1 1 5BB6AF52
P 8400 5700
F 0 "J1" H 8427 5676 50  0000 L CNN
F 1 "Conn_01x02_Female" H 8427 5585 50  0000 L CNN
F 2 "" H 8400 5700 50  0001 C CNN
F 3 "~" H 8400 5700 50  0001 C CNN
	1    8400 5700
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J24
U 1 1 5BB6B406
P 2650 5700
F 0 "J24" H 2677 5676 50  0000 L CNN
F 1 "Conn_01x02_Female" H 2677 5585 50  0000 L CNN
F 2 "" H 2650 5700 50  0001 C CNN
F 3 "~" H 2650 5700 50  0001 C CNN
	1    2650 5700
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J23
U 1 1 5BB6B40D
P 2900 5700
F 0 "J23" H 2927 5676 50  0000 L CNN
F 1 "Conn_01x02_Female" H 2927 5585 50  0000 L CNN
F 2 "" H 2900 5700 50  0001 C CNN
F 3 "~" H 2900 5700 50  0001 C CNN
	1    2900 5700
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J22
U 1 1 5BB6B414
P 3150 5700
F 0 "J22" H 3177 5676 50  0000 L CNN
F 1 "Conn_01x02_Female" H 3177 5585 50  0000 L CNN
F 2 "" H 3150 5700 50  0001 C CNN
F 3 "~" H 3150 5700 50  0001 C CNN
	1    3150 5700
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J21
U 1 1 5BB6B41B
P 3400 5700
F 0 "J21" H 3427 5676 50  0000 L CNN
F 1 "Conn_01x02_Female" H 3427 5585 50  0000 L CNN
F 2 "" H 3400 5700 50  0001 C CNN
F 3 "~" H 3400 5700 50  0001 C CNN
	1    3400 5700
	0    1    1    0   
$EndComp
Wire Wire Line
	2550 5500 2550 5300
Wire Wire Line
	2550 5300 2800 5300
Wire Wire Line
	8300 5300 8300 5500
Wire Wire Line
	2800 5500 2800 5300
Connection ~ 2800 5300
Wire Wire Line
	2800 5300 3050 5300
Wire Wire Line
	3050 5500 3050 5300
Connection ~ 3050 5300
Wire Wire Line
	3050 5300 3300 5300
Wire Wire Line
	3300 5500 3300 5300
Connection ~ 3300 5300
Wire Wire Line
	3300 5300 3550 5300
Wire Wire Line
	3550 5500 3550 5300
Connection ~ 3550 5300
Wire Wire Line
	3550 5300 3800 5300
Wire Wire Line
	3800 5500 3800 5300
Connection ~ 3800 5300
Wire Wire Line
	3800 5300 4050 5300
Wire Wire Line
	4050 5500 4050 5300
Connection ~ 4050 5300
Wire Wire Line
	4050 5300 4300 5300
Wire Wire Line
	4300 5500 4300 5300
Connection ~ 4300 5300
Wire Wire Line
	4300 5300 4550 5300
Wire Wire Line
	4550 5500 4550 5300
Connection ~ 4550 5300
Wire Wire Line
	4550 5300 4800 5300
Wire Wire Line
	4800 5500 4800 5300
Connection ~ 4800 5300
Wire Wire Line
	4800 5300 5050 5300
Wire Wire Line
	5050 5500 5050 5300
Connection ~ 5050 5300
Wire Wire Line
	5050 5300 5300 5300
Wire Wire Line
	5300 5500 5300 5300
Connection ~ 5300 5300
Wire Wire Line
	5550 5500 5550 5300
Connection ~ 5550 5300
Wire Wire Line
	5550 5300 5800 5300
Wire Wire Line
	5800 5500 5800 5300
Connection ~ 5800 5300
Wire Wire Line
	5800 5300 6050 5300
Wire Wire Line
	6050 5500 6050 5300
Connection ~ 6050 5300
Wire Wire Line
	6050 5300 6300 5300
Wire Wire Line
	6300 5500 6300 5300
Connection ~ 6300 5300
Wire Wire Line
	6300 5300 6550 5300
Wire Wire Line
	6550 5500 6550 5300
Connection ~ 6550 5300
Wire Wire Line
	6550 5300 6800 5300
Wire Wire Line
	6800 5500 6800 5300
Connection ~ 6800 5300
Wire Wire Line
	6800 5300 7050 5300
Wire Wire Line
	7050 5500 7050 5300
Connection ~ 7050 5300
Wire Wire Line
	7050 5300 7300 5300
Wire Wire Line
	7300 5500 7300 5300
Connection ~ 7300 5300
Wire Wire Line
	7300 5300 7550 5300
Wire Wire Line
	7550 5500 7550 5300
Connection ~ 7550 5300
Wire Wire Line
	7550 5300 7800 5300
Wire Wire Line
	7800 5500 7800 5300
Connection ~ 7800 5300
Wire Wire Line
	7800 5300 8050 5300
Wire Wire Line
	8050 5500 8050 5300
Connection ~ 8050 5300
Wire Wire Line
	8050 5300 8300 5300
Wire Wire Line
	5300 5300 5550 5300
Wire Wire Line
	6500 4600 8400 4600
Wire Wire Line
	8400 4600 8400 5500
Wire Wire Line
	6400 4600 6400 4650
Wire Wire Line
	6400 4650 8150 4650
Wire Wire Line
	8150 4650 8150 5500
Wire Wire Line
	6300 4600 6300 4700
Wire Wire Line
	6300 4700 7900 4700
Wire Wire Line
	7900 4700 7900 5500
Wire Wire Line
	6200 4600 6200 4750
Wire Wire Line
	6200 4750 7650 4750
Wire Wire Line
	7650 4750 7650 5500
Wire Wire Line
	6100 4600 6100 4800
Wire Wire Line
	6100 4800 7400 4800
Wire Wire Line
	7400 4800 7400 5500
Wire Wire Line
	6000 4600 6000 4850
Wire Wire Line
	6000 4850 7150 4850
Wire Wire Line
	7150 4850 7150 5500
Wire Wire Line
	5900 4600 5900 4900
Wire Wire Line
	5900 4900 6900 4900
Wire Wire Line
	6900 4900 6900 5500
Wire Wire Line
	5800 4600 5800 4950
Wire Wire Line
	5800 4950 6650 4950
Wire Wire Line
	6650 4950 6650 5500
Wire Wire Line
	5700 4600 5700 5000
Wire Wire Line
	5700 5000 6400 5000
Wire Wire Line
	6400 5000 6400 5500
Wire Wire Line
	5600 4600 5600 5050
Wire Wire Line
	5600 5050 6150 5050
Wire Wire Line
	6150 5050 6150 5500
Wire Wire Line
	5500 4600 5500 5100
Wire Wire Line
	5500 5100 5900 5100
Wire Wire Line
	5900 5100 5900 5500
Wire Wire Line
	5400 4600 5400 5150
Wire Wire Line
	5400 5150 5650 5150
Wire Wire Line
	5650 5150 5650 5500
Wire Wire Line
	5300 4600 5300 5200
Wire Wire Line
	5300 5200 5400 5200
Wire Wire Line
	5400 5200 5400 5500
Wire Wire Line
	5200 4600 5200 5200
Wire Wire Line
	5200 5200 5150 5200
Wire Wire Line
	5150 5200 5150 5500
Wire Wire Line
	5100 4600 5100 5150
Wire Wire Line
	5100 5150 4900 5150
Wire Wire Line
	4900 5150 4900 5500
Wire Wire Line
	5000 4600 5000 5100
Wire Wire Line
	5000 5100 4650 5100
Wire Wire Line
	4650 5100 4650 5500
Wire Wire Line
	4900 4600 4900 5050
Wire Wire Line
	4900 5050 4400 5050
Wire Wire Line
	4400 5050 4400 5500
Wire Wire Line
	4800 4600 4800 5000
Wire Wire Line
	4800 5000 4150 5000
Wire Wire Line
	4150 5000 4150 5500
Wire Wire Line
	4700 4950 3900 4950
Wire Wire Line
	3900 4950 3900 5500
Wire Wire Line
	4700 4600 4700 4950
Wire Wire Line
	4600 4600 4600 4900
Wire Wire Line
	4600 4900 3650 4900
Wire Wire Line
	3650 4900 3650 5500
Wire Wire Line
	4500 4600 4500 4850
Wire Wire Line
	4500 4850 3400 4850
Wire Wire Line
	3400 4850 3400 5500
Wire Wire Line
	4400 4600 4400 4800
Wire Wire Line
	4400 4800 3150 4800
Wire Wire Line
	3150 4800 3150 5500
Wire Wire Line
	4300 4600 4300 4750
Wire Wire Line
	4300 4750 2900 4750
Wire Wire Line
	2900 4750 2900 5500
Wire Wire Line
	4200 4600 4200 4700
Wire Wire Line
	4200 4700 2650 4700
Wire Wire Line
	2650 4700 2650 5500
Wire Wire Line
	8300 5300 8550 5300
Wire Wire Line
	8550 5300 8550 4100
Connection ~ 8300 5300
Connection ~ 8550 4100
Wire Wire Line
	6800 4100 8550 4100
Wire Wire Line
	3650 1400 4100 1400
$Comp
L Switch:SW_SPST_LED SW1
U 1 1 5C6C82DB
P 8750 1500
F 0 "SW1" H 8750 1835 50  0000 C CNN
F 1 "LED Rocker Switch" H 8750 1744 50  0000 C CNN
F 2 "" H 8750 1800 50  0001 C CNN
F 3 "" H 8750 1800 50  0001 C CNN
	1    8750 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 1400 8950 1500
$Comp
L huzzahesp32:HuzzahESP32 A2
U 1 1 5C6D9879
P 6950 2450
F 0 "A2" V 7050 2050 50  0000 L CNN
F 1 "HuzzahESP32" V 7150 1900 50  0000 L CNN
F 2 "" H 7050 2450 50  0001 C CNN
F 3 "" H 7050 2450 50  0001 C CNN
	1    6950 2450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4100 1850 4100 1400
Connection ~ 4100 1400
Wire Wire Line
	7950 1400 8550 1400
Wire Wire Line
	4100 1400 4900 1400
Wire Wire Line
	6850 2950 6850 3000
Wire Wire Line
	8550 1500 8550 4100
Wire Wire Line
	3650 1400 3650 1900
Wire Wire Line
	5200 3200 5200 3100
Wire Wire Line
	5200 3100 4900 3100
Wire Wire Line
	4900 3100 4900 2850
Wire Wire Line
	7650 2950 7650 3100
Wire Wire Line
	7650 3100 5200 3100
Connection ~ 5200 3100
Wire Wire Line
	5300 3200 5300 3050
Wire Wire Line
	7550 2950 7550 3050
Wire Wire Line
	7550 3050 5300 3050
Connection ~ 5300 3050
Wire Wire Line
	5100 3050 5300 3050
Wire Wire Line
	5100 2850 5100 3050
Wire Wire Line
	5400 3200 5400 3150
Wire Wire Line
	5400 2950 5300 2950
Wire Wire Line
	5300 2950 5300 2850
Wire Wire Line
	8050 2950 8050 3150
Wire Wire Line
	8050 3150 5400 3150
Connection ~ 5400 3150
Wire Wire Line
	5400 3150 5400 2950
Wire Wire Line
	4500 2850 4500 3000
Wire Wire Line
	4500 3000 4700 3000
Wire Wire Line
	5500 3000 5500 3200
$Comp
L Connector:Conn_01x02_Female P1
U 1 1 5C735CDF
P 4800 850
F 0 "P1" V 4740 662 50  0000 R CNN
F 1 "Blanking Signal" V 4649 662 50  0000 R CNN
F 2 "" H 4800 850 50  0001 C CNN
F 3 "~" H 4800 850 50  0001 C CNN
	1    4800 850 
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x02_Female P2
U 1 1 5C735E3E
P 6150 850
F 0 "P2" V 6090 662 50  0000 R CNN
F 1 "Trigger Channel" V 5999 662 50  0000 R CNN
F 2 "" H 6150 850 50  0001 C CNN
F 3 "~" H 6150 850 50  0001 C CNN
	1    6150 850 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6250 1050 6250 1400
Connection ~ 6250 1400
Wire Wire Line
	4900 1050 4900 1400
Connection ~ 4900 1400
Wire Wire Line
	4900 1400 6250 1400
Wire Wire Line
	4500 3000 3500 3000
Connection ~ 4500 3000
Wire Wire Line
	7350 2950 7350 3250
Wire Wire Line
	7350 3250 7050 3250
Wire Wire Line
	6950 2950 6950 3200
Wire Wire Line
	6950 3200 6150 3200
Wire Wire Line
	6150 3200 6150 1600
Wire Wire Line
	6250 1400 7750 1400
Wire Wire Line
	6250 1400 6250 3000
Wire Wire Line
	6250 3000 6850 3000
Wire Wire Line
	4900 1850 4900 1600
Wire Wire Line
	4900 1600 6150 1600
Connection ~ 6150 1600
Wire Wire Line
	6150 1600 6150 1050
Wire Wire Line
	4700 2850 4700 3000
Connection ~ 4700 3000
Wire Wire Line
	4700 3000 5500 3000
Wire Wire Line
	6650 2950 6650 2900
Wire Wire Line
	6650 2900 5700 2900
Wire Wire Line
	5700 2850 5700 2900
Wire Wire Line
	5700 2900 3350 2900
Connection ~ 5700 2900
$Comp
L Device:R R1
U 1 1 5CE7A744
P 3100 1550
F 0 "R1" H 3170 1596 50  0000 L CNN
F 1 "1k" H 3050 1550 50  0000 L CNN
F 2 "" V 3030 1550 50  0001 C CNN
F 3 "~" H 3100 1550 50  0001 C CNN
	1    3100 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5CE7A7E6
P 3200 2900
F 0 "R2" V 3050 2900 50  0000 C CNN
F 1 "1k" V 3200 2900 50  0000 C CNN
F 2 "" V 3130 2900 50  0001 C CNN
F 3 "~" H 3200 2900 50  0001 C CNN
	1    3200 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	3100 1400 3100 1050
Wire Wire Line
	3100 1050 4800 1050
Wire Wire Line
	3100 1700 3100 2050
$Comp
L Transistor_BJT:2N2219 Q1
U 1 1 5CEA710A
P 3100 2250
F 0 "Q1" V 3336 2250 50  0000 C CNN
F 1 "2N5089" V 3427 2250 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-39-3" H 3300 2175 50  0001 L CIN
F 3 "http://www.onsemi.com/pub_link/Collateral/2N2219-D.PDF" H 3100 2250 50  0001 L CNN
	1    3100 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	2900 2350 2650 2350
Wire Wire Line
	2650 2350 2650 1900
Wire Wire Line
	2650 1900 3650 1900
Connection ~ 3650 1900
Wire Wire Line
	3300 2350 3500 2350
Wire Wire Line
	3500 2350 3500 3000
Wire Wire Line
	3050 2900 2850 2900
Wire Wire Line
	2850 2900 2850 3000
Wire Wire Line
	2850 3000 3500 3000
Connection ~ 3500 3000
$Comp
L Device:R R4
U 1 1 5CECEA9C
P 7300 3600
F 0 "R4" V 7200 3650 50  0000 R CNN
F 1 "220" V 7300 3650 50  0000 R CNN
F 2 "" V 7230 3600 50  0001 C CNN
F 3 "~" H 7300 3600 50  0001 C CNN
	1    7300 3600
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5CED8D2D
P 7800 3600
F 0 "R3" V 7700 3600 50  0000 C CNN
F 1 "470" V 7800 3600 50  0000 C CNN
F 2 "" V 7730 3600 50  0001 C CNN
F 3 "~" H 7800 3600 50  0001 C CNN
	1    7800 3600
	0    1    1    0   
$EndComp
Wire Wire Line
	3650 3800 3900 3800
Wire Wire Line
	3650 3800 2250 3800
Wire Wire Line
	2250 3800 2250 3850
Connection ~ 3650 3800
Wire Wire Line
	7050 2950 7050 3250
Wire Wire Line
	7650 3600 7550 3600
Wire Wire Line
	7350 3250 7550 3250
Wire Wire Line
	7550 3250 7550 3600
Connection ~ 7350 3250
Connection ~ 7550 3600
Wire Wire Line
	7550 3600 7450 3600
Wire Wire Line
	6850 3000 6850 3800
Wire Wire Line
	6850 3800 7950 3800
Wire Wire Line
	7950 3800 7950 3600
Connection ~ 6850 3000
Wire Wire Line
	5500 3000 6050 3000
Wire Wire Line
	6050 3000 6050 3250
Wire Wire Line
	6050 3250 7000 3250
Wire Wire Line
	7000 3250 7000 3600
Wire Wire Line
	7000 3600 7150 3600
Connection ~ 5500 3000
Wire Wire Line
	3650 1900 3650 3800
$EndSCHEMATC
