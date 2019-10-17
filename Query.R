#===========
# README
#===========
# Reuseable WikiData Molecules Query For Assignment 3 MSB1015 
#============================================================
# Caroline Collins 6192527
# 16 October 2019
#
# Run this code to obtain the `query_result.tsv` file of all the molecules
# in the Wikidata database with their canonical SMILES and isoSMILES.
#
# Note : 
# As a prerequisite, this code needs a certain Wikidata query R package 
# which you can find here: https://github.com/bearloga/WikidataQueryServiceR
#===============================================
# STEP 0 Define your main directory/directories:
#===============================================
working_directory <- getwd()
DATA.DIR <- working_directory
RESULTS.DIR <- working_directory     #change this to suit your working method
#===================================================
# INSTALL required library
#====================================================
library(WikidataQueryServiceR)

#=================
# QUERY WikiData
#=================
# Note: if you wish to alter the query, change the WikiData query (within the quotes '' ).
# The following query indiscriminately extracts 
# any and every compound with a (iso)SMILES entry from the database.
# (P233 corresponds to canonical SMILES, P2017 to isomeric SMILES)
# Information on identifiers and query testing 
# can be found at https://www.wikidata.org/wiki/Wikidata:SPARQL_query_service/Wikidata_Query_Help/SPARQL_Editor

my_query <- 'SELECT DISTINCT ?compound ?smiles ?isoSmiles WHERE {
  ?compound wdt:P233 | wdt:P2017 [] .
  OPTIONAL { ?compound wdt:P233 ?smiles }
  OPTIONAL { ?compound wdt:P2017 ?isoSmiles }
}'

query_result <- query_wikidata(my_query) #query_wikidata() requires library WikidataQueryServiceR

#===========================
# STORE RESULT IN A TSV FILE
#===========================
write.table(query_result, file = "query_result.tsv", sep = "\t", row.names = FALSE,
            quote = F)
#===============================END
