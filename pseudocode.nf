#!/usr/bin/env nextflow             //shebang tells shell we are going to be speaking Nextflow from now on

// import statements

/**
 * @author      Caroline Collins 
 * @version     1.0             
 */
public class Code {
    // class body
}
/**
 * Calculate JPlogP values for a list of molecules.                          
 * <p>
 * Optional longer description.   
 * here.
 * </p>
 * More explanations 
 * paragraphs separated by HTML paragraph breaks.
 *
 * @param  variable Description cores query text.         
 * @return Description a.tsv file containing molecule IDs and their JPlogP values.
 */


// Process 0 change no. of threads  MANUALLY RESTRICT to single fork to prevent parallel computing
//     input maybe a command line parameter overwrite with the double dash? params.query?
//     there is a command `cpu 1` or `maxForks 1` 
//     output number of threads  

// Process 1 query wikidata for molecules and their SMILES will be done `IN Query.R`  not in nextflow
//   input query text, // used query from  `getSMILES (.rq)`
//   query Wikidata using specialised R package
//   output  `query_result.tsv` molecules, (iso)SMILES in a file

// Process 2ab query CDK for JPlogP by parsing the SMILEs will be done in Nextflow
// Comment: Does this need to be two processes? first parse smiles then calculate and make table?
//    input molecules `query_result.tsv`
//    import various CDK urls
//    ensure error handling for missing values, typos
//    output `JPlogP.tsv` molecules, (iso)SMILES, JPlogP  

// Process 3 timing WILL BE DONE MANUALLY using `time` on the command line `time run ./nextflow JPlogP.nf`
//     duration of process 2 
//     real    0m3.890s
//     user    0m10.313s
//     sys     0m1.250s

// Process 4 make a text table     MANUALLY not in nextflow
//     input timing, parallel vs not parallel
//     output something understandable tha I can display on the Readme

// Process 5 find min max and median of all JPlogPs (MANUALLY in R)
// Comment: optional, if time allows
//    input `JPlogP.tsv`
//    output min, max, median



