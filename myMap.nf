myMap = ["China": 26 , "India" : 22, "USA" : 13]  //creates a map

result = 5                                         // assigns the value 5 to variable result
myMap.keySet().each( { result+= myMap[it] } )      // iterate over the key-variable pairs of the map
//each time add the value to result cumulatively
//keySet is a Groovy function htat returns the set of the keys in a map
//it is a dummy variable name - any name would do here

println result
