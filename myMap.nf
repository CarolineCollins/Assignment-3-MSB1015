#!/usr/bin/env nextflow

Channel
  .from('Cat', 'Dog', 'Elephant')
  .set{ zoo }



process foo {
input: 
  animalName from zoo
//exec: 
//  println "Animal ${animalName}" 
output:
  """
  echo $animalName 
  """
}
