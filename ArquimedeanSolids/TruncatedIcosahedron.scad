// Truncated Icosahedron
// (C) @oblomobka - 2023.09
// GPL license

/* **CUSTOMIZER VARIABLES** */
// Edge
edge = 30; // [10:100]
// Center of the solid or stand over a face
position = "Center"; // ["Center", "Face"]

module TruncatedIcosahedron(edge=20, position="Face"){  // tI
    // Constants
    phi = (1+sqrt(5))/2; // Golden ratio = 1,618...
    
    // Invariants
    diAngleIcosahedron = acos(-sqrt(5)/3); // dihedral angle of Icosahedron = 138,1897...
    
    // Relations
    rInsHexagon = phi^2/(2*sqrt(3));
    
    // Variables
    s = edge/2; //edge * (phi / 2); // * (2 / phi);
    // define 3 rectangles on plane XY/XZ/YZ
    p1 = (3 * phi) * s;
    p2 = 1 * s;
    // define 3 boxes. Every point in one octant
    b1 = (2 * phi) * s;
    b2 = (2 + phi) * s;
    b3 = 1 * s;
    // define 3 boxes. Every point in one octant
    t1 = (2 * phi + 1) * s;
    t2 = 2 * s;
    t3 = (1 * phi) * s;
    
    
    // Definition of points and faces V = 60 / F3 = 20 / F10 = 12
    Dpoints = [
    
        // Build 3 rectangles on plane XY/XZ/YZ
        [+p1, +p2,   0], [-p1, +p2,   0], [+p1, -p2,   0], [-p1, -p2,   0],    // XY
        [+p2,   0, +p1], [+p2,   0, -p1], [-p2,   0, +p1], [-p2,   0, -p1],    // XZ
        [0,   +p1, +p2], [0,   -p1, +p2], [0,   +p1, -p2], [0,   -p1, -p2],    // XZ
        
        // build 3 boxes. Every point in one octant
        [+b1, +b2, +b3], [-b1, +b2, +b3], [+b1, -b2, +b3], [-b1, -b2, +b3],    // XYZ order by size - UP side
        [+b1, +b2, -b3], [-b1, +b2, -b3], [+b1, -b2, -b3], [-b1, -b2, -b3],    // XYZ order by size - DOWN side
        
        [+b2, +b3, +b1], [+b2, +b3, -b1], [-b2, +b3, +b1], [-b2, +b3, -b1],    // YZX order by size - UP side
        [+b2, -b3, +b1], [+b2, -b3, -b1], [-b2, -b3, +b1], [-b2, -b3, -b1],    // YZX order by size - Down side
        
        [+b3, +b1, +b2], [+b3, -b1, +b2], [+b3, +b1, -b2], [+b3, -b1, -b2],    // ZXY order by size - UP side
        [-b3, +b1, +b2], [-b3, -b1, +b2], [-b3, +b1, -b2], [-b3, -b1, -b2],    // ZXY order by size - DOWN side
        
        // Build 8 triangles. One triangle per octant
        [+t1, +t2, +t3], [-t1, +t2, +t3], [+t1, -t2, +t3], [-t1, -t2, +t3],    //   36  37  38  39
        [+t1, +t2, -t3], [-t1, +t2, -t3], [+t1, -t2, -t3], [-t1, -t2, -t3],    //   40  41  42  43    
        
        [+t2, +t3, +t1], [+t2, +t3, -t1], [-t2, +t3, +t1], [-t2, +t3, -t1],    //   44  45  46  47
        [+t2, -t3, +t1], [+t2, -t3, -t1], [-t2, -t3, +t1], [-t2, -t3, -t1],    //   48  49  50  51  
        
        [+t3, +t1, +t2], [+t3, -t1, +t2], [+t3, +t1, -t2], [+t3, -t1, -t2],    //   52  53  54  55  
        [-t3, +t1, +t2], [-t3, -t1, +t2], [-t3, +t1, -t2], [-t3, -t1, -t2]     //   56  57  58  59  
        
        ];
         
    Dfaces = [
    
        //  + X
        [  0, 40, 16, 12, 36], [  2, 38, 14, 18, 42],           // Pentagons
        [  0, 36, 20, 24, 38,  2], [  0,  2, 42, 25, 21, 40],   // Hexagons       
        // - X
        [  1, 37, 13, 17, 41], [  3, 43, 19, 15, 39],           // Pentagons
        [  1,  3, 39, 26, 22, 37], [  1, 41, 23, 27, 43,  3],   // Hexagons  
        
        // + Z
        [  4, 48, 24, 20, 44], [  6, 46, 22, 26, 50],           // Pentagons
        [  4,  44, 28, 32, 46, 6], [  4,  6, 50, 33, 29, 48],   // Hexagons  
        // - Z
        [  5, 45, 21, 25, 49], [  7, 51, 27, 23, 47],           // Pentagons
        [  5,  7, 47, 34, 30, 45], [  5, 49, 31, 35, 51,  7],   // Hexagons  
        
        // + Y
        [  8, 56, 32, 28, 52], [ 10, 54, 30, 34, 58],           // Pentagons
        [  8, 52, 12, 16, 54, 10], [  8, 10, 58, 17, 13, 56],   // Hexagons  
        
        // - Y
        [  9, 53, 29, 33, 57], [ 11, 59, 35, 31, 55],           // Pentagons
        [  9, 11, 55, 18, 14, 53], [  9, 57, 15, 19, 59, 11],   // Hexagons  
        
        // Hexagons on corners
        // UP
        [ 12, 52, 28, 44, 20, 36], [ 13, 37, 22, 46, 32, 56],
        [ 14, 38, 24, 48, 29, 53], [ 15, 57, 33, 50, 26, 39],
        
        // DOWN
        [ 16, 40, 21, 45, 30, 54], [ 17, 41, 23, 47, 34, 58],
        [ 31, 49, 25, 42, 18, 55], [ 27, 51, 35, 59, 19, 43]
                
        ];
    
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if(position=="Face"){
        translate([0,0,3*edge*rInsHexagon])
            rotate([90-diAngleIcosahedron/2, 0, 0])
                polyhedron(Dpoints,Dfaces);
        }
        
    else if(position=="Center") {
        polyhedron(Dpoints,Dfaces);        
        } 
}
/* **RENDERING OF SOLIDS** */
TruncatedIcosahedron ( edge = edge, position = position);
    
