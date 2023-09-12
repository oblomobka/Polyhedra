// Rhombicosidodecahedron
// (C) @oblomobka - 2023.09
// GPL license

/* **CUSTOMIZER VARIABLES** */
// Edge
edge = 30; // [10:100]
// Center of the solid or stand over a face
position = "Center"; // ["Center", "Face"]

module Rhombicosidodecahedron ( edge = 30, position="Face"){  // eD
    // Constants
    phi = (1+sqrt(5))/2; // Golden ratio = 1,618...
    
    // Relations
    rCirRhombicosidodecahedron = sqrt(8*phi+7)/2;   // radius of a circumscribed sphere for edge = 1 / = 2,233
    rInsSquare = sqrt(8*phi+5)/2;                   // Distance from center os polyhedron to center of square for edge = 1 / =2,118
    rInsPentagon = sqrt((45 + 18*sqrt(5))/20);      // Distance from center os polyhedron to center of pentagon for edge = 1 / =2,065
    //hPentagon = sqrt(5+2*sqrt(5))/2;
    //rPentagon = sqrt((5+sqrt(5))/10);
    
    // Dihedral angles
    diAngleTriSqu = 180 - atan((3-sqrt(5))/2); // dihedral angle triangular-square faces = 159,09°
    diAngleSquPent = 180 - atan((sqrt(5)-1)/2); // dihedral angle square-pentagonal faces = 148.28°
    
    // Variables
    s = edge/2;
    // define 3 rectangles on plane XY/XZ/YZ. For Triangles
    pT1 = (1 * phi^2) * s;
    pT2 = (2 + phi) * s;
    // define 3 boxes. Every point in one octant. For Squares
    bS1 = (1 * phi^3) * s;
    bS2 = 1 * s;
    bS3 = 1 * s;
    // define 3 boxes. Every point in one octant. For Pentagons
    bP1 = (2 * phi) * s;
    bP2 = (1 * phi^2) * s;
    bP3 = (1 * phi) * s;
    
    
    // Definition of points and faces V = 60 / F = 62 ( 20 triangles + 30 squares + 12 pentagons )
    // Even permutations of (±(2+φ), 0, ±φ^2) and(±φ^3, ±1, ±1) and (±2φ, ±φ^2, ±φ)
    
    eDpoints = [
    
        // Build 3 rectangles on plane XY/XZ/YZ
        [+pT1, +pT2,   0], [-pT1, +pT2,   0], [+pT1, -pT2,   0], [-pT1, -pT2,   0],    // XY    [  0 -  3]
        [+pT2,   0, +pT1], [+pT2,   0, -pT1], [-pT2,   0, +pT1], [-pT2,   0, -pT1],    // XZ    [  4 -  7]
        [0,   +pT1, +pT2], [0,   -pT1, +pT2], [0,   +pT1, -pT2], [0,   -pT1, -pT2],    // XZ    [  8 - 11]
        
        // build 3 boxes. Every point in one octant
        [+bS1, +bS2, +bS3], [-bS1, +bS2, +bS3], [+bS1, -bS2, +bS3], [-bS1, -bS2, +bS3],    // XYZ by size - UP side       [ 12 - 15]
        [+bS1, +bS2, -bS3], [-bS1, +bS2, -bS3], [+bS1, -bS2, -bS3], [-bS1, -bS2, -bS3],    // XYZ by size - DOWN side     [ 16 - 19]
        
        [+bS2, +bS3, +bS1], [+bS2, +bS3, -bS1], [-bS2, +bS3, +bS1], [-bS2, +bS3, -bS1],    // YZX by size - UP side       [ 20 - 23]
        [+bS2, -bS3, +bS1], [+bS2, -bS3, -bS1], [-bS2, -bS3, +bS1], [-bS2, -bS3, -bS1],    // YZX by size - Down side     [ 24 - 27]
        
        [+bS3, +bS1, +bS2], [+bS3, -bS1, +bS2], [+bS3, +bS1, -bS2], [+bS3, -bS1, -bS2],    // ZXY by size - UP side       [ 28 - 31]
        [-bS3, +bS1, +bS2], [-bS3, -bS1, +bS2], [-bS3, +bS1, -bS2], [-bS3, -bS1, -bS2],    // ZXY by size - DOWN side     [ 32 - 35]
        
        // build 3 boxes. Every point in one octant
        [+bP1, +bP2, +bP3], [-bP1, +bP2, +bP3], [+bP1, -bP2, +bP3], [-bP1, -bP2, +bP3],    //   36  37  38  39
        [+bP1, +bP2, -bP3], [-bP1, +bP2, -bP3], [+bP1, -bP2, -bP3], [-bP1, -bP2, -bP3],    //   40  41  42  43    
        
        [+bP2, +bP3, +bP1], [+bP2, +bP3, -bP1], [-bP2, +bP3, +bP1], [-bP2, +bP3, -bP1],    //   44  45  46  47
        [+bP2, -bP3, +bP1], [+bP2, -bP3, -bP1], [-bP2, -bP3, +bP1], [-bP2, -bP3, -bP1],    //   48  49  50  51  
        
        [+bP3, +bP1, +bP2], [+bP3, -bP1, +bP2], [+bP3, +bP1, -bP2], [+bP3, -bP1, -bP2],    //   52  53  54  55  
        [-bP3, +bP1, +bP2], [-bP3, -bP1, +bP2], [-bP3, +bP1, -bP2], [-bP3, -bP1, -bP2]     //   56  57  58  59  
        
        ];
         
    eDfaces = [
        // Caps centred on the axis ( 5 squares + 2 triangles + 2 pentagons
        // + X
        [ 12, 16, 18, 14],                              // Central square on the axis
        [ 12, 14,  4], [ 18, 16,  5],                   // Triangles adjacent to central square
        [ 12, 36, 0, 40, 16], [ 14, 18, 42,  2, 38],    // Pentagons adjacent to central square
        [ 12,  4, 44, 36], [ 14, 38, 48,  4],           // Squares touching vertices of the central square - +Z
        [ 16, 40, 45,  5], [ 18,  5, 49, 42],           // Squares touching vertices of the central square - -Z
        
        // - X
        [ 13, 15, 19, 17],                              
        [ 15, 13,  6], [ 17, 19,  7],                   
        [ 13, 17, 41,  1, 37], [ 19, 15, 39,  3, 43],   
        [ 13, 37, 46,  6], [ 17,  7, 47, 41],           // +Z
        [ 15,  6, 50, 39], [ 19, 43, 51,  7],           // -Z
        
        // + Z
        [ 20, 24, 26, 22],                              
        [ 20, 22,  8], [ 24,  9, 26],                   
        [ 20, 44,  4, 48, 24], [ 22, 26, 50,  6, 46],   
        [ 20,  8, 52, 44], [ 22, 46, 56,  8],           // +Y
        [ 24, 48, 53,  9], [ 26,  9, 57, 50],           // -Y
        
        // - Z
        [ 21, 23, 27, 25],                             
        [ 21, 10, 23], [ 25, 27, 11],                   
        [ 21, 25, 49,  5, 45], [ 23, 47,  7, 51, 27],   
        [ 21, 45, 54, 10], [ 23, 10, 58, 47],           // +Y
        [ 25, 11, 55, 49], [ 27, 51, 59, 11],           // -Y
        
        // + Y
        [ 28, 32, 34, 30],                              
        [ 30,  0, 28], [ 32,  1, 34],                   
        [ 28, 52,  8, 56, 32], [ 34, 58, 10, 54, 30],   
        [ 28,  0, 36, 52], [ 30, 54, 40,  0],           // +X
        [ 32, 56, 37,  1], [ 34,  1, 41, 58],           // -X
        
        // - Y
        [ 29, 31, 35, 33],                              
        [ 29,  2, 31], [ 35,  3, 33],                   
        [ 33, 57,  9, 53, 29], [ 31, 55, 11, 59, 35],   
        [ 29, 53, 38,  2], [ 31,  2, 42, 55],           // +X
        [ 33,  3, 39, 57], [ 35, 59, 43,  3],           // -X
        
        // 8 Triangles on the corners (octants)
        [ 36, 44, 52], [ 37, 56, 46], [ 38, 53, 48], [ 39, 50, 57],
        [ 40, 54, 45], [ 41, 47, 58], [ 42, 49, 55], [ 43, 59, 51]
                
        ];
        
        // Helpers
        planes = [
            [  0,  1,  3,  2],
            [  4,  5,  7,  6],
            [  8,  9, 11, 10]
            ];        
         box1 = [
            [ 12, 13, 15, 14], [ 16, 17, 19, 18],
            [ 20, 21, 23, 22], [ 24, 25, 27, 26],
            [ 28, 29, 31, 30], [ 32, 33, 35, 34]
            ];
         box2 = [
            [ 36, 37, 39, 38], [ 40, 41, 43, 42],
            [ 44, 45, 47, 46], [ 48, 49, 51, 50],
            [ 52, 53, 55, 54], [ 56, 57, 59, 58]
            ];
            
          /*color("red", 0.4){ polyhedron ( eDpoints, planes); }
            color("blue", 0.4){ polyhedron ( eDpoints, box1); }
            color("green", 0.4){ polyhedron ( eDpoints, box2); }*/
    
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if ( position == "Face"){
        translate ([ 0, 0, edge*rInsPentagon])
            rotate ([ 0*diAngleTriSqu, 1*diAngleSquPent, 0])
                polyhedron ( eDpoints, eDfaces);
            //color("red", 0.4){ sphere (edge*rCirRhombicosidodecahedron);}
            
        }
        
    else if ( position == "Center") {
        polyhedron ( eDpoints, eDfaces);
        //color("red", 0.4){ sphere (edge*rCirRhombicosidodecahedron);}      
        }

}
/* **RENDERING OF SOLIDS** */
Rhombicosidodecahedron ( edge = edge, position = position);
    
