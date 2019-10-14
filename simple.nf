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

 // channel?
 
// process ?

//@Grab(group='io.github.egonw.bacting', module='managers-cdk', version='0.0.9')
//import net.bioclipse.managers.CDKManager
//
//filename = "./short.tsv"
//
//def cdk = new CDKManager(".");

//println "file: " + filename
//new File(filename).eachLine() { line ->
// fields = line.split("\t")
// try {
//    mol = cdk.fromSMILES(fields[1])
//  } catch (Exception exc) {
//    println "Error in " + fields[0] + ": " + exc.message
//  }
//}

/* SPARQL query for the full 159,000 molecules written as an .rq file
* PREFIX wdt: <http://www.wikidata.org/prop/direct/>
* SELECT DISTINCT ?compound ?smiles ?isoSmiles WHERE {
*  ?compound wdt:P233 | wdt:P2017 [] .
*  OPTIONAL { ?compound wdt:P233 ?smiles }
*  OPTIONAL { ?compound wdt:P2017 ?isoSmiles }
* } */
