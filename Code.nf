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

// Process 2b query CDK for JPlogP by parsing the SMILEs will be done in Nextflow
//    input molecules `query_result.tsv`
//    import various CDK urls
//    ensure error handling for missing values, typos
//    output `JPlogP.tsv` molecules, (iso)SMILES, JPlogP  

// Process 3 timing
//     input start time of process 2 and end time of process 2
//     take difference  = timing
//     output timing

// Process 4 make a text table
//     input timing, number of threads
//     output save a .csv file maybe so that I can display it on the Readme

// Process 5 find min max and median of all JPlogPs (use R? or Math.*)
//    input JPlogP
//    output min, max, median



