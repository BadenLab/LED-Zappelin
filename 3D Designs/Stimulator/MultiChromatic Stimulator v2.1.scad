/* 


                            Multi LED Stimulator v2.1.
                    
        An opensource LED stimulator for visual and optogenetics stimulation in combination with 2-photon recording



This 3D file is designed for the Multi-Chromatic Stimulator project components and its customed PCB
Source : https://github.com/BadenLab/Multi-Chromatic-Stmulator
This project is Open Source licensed, released under CERN OHL v1.2

by M.J.Y. Zimmermann, 2018.12.11
Baden Lab, CRPC, School of Life Sciences, University of Sussex, United Kingdom

                                                                                     */



// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                            ---  User Parameters  ---                             */
 
Wall = 2;           // Defines the wall thickness of the box
Smoothness = 360;   // Number of facets
tol = 0.1;          // Printing tolerance
TOL = 0.4;          // Component tolerance

sep = 7;            // x & y separation values for display function
zsep = 7;           // z separation values for display function


// // // // // // // // // // // // // // // // // // // // // // // // // // // //
// // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                               ---  Switches  ---                              */

Bottom = 1;
Front = 1;
Right = 1;
Left = 1;
Back = 1;
Lid = 1;

LED_Option = 1;
LED_Holder = 1;

PCB = 10;
Power_Switch = 10;

// // // // // // // // // // // // // // // // // // // // // // // // // // // //
// // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                        ---  Component Parameters  ---                        */
// Customed PCB
    x_PCB = 125;
    y_PCB = 75;
    z_PCB = 1;
    
// Box
    x_Box = x_PCB + 2*TOL;
    y_Box = y_PCB + 2*TOL + 6*Wall;
    z_Box = 50; 
    
// Number of LED channel
    n_LED = 4;          

// Potentiometer Board
    x_pot = 40;
    y_pot = 30;
    z_pot = 6.86+z_PCB;
    z_pot2 = 4.9+z_PCB;
    d_pot = 10.26;
    r_pot = 3/2+tol;
    pot_pitch = 2.54*4;
    pos_z_pot = z_Box-20;
    x_Support = 2*Wall;
    z_Support = 5*Wall;
    y_Support = sqrt((y_pot+Wall)*(y_pot+Wall)+z_Support*z_Support);
    rotate_Support = [atan((y_pot+Wall)/z_Support),0,0];
    
// M3
    r_M3 = 3/2;
    R_M3 = 4/2;
    r_M3_Nut = 6.44/2;
    h_M3_Nut = 2.3;
    
// M4
    r_M4 = 4/2;
    R_M4 = 6.85/2;
    r_M4_Nut = 7.8/2;
    h_M4_Nut = 2.1;
    
 
    pos_x_PCB1 = -x_PCB/2 + 25+2*Wall;
    pos_x_PCB2 = -x_PCB/2 + 110.25+2*Wall;
    pos_y_PCB1 = -y_PCB/2 + 15+2*Wall;
    pos_y_PCB2 = -y_PCB/2 + 55+2*Wall;
    pos_z_PCB = 7.5;
    
// BNC
    pos_y_BNC1 = 13+2*Wall;
    pos_y_BNC2 = 57.75+2*Wall;
    pos_z_BNC2 = 15.8/2;
    h_BNC = 15.8/2;
    r_BNC = 12.83/2;
    cut_BNC = r_BNC-5.54;
    pos_z_BNC = pos_z_PCB + z_PCB + pos_z_BNC2 + 2*tol;
    
// Barrel Jack
    h_Jack = 11.15 + 2*tol;
    y_Jack = 9.25 + 2*tol;
    pos_y_Jack = 47.75;
    
// USB
    y_USB = 10.8;
    z_USB = 7.7;
    pos_z_USB = pos_z_PCB + z_PCB + 12.25+1.25;
    
// Box
    f1=15;
    f2=x_Box+4*Wall-f1-35;  
    b1=20;
    b2=x_Box+4*Wall-b1-20;
    r1=25;
    r2=y_Box+4*Wall-r1-25;
    l1=13;
    l2=y_Box+4*Wall-l1-15;
    
// LEDs
    r_LED = 4.75/2 + tol;
    R_LED = 3/2;
    x_LED = 2*R_LED + 2.5*Wall;
    d_LED = 10;
    pos_LED = [-x_Box/2+f1+2*Wall,-y_Box/2-Wall,z_Box/2+15.05];
    h_Sheet = 0.3;
    z_Sheet = Wall - h_Sheet;
    r_Cable = 15/2;

// Connectors
    x_connector = 7.5;
    x_connector2 = 10;
    y_connector = 6;
    z_connector = 15;

// Adafruit TLC
    x_TLC = 51.3;
    y_TLC = 25.5;
    z_TLC = 12.75;

//Adafruit ESP32 Feather HUZZAH   
    x_ESP = 51;
    y_ESP = 23;
    z_ESP = 12.75;
     
// Power Switch
    r_Switch = 20.5/2+tol;
    x_Switch = 10.75;
    y_Switch = 22.5;
    z_Switch = 15;
    pos_z_Switch = 22.5;
    
// Screws
    pos_x_Screw1 = -x_Box/2+2*Wall;
    pos_x_Screw2 = x_Box/2+2*Wall;
    pos_y_Screw1 = -y_Box/2+2*Wall;
    pos_y_Screw2 = y_Box/2+2*Wall;
    

 // // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                               ---  Display  ---                               */

if(Bottom==1){
    difference(){
        Box();
        
        translate([-x_Box/2-tol,-y_Box/2-tol,z_Box-Wall-2*tol])cube([x_Box+4*Wall+2*tol,y_Box+4*Wall+2*tol,2*Wall+4*tol]);
        Front_neg();
        Back_neg();
        Left_neg();
        Right_neg();  
    }
}
if(Front==1){translate([0,-sep,zsep]){
    difference(){
        intersection(){
            Box();
            Front();
        }
        Right_neg();
        Left_neg();
    }
    if (LED_Option==1)LED();
}}
if(Back==1){translate([0,sep,zsep]){
    difference(){
        intersection(){
            Box();
            Back();
        }
        Right_neg();
        Left_neg();
        Potentiometer();
    }
    Potentiometer_Platform();
}}
if(Right==1){translate([sep,0,2*zsep]){
    difference(){
        intersection(){
            Box();
            Right();
        }
    }
}}

if(Left==1)translate([-sep,0,2*zsep]){
    difference(){
        intersection(){
            Box();
            Left();
        }
    }
}

if(Lid==1)translate([0,0,3*zsep+tol]){
    difference(){
        union(){
            Lid();
            Box();
        }
        Top_neg();
        Screws();
        Logo();
        Labels();
    }
}

if(LED_Holder==1)translate([0,sep,0]){
    LED_Holder();
}

if(PCB==1){
    color([0,1,0])PCB();
}
if(Power_Switch==1){
    color([0,0,1])Switch();
}

// // // // // // // // // // // // // // // // // // // // // // // // // // // //
/*                               ---  Modules  ---                               */
   

module Box(){
   difference(){
       minkowski(){
           translate([-x_Box/2+Wall,-y_Box/2+Wall,0])cube([x_Box+2*Wall,y_Box+2*Wall,z_Box-Wall]);
           cylinder(r1=Wall,h=Wall,$fn=Smoothness);
       }
       difference(){
           translate([-x_Box/2+2*Wall,-y_Box/2+2*Wall,Wall])cube([x_Box,y_Box,z_Box+tol]);
           Corners();
       }
       Screws();
       Nuts();
       BNC();
       Jack();
       USB();
       Power_Switch();
       Labels();
       if (LED_Option==1)LED_neg();
       LED_Cables();
   }
   
    Platform();
    
   
}

module Lid(){
   difference(){
      translate([-x_Box/2+2*Wall,-y_Box/2+2*Wall,z_Box-2*Wall])cube([x_Box,y_Box,2*Wall]);
  } 
}

module PCB(){
    translate([-x_PCB/2,-y_PCB/2,pos_z_PCB])cube([x_PCB,y_PCB,z_PCB]);
    for (aa = [0:10:110]){
        translate([-x_PCB/2+aa,-y_PCB/2+0.5,pos_z_PCB+z_PCB])cube([x_connector,y_connector,z_connector]);
    }
    for (bb = [0:10:110]){
        translate([-x_PCB/2+bb,y_PCB/2-0.5-y_connector,pos_z_PCB+z_PCB])cube([x_connector,y_connector,z_connector]);
    }
    for (aaa = [126.5:10:186.5]){
        translate([-x_PCB/2+aaa,-y_PCB/2+0.5,pos_z_PCB+z_PCB])cube([x_connector,y_connector,z_connector]);
    }
    for (bbb = [126.5:10:186.5]){
        translate([-x_PCB/2+bbb,y_PCB/2-0.5-y_connector,pos_z_PCB+z_PCB])cube([x_connector,y_connector,z_connector]);
    }
    
    translate([x_PCB/2-0.5-y_connector,-y_PCB/2+11.7,pos_z_PCB+z_PCB])cube([y_connector,x_connector,z_connector]);
    translate([x_PCB/2-0.5-y_connector,-y_PCB/2+23.25,pos_z_PCB+z_PCB])cube([y_connector,x_connector2,z_connector]);
    translate([x_PCB/2-0.5-y_connector,-y_PCB/2+47.6,pos_z_PCB+z_PCB])cube([y_connector,x_connector,z_connector]);
    translate([x_PCB/2-0.5-y_connector,-y_PCB/2+59.4,pos_z_PCB+z_PCB])cube([y_connector,x_connector,z_connector]);
    
    translate([x_PCB/2-15+2,-y_PCB/2+34.75,pos_z_PCB+z_PCB])cube([15,y_Jack,h_Jack]);
    

     
     translate([-x_PCB/2+56.5,-y_PCB/2+25,pos_z_PCB+z_PCB])cube([x_TLC,y_TLC,z_TLC]);
    translate([-x_PCB/2+128,-y_PCB/2+25,pos_z_PCB+z_PCB])cube([x_TLC,y_TLC,z_TLC]);
     
     translate([-x_PCB/2,-y_PCB/2+23.5,pos_z_PCB+z_PCB])cube([x_ESP,y_ESP,z_ESP]);
}

module Platform(){
    difference(){
        union(){
            translate([pos_x_PCB1,pos_y_PCB1,Wall])cylinder(r1=r_M3+2*Wall,r2=r_M3+Wall,h=pos_z_PCB-Wall,$fn=Smoothness);
            translate([pos_x_PCB1,pos_y_PCB2,Wall])cylinder(r1=r_M3+2*Wall,r2=r_M3+Wall,h=pos_z_PCB-Wall,$fn=Smoothness);
            translate([pos_x_PCB2,pos_y_PCB1,Wall])cylinder(r1=r_M3+2*Wall,r2=r_M3+Wall,h=pos_z_PCB-Wall,$fn=Smoothness);
            translate([pos_x_PCB2,pos_y_PCB2,Wall])cylinder(r1=r_M3+2*Wall,r2=r_M3+Wall,h=pos_z_PCB-Wall,$fn=Smoothness);
        }
        Screws();
        Nuts();
    }
}

module Screws(){
    translate([pos_x_PCB1,pos_y_PCB1,0])cylinder(r=r_M3,h=pos_z_PCB+tol,$fn=Smoothness);
    translate([pos_x_PCB1,pos_y_PCB2,0])cylinder(r=r_M3,h=pos_z_PCB+tol,$fn=Smoothness);
    translate([pos_x_PCB2,pos_y_PCB1,0])cylinder(r=r_M3,h=pos_z_PCB+tol,$fn=Smoothness);
    translate([pos_x_PCB2,pos_y_PCB2,0])cylinder(r=r_M3,h=pos_z_PCB+tol,$fn=Smoothness);
    
    translate([pos_x_Screw1,pos_y_Screw1,-tol])cylinder(r=r_M4,h=z_Box+Wall+2*tol,$fn=Smoothness);
    translate([pos_x_Screw1,pos_y_Screw2,-tol])cylinder(r=r_M4,h=z_Box+Wall+2*tol,$fn=Smoothness);
    translate([pos_x_Screw2,pos_y_Screw1,-tol])cylinder(r=r_M4,h=z_Box+Wall+2*tol,$fn=Smoothness);
    translate([pos_x_Screw2,pos_y_Screw2,-tol])cylinder(r=r_M4,h=z_Box+Wall+2*tol,$fn=Smoothness);
    
    translate([pos_x_Screw1,pos_y_Screw1,z_Box-Wall/2])cylinder(r=R_M4,h=z_Box+Wall+2*tol,$fn=Smoothness);
    translate([pos_x_Screw1,pos_y_Screw2,z_Box-Wall/2])cylinder(r=R_M4,h=z_Box+Wall+2*tol,$fn=Smoothness);
    translate([pos_x_Screw2,pos_y_Screw1,z_Box-Wall/2])cylinder(r=R_M4,h=z_Box+Wall+2*tol,$fn=Smoothness);
    translate([pos_x_Screw2,pos_y_Screw2,z_Box-Wall/2])cylinder(r=R_M4,h=z_Box+Wall+2*tol,$fn=Smoothness);
}

module Nuts(){
    translate([pos_x_PCB1,pos_y_PCB1,-tol])cylinder(r=r_M3_Nut,h=h_M3_Nut+Wall,$fn=6);
    translate([pos_x_PCB1,pos_y_PCB2,-tol])cylinder(r=r_M3_Nut,h=h_M3_Nut+Wall,$fn=6);
    translate([pos_x_PCB2,pos_y_PCB1,-tol])cylinder(r=r_M3_Nut,h=h_M3_Nut+Wall,$fn=6);
    translate([pos_x_PCB2,pos_y_PCB2,-tol])cylinder(r=r_M3_Nut,h=h_M3_Nut+Wall,$fn=6);
    
    translate([pos_x_Screw1,pos_y_Screw1,-tol])cylinder(r=r_M4_Nut,h=h_M4_Nut+Wall,$fn=6);
    translate([pos_x_Screw1,pos_y_Screw2,-tol])cylinder(r=r_M4_Nut,h=h_M4_Nut+Wall,$fn=6);
    translate([pos_x_Screw2,pos_y_Screw1,-tol])cylinder(r=r_M4_Nut,h=h_M4_Nut+Wall,$fn=6);
    translate([pos_x_Screw2,pos_y_Screw2,-tol])cylinder(r=r_M4_Nut,h=h_M4_Nut+Wall,$fn=6);
}

module Corners(){
    translate([pos_x_Screw1,pos_y_Screw1,Wall])cylinder(r1=r_M4+2*Wall,r2=r_M4+Wall/2,h=pos_z_PCB-Wall-TOL,$fn=Smoothness);
    translate([pos_x_Screw1,pos_y_Screw2,Wall])cylinder(r1=r_M4+2*Wall,r2=r_M4+Wall/2,h=pos_z_PCB-Wall-TOL,$fn=Smoothness);
    translate([pos_x_Screw2,pos_y_Screw1,Wall])cylinder(r1=r_M4+2*Wall,r2=r_M4+Wall/2,h=pos_z_PCB-Wall-TOL,$fn=Smoothness);
    translate([pos_x_Screw2,pos_y_Screw2,Wall])cylinder(r1=r_M4+2*Wall,r2=r_M4+Wall/2,h=pos_z_PCB-Wall-TOL,$fn=Smoothness);
    
    translate([pos_x_Screw1,pos_y_Screw1,0])cylinder(r=r_M4+Wall/2,h=z_Box,$fn=Smoothness);
    translate([pos_x_Screw1,pos_y_Screw2,0])cylinder(r=r_M4+Wall/2,h=z_Box,$fn=Smoothness);
    translate([pos_x_Screw2,pos_y_Screw1,0])cylinder(r=r_M4+Wall/2,h=z_Box,$fn=Smoothness);
    translate([pos_x_Screw2,pos_y_Screw2,0])cylinder(r=r_M4+Wall/2,h=z_Box,$fn=Smoothness);
}
    
module BNC(){
    translate([-x_Box/2-tol,-y_PCB/2+pos_y_BNC1,pos_z_BNC])difference(){
        rotate([0,90,0])cylinder(r=r_BNC+tol,h=2.5*Wall+TOL,$fn=Smoothness);
        translate([0,-r_BNC,r_BNC-cut_BNC])cube([2.5*Wall+TOL,2*r_BNC,cut_BNC+Wall]);
    }
    translate([-x_Box/2-tol,-y_PCB/2+pos_y_BNC2,pos_z_BNC])difference(){
        rotate([0,90,0])cylinder(r=r_BNC+tol,h=2.5*Wall+TOL,$fn=Smoothness);
        translate([0,-r_BNC,r_BNC-cut_BNC])cube([2.5*Wall+TOL,2*r_BNC,cut_BNC+Wall]);
    }
}    

module USB(){
    minkowski(){
        translate([-x_Box/2-tol,-y_USB/2-tol,pos_z_USB])cube([2*Wall+tol,y_USB+2*tol,z_USB,]);
        rotate([0,90,0])cylinder(r=1.25,h=1, $fn=Smoothness);
    }
}
    
module Jack(){
    translate([x_PCB/2+2*Wall,-y_Jack/2+2*Wall,pos_z_PCB+z_PCB])cube([2.5*Wall+TOL+tol,y_Jack,h_Jack]);
}

// // // // // // // // // // // // Compartimentation Modules // // // // // // // // // // // //


module Front(){
    difference(){
        union(){
            translate([-x_Box/2,-y_Box/2,z_Box*1/3-Wall])cube([f1,4*Wall,z_Box*2/3]);
            translate([-x_Box/2+f1,-y_Box/2,3*Wall])cube([f2,4*Wall,z_Box-4*Wall]);
            translate([-x_Box/2+f1+f2,-y_Box/2,z_Box*1/3-Wall])cube([x_Box+4*Wall-f1-f2,4*Wall,z_Box*2/3]);
        }  
        translate([-x_Box/2,-y_Box/2,z_Box*1/3-Wall])cube([f1,Wall,Wall]);//Front Left
        translate([-x_Box/2+f1,-y_Box/2+Wall,3*Wall])cube([f2,Wall,Wall]);//Front Middle
        translate([-x_Box/2+f1+f2,-y_Box/2,z_Box*1/3-Wall])cube([x_Box+4*Wall-f1-f2,Wall,Wall]);//Front Right
    }
}
module Front_neg(){
    difference(){
        union(){
            translate([-x_Box/2,-y_Box/2,z_Box*1/3-Wall-tol])cube([f1,4*Wall+tol,z_Box*2/3+tol+Wall]);
            translate([-x_Box/2+f1-tol,-y_Box/2-tol,3*Wall-tol])cube([f2+2*tol,4*Wall+tol,z_Box-4*Wall+tol]);
            translate([-x_Box/2+f1+f2,-y_Box/2,z_Box*1/3-Wall-tol])cube([x_Box+4*Wall-f1-f2,4*Wall+tol,z_Box*2/3+tol+Wall]);
        }  
        translate([-x_Box/2,-y_Box/2,z_Box*1/3-Wall-tol])cube([f1-tol,Wall-tol,Wall]);//Front Left
        translate([-x_Box/2+f1-tol,-y_Box/2+Wall+tol,3*Wall-tol])cube([f2+2*tol,Wall-tol,Wall]);//Front Middle
        translate([-x_Box/2+f1+f2+tol,-y_Box/2,z_Box*1/3-Wall-tol])cube([x_Box+4*Wall-f1-f2-tol,Wall-tol,Wall]);//Front Right
    }
}

module Back(){
    difference(){
        union(){
            translate([-x_Box/2,y_Box/2,z_Box*1/3-Wall])cube([b1,4*Wall,z_Box*2/3]);
            translate([-x_Box/2+b1,y_Box/2,3*Wall])cube([b2,4*Wall,z_Box-4*Wall]);
            translate([-x_Box/2+b1+b2,y_Box/2,z_Box*1/3-Wall])cube([x_Box+4*Wall-b1-b2,4*Wall,z_Box*2/3]);
        }
        translate([-x_Box/2,y_Box/2+3*Wall,z_Box*1/3-Wall])cube([b1,Wall,Wall]);//Front Left
        translate([-x_Box/2+b1,y_Box/2+2*Wall,3*Wall])cube([b2,Wall,Wall]);//Front Middle
        translate([-x_Box/2+b1+b2,y_Box/2+3*Wall,z_Box*1/3-Wall])cube([x_Box+4*Wall-b1-b2,Wall,Wall]);//Front Right
    }
}
module Back_neg(){
    difference(){
        union(){
            translate([-x_Box/2,y_Box/2-tol,z_Box*1/3-Wall-tol])cube([b1-tol,4*Wall+tol,z_Box*2/3+tol+Wall]);
            translate([-x_Box/2+b1-tol,y_Box/2,3*Wall-tol])cube([b2+2*tol,4*Wall,z_Box-4*Wall+tol]);
            translate([-x_Box/2+b1+b2,y_Box/2-tol,z_Box*1/3-Wall-tol])cube([x_Box+4*Wall-b1-b2,4*Wall+tol,z_Box*2/3+tol+Wall]);
        }
        translate([-x_Box/2,y_Box/2+3*Wall+tol,z_Box*1/3-Wall-tol])cube([b1-tol,Wall,Wall]);//Front Left
        translate([-x_Box/2+b1-tol,y_Box/2+2*Wall,3*Wall-tol])cube([b2+2*tol,Wall-tol,Wall]);//Front Middle
        translate([-x_Box/2+b1+b2+tol,y_Box/2+3*Wall+tol,z_Box*1/3-Wall-tol])cube([x_Box+4*Wall-b1-b2+tol,Wall,Wall]);//Front Right
    }
}

module Right(){
    difference(){
        union(){
            translate([x_Box/2,-y_Box/2,z_Box*2/3-Wall])cube([4*Wall,r1,z_Box*1/3]);
            translate([x_Box/2,-y_Box/2+r1,3*Wall])cube([4*Wall,r2,z_Box-4*Wall]);
            translate([x_Box/2,-y_Box/2+r1+r2,z_Box*2/3-Wall])cube([4*Wall,y_Box+4*Wall-r1-r2,z_Box*1/3]);
        }
        translate([x_Box/2+3*Wall,-y_Box/2,z_Box*2/3-Wall])cube([Wall,r1,Wall]);// Right Back
        translate([x_Box/2+2*Wall,-y_Box/2+r1,3*Wall])cube([Wall,r2,Wall]); // Right Middle
        translate([x_Box/2+3*Wall,-y_Box/2+r1+r2,z_Box*2/3-Wall])cube([Wall,y_Box+4*Wall-r1-r2,Wall]);// Right Front
    }
}
module Right_neg(){
    difference(){
        union(){
            translate([x_Box/2-tol,-y_Box/2,z_Box*2/3-Wall-tol])cube([4*Wall+2*tol,r1-tol,z_Box*1/3+tol]);
            translate([x_Box/2,-y_Box/2+r1-tol,3*Wall-tol])cube([4*Wall+tol,r2+2*tol,z_Box-4*Wall+tol]);
            translate([x_Box/2-tol,-y_Box/2+r1+r2,z_Box*2/3-Wall-tol])cube([4*Wall+2*tol,y_Box+4*Wall-r1-r2,z_Box*1/3+tol]);
        }
        translate([x_Box/2+3*Wall+tol,-y_Box/2,z_Box*2/3-Wall-tol])cube([Wall,r1-tol,Wall]);// Right Back
        translate([x_Box/2+2*Wall-tol,-y_Box/2+r1-tol,3*Wall-tol])cube([Wall,r2+2*tol,Wall]); // Right Middle
        translate([x_Box/2+3*Wall+tol,-y_Box/2+r1+r2+tol,z_Box*2/3-Wall-tol])cube([Wall,y_Box+4*Wall-r1-r2,Wall]);// Right Front
    }
}

module Left(){
    difference(){
        union(){
            translate([-x_Box/2,-y_Box/2,z_Box*2/3-Wall])cube([4*Wall,l1,z_Box*1/3]);
            translate([-x_Box/2,-y_Box/2+l1,3*Wall])cube([4*Wall,l2,z_Box-4*Wall]);
            translate([-x_Box/2,-y_Box/2++l1+l2,z_Box*2/3-Wall])cube([4*Wall,y_Box+4*Wall-l1-l2,z_Box*1/3]);
        }
        translate([-x_Box/2,-y_Box/2,z_Box*2/3-Wall])cube([Wall,l1,Wall]);// Left Back
        translate([-x_Box/2+Wall-tol,-y_Box/2+l1,3*Wall])cube([2*Wall,l2,Wall]); // Left Middle
        translate([-x_Box/2,-y_Box/2+l1+l2,z_Box*2/3-Wall])cube([Wall,y_Box+4*Wall-l1-l2,Wall]);// Left Front
    }
}
module Left_neg(){
    difference(){
        union(){
            translate([-x_Box/2-tol,-y_Box/2,z_Box*2/3-Wall-tol])cube([4*Wall+2*tol,l1-tol,z_Box*1/3+tol]);
            translate([-x_Box/2-tol,-y_Box/2+l1-tol,3*Wall-tol])cube([4*Wall,l2+3*tol,z_Box-4*Wall+tol]);
            translate([-x_Box/2-tol,-y_Box/2+l1+l2+tol,z_Box*2/3-Wall-tol])cube([4*Wall+2*tol,y_Box+4*Wall-l1-l2+tol,z_Box*1/3+tol]);
        }
        translate([-x_Box/2-tol,-y_Box/2,z_Box*2/3-Wall-tol])cube([Wall,l1-tol,Wall]);// Left Back
        translate([-x_Box/2+Wall+tol,-y_Box/2+l1-tol,3*Wall-tol])cube([Wall,l2+2*tol,Wall]); // Left Middle
        translate([-x_Box/2-tol,-y_Box/2+l1+l2+tol,z_Box*2/3-Wall-tol])cube([Wall,y_Box+4*Wall-l1-l2,Wall]);// Left Front
    }
}

module Top_neg(){
    translate([-x_Box/2-2*Wall-tol+2*Wall,-y_Box/2-2*Wall-tol+2*Wall,0])cube([x_Box+4*Wall+2*tol,y_Box+4*Wall+2*tol,z_Box-Wall]);  
}

module Power_Switch(){
    translate([x_Box/2+Wall-r_Switch-5*Wall,-y_Box/2,r_Switch+pos_z_Switch])rotate([-90,0,0])cylinder(r=r_Switch+tol,h=2*Wall+2*tol,$fn=Smoothness);
}

module Switch(){
    translate([x_Box/2+Wall-r_Switch-5*Wall,-y_Box/2-Wall,r_Switch+pos_z_Switch])rotate([-90,0,0])cylinder(r=r_Switch+tol,h=Wall+2*tol,$fn=Smoothness);
    translate([x_Box/2+Wall-r_Switch-5*Wall-x_Switch/2,-y_Box/2,r_Switch+pos_z_Switch-y_Switch/2])cube([x_Switch,z_Switch,y_Switch]);
}

module Labels(){
    translate([-x_Box/2+2,y_Box/2-20,z_Box-Wall/2])linear_extrude(h=Wall/2)text("Multi-Chromatic Stimulator",size = 7.5);
    translate([x_Box/2-17,y_Box/2-27.5,z_Box-Wall/2])linear_extrude(h=Wall/2)text("v2.1",size=5);
    translate([-x_Box/2+10,y_Box/2-45,z_Box-Wall/2])linear_extrude(h=Wall/2)text("An open-source LED Stimulator",size=5.5);
    
    translate([-x_Box/2+Wall,32+Wall,z_Box/2+7])rotate([90,0,0])rotate([0,-90,0])linear_extrude(h=Wall/2)text("Blanking",size=4.5);
    translate([-x_Box/2+Wall,29+Wall,z_Box/2])rotate([90,0,0])rotate([0,-90,0])linear_extrude(h=Wall/2)text("Signal",size=4.5);
    
    translate([-x_Box/2+Wall,-12+Wall,z_Box/2+7])rotate([90,0,0])rotate([0,-90,0])linear_extrude(h=Wall/2)text("Trigger",size=4.5);
    translate([-x_Box/2+Wall,-10+Wall,z_Box/2])rotate([90,0,0])rotate([0,-90,0])linear_extrude(h=Wall/2)text("Channel",size=4.5);
    
    translate([x_Box/2+3*Wall,-12,z_Box/2+6])rotate([90,0,0])rotate([0,90,0])linear_extrude(h=Wall/2)text("Power in",size=5);
    translate([x_Box/2+3*Wall,-9,z_Box/2-2])rotate([90,0,0])rotate([0,90,0])linear_extrude(h=Wall/2)text("5 - 30V",size=5);
    
    translate([62.5,y_Box/2+3*Wall,z_Box/2+15])rotate([90,0,180])linear_extrude(h=Wall/2)text("LED Channel",size=5);
    translate([17,y_Box/2+3*Wall,z_Box/2+15])rotate([90,0,180])linear_extrude(h=Wall/2)text("1",size=5);
    translate([7,y_Box/2+3*Wall,z_Box/2+15])rotate([90,0,180])linear_extrude(h=Wall/2)text("2",size=5);
    translate([-3.25,y_Box/2+3*Wall,z_Box/2+15])rotate([90,0,180])linear_extrude(h=Wall/2)text("3",size=5);
    translate([-13,y_Box/2+3*Wall,z_Box/2+15])rotate([90,0,180])linear_extrude(h=Wall/2)text("4",size=5);

}

module Logo(){
    translate([-x_Box/2+75,-y_Box/2+7.5,z_Box-Wall/2])scale([1,1,1])scale([0.175,0.175,1])import("C:/Users/Maxime/Documents/GitHub/Multi-Chromatic-Stimulator/3D Designs/Stimulator/Logo/Badenlab_logo.stl");
}

module LED(){
    difference(){
        union(){
            translate(pos_LED)minkowski(){
                cube([Wall+n_LED*Wall+n_LED*x_LED,Wall,R_LED+2*Wall]);
                cylinder(r1=Wall/2,r2=0,h=Wall,$fn=Smoothness);
            }
            translate(pos_LED)mirror([0,0,1])minkowski(){
                cube([Wall+n_LED*Wall+n_LED*x_LED,Wall,R_LED+2*Wall]);
                cylinder(r1=Wall/2,r2=0,h=Wall,$fn=Smoothness);
            }
        }
        LED_neg();
        translate(pos_LED+[-30,Wall,-50])cube([100,100,100]);
        
    }
}

module LED_neg()translate(pos_LED){
    translate([Wall,-Wall/2,-x_LED/2])cube([x_LED,2*Wall,x_LED]);
    translate([Wall+x_LED+Wall,-Wall/2,-x_LED/2])cube([x_LED,2*Wall,x_LED]);
    translate([Wall+2*x_LED+2*Wall,-Wall/2,-x_LED/2])cube([x_LED,2*Wall,x_LED]);
    translate([Wall+3*x_LED+3*Wall,-Wall/2,-x_LED/2])cube([x_LED,2*Wall,x_LED]);
    
    translate([Wall/2,0,-x_LED/2-Wall/2])cube([n_LED*x_LED+n_LED*Wall,3*Wall,x_LED+Wall]);
}
H_LED = 1;
R_LED = 3.9/2;
module LED_Holder()translate(pos_LED+[0.9,0,-5.2]){
    difference(){
        union(){
            translate([2*tol,0,2*tol])cube([n_LED*x_LED+n_LED*Wall-4*tol,z_Sheet,x_LED+Wall-4*tol]);
            translate([-Wall+tol,z_Sheet,-Wall+tol])cube([n_LED*x_LED+n_LED*Wall-2*tol+2*Wall,Wall/2,x_LED+Wall-2*tol+2*Wall]);
            translate([-Wall/2+tol,z_Sheet+Wall/2,-Wall/2+tol])cube([n_LED*x_LED+n_LED*Wall-2*tol+Wall,d_LED+Wall,x_LED+Wall-2*tol+Wall]);
        }
        translate([Wall/2+tol,0,tol+Wall/2])cube([x_LED,z_Sheet+Wall+d_LED,x_LED]);
        translate([Wall/2+tol+x_LED+Wall,0,tol+Wall/2])cube([x_LED,z_Sheet+Wall+d_LED,x_LED]);
        translate([Wall/2+tol+2*x_LED+2*Wall,0,tol+Wall/2])cube([x_LED,z_Sheet+Wall+d_LED,x_LED]);
        translate([Wall/2+tol+3*x_LED+3*Wall,0,tol+Wall/2])cube([x_LED,z_Sheet+Wall+d_LED,x_LED]);
        
        translate([Wall/2+tol+x_LED/2,z_Sheet+Wall/2+d_LED+1.5*Wall,tol+Wall/2+x_LED/2])rotate([90,0,0])cylinder(r=r_LED,h=d_LED+3*Wall,$fn=Smoothness);
        translate([Wall/2+tol+x_LED/2+x_LED+Wall,z_Sheet+Wall/2+d_LED+1.5*Wall,tol+Wall/2+x_LED/2])rotate([90,0,0])cylinder(r=r_LED,h=d_LED+3*Wall,$fn=Smoothness);
        translate([Wall/2+tol+x_LED/2+2*x_LED+2*Wall,z_Sheet+Wall/2+d_LED+1.5*Wall,tol+Wall/2+x_LED/2])rotate([90,0,0])cylinder(r=r_LED,h=d_LED+3*Wall,$fn=Smoothness);
        translate([Wall/2+tol+x_LED/2+3*x_LED+3*Wall,z_Sheet+Wall/2+d_LED+1.5*Wall,tol+Wall/2+x_LED/2])rotate([90,0,0])cylinder(r=r_LED,h=d_LED+3*Wall,$fn=Smoothness);
    } 
}

module LED_Cables(){
    translate([0,y_Box/2+Wall,z_Box/3])rotate([90,0,0])cylinder(r=r_Cable,h=Wall,$fn=Smoothness);
}

module Potentiometer()translate([0,y_Box/2-y_pot,pos_z_pot+Wall/2]){
    translate([-x_pot/2,0,0])cube([x_pot,y_pot,z_pot]);
    
    for (pp = [pot_pitch/2:pot_pitch:pot_pitch/2+((n_LED/2-1)*pot_pitch)]){
        translate([pp,y_pot+Wall,z_pot2])rotate([-90,0,0])cylinder(r=r_pot,h=4*Wall,$fn=Smoothness);
    }
    for (ppp = [-pot_pitch/2:-pot_pitch:-pot_pitch/2-((n_LED/2-1)*pot_pitch)]){
        translate([ppp,y_pot+Wall,z_pot2])rotate([-90,0,0])cylinder(r=r_pot,h=4*Wall,$fn=Smoothness);
    }

    
}

module Potentiometer_Platform(){

   translate([-x_pot/2-Wall,y_Box/2-y_pot+Wall,pos_z_pot])difference(){
        cube([x_pot+2*Wall,y_pot+Wall,1.5*Wall]);
        
       translate([Wall-tol,Wall-tol,Wall/2])cube([x_pot+2*tol,y_pot+tol,z_pot]);
       translate([2*Wall,2*Wall,-Wall])cube([x_pot-2*Wall,y_pot,z_pot]);
    }

    difference(){
        union(){
            translate([-x_pot/2-Wall,y_Box/2+2*Wall,pos_z_pot-z_Support])rotate(rotate_Support)cube([x_Support,z_Support,y_Support]);
            translate([x_pot/2-Wall,y_Box/2+2*Wall,pos_z_pot-z_Support])rotate(rotate_Support)cube([x_Support,z_Support,y_Support]);
        }
        translate([-x_pot/2-Wall,y_Box/2-y_pot+Wall,pos_z_pot+Wall/2])cube([x_pot+2*Wall,y_pot+Wall,z_Support]);
        translate([-x_pot/2-Wall,y_Box/2+2*Wall,pos_z_pot+Wall/2-z_Support])cube([x_pot+2*Wall,y_pot+Wall,z_Support]);
        translate([-x_pot/2-Wall,y_Box/2-y_pot+Wall,pos_z_pot+Wall/2])translate([Wall*3/2,Wall*3/2,-tol])cube([x_pot-Wall,y_pot-Wall,z_pot]);
    }
}

