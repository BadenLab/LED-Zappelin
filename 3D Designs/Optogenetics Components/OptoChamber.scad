/* 

                            Opto Chamber v1.1
                            
    
 
This 3D file is designed for the Multi-Chromatic Stimulator project components and its customed PCB
Source : https://github.com/BadenLab/LED-Zappelin
This project is Open Source licensed, released under CERN OHL v1.2

by Tom Baden
modified by MJY Zimmermann
Baden Lab, CRPC, School of Life Sciences, University of Sussex, United Kingdom, www.badenlab.org 

and Sinziana Pop
Prieto Lab, Francis Crick Institute, United Kingdom
                                                                                     */


// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                            ---  User Parameters  ---                             */

tol = 0.1;                // Printing tolerance
wall = 1.5;               // Defines the wall thickness of the chamber
Smoothness = 30;         // Number of facets


// // // // // // // // // // // // // // // // // // // // // // // // // // // //
// // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                               ---  Switches  ---                              */

Version = 2;              // Select either version 1 or 2, or enter 0 for no display
Platform = 1;             // Enter 1 for displaying the mounting platform, 0 to hide it


// // // // // // // // // // // // // // // // // // // // // // // // // // // //
// // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                        ---  Component Parameters  ---                        */

thickwall = 7;            // Inner circle thickness
Asub_r = 39.5/2 + tol;    // Petri dish hole radius 
R_Accessgroove = 6;       // Access groove radius

A_h= wall;                // Chamber heigh
A_r = 39.2;               // Chamber radius
A_h2= 9;                  // Inner circle heigh
A_r2= Asub_r + thickwall; // Inner circle radius

A_LED_r = 2.3 + tol;      // LED holder radius
A_LED_zpos = A_h2-4.5;    // LED holder heigh position

Olf_width = 21;           // Width for the olfactory system

mount_width = 50.8;       // Platform width
stage_depth = 8;          // Stage height
stage_width = 100;        // Stage width
stage_length = 75;        // Stage length


rect_hole_width = 23;
rect_hole_length = 100;
rect_hole_y = 70;

circ_hole_rad = 32.5+tol;

screw_rad = 6/2+tol;
screw_coord1 = 12.9;
screw_coord2 = 37.9;


magnet_rad = 14/2+tol;    // Mounting magnet radius
magnet_depth = 3+tol;     // Mounting magnet height

magnet1_x = -15;          // First magnet x_position
magnet1_y = 116;          // First magnet y_position

magnet2_x = 66;           // Second magnet x_position
magnet2_y = 61;           // Second magnet y_position



 // // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                               ---  Display  ---                               */

if (Version==1){rotate([0,0,40])
    difference(){ 
        A();
        Asub(); 
    }
    difference(){ 
        B();
        Bsub(); 
    }
}
 
if (Version==2){rotate([0,0,45])
    difference(){ 
        A2();
        A2sub(); 
    }   
    difference(){ 
        B2();
        B2sub(); 
    }
}

if (Platform==1){
    translate([-25,-90,-9])stage();
}


// // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                               ---  Modules  ---                               */

module A() {
	translate([0,0,0])rotate([0,0,0])cylinder($fn=Smoothness, r=A_r, h=A_h, center=true); // Main_rim
	translate([0,0,-A_h2/2])rotate([0,0,0])cylinder($fn=Smoothness, r=A_r2, h=A_h2, center=true); // Main_sub
}

module Asub() {
	translate([0,0,-A_h2/2+wall])rotate([0,0,0]){cylinder($fn=Smoothness, r=Asub_r, h = A_h2, center = true); } // Main	
    translate([0,0,-A_h2/2+wall]){ rotate([0,0,0]){ cylinder( $fn=Smoothness, r = Asub_r-wall, h = 100, center = true); }} // Through hole

    translate([Asub_r*sqrt(2)/2,-Asub_r*sqrt(2)/2,-A_h2/2+wall]){ rotate([0,0,0]){ cylinder( $fn=Smoothness, r = R_Accessgroove, h = A_h2, center = true); }} // Chamber access-aid hole	

    translate([-Asub_r*sqrt(2)/2,Asub_r*sqrt(2)/2,-A_h2/2+wall]){ rotate([0,0,0]){ cylinder( $fn=Smoothness, r = R_Accessgroove, h = A_h2, center = true); }} // Chamber access-aid hole	

    translate([sqrt(2)*A_r/2-2,sqrt(2)*A_r/2-2,-A_h2/2+wall]){ rotate([0,0,0]){ cylinder( $fn=Smoothness, r = Asub_r-thickwall, h = 100, center = true); }} // Cable hole

	translate([0,0,-A_LED_zpos]){ rotate([0,90,0]){ cylinder( $fn=Smoothness, r = A_LED_r, h = 100, center = true); }} // LEDs
	translate([0,0,-A_LED_zpos]){ rotate([90,0,0]){ cylinder( $fn=Smoothness, r = A_LED_r, h = 100, center = true); }} // LEDs
}

module B() {
	translate([0,0,0]){ rotate([0,0,0]){ cylinder( $fn=Smoothness, r = A_r, h = A_h, center = true); }} // Main_rim
}


module Bsub() {
	translate([0,0,-A_h2/2+wall]){ rotate([0,0,0]){ cylinder( $fn=Smoothness, r = A_r - 5, h = A_h2, center = true); }} // Main	
}

module A2() {
	translate([0,0,0]){ rotate([0,0,0]){ cylinder( $fn=Smoothness, r = A_r, h = A_h, center = true); }} // Main_rim
	translate([0,0,-A_h2/2]){ rotate([0,0,0]){ cylinder( $fn=Smoothness, r = A_r2, h = A_h2, center = true); }} // Main_sub
}

module A2sub() {
	translate([0,0,-A_h2/2+wall]){ rotate([0,0,0]){ cylinder( $fn=Smoothness, r = Asub_r, h = A_h2, center = true); }} // Main	
    translate([0,0,-A_h2/2+wall]){ rotate([0,0,0]){ cylinder( $fn=Smoothness, r = Asub_r-wall, h = 100, center = true); }} // Through hole

    translate([Asub_r*sqrt(2)/2,-Asub_r*sqrt(2)/2,-A_h2/2+wall]){ rotate([0,0,0]){ cylinder( $fn=Smoothness, r = R_Accessgroove, h = A_h2, center = true); }} // Chamber access-aid hole	

    translate([-Asub_r*sqrt(2)/2,Asub_r*sqrt(2)/2,-A_h2/2+wall]){ rotate([0,0,0]){ cylinder( $fn=Smoothness, r = R_Accessgroove, h = A_h2, center = true); }} // Chamber access-aid hole	

    translate([sqrt(2)*A_r/2-2,sqrt(2)*A_r/2-2,-A_h2/2+wall]){ rotate([0,0,0]){ cylinder( $fn=Smoothness, r = Asub_r-thickwall, h = 100, center = true); }} // Cable hole

	translate([0,0,-A_LED_zpos]){ rotate([0,90,0]){ cylinder( $fn=Smoothness, r = A_LED_r, h = 100, center = true); }} // LEDs
	translate([0,0,-A_LED_zpos]){ rotate([90,0,0]){ cylinder( $fn=Smoothness, r = A_LED_r, h = 100, center = true); }} // LEDs

    translate([0,0,-A_LED_zpos]){ rotate([45,90,0]){ cylinder( $fn=Smoothness, r = A_LED_r, h = 100, center = true); }} // LEDs NEW
	translate([0,0,-A_LED_zpos]){ rotate([-45,90,0]){ cylinder( $fn=Smoothness, r = A_LED_r, h = 100, center = true); }} // LEDs NEW

    translate([-Asub_r+5,-Asub_r+5,0]){ rotate([0,0,45]){ cube([12,Olf_width,100], center = true); }} // Olfaction stuff hole	
}

module B2() {
	translate([0,0,0]){ rotate([0,0,0]){ cylinder( $fn=Smoothness, r = A_r, h = A_h, center = true); }} // Main_rim  
}

module B2sub() {
	translate([0,0,-A_h2/2+wall]){ rotate([0,0,0]){ cylinder( $fn=Smoothness, r = A_r - 5, h = A_h2, center = true); }} // Main
}

module stage() {
    difference() {
        stage_add();
        stage_sub();
    }
}


module stage_add() {
    cube([mount_width,mount_width,stage_depth]);
    translate([-(stage_width - mount_width)/2,mount_width,0]) {
        cube([stage_width,stage_length,stage_depth]);
    };
    
}

module stage_sub() {
    
    // round stage hole
     translate([mount_width/2,mount_width + stage_length - circ_hole_rad,0]) {
        cylinder(stage_depth,circ_hole_rad,circ_hole_rad, $fn=Smoothness);
    };
    
    // space for olfactory stimulator
    translate([(mount_width - rect_hole_width)/2,rect_hole_y,0]) {
        cube([rect_hole_width,rect_hole_length,stage_depth]);
    };
    
     // center M6 screw hole
    translate([mount_width/2,mount_width/2,0]) {
        cylinder(stage_depth,screw_rad,screw_rad, $fn=Smoothness);
    };
    
     // top left M6 screw hole
    translate([screw_coord1,screw_coord2,0]) {
        cylinder(stage_depth,screw_rad,screw_rad, $fn=Smoothness);
    };
    
     // top right M6 screw hole
    translate([screw_coord2,screw_coord2,0]) {
        cylinder(stage_depth,screw_rad,screw_rad, $fn=Smoothness);
    };
    
     // bottom left M6 screw hole
    translate([screw_coord1,screw_coord1,0]) {
        cylinder(stage_depth,screw_rad,screw_rad, $fn=Smoothness);
    };
    
     // bottom right M6 screw hole
    translate([screw_coord2,screw_coord1,0]) {
        cylinder(stage_depth,screw_rad,screw_rad, $fn=Smoothness);
    };
    
 
     // magnet hole 1
    translate([magnet1_x,magnet1_y,stage_depth - magnet_depth]) {
        cylinder(magnet_depth,magnet_rad,magnet_rad, $fn=Smoothness);
    };
    
    
      // magnet hole 2
    translate([magnet2_x,magnet2_y,stage_depth - magnet_depth]) {
        cylinder(magnet_depth,magnet_rad,magnet_rad, $fn=Smoothness);
    };
    
}
