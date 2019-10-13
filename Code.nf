#!/usr/bin/env nextflow                 //shebang tells shell we are going to speaking Nextflow from now on

// Process 1 query wikidata for molecules and their SMILES 
//   in query , 
//   out mols SMILES

// Process 2 query CDK for JPlogP using the smiles
//    in mols , SMILES
//    out mols, SMILES, JPlogP   

// Process 3 time 
//     in start time of process 1 and end time of process 2
//     out difference  

// Process 4 make a text table
//     in difference, number of threads
//     out save a .csv file maybe so that I can display it on the Readme

// Process 0 change the number of threads used
//     in maybe a command line parameter overwrite with the double dash?
//     out number of threads

