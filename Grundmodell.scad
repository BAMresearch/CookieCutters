l = 50;
b = 60;
h = 10;

lc = 47; //cut out area in length and breith and depth;)
bc = 57;
hc = 9;

//define cutout in x-direction
c = 14;
f = 5; // additional cutout in y-direction negative from lower part of element text

d = 15; // length between the element name and the atomic number and atomic weight

size = 14;
small_size = 2/3 * size;

atomicnum = "2";
element = "Fm";
atomicwght = "186.2";

font = "Roboto Bold";

lbh = [l, b, h];

difference() {
    difference() {
        cube(lbh, center = true);
            translate([0,0,h-hc]) {
            cube([lc,bc,hc], center = true);
        }
        translate([c,0-size/2 -f,-6])    
            cube([(lc/2)-c, (bc/2) +size/2 +f, 11]);
        
    mirror([-1,0,0]){
            translate([c,0-size/2 -f ,-6])    
            cube([(lc/2)-c, (bc/2) +size/2 +f, 11]);
    }
    
}
}


translate([0,0,-4]) { //writing on the backside
    mirror([-1,0,0]){
    linear_extrude(8){
            translate([0,d-4,0]) {
                text(atomicnum, font = font, size = small_size, halign = "center");
            }

            text(element, font = font, size = size, halign = "center", valign = "center");

            translate([0,-d,0]) {
                text(atomicwght, font = font, size = small_size,  halign = "center", valign = "top");
            }
        }
    }
}

