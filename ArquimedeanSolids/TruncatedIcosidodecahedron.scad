// Truncated Icosidodecahedron
// (C) @oblomobka - 2023.09
// GPL license

/* **CUSTOMIZER VARIABLES** */
// Edge
edge = 30; // [10:100]
// Center of the solid or stand over a face
position = "Center"; // ["Center", "Face"]

module TruncatedIcosidodecahedron ( edge = 30, position="Face"){  // bD
    // Constants
    phi = (1+sqrt(5))/2; // Golden ratio = 1,618...
    
    // Relations
    rCirTruncatedIcosidodecahedron = sqrt(31 +12*sqrt(5))/2;   // radius of a circumscribed sphere for edge = 1 / = 3,802
    rInsDecagon = sqrt(25 +10*sqrt(5))/2;                   // Distance from center os polyhedron to center of decagon for edge = 1 / =3,441
    rInsSquare = sqrt(29 +12*sqrt(5))/2;                   // Distance from center os polyhedron to center of square for edge = 1 / =3,736
    
    // Dihedral angles
    diAngleSquHex = 180 - atan((3-sqrt(5))/2);      // dihedral angle square-hexagonal faces = 159,09°
    diAngleSquDec = 180 - atan((sqrt(5)-1)/2);      // dihedral angle square-decagonal faces = 148.28°
    diAngleHexDec = acos(-sqrt((5+2*sqrt(5))/15));  // hexagonal-decagonal faces = 142.62°
 
    // Variables
    
    s = edge/(2*phi - 2);
    
    // define 3 boxes. Every point in one octant.
    ba1 = (1/phi) * s;
    ba2 = (1/phi) * s;
    ba3 = (3 + 1*phi) * s;
    
    // define 3 boxes. Every point in one octant.
    be1 = (2/phi) * s;
    be2 = (1*phi) * s;
    be3 = (1 + 2*phi) * s;
    
    // define 3 boxes. Every point in one octant.
    bi1 = (1/phi) * s;
    bi2 = (1*phi^2) * s;
    bi3 = (-1 + 3*phi) * s;
    
    // define 3 boxes. Every point in one octant.
    bo1 = (-1 + 2*phi) * s;
    bo2 = 2 * s;
    bo3 = (2 + 1*phi) * s;
    
    // define 3 boxes. Every point in one octant.
    bu1 = (1*phi) * s;
    bu2 = 3 * s;
    bu3 = (2*phi) * s;
    

    // Definition of points and faces V = 120 / F = 62 ( 20 hexagons + 30 squares + 12 decagons )
    // Even permutations of (±1/φ, ±1/φ, ±(3 + φ)) (±2/φ, ±φ, ±(1 + 2*φ)) (±1/φ, ±φ^2, ±(-1 + 3*φ)) (±(2*φ - 1), ±2, ±(2 + 1*φ)) (±φ, ±3, ±2*φ)
    
    bDpoints = [
           
        // build 3 boxes. Every point in one octant
        [+ba1, +ba2, +ba3], [-ba1, +ba2, +ba3], [+ba1, -ba2, +ba3], [-ba1, -ba2, +ba3],    // [  0 -  3]
        [+ba1, +ba2, -ba3], [-ba1, +ba2, -ba3], [+ba1, -ba2, -ba3], [-ba1, -ba2, -ba3],    // [  4 -  7]
        
        [+ba2, +ba3, +ba1], [+ba2, +ba3, -ba1], [-ba2, +ba3, +ba1], [-ba2, +ba3, -ba1],    // [  8 - 11]
        [+ba2, -ba3, +ba1], [+ba2, -ba3, -ba1], [-ba2, -ba3, +ba1], [-ba2, -ba3, -ba1],    // [ 12 - 15]
        
        [+ba3, +ba1, +ba2], [+ba3, -ba1, +ba2], [+ba3, +ba1, -ba2], [+ba3, -ba1, -ba2],    // [ 16 - 19]
        [-ba3, +ba1, +ba2], [-ba3, -ba1, +ba2], [-ba3, +ba1, -ba2], [-ba3, -ba1, -ba2],    // [ 20 - 23]
        
        // build 3 boxes. Every point in one octant
        [+be1, +be2, +be3], [-be1, +be2, +be3], [+be1, -be2, +be3], [-be1, -be2, +be3],    // [ 24 - 27]
        [+be1, +be2, -be3], [-be1, +be2, -be3], [+be1, -be2, -be3], [-be1, -be2, -be3],    // [ 28 - 31]
        
        [+be2, +be3, +be1], [+be2, +be3, -be1], [-be2, +be3, +be1], [-be2, +be3, -be1],    // [ 32 - 35]
        [+be2, -be3, +be1], [+be2, -be3, -be1], [-be2, -be3, +be1], [-be2, -be3, -be1],    // [ 36 - 39]
        
        [+be3, +be1, +be2], [+be3, -be1, +be2], [+be3, +be1, -be2], [+be3, -be1, -be2],    // [ 40 - 43]
        [-be3, +be1, +be2], [-be3, -be1, +be2], [-be3, +be1, -be2], [-be3, -be1, -be2],    // [ 44 - 47]
        
        // build 3 boxes. Every point in one octant
        [+bi1, +bi2, +bi3], [-bi1, +bi2, +bi3], [+bi1, -bi2, +bi3], [-bi1, -bi2, +bi3],    // [ 48 - 51]
        [+bi1, +bi2, -bi3], [-bi1, +bi2, -bi3], [+bi1, -bi2, -bi3], [-bi1, -bi2, -bi3],    // [ 52 - 55]
        
        [+bi2, +bi3, +bi1], [+bi2, +bi3, -bi1], [-bi2, +bi3, +bi1], [-bi2, +bi3, -bi1],    // [ 56 - 59]
        [+bi2, -bi3, +bi1], [+bi2, -bi3, -bi1], [-bi2, -bi3, +bi1], [-bi2, -bi3, -bi1],    // [ 60 - 63]
        
        [+bi3, +bi1, +bi2], [+bi3, -bi1, +bi2], [+bi3, +bi1, -bi2], [+bi3, -bi1, -bi2],    // [ 64 - 67]
        [-bi3, +bi1, +bi2], [-bi3, -bi1, +bi2], [-bi3, +bi1, -bi2], [-bi3, -bi1, -bi2],    // [ 68 - 72]
        
        // build 3 boxes. Every point in one octant
        [+bo1, +bo2, +bo3], [-bo1, +bo2, +bo3], [+bo1, -bo2, +bo3], [-bo1, -bo2, +bo3],    // [ 72 - 75]
        [+bo1, +bo2, -bo3], [-bo1, +bo2, -bo3], [+bo1, -bo2, -bo3], [-bo1, -bo2, -bo3],    // [ 76 - 79]
        
        [+bo2, +bo3, +bo1], [+bo2, +bo3, -bo1], [-bo2, +bo3, +bo1], [-bo2, +bo3, -bo1],    // [ 80 - 83]
        [+bo2, -bo3, +bo1], [+bo2, -bo3, -bo1], [-bo2, -bo3, +bo1], [-bo2, -bo3, -bo1],    // [ 84 - 87]
        
        [+bo3, +bo1, +bo2], [+bo3, -bo1, +bo2], [+bo3, +bo1, -bo2], [+bo3, -bo1, -bo2],    // [ 88 - 91]
        [-bo3, +bo1, +bo2], [-bo3, -bo1, +bo2], [-bo3, +bo1, -bo2], [-bo3, -bo1, -bo2],    // [ 92 - 95]

        // build 3 boxes. Every point in one octant
        [+bu1, +bu2, +bu3], [-bu1, +bu2, +bu3], [+bu1, -bu2, +bu3], [-bu1, -bu2, +bu3],    // [  96 -  99]
        [+bu1, +bu2, -bu3], [-bu1, +bu2, -bu3], [+bu1, -bu2, -bu3], [-bu1, -bu2, -bu3],    // [ 100 - 103]
        
        [+bu2, +bu3, +bu1], [+bu2, +bu3, -bu1], [-bu2, +bu3, +bu1], [-bu2, +bu3, -bu1],    // [ 104 - 107]
        [+bu2, -bu3, +bu1], [+bu2, -bu3, -bu1], [-bu2, -bu3, +bu1], [-bu2, -bu3, -bu1],    // [ 108 - 111]
        
        [+bu3, +bu1, +bu2], [+bu3, -bu1, +bu2], [+bu3, +bu1, -bu2], [+bu3, -bu1, -bu2],    // [ 112 - 115]
        [-bu3, +bu1, +bu2], [-bu3, -bu1, +bu2], [-bu3, +bu1, -bu2], [-bu3, -bu1, -bu2],    // [ 116 - 119]
        
        ];
         
    bDfaces = [
        // Caps centred on the axis ( 5 squares + 2 hexagons + 2 decagons
        // + Z
        [  0,  2,  3,  1],                                      // Central square on the axis            
        [  0,  1, 25, 49, 48, 24], [  3,  2, 26, 50, 51, 27],   // Hexagons adjacent to central square      
        [  2,  0, 24, 72,112, 64, 65, 113, 74, 26],             // Decagon adjacent to central square
        [  1,  3, 27, 75,117, 69, 68, 116, 73, 25],             // Decagon adjacent to central square
        [ 24, 48, 96, 72], [ 25, 73, 97, 49],                   // Other Squares touching  - +Y
        [ 26, 74, 98, 50], [ 27, 51, 99, 75],                   // Other Squares touching  - -Y
        
        // - Z
        [  4,  5,  7,  6],                                      // Central square on the axis
        [  5,  4, 28, 52, 53, 29], [  6,  7, 31, 55, 54, 30],   // Hexagons adjacent to central square      
        [  4,  6, 30, 78, 115, 67, 66, 114, 76, 28],            // Decagon adjacent to central square
        [  7,  5, 29, 77, 118, 70, 71, 119, 79, 31],            // Decagon adjacent to central square
        [ 28, 76, 100, 52], [ 29, 53, 101, 77],                 // Other Squares touching  - +Y
        [ 30, 54, 102, 78], [ 31, 79, 103, 55],                 // Other Squares touching  - -Y
        
        // + Y
        [  8, 10, 11,  9],                                      // Central square on the axis            
        [  8,  9, 33, 57, 56, 32], [ 11, 10, 34, 58, 59, 35],   // Hexagons adjacent to central square      
        [ 10,  8, 32, 80, 96, 48, 49, 97, 82, 34],              // Decagon adjacent to central square
        [  9, 11, 35, 83, 101, 53, 52, 100, 81, 33],            // Decagon adjacent to central square
        [ 32, 56, 104, 80], [ 33, 81, 105, 57],                 // Other Squares touching  - +X
        [ 34, 82, 106, 58], [ 35, 59, 107, 83],                 // Other Squares touching  - -X
        
        // - Y
        [ 12, 13, 15, 14],                                      // Central square on the axis            
        [ 13, 12, 36, 60, 61, 37], [ 14, 15, 39, 63, 62, 38],   // Hexagons adjacent to central square      
        [ 12, 14, 38, 86, 99, 51, 50, 98, 84, 36],              // Decagon adjacent to central square
        [ 15, 13, 37, 85, 102, 54, 55, 103, 87, 39],            // Decagon adjacent to central square
        [ 36, 84, 108, 60], [ 37, 61, 109, 85],                 // Other Squares touching  - +X
        [ 38, 62, 110, 86], [ 39, 87, 111, 63],                 // Other Squares touching  - -X
        
        // + X
                                            
        [ 16, 18, 19, 17],                                      // Central square on the axis
        [ 16, 17, 41, 65, 64, 40], [ 19, 18, 42, 66, 67, 43],   // Hexagons adjacent to central square
        [ 18, 16, 40, 88, 104, 56, 57, 105, 90, 42],            // Decagon adjacent to central square
        [ 17, 19, 43, 91, 109, 61, 60, 108, 89, 41],            // Decagon adjacent to central square
        [ 40, 64, 112, 88], [ 41, 89, 113, 65],                 // Other Squares touching  - +Z
        [ 42, 90, 114, 66], [ 43, 67, 115, 91],                 // Other Squares touching  - -Z
        
        // - X                              
        [ 20, 21, 23, 22],                                      // Central square on the axis
        [ 21, 20, 44, 68, 69, 45], [ 22, 23, 47, 71, 70, 46],   // Hexagons adjacent to central square
        [ 20, 22, 46, 94, 107, 59, 58, 106, 92, 44],            // Decagon adjacent to central square
        [ 23, 21, 45, 93, 110, 62, 63, 111, 95, 47],            // Decagon adjacent to central square
        [ 44, 92, 116, 68], [ 45, 69, 117, 93],                 // Other Squares touching  - +Z
        [ 46, 70, 118, 94], [ 47, 95, 119, 71],                 // Other Squares touching  - -Z
        
        
        // 8 hexagons on the corners (octants)
        [ 72, 96, 80, 104, 88, 112], [ 73, 116, 92, 106, 82, 97],
        [ 74, 113, 89, 108, 84, 98], [ 75, 99, 86, 110, 93, 117],
        [ 76, 114, 90,105, 81, 100], [ 77, 101, 83, 107, 94, 118],
        [ 78, 102, 85, 109, 91, 115], [ 79, 119, 95, 111, 87, 103],
        ];
        
        // Helpers
        
         box1 = [
            [  0,  1,  3,  2], [  4,  5,  7,  6],
            [  8,  9, 11, 10], [ 12, 13, 15, 14],
            [ 16, 17, 19, 18], [ 20, 21, 23, 22]
            ];
         box2 = [
            [ 24, 25, 27, 26], [ 28, 29, 31, 30],
            [ 32, 33, 35, 34], [ 36, 37, 39, 38],
            [ 40, 41, 43, 42], [ 44, 45, 47, 46]
            ];
         box3 = [
            [ 48, 49, 51, 50], [ 52, 53, 55, 54],
            [ 56, 57, 59, 58], [ 60, 61, 63, 62],
            [ 64, 65, 67, 66], [ 68, 69, 71, 70]
            ];
         box4 = [
            [ 72, 73, 75, 74], [ 76, 77, 79, 78],
            [ 80, 81, 83, 82], [ 84, 85, 87, 86],
            [ 88, 89, 91, 90], [ 92, 93, 95, 94]
            ];
         box5 = [
            [ 96, 97, 99, 98], [100,101,103,102],
            [104,105,107,106], [108,109,111,110],
            [112,113,115,114], [116,117,119,118]
            ];

       /*color("blue", 0.4) { polyhedron ( bDpoints, box1); }
         color("green", 0.4){ polyhedron ( bDpoints, box2); }
         color("red", 0.4)  { polyhedron ( bDpoints, box3); }
         color("yellow", 0.4)  { polyhedron ( bDpoints, box4); }
         color("grey", 0.4)  { polyhedron ( bDpoints, box5); }*/
    
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if ( position == "Face"){
        translate ([ 0, 0, 0*edge*rInsSquare + 1*edge*rInsDecagon])
            rotate ([  0, 1*diAngleSquDec, 0])
                polyhedron ( bDpoints, bDfaces);
        }
        
    else if ( position == "Center") {
        polyhedron ( bDpoints, bDfaces);   
        }
echo (rInsSquare);
}
/* **RENDERING OF SOLIDS** */
TruncatedIcosidodecahedron ( edge = edge, position = position);
    
