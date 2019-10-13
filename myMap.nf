//myMap = ["China": 26 , "India" : 22, "USA" : 13]  //creates a map

//result = 5                                         // assigns the value 5 to variable result
//myMap.keySet().each( { result+= myMap[it] } )      // iterate over the key-variable pairs of the map
  //each time add the value to result cumulatively
  //keySet is a Groovy function that returns the full set of the keys in a map
  //if I want to use thingy as a variable name instead of it I must specify somewhere "thingy ->"

//println result
//==============
//split this into Channel and Process

zoo = Channel.value(['Cat', 'Dog', 'Elephant'])


process foo {
input: 
  val animalName from zoo
//exec: 
//  println "Animal ${animalName}" 
output:
  """
  echo $animalName 
  """
}
