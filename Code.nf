#!/usr/bin/env nextflow                 //shebang tells shell we are going to be speaking Nextflow from now on

/** Input a query text 
*  Output min, max and median of 159,000 JPlogP values and a timing*/

// Process 0 change the number of threads used
//     input maybe a command line parameter overwrite with the double dash? params.query?
//     output number of threads  

// Process 1 query wikidata for molecules and their SMILES 
//   input query text, 
// use getSMILES (.rq) and checkSMILES (Groovy)
//   output molecules, SMILES

// Process 2 query CDK for JPlogP using the smiles
//    input molecules , SMILES
//  use getJPlogP and checkJPlogP ?
//    output molecules, SMILES, JPlogP  , start time, end time  

// Process 3 timing
//     input start time of process 2 and end time of process 2
//     take difference  = timing
//     output timing

// Process 4 make a text table
//     input timing, number of threads
//     output save a .csv file maybe so that I can display it on the Readme

// Process 5 find min max and median of all JPlogPs (use R? or Math.*)
//    input JPlogP
//    output min, max, median



