#!/usr/bin/env nextflow

@Grab(group='org.openscience.cdk', module='cdk-qsarmolecular', version='2.3')
@Grab(group='io.github.egonw.bacting', module='managers-cdk', version='0.0.9')

import net.bioclipse.managers.CDKManager
import org.openscience.cdk.interfaces.IAtomContainer
import org.openscience.cdk.*;
import org.openscience.cdk.templates.*;
import org.openscience.cdk.tools.*;
import org.openscience.cdk.tools.manipulator.*;
import org.openscience.cdk.qsar.descriptors.molecular.*;
import org.openscience.cdk.qsar.result.*;

Channel
    .fromPath("./short.tsv")
    .splitCsv(header: ['wikidata', 'smiles'], sep:'\t')
    .map{ row -> tuple(row.wikidata, row.smiles) }
	.buffer(size:2, remainder:true)
    .set { molecules_ch }


process printSMILES {
    input:
    each set from molecules_ch

    exec:
      println "Running..."
	for (entry in set){
		wikidata = entry[0]
		smiles = entry[1]
	
	if (smiles !=null){
	
	
	cdk = new CDKManager(".");
	descriptor = new XLogPDescriptor()
	mol = cdk.fromSMILES(smiles)
	((DoubleResult)descriptor.calculate(mol.getAtomContainer()).value)
	xLogP=((DoubleResult)descriptor.calculate(mol.getAtomContainer()).value)
		println "$mol has SMILES: ${smiles} & logP equals $xLogP "
	}else{
		println "$mol has no SMILES"
		}
	}
}