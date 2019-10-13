#!/usr/bin/env nextflow

Channel
  .from('Cat', 'Dog', 'Elephant')
  .set{ zoo }



process foo {
input: 
  set animal from zoo
exec: 
  println "Animal ${animal}" 
//output:
 // """
 // echo ${animal}
 // """
}
