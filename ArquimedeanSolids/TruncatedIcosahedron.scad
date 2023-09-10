// Truncated Icosahedron
// (C) @oblomobka - 2023.09
// GPL license

/* **CUSTOMIZER VARIABLES** */
// Edge
edge = 30; // [10:100]
// Center of the solid or stand over a face
position = "Center"; // ["Center", "Face"]

module TruncatedIcosahedron ( edge = 30, position = "Face"){  // tI
    // Constants
    phi = (1+sqrt(5))/2; // Golden ratio = 1,618...
    
    // Dihedral angles
    diAngleHexHex = acos(-sqrt(5)/3); // hexagonal-hexagonal faces = 138,1897...
    diAnglePentHex = acos (-sqrt((5+2*sqrt(5))/15)); // pentagonal-hexagonal faces = 142.62°
    
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
    
    
    // Definition of points and faces V = 60 / F = 32 ( 12 pentagons + 20 hexagons )
    // Even permutations of ( ±3φ, ±1, 0) and ( ±(2*φ), ±(2+φ), ±1) and ( ±(2*φ+1), ±2, ±φ)
    tIpoints = [
    
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
         
    tIfaces = [
        // + X
        [ 36, 12, 16, 40,  0], [ 42, 18, 14, 38,  2],           // Pentagons
        [  2, 38, 24, 20, 36, 0], [ 40, 21, 25, 42,  2,  0],    // Hexagons
        // - X
        [ 41, 17, 13, 37,  1], [ 39, 15, 19, 43,  3],           // Pentagons
        [ 37, 22, 26, 39,  3,  1], [ 3, 43, 27, 23, 41,  1],    // Hexagons
        
        // + Z
        [ 44, 20, 24, 48,  4], [ 50, 26, 22, 46,  6],           // Pentagons
        [  6, 46, 32, 28, 44,  4], [ 48, 29, 33, 50,  6,  4],   // Hexagons
   
        // - Z
        [ 49, 25, 21, 45,  5], [ 47, 23, 27, 51,  7],           // Pentagons
        [ 45, 30, 34, 47,  7,  5], [  7, 51, 35, 31, 49,  5],   // Hexagons  
        
        // + Y
        [ 52, 28, 32, 56,  8], [ 58, 34, 30, 54, 10],           // Pentagons
        [ 10, 54, 16, 12, 52,  8], [ 56, 13, 17, 58, 10,  8],   // Hexagons
        
        // - Y
        [ 57, 33, 29, 53,  9], [ 55, 31, 35, 59, 11],           // Pentagons
        [ 53, 14, 18, 55, 11,  9], [ 11, 59, 19, 15, 57, ,9],   // Hexagons
        
        // Hexagons on corners
        // UP
        [ 36, 20, 44, 28, 52, 12], [ 56, 32, 46, 22, 37, 13],
        [ 53, 29, 48, 24, 38, 14], [ 39, 26, 50, 33, 57, 15],
        
        // DOWN
        [ 54, 30, 45, 21, 40, 16], [ 41, 23, 47, 34, 58, 17],
        [ 55, 18, 42, 25, 49, 31], [ 43, 19, 59, 35, 51, 27]
                
        ];
    
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if ( position == "Face"){
        translate ([ 0, 0, 3*edge*rInsHexagon])
            rotate ([ 90-diAngleHexHex/2, 0, 0])
                polyhedron ( tIpoints, tIfaces);
        }
        
    else if ( position == "Center") {
        polyhedron ( tIpoints, tIfaces);        
        } 
}
/* **RENDERING OF SOLIDS** */
TruncatedIcosahedron ( edge = edge, position = position);
    
