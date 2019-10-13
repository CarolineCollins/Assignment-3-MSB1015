myMap = ["China": 1 , "India" : 2, "USA" : 3]

result = 0
myMap.keySet().each( { result+= myMap[it] } )

println result