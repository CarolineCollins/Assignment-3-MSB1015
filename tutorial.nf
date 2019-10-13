#!/usr/bin/env nextflow                     //shebang line tells the shell that you are speaking Nextflow

params.str = 'Hello world!'                    //define a variable '' it's a string

process splitLetters {                             //nice descriptive process name

    output:
    file 'chunk_*' into letters mode flatten           //this is upsetting, where is the "input: " I expect?
                                                      //flatten means get rid of any nesting
    """
    printf '${params.str}' | split -b 6 - chunk_        //multiline string speaks in bash pipes, print not visible
    """
}


process convertToUpper {                                   //nice descriptive process name

    input:
    file x from letters                                     //it seems that letters is a channel was output from splitLetters
                                                                //need to look up what "file" does
    output:
    stdout result                                     //standard output is the default file descriptor designated as "result"

    """
    cat $x | tr '[a-z]' '[A-Z]'                                  //concatenate the variable x and pipe it to translate
    """                                                             //direct map from little to big letters
}

result.println { it.trim() }                                    //print is outside the process!
