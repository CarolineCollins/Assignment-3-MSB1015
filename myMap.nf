#!/usr/bin/env nextflow

myFile = ('/home/caroliine/tmp/Assignment-3-MSB1015//my_file.file')

Channel
  .from('Lion', 'Tiger', 'Elephant')
  .set{ zoo }



process get_the_animals_from_the_zoo  {
input: 
  set animal from zoo
output: 
  file 'myFile.txt' into result  

 """
 echo myFile.txt
 """
 }

result.println { it.text }

/* 
 * The `subscribe` operator is triggered when the `result`
 * emits the output produced by the above process, printing 
 * the blast result
 */




/*
 *.
 * The output is sent over the `result` channel 
 */

