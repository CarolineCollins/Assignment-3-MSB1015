#!/usr/bin/env nextflow                     //shebang line tells the shell that you are speaking Nextflow

params.str = 'HELLO WORLD!'                    //define a variable '' it's a string

process splitLetters {                             //nice descriptive process name

    output:
    file 'chunk_*' into letters mode flatten           //this is upsetting, where is the "input: " I expect?
                                                      //flatten means get rid of any nesting keeps integrity of words
    """
    printf '${params.str}' | split -b 6 - chunk_        
    """
}
//multiline string speaks in bash pipes, print not visible - how does it keep words together yet split string into 6 parts?

process convertToLower {                                   //nice descriptive process name

    input:
    file x from letters                                     //it seems that letters is a channel was output from splitLetters
                                                                //need to look up what "file" does
    output:
    stdout result                                     //standard output is the default file descriptor designated as "result"

    """
    rev $x                                   
    """                                                            
}
//reverses  

result.println { it.trim() }                                    //print is outside the process!
