/* 
                 LED Holder design to fit into a Thorlab 1 inch diameter lens holder
                            
        This holder has been designed to fit into the stimulator described in:
        Multi LED Stimulator v2.1: An opensource LED stimulator for visual and optogenetics 
        stimulation in combination with 2-photon recording

This project is Open Source licensed, released under CERN OHL v1.2

by M.J.Y. Zimmermann, 2018.12.11
Baden Lab, CRPC, School of Life Sciences, University of Sussex, United Kingdom



// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                            ---  User Parameters  ---                             */

Wall = 2;           // Defines the wall thickness of the box
Smoothness = 360;   // Number of facets
tol = 0.1;          // Printing tolerance

// // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                               ---  Switches  ---                              */

n_LED = 1;          // Determine the number of LEDs to mount (from 1 to 7)


// // // // // // // // // // // // // // // // // // // // // // // // // // // //
// // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                        ---  Component Parameters  ---                        */

r_lens_1_inch    = 25.8/2;      // ThorLabs 1 inch diameter lens radius
r_inner_ring     = 22.8/2;      // ThorLabs 1 inch diameter lens ring radius
h_ring           = 2;           // ThorLabs 1 inch diameter lens ring heigh

r_LED            = 6.35/2;      // 5mm LED radius
h_LED_Holder     = 3;
d_LED_Holder     = 8;           // 5mm LED clip diameter
h_clip           = 1;           // inside 5mm LED clip heigh
r_Clip           = 7.5/2+tol;   // 5mm LED clip radius



// // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                               ---  Display  ---                               */

difference(){
    LED_holder();
    
    if (n_LED==1){
        LED_hole();
    }
    if (n_LED==2){
        for (a=[0:180:360])rotate([0,0,a])translate([0,7,0])LED_hole();
    }
    if (n_LED==3){
        for (a=[0:360/3:360])rotate([0,0,a])translate([0,d_LED_Holder,0])LED_hole();
    }
    if (n_LED==4){
        LED_hole();
        for (a=[0:360/3:360])rotate([0,0,a])translate([0,d_LED_Holder,0])LED_hole();
    }
    if (n_LED==5){
        LED_hole();
        for (a=[0:360/4:360])rotate([0,0,a])translate([0,d_LED_Holder,0])LED_hole();
    }
    if (n_LED==6){
        LED_hole();
        for (a=[0:360/5:360])rotate([0,0,a])translate([0,d_LED_Holder,0])LED_hole();
    }
    if (n_LED==7){
        LED_hole();
        for (a=[0:360/6:360])rotate([0,0,a])translate([0,d_LED_Holder,0])LED_hole();
    }
}


// // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                               ---  Modules  ---                               */

module LED_holder(){
    difference(){
        cylinder(r=r_lens_1_inch-tol, h=h_LED_Holder, $fn=Smoothness);
    
        translate([0,0,h_ring])difference(){
            cylinder(r=r_lens_1_inch, h=h_LED_Holder, $fn=Smoothness);
            cylinder(r=r_inner_ring-tol, h=h_LED_Holder, $fn=Smoothness);
        }
    } 
}

module LED_hole(){
    cylinder(r=r_LED, h=h_LED_Holder, $fn=Smoothness);
    translate([0,0,h_clip])cylinder(r=r_Clip,h=h_LED_Holder,$fn=Smoothness);
}