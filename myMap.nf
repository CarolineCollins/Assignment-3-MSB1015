#!/usr/bin/env nextflow

Channel
  .from('Cat', 'Dog', 'Elephant')
  .set{ zoo }



process foo {
input: 
 zoo
//exec: 
//  println "Animal ${it}" 
output:
  """
  echo ${zoo}
  """
}
