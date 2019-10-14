#!/usr/bin/env nextflow

myFile = ('/home/caroliine/tmp/Assignment-3-MSB1015//my_file.file')

Channel
  .from('Lion', 'Tiger', 'Elephant')
  .set{ zoo }



process get_the_animals_from_the_zoo {
input: 
  set animal from zoo
output: 
  file 'myFile.txt' into "Animal ${animal}" 


 """
 echo myFile.txt
 """
}
