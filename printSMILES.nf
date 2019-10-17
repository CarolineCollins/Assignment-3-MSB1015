#!/usr/bin/env nextflow

/** tab separated values file has the data - split the tsv by tab and set up column names
* creates a map (AKA associative array) of ordered pairs - buffer slows the process down for testing purposes
* set designates - that variable will be the channel 
*/

@Grab(group='io.github.egonw.bacting', module='managers-cdk', version='0.0.9')
@Grab(group='org.openscience.cdk', module='cdk-qsarmolecular', version='2.3')
import net.bioclipse.managers.CDKManager
import org.openscience.cdk.qsar.descriptors.molecular.JPlogPDescriptor
import org.openscience.cdk.interfaces.IAtomContainer

Channel
    .fromPath("./short.tsv")                            
    .splitCsv(header: ['wikidata', 'smiles'], sep:'\t') 
    .map{ row -> tuple(row.wikidata, row.smiles) }                    
    .set { molecules_ch }                               
  
/** this node just has input-output- exec, AND .subscribe
*   input from the `molecules_ch` channel is designated
*   output from the exec line `results` is designated as `output_ch`.
*/

process printSMILES {                                   
    input:
    set wikidata, smiles from molecules_ch     
       
    output:
      val results into output_ch
      
    exec:
	println "Running.."   //as recommended by Ammar
	cdk = new CDKmanager(".");
	try {
	  molecule = cdk.fromSMILES(smiles)
	  descriptor = new JPlogPDescriptor()
          jplogp = descriptor.calculate(molecule.getAtomContainer()).value.toString()
	  println "JPLogP : " + jplogp
	} catch (Exception exc) {
	  println "Error in parsing this SMILE $smiles"
	}
      results = "${wikidata} has JPlogP: ${jplogp}"    
      
}

output_ch.subscribe {
  println "Output line: " + it
}

/** print with a new line at the end of each string. $ ensures the {} is treated as a string
* `it` is an implicit variable
*/

/** process calculateJPlogP {
*    input:
*     
*    add maxForks1 to stop processes jumping from one CPU to another
*    
*    exec:  
*/
