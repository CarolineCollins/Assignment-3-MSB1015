#!/usr/bin/env nextflow




Channel
    .fromPath("./short.tsv")                            //tab separated values file has the data
    .splitCsv(header: ['wikidata', 'smiles'], sep:'\t') //split the tsv by tab and set up column names
    .map{ row -> tuple(row["wikidata"], row["smiles"]) }      //creates a map (AKA associative array) of ordered pairs
    .buffer( size: 50000, remainder: true)                 //slow down the process
    .set { molecules_ch }                               //_ch designates that as a channel
  

process printSMILES {                                   //this node just has input-exec, rather than input-output
    input:
    set wikidata, smiles from molecules_ch              //input from the channel is designated 

    exec:
      println "${wikidata} has SMILES: ${smiles}"       
}
//print with a new line at the end of each string. $ ensures the {} is treated as a string//
//two alternative ways to define a map : println scores["Pete"] or println scores.Pete//

//process calculateJPlogP {
//    input:
    
    
    //add maxForks1 to stop processes jumping from one CPU to another
    
//    exec:
