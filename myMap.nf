#!/usr/bin/env nextflow

Channel
  .from('Cat', 'Dog', 'Elephant')
  .set{ zoo }



process foo {
input: 
 it from zoo
exec: 
  println "Animal ${it}" 
//output:
 // """
 // echo ${zoo}
 // """
}
