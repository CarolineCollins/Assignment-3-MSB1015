#!/usr/bin/env nextflow

@Grab(group='io.github.egonw.bacting', module='managers-cdk', version='0.0.9')
@Grab(group='org.openscience.cdk', module='cdk-qsarmolecular', version='2.3')
import net.bioclipse.managers.CDKManager
import org.openscience.cdk.qsar.descriptors.molecular.JPlogPDescriptor
import org.openscience.cdk.interfaces.IAtomContainer

Channel.fromPath("./short.tsv")
    .splitCsv(header: ['wikidata', 'smiles'], sep:'\t')
    .map{ row -> tuple(row.wikidata, row.smiles) }
    .set { molecules_ch }
	

process getJPlogP {

    input:
    set wikidata, smiles from molecules_ch

    exec:
	println "Running.."                          //as recommended by Ammar
	cdk = new CDKManager(".");

	try {
	  molecule = cdk.fromSMILES(smiles)
	  descriptor = new JPlogPDescriptor()
          jplogp = descriptor.calculate(molecule.getAtomContainer()).value.toString()
	  println "JPLogP : " + jplogp
	} catch (Exception exc) {
	  println "Error in parsing this SMILE $smiles"
	}
     
}
