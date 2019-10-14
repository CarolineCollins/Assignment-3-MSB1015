#!/usr/bin/env nextflow

Channel
  .from('Lion', 'Tiger', 'Elephant')
  .set{ zoo }



process get_the_animals_from_the_zoo {
input: 
  set animal from zoo
exec: 
  myFile.text = "Animal ${animal}" 
//output:
 // """
 // echo ${animal}
 // """
}
