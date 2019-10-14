#!/usr/bin/env nextflow

Channel
    .fromPath("./short.tsv")
    .splitCsv(header: ['wikidata', 'smiles'], sep:'\t')
    .map{ row -> tuple(row.wikidata, row.smiles) }
    .set { molecules_ch }

process printSMILES {
    input:
    set wikidata, smiles from molecules_ch

    exec:
      println "${wikidata} has SMILES: ${smiles}"
}

/* process calculateJPlogP {
*    input:
*   
*    
*    add maxForks1 to stop processes jumping from one CPU to another
*    
*    exec:  */
