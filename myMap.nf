myMap = ["China": 26 , "India" : 22, "USA" : 13]

result = 5
myMap.keySet().each( { result+= myMap[it] } )

println result
