/* 

                            Optical Component parts for
                            Multi LED Stimulator v2.1.
                    
        An opensource LED stimulator for visual and optogenetics stimulation in combination with 2-photon recording



This 3D file is designed to be used along ThorLabs optical cage assemblies 

Source : https://github.com/BadenLab/Multi-Chromatic-Stmulator
This project is Open Source licensed, released under CERN OHL v1.2

by M.J.Y. Zimmermann and A.M. Chagas, 2019.02.25
Baden Lab, CRPC, School of Life Sciences, University of Sussex, United Kingdom

                                                                                     */


// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                            ---  User Parameters  ---                             */

Smoothness = 360;        // Number of facets. A value of 360 is recommended for a smooth print
tol = 0.1;               // Tolerance value, set by default to 0.1 for Ultimaker2 printer
Wall = 2.5;              // Wall thickness (applied only to certain modules)
wall = 2;                // Wall thickness (applied only to certain modules

// // // // // // // // // // // // // // // // // // // // // // // // // // // //
// // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                               ---  Switches  ---                              */
        LCP30 = 1;
        Mirror_Holder = 1;
        Dichroic_Frame = 1;


// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                         ---  Display Parameters  ---                             */

rotation = 45;      // mirror angle 
lens_offset = 1;
sep = 5;            // Separtion between objects (75 by default for proper display)


// // // // // // // // // // // // // // // // // // // // // // // // // // // //
// // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                        ---  Component Parameters  ---                        */

rod_pos2 = 60/2;         // Rod position for 60mm cage system
r_rod = 6.1/2 + tol/2;   // Rod radius 0.25 inch
S4 = 2.75/2;             // ThorLabs small holding screws 0.05 inch
r_lens_1_inch = 25.4/2;  // ThorLabs 1 inch Lens

Frame_Base = 10;
dichz = 25.4;
dichy = 1;
dichx = 36.2;

x_Frame = 36.2;
y_Frame = 3;
z_Frame = 25.4+1.5*Wall;
X_LCP30 = 73.7; //outer cube length
x_LCP30 = 40.7; //inner cube length
y_LCP30 = 40.6;
z_LCP30 = 12.70; //module thickness
y_Groove_LCP30 = 12.9;
x_arm_LCP30 = 16.5; //arm width
y_arm_LCP30 = 14; //arm length
x_ext_LCP30 = 96.3; //module diagonal length
pos_z_Screw_LCP30 = 5.6;
pos_x_screw_LCP30 = 67.3/2;
pos_y_screw_LCP30 = 26.7/2;

h_add=4;


 // // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                               ---  Display  ---                               */
if (LCP30==1){LCP();}
if (Mirror_Holder==1){translate([lens_offset,0,sep])rotate([0,0,rotation])mirror_holder();}
if (Dichroic_Frame==1){translate([lens_offset,0,z_LCP30+h_add+Frame_Base+2*sep])rotate([0,0,rotation])dich_frame();}


// // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                               ---  Modules  ---                               */

module LCP(){
difference(){
        union(){
            translate([-X_LCP30/2,-y_LCP30/2,0])cube([X_LCP30,y_LCP30,z_LCP30]);
             minkowski(){
                translate([-x_LCP30/2+2*tol+Wall,-y_LCP30/2+Wall,z_LCP30])cube([x_LCP30-2*tol-2*Wall,y_LCP30-2*Wall,h_add-Wall]);
                cylinder(r1=Wall,h=Wall,$fn=Smoothness);
            }
        }
        
        difference(){
           translate([-X_LCP30/2,-y_Groove_LCP30/2,0])cube([X_LCP30,y_Groove_LCP30,z_LCP30]);
           translate([-x_LCP30/2,-y_LCP30/2,0])cube([x_LCP30,y_LCP30,z_LCP30]);
        }
        
        Screw_LCP30();
        translate([lens_offset,0,0])cylinder(r=r_lens_1_inch,h=z_LCP30+h_add,$fn=Smoothness);
        
        //customisation
        translate([-X_LCP30/2,-y_LCP30/2,0])cube([X_LCP30/2-x_LCP30/2+2*tol,y_LCP30,z_LCP30]);
    }
    //customization
    difference(){
        
        translate([-X_LCP30/2,-y_Groove_LCP30/2+2*tol,0])cube([X_LCP30/2-x_LCP30/2+2*tol,y_Groove_LCP30-4*tol,z_LCP30]);
        
        Screw_LCP30();
        translate([-pos_x_screw_LCP30,0,0])cylinder(r=S4,h=z_LCP30,$fn=Smoothness);
    }
}

module Screw_LCP30(){ 
    translate([pos_x_screw_LCP30,pos_y_screw_LCP30,0])cylinder(r=S4,h=z_LCP30,$fn=Smoothness);
    translate([pos_x_screw_LCP30,-pos_y_screw_LCP30,0])cylinder(r=S4,h=z_LCP30,$fn=Smoothness);
    
    translate([rod_pos2,-y_LCP30/2,pos_z_Screw_LCP30])rotate([-90,0,0])cylinder(r=r_rod,h=y_LCP30,$fn=Smoothness);
    translate([-rod_pos2,-y_LCP30/2,pos_z_Screw_LCP30])rotate([-90,0,0])cylinder(r=r_rod,h=y_LCP30,$fn=Smoothness);
    
    
    translate([x_LCP30/2,0,z_LCP30+h_add/3])rotate([0,-90,0])cylinder(r=S4,h=x_LCP30/2,$fn=Smoothness);
    translate([x_LCP30/2,0,h_add+3])rotate([0,-90,0])cylinder(r=S4,h=x_LCP30/2,$fn=Smoothness);
    translate([0,x_LCP30/2,z_LCP30+h_add/3])rotate([90,0,0])cylinder(r=S4,h=x_LCP30/2,$fn=Smoothness);
    translate([0,-x_LCP30/2,z_LCP30+h_add/3])rotate([-90,0,0])cylinder(r=S4,h=x_LCP30/2,$fn=Smoothness);
}

module mirror_holder(){
cylinder(r=r_lens_1_inch-tol,h=z_LCP30+Wall+h_add,$fn=Smoothness);
    
translate([0,0,z_LCP30+h_add])difference(){
    translate([-x_Frame/2-1.5*Wall,-y_Frame/2-Wall,0])cube([x_Frame+3*Wall,y_Frame+2*Wall,z_Frame+Frame_Base]);
    
    translate([-x_Frame/2-tol,-y_Frame/2-Wall,Frame_Base])cube([x_Frame+2*tol,y_Frame+2*Wall,z_Frame+tol]);
    translate([-x_Frame/2-Wall-tol,-y_Frame/2-wall/2-tol,Frame_Base-Wall/2])cube([x_Frame+2*Wall+2*tol,y_Frame+wall+2*tol,z_Frame+Wall/2+tol]);
}
}

module dich_frame(){
difference(){    
    translate([-x_Frame/2-Wall,-y_Frame/2-wall/2,0])cube([x_Frame+2*Wall,y_Frame+wall,z_Frame]);

    translate([-dichx/2-tol,-y_Frame/2-wall/2,Wall-tol])cube([dichx+2*tol,dichy+wall/2,dichz+2*tol]);
    translate([-dichx/2+wall/2,-y_Frame/2-Wall,Wall-tol+wall/2])cube([dichx-wall,y_Frame+2*wall,dichz-wall]);
    translate([-Wall,-y_Frame/2-wall/2,z_Frame-Wall])cube([2*wall,dichy+wall/2,Wall]);
}
}


