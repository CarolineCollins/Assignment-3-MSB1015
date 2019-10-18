# Assignment-3-MSB1015
### Synopsis
A project to learn how to use Nextflow, SPARQL query, and CDK to calculate JPlogP on *all* the molecules in WikiData.
An investigation of parallel computing.  
#### Task
We compare times between   
a restricted nextflow run (ie without parallel computing) vs a nextflow run employing parallel computing on all available CPU's.  
Here on the README I will note the results of comparing the computation times   
for *parsing the SMILES and getting their JPlogP values*.

### What can you find in this repository?
- `thing.r` R code to send a query to Wikidata and create a .tsv file from the results
- `thing.nf` nextflow code to calculate the JPlogP values of molecules from the .tsv file 
- `query_result.tsv` the result of the SPARQL query (run from R code) 
- `short.tsv` a toy data set of only 5 molecules with their SMILES.
- supporting documents and a `logbook.md` of the learning process 

### How to make it run?

- R code requires installation of the [R package which you can find here](https://github.com/bearloga/WikidataQueryServiceR)
- The nextflow code can be run on any command line interface, I used Ubuntu App on Windows 10  

#### Input

- the Nextflow code accepts a .tsv file of molecules and their associated (iso)SMILES.  

#### Output

- the Nextflow code outputs and writes to a .tsv file molecules and their associated JPlogP values.  

#### How to adapt the code for reuse

If you want to make the calculation for a different set of molecules, then 
change the text of the query within the R code as detailed in the code comments.
The query given in this code is as follows (SPARQL query syntax):  
**SELECT DISTINCT ?compound ?smiles ?isoSmiles WHERE {  
  ?compound wdt:P233 | wdt:P2017 [] .  
  OPTIONAL { ?compound wdt:P233 ?smiles }  
  OPTIONAL { ?compound wdt:P2017 ?isoSmiles }  
  }**  
  which indiscriminately returns everything from Wikidata having an (iso)SMILES. 
  
#### Understanding Nextflow

[Nextflow](https://www.nature.com/articles/nbt.3820) is a domain-specific language (DSL) that enables pipelines 
with operations that can be written in any scripting language.
In Nextflow any set of results can be associated with a single command line 
and reproduced or adapted as required. Workflows can even be resumed using cached results.
Each operation has an input and output and outputs are "streamed" between operations ("processes") in "channels".
Under the "dataflow paradigm" processes start automatically as data are received in the channel.
This approach enables parallelization.
              
### Useful resources:
- WikiData SPARQL query `https://query.wikidata.org/`
- CDK `https://github.com/egonw/cdkbook`
- CDK `http://cdk.github.io/cdk/latest/docs/api/index.html`
- SMILES `http://opensmiles.org/opensmiles.html`
- Isomeric SMILES `https://www.wikidata.org/wiki/Property:P2017`
- JPlogP `https://jcheminf.biomedcentral.com/articles/10.1186/s13321-018-0316-5`
- Nextflow `https://www.nextflow.io/docs/latest/basic.html`
- Ubuntu and the command line `https://tutorials.ubuntu.com/tutorial/command-line-for-beginners#0`
- Markdown `https://www.markdownguide.org/basic-syntax`

### References
- Plante J, Werner S. JPlogP: an improved logP predictor trained using predicted data. Journal of Cheminformatics. 2018;10(1):61.
- Di Tommaso P, Chatzou M, Floden EW, Barja PP, Palumbo E, Notredame C. Nextflow enables reproducible computational workflows. Nature biotechnology. 2017;35(4):316-9.

### Thought for the day:
`"Mistakes can and will happen, but by encouraging researchers to be open about them 
and not reprimanding others for them, open science can counter incentives to hide mistakes." `
              
Christopher Allen and David M A Mehler
