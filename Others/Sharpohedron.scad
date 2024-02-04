// Sharpohedron
// (C) @oblomobka - 2024.02
// GPL license
// https://archive.org/details/bim_eighteenth-century_geometry-improvd-1-by_sharp-abraham_1717/page/73/mode/2up
// https://georgehart.com/sharp/

/* **CUSTOMIZER VARIABLES** */
// Edge
h = 30; //[10:100]
// Center of the solid or stand over a face
position = "Center"; //["Center", "Face"]

/* **MODULES** */
module Sharpohedron ( h = 30, position = "Face"){
        
    // Relations
    rCirCube = sqrt(3)/2; // radius of a circumscribed sphere for edge = 1 / = 1,061...
    rInsCube = 1/2; // radius of a inscribed sphere for edge = 1 / = 0,5
    rMidCube = 1/sqrt(2); // Midradius, which touches the middle of each edge / =0,707...
    
    // Variables
    a = h/2;
    rl = h/3;       // rhombus factor
    b = a-rl;
    k = rl*3/5;     // kite factor
    c = a-k;
    
    // Definition of points and faces V = 20 / F = 18
    Shpoints = [
        // UP
        [ +a, +a, +a],
        [ -a, +b, +b], [ -b, +a, +b], [ -b, +b, +a], [ -c, +c, +c], // [  1,  2,  3,  4]
        [ +a, -b, +b], [ +b, -a, +b], [ +b, -b, +a], [ +c, -c, +c], // [  5,  6,  7,  8]
        [ -a, -a, +a],
        // DOWN    
        [ +a, +b, -b], [ +b, +a, -b], [ +b, +b, -a], [ +c, +c, -c], // [ 10, 11, 12, 13]
        [ -a, +a, -a],
        [ +a, -a, -a],
        [ -a, -b, -b], [ -b, -a, -b], [ -b, -b, -a], [ -c, -c, -c], // [ 16, 17, 18, 19]
        ];
    
    Shfaces = [
        // Rombos
        [  0,  7,  9,  3], [  0, 10, 15,  5], [  0,  2, 14, 11],
        [  9,  6, 15, 17], [  9, 16, 14,  1], [ 14, 18, 15, 12],
        // Kites
        [  0,  3,  4,  2], [  0,  5,  8,  7], [  0, 11, 13, 10],
        [  9,  1,  4,  3], [  9,  7,  8,  6], [  9, 17, 19, 16],
        [ 14,  2,  4,  1], [ 14, 12, 13, 11], [ 14, 16, 19, 18],
        [ 15,  6,  8,  5], [ 15, 10, 13, 12], [ 15, 18, 19, 17]
        ];
    
    // Polyhedron stands on xy plane centered on the center of the face or centered on the center of polyhedron
    if ( position == "Face"){
        translate([ 0, 0, a])
            polyhedron( Shpoints, Shfaces);}
    else if ( position == "Center") {
        polyhedron( Shpoints, Shfaces);} 
}


/* **RENDERING OF SOLIDS** */ 
Sharpohedron ( h = h, position = position);