#!/usr/bin/env nextflow                 //shebang tells shell we are going to be speaking Nextflow from now on

// Process 0 change the number of threads used
//     input maybe a command line parameter overwrite with the double dash?
//     output number of threads  

// Process 1 query wikidata for molecules and their SMILES 
//   input query text, 
// use getSMILES (.rq) and checkSMILES (Groovy)
//   output molecules, SMILES, start time

// Process 2 query CDK for JPlogP using the smiles
//    input molecules , SMILES
//  use getJPlogP and checkJPlogP ?
//    output molecules, SMILES, JPlogP  , end time 

// Process 3 time 
//     input start time of process 1 and end time of process 2
//     output difference  

// Process 4 make a text table
//     input difference, number of threads
//     output save a .csv file maybe so that I can display it on the Readme

// Process 5 find min max and median of all JPlogPs (use R? or Math.*)
//    input JPlogP
//    output min, max, median



