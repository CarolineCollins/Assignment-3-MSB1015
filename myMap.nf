#!/usr/bin/env nextflow

Channel
  .from('Cat', 'Dog', 'Elephant')
  .set{ zoo }



process get_the_animals_from_the_zoo {
input: 
  set animal from zoo
exec: 
  println "Animal ${animal}" 
//output:
 // """
 // echo ${animal}
 // """
}
