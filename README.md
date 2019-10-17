# Assignment-3-MSB1015
### Synopsis
A project to learn how to use Nextflow, SPARQL query, and CDK to calculate JPlogP on all the molecules in WikiData.
Here on the README note the results of a comparison of computation times for *parsing the SMILES and getting the JPlogP value*.
Compare times between a nextflow run with parallel computing restricted vs 
a run employing parallel computing on all available CPU's.

### What can you find in this repository?
- R code to send a query to Wikidata and create a .tsv file containing the results
- nextflow code to calculate the JPlogP values of molecules from the .tsv file 

### How to make it run?
- R code requires installation of the [R package which you can find here](https://github.com/bearloga/WikidataQueryServiceR)
- The nextflow code can be run on any command line interface, I used Ubuntu App on Windows 10  

#### Input
#### Output
#### How to adapt the code for reuse
If you want to make the calculation for a different set of molecules 
change the text of the query within the R code as detailed in the comments
              
### Useful resources:
- WikiData SPARQL query `https://query.wikidata.org/`
- CDK `https://github.com/egonw/cdkbook`
- CDK `http://cdk.github.io/cdk/latest/docs/api/index.html`
- 2D depictions of molecules `https://github.com/cdk/depict`
- SMILES `http://opensmiles.org/opensmiles.html`
- Isomeric SMILES `https://www.wikidata.org/wiki/Property:P2017`
- JPlogP `https://jcheminf.biomedcentral.com/articles/10.1186/s13321-018-0316-5`
- Nextflow `https://www.nextflow.io/docs/latest/basic.html`
- Ubuntu and the command line `https://tutorials.ubuntu.com/tutorial/command-line-for-beginners#0`
- Markdown `https://www.markdownguide.org/basic-syntax`
- Docker `https://docs.docker.com/get-started/`
          `https://docker-curriculum.com/` *suggested with Ubunty or debian*

### References
- Plante J, Werner S. JPlogP: an improved logP predictor trained using predicted data. Journal of Cheminformatics. 2018;10(1):61.
- Di Tommaso P, Chatzou M, Floden EW, Barja PP, Palumbo E, Notredame C. Nextflow enables reproducible computational workflows. Nature biotechnology. 2017;35(4):316-9.

### Thought for the day:
`"Mistakes can and will happen, but by encouraging researchers to be open about them 
and not reprimanding others for them, open science can counter incentives to hide mistakes." `
              
Christopher Allen and David M A Mehler
