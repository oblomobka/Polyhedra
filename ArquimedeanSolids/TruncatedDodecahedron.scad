// Truncated Dodecahedron
// (C) @oblomobka - 2023.06
// GPL license

/* **CUSTOMIZER VARIABLES** */
// Edge
edge = 30; // [10:100]
// Center of the solid or stand over a face
position = "Center"; // ["Center", "Face"]

/* **MODULES** */   
module TruncatedDodecahedron(edge=20, position="Face"){  // tD
    // Constants
    phi = (1+sqrt(5))/2; // Golden ratio = 1,618...
    
    // Invariants
    diAngleDodecahedron = acos(-1/sqrt(5)); // dihedral angle of Dodecahedron = 116,56505...
    
    // Relations
    rInsDecagon = (sqrt((25 +11*sqrt(5))/2))/2;
    
    // Variables
    s = edge * (phi / 2); // * (2 / phi);
    // define 3 rectangles on plane XY/XZ/YZ
    p1 = (2 + phi) * s;
    p2 = (1 / phi) * s;
    // define 3 boxes. Every point in one octant
    b1 = (2 * phi) * s;
    b2 = (1 * phi) * s;
    b3 = (1 / phi) * s;
    // define 8 triangles. One triangle per octant
    t1 = (phi + 1) * s;
    t2 = 2 * s;
    t3 = (1 * phi) * s;
    
    
    // Definition of points and faces V = 60 / F = 32 ( 20 triangles + 12 decagons )
    Dpoints = [
    
        // Build 3 rectangles on plane XY/XZ/YZ
        [+p1, +p2,   0], [-p1, +p2,   0], [+p1, -p2,   0], [-p1, -p2,   0],    // XY    [  0 -  3]
        [+p2,   0, +p1], [+p2,   0, -p1], [-p2,   0, +p1], [-p2,   0, -p1],    // XZ    [  4 -  7]
        [0,   +p1, +p2], [0,   -p1, +p2], [0,   +p1, -p2], [0,   -p1, -p2],    // XZ    [  8 - 11]
        
        // build 3 boxes. Every point in one octant
        [+b1, +b2, +b3], [-b1, +b2, +b3], [+b1, -b2, +b3], [-b1, -b2, +b3],    // XYZ order by size - UP side       [ 12 - 15]
        [+b1, +b2, -b3], [-b1, +b2, -b3], [+b1, -b2, -b3], [-b1, -b2, -b3],    // XYZ order by size - DOWN side     [ 16 - 19]
        
        [+b2, +b3, +b1], [+b2, +b3, -b1], [-b2, +b3, +b1], [-b2, +b3, -b1],    // YZX order by size - UP side       [ 20 - 23]
        [+b2, -b3, +b1], [+b2, -b3, -b1], [-b2, -b3, +b1], [-b2, -b3, -b1],,    // YZX order by size - Down side    [ 24 - 27]
        
        [+b3, +b1, +b2], [+b3, -b1, +b2], [+b3, +b1, -b2], [+b3, -b1, -b2],    // ZXY order by size - UP side       [ 28 - 31]
        [-b3, +b1, +b2], [-b3, -b1, +b2], [-b3, +b1, -b2], [-b3, -b1, -b2],    // ZXY order by size - DOWN side     [ 32 - 35]
        
        // Build 8 triangles. One triangle per octant
        [+t1, +t2, +t3], [-t1, +t2, +t3], [+t1, -t2, +t3], [-t1, -t2, +t3],    //   36  37  38  39
        [+t1, +t2, -t3], [-t1, +t2, -t3], [+t1, -t2, -t3], [-t1, -t2, -t3],    //   40  41  42  43    
        
        [+t2, +t3, +t1], [+t2, +t3, -t1], [-t2, +t3, +t1], [-t2, +t3, -t1],    //   44  45  46  47
        [+t2, -t3, +t1], [+t2, -t3, -t1], [-t2, -t3, +t1], [-t2, -t3, -t1],    //   48  49  50  51  
        
        [+t3, +t1, +t2], [+t3, -t1, +t2], [+t3, +t1, -t2], [+t3, -t1, -t2],    //   52  53  54  55  
        [-t3, +t1, +t2], [-t3, -t1, +t2], [-t3, +t1, -t2], [-t3, -t1, -t2]     //   56  57  58  59  
        
        ];
         
    Dfaces = [
    
        // Triangles on planes
        [  0, 12, 16], [  1, 17, 13], [  2, 18, 14], [  3, 15, 19],        // XY
        [  4, 20, 24], [  5, 25, 21], [  6, 26, 22], [  7, 23, 27],        // XZ
        [  8, 28, 32], [  9, 33, 29], [ 10, 34, 30], [ 11, 31, 35],        // YZ
        
        // Triangles on corners
        [ 36, 44, 52], [ 37, 56, 46], [ 38, 53, 48], [ 39, 50, 57],        // UP    - A/B/C/D
        [ 40, 54, 45], [ 41, 47, 58], [ 42, 49, 55], [ 43, 59, 51],        // DOWN  - E/F/G/H
        
        // Decagons
        [  2, 14, 38, 48, 24, 20, 44, 36, 12,  0], [ 16, 40, 45, 21, 25, 49, 42, 18,  2,  0],   // +X
        [ 13, 37, 46, 22, 26, 50, 39, 15,  3,  1], [  3, 19, 43, 51, 27, 23, 47, 41, 17,  1],   // -X
        [ 10, 30, 54, 40, 16, 12, 36, 52, 28,  8], [ 32, 56, 37, 13, 17, 41, 58, 34, 10,  8],   // +Y
        [ 11, 35, 59, 43, 19, 15, 39, 57, 33,  9], [ 29, 53, 38, 14, 18, 42, 55, 31, 11,  9],   // -Y
        [  6, 22, 46, 56, 32, 28, 52, 44, 20,  4], [ 24, 48, 53, 29, 33, 57, 50, 26,  6,  4],   // +Z
        [  7, 27, 51, 59, 35, 31, 55, 49, 25,  5], [ 21, 45, 54, 30, 34, 58, 47, 23,  7,  5]    // -Z


        ];
    
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if(position=="Face"){
        translate([0,0,edge*rInsDecagon])
            rotate([90-diAngleDodecahedron/2, 0, 0])
                polyhedron(Dpoints,Dfaces);
        }
        
    else if(position=="Center") {
        polyhedron(Dpoints,Dfaces);        
        } 
}

/* **RENDERING OF SOLIDS** */
TruncatedDodecahedron ( edge = edge, position = position);
    
