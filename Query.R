# Reuseable WikiData Molecules Query For Assignment 3 MSB1015 
# Caroline Collins 6192527 with support from Ammar Ammar and Raphael Stolpe
# 16 October 2019

#Run this file to obtain a .tsv file of all molecules in Wikidata database
#with their canonical SMILES and isoSMILES

#===============================================  
# Note 
# As a prerequisite, this notebook needs a certain Wikidata query R package 
# which you can find here: https://github.com/bearloga/WikidataQueryServiceR
#===================================================
#INSTALL required library
#====================================================
library(WikidataQueryServiceR)

#=================
#QUERY WikiData
#=================
#Note: if you wish to alter the query, change the WikiData query within the quotes below '' 
# (eg P233 corresponds to canonical SMILES)
#Information on identifiers and query testing 
#can be found at https://www.wikidata.org/wiki/Wikidata:SPARQL_query_service/Wikidata_Query_Help/SPARQL_Editor

my_query <- 'SELECT DISTINCT ?compound ?smiles ?isoSmiles WHERE {
  ?compound wdt:P233 | wdt:P2017 [] .
  OPTIONAL { ?compound wdt:P233 ?smiles }
  OPTIONAL { ?compound wdt:P2017 ?isoSmiles }
}'

query_result <- query_wikidata(my_query) #function query_wikidata requires library WikidataQueryServiceR

#===========================
#STORE RESULT IN A TSV FILE
#===========================
write.table(query_result, file = "OneHundredSixtyThousandMols.tsv", sep = "\t", row.names = FALSE,
            quote = F)
#===============================END
