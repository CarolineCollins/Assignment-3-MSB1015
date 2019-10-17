#!/usr/bin/env nextflow

/** tab separated values file has the data - split the tsv by tab and set up column names
* creates a map (AKA associative array) of ordered pairs - buffer slows the process down for testing purposes
* set designates - that variable will be the channel */


Channel
    .fromPath("./short.tsv")                            
    .splitCsv(header: ['wikidata', 'smiles'], sep:'\t') 
    .map{ row -> tuple(row.wikidata, row.smiles) }      
    //.buffer( size: 5000, remainder: true)                
    .set { molecules_ch }                               
  
/** this node just has input-exec, rather than input-output
* input from the channel is designated */

process printSMILES {                                   
    input:
    set wikidata, smiles from molecules_ch     
    maxForks 1
    output:
      val results into output_ch
   
    
    exec:
      results = "${wikidata} has SMILES: ${smiles}"     
}

output_ch.subscribe {
  println "Output line: " + it
}

/** print with a new line at the end of each string. $ ensures the {} is treated as a string
* it is an implicit variable
*/

/** process calculateJPlogP {
*    input:
*   
*    
*    add maxForks1 to stop processes jumping from one CPU to another
    
*    exec:  */
