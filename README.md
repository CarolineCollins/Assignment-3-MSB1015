# Assignment-3-MSB1015
### Synopsis
A project to learn how to use Nextflow, SPARQL query, and CDK to calculate JPlogP on *all* the molecules in WikiData.
An investigation of parallel computing. logP is often used in cheminformatics to describe the hydrophobicity property of a molecule.
#### Task
We compare times between   
a restricted nextflow run (ie without parallel computing) vs a nextflow run employing parallel computing on all available CPU's.  
Here we note the results of comparing the computation times   
for *parsing the SMILES and getting their JPlogP values*.

### Results

| parallelisation | sys time *   | command     |  
|-----------------|--------------|-------------|  
| NO  (1 CPU)     | 11m19.594s   | maxForks 1  |  
| YES (4 CPU)     |  7m46.938s   |    -        |  

* We record CPU time used by the process. A run on the command line with the following syntax  
` >time ./nextflow printJPlogP.nf`    gives us a printout of the sys time - after the run has finished.

### What can you find in this repository?

- `Query.r` reuseable, fully-documented R code to send a query to Wikidata and create a .tsv file from the results
- `printJPlogP.nf` nextflow code to get JPlogP values of molecules from .tsv file (documentation here in `README.md` ) 
- `nextflow.config` nextflow configuration file. 
- `query_result.tsv` the result of the SPARQL query (run from R code). 
- `short.tsv` a toy data set of only 5 molecules with their SMILES (2 columns).
- `short_with_isoSMILES.tsv` a toy data set of 10 molecules with (iso)SMILES (3 columns).
-  a `logbook.md` of the learning process

### How to make it run?

- R code `Query.r` requires installation of the [R package which you can find here](https://github.com/bearloga/WikidataQueryServiceR)
- The nextflow code `printJPlogP.nf` can be run on any Linux, I used Ubuntu App on Windows 10  
- `nextflow.config` To make this workflow reproducible I have saved a copy of the config file.   
   Nextflow takes care of calling `nextflow.config` behind the scenes for you.  
- To reproduce my timing experiment, you can comment and uncomment the directive *maxForks 1* inside the process in `printJPlogP.nf`  
   maxForks 1 forces the process to run sequentially / deleting or commenting it allows free parallelisation on available CPUs
  

#### Input

- the Nextflow code `printJPlogP.nf` accepts the `query_result.tsv` file of molecules and their associated (iso)SMILES.  

#### Output

- the Nextflow code `printJPlogP.nf` prints out molecules and their associated JPlogP values.  

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
NB reading from a channel is not at all the same as reading from a file,   
the most remarkable difference for new users being that the *order is not guaranteed*.

##### Parallelisation
For the purposes of this Assignment we had to investigate techniques to restrict *parallelisation*.
In the `nextflow.config` file we can define the number of logical CPU required by the process.
Here we can also specify maxForks, a directive which allows us to define the maximum number  
of process instances that can be executed in parallel.   
By default this value is equals to the number of CPU cores available minus 1.
On the machine on which I am developing the Assignment, I have 4 CPU, giving a default maxForks of 3.  
If I want to execute my process sequentially (ie NO parallelisation), I set maxForks to 1.
I cannot find any documentation that clarifies the effects of combining `maxForks` and `cpus`.

##### Error handling
In `nextflow.config` the *errorStrategy* directive defines how an error condition is managed by the process. 
This overrides the default by which the process would stop immediately, terminating the entire pipeline. 
In `nextflow.config` the *maxErrors* directive specifies  
the maximum number of times a process can *fail* when using the
retry error strategy. Similarly *maxRetries* defines the maximum number of times the same process execution can
be retried in case of an error. Particularly useful when querying remote server, as in this case.
              
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
