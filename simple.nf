#!/usr/bin/env nextflow

Channel
    .fromPath("./short.tsv")                            //tab separated values file has the data
    .set { rawdata_ch }                                   //intend to look at the data side by side for bugfix

Channel
    .fromPath("./short.tsv")                            //tab separated values file has the data
    .splitCsv(header: ['wikidata', 'smiles'], sep:'\t') //split the tsv by tab and set up column names
    .map{ row -> tuple(row["wikidata"], row["smiles"]) }      //creates a map (AKA associative array) of ordered pairs
    .set { molecules_ch }                               //_ch designates that as a channel
  
process print_rawdata {
    input:
    set rawdata from rawdata_ch
    
    exec:
        print "${rawdata}"
}

process printSMILES {                                   //this node just has input-exec, rather than input-output
    input:
    set wikidata, smiles from molecules_ch              //input from the channel is designated 

    exec:
      println "${wikidata} has SMILES: ${smiles}"       
}
//print with a new line at the end of each string. $ ensures the {} is treated as a string//
//two alternative ways to define a map : println scores["Pete"] or println scores.Pete//
