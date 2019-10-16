#!/usr/bin/env nextflow

smiles = Channel.from("CC1=C(C=CC(=C1)Cl)OC(C)C(=O)O","CC1=CC=CC2=CC=CC=C12",
	"CC1CCCC(=O)CCCC=CC2=CC(=CC(=C2C(=O)O1)O)O","CC4CCCC(=O)CCCC=CC2=CC(=CC(=C2C(=O)O1)O)O",
	"CC1CCCC=CC2CC(CC2C(C=CC(=O)O1)O)O")
	

process printSMILES {


    input:
    val smile from smiles

    output:
    stdout out

    script:
      """
	#!/usr/bin/env groovy

	@Grab(group='io.github.egonw.bacting', module='managers-cdk', version='0.0.9')
	import net.bioclipse.managers.CDKManager

	def cdk = new CDKManager(".");

	try {
	  mol = cdk.fromSMILES("$smile")
	  println "No problem while parsing this SMILE: $smile"
	} catch (Exception exc) {
	  println "Error in parsing this SMILE $smile"
	}
      """
}

out.println{ it }
