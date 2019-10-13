#### Day 1: 
after a lecture on Monday I went home and installed Nextflow through the Ubuntu App.
This involved wrestling with the command line, so I have put a command line glossary in my repo
for the benefit of future me and any other beginners that pass this way.
On Monday we picked up a lot of resources about NextFlow and ideas about parallel computing, 
today Wednesday was a practical session during which I set up the Assignment 3 repository and peopled it with some files.
Egon provided us with templates,  simple for Nextflow, and a short .tsv file to start us off.
##### Lecture 1: 
- emphasis on parallel computing
- examples of workflow systems : KNIME, Apache Taverna, BIOVIA
- a very important abstraction is the drawing of boundaries around each component (node), 
once that is done INPUT and OUTPUT can be clearly defined, OUTPUT can be cached, passed around, stored
eg in KNIME in a relational database (ie not in memory) and a consequence is that you can parallelise.
- the structure is Open Source
- It is useful to ask yourself: can I explain the code in my assignments as a workflow?
##### Nextflow:
Why yet another workflow?
` https://www.nextflow.io/index.html#Features `

Recent, since 2017. One design decision was not to make it graphical. 
Information channels link nodes.
You can see some examples on `openrisknet.org`
Egon's opinion: 
- one defect of N is that it is hard to see what is going on in background.
 This makes it super-important to document what you think is going on.
 I struggle to see the data in the channel
 I cannot easily how many processes have started
- NB reading from a channel is not at all the same as reading from a file eg
 the order is not guaranteed
- The multiline string defined within """   """ is something Groovy will run on the command line
- N is smart, but not v transparent, so you need to make up for this in your documentation.
- Manon asks in what platform we will be working - coding in a plain text editor like Notepad
 with extension ".nf"
- Docker: the nodes in the workflow can be Docker images, eg:
  """
  blast
  cat
  """
 where blast and cat are 2 programs AKA *microservices*
 the smallest Docker is around 30MB
 Docker get started is a useful resource; "fire up one of these nodes"
 the nodes are isolated modular bits of functionality IN -> thing -> OUT
 Docker image is a bit like an App
 Docker Hub a bit like an App Store
 (even includes its own OS therefore easy to move around between machines
 eg. if you need persistence of data you can keep a DB in there)
 docker pull thing
 docker run thing
 - busybox is a small very small Linux-based OS
 
#### Day 2:
after a big Windows update last night, I reopen the Ubuntu app
and, due to my lack of ability with the command line interface,
no longer able to understand how to get the `simple.nf` to run anymore.
I try ` ./nextflow simple.nf ` .
Nextflow launches but can't find the tsv file.
I try ls -al to find out what files are in my directory.
I try the same code as yesterday, but get the error message
`No such file: /home/caroliine/short.tsv`
My user name is caroliine, I had forgotten that. (the command whoami will remind me next time!)
It seems this is my home directory (probably you return there at every restart(?)). (home directory is AKA ~)
Need to spend some time doing command line tutorials, it seems.
Feeling more happy after some time spent on the tutorial. ~ / relative and absolute paths clearer now

#### Day 3:
##### Instructions for Assignment Task
- JPlogP values; 
- molecules encoded as SMILES
- start input file with SMILES
- use CDK to calculate JPlogP values (a measure of hydrophobicity a good predictor of biological properties)
- outline of expected repository
experiment runs on laptop
with 1,2, or 4 CPU's in use
and report the effect on total computation time
maybe even obtain a plot of this. Time: lowest, highest values, maybe
a graph that compares different times on different numbers of threads 
to calculate JPlogP on 159,000 molecules.
put this on the README in a text table for ease of comparison
(note that Egon will not try to reproduce these calc time results)
from SMILES: JPlogP 
pass to R (optional) and calc. (can also be done in Nextflow for extra points!)
what is the Min, max, median JPlogP value of all the c.159,000 SMILES 
Expect to see 4 cores is not 4 times as fast.
Expect 159,000 molecules from WikiData
- The building blocks have been provided in github/egonw
simple.nf "passes but does not calculate"
we must create a function that passes the file and creates a logP value for each molecule
we can ask stackoverflow how to define afunction in Groovy
In addition, the cdkbook on github/egonw contains a lot of Groovy code eg
code ReadSMILES.groovy
- The difference between logP descriptor (not open source) 
                   and JPlogP (open source) (Plante reference in Readme)
- Learn how to write code that "catches" exceptions eg LogP "throws an exception" if wrong SMILES

#### Day 4:
Awake at 5am thinking about this, so
##### Useful commands
- "? * con*cat*enate > >> less q ."
- rm -i   seems like a good option to avoid catastrophic accidental deletions. 
- "man thing                 for looking commands up in the manual"
- "|  pipes"
- dangers of su and sudo
 That was a pretty successful tutorial because now I can move about in my files and directories and run 
 the simple.nf code pulled from this github repo. (also look knowledgeable in front of my 13 yo son!)
 ##### Nextflow documentation
 - input and output clearly defined in processes
 - communication channels
 - process is run reactively when input becomes available
 - execution abstraction : means can reuse code unaltered on local, cloud, whatever 
 by simply redefining target execution platform in configuration files
 - batch schedulers
 - cloud platforms
 - Nextflow executors
 - Java((Groovy(Nextflow))) languages
  Nextflow can execute any piece of Groovy code or use any library for the JVM platform
  JVM stands for Java Virtual Machine. a VM easily moves tasks from one physical computer to another.
 - nextflow.config a file in execution directory in which you define the pipeline configurations
 - when working in Notepad use UTF-8 character encoding
 
 #### Day 5 
 "Playing with simple.nf, commenting and deciphering the code
 Finding alternative ways to write the same thing
 Then noticed that different runs of simple.nf were returning different answers.
 Sometimes prints 4 strings (of 5)
 Sometimes prints 2 strings or only 1!
 Def a bug not a feature of parallel programming.
 What is not working here?
 ##### Playing with Nextflow tutorial
 It is quite funny to sometimes get world Hello! instead of Hello world!" \n
 "Launching `tutorial.nf` [fabulous_blackwell] - revision: 565bdfd565
executor >  local (3)
[c5/0cafad] process > splitLetters       [100%] 1 of 1 ✔
[2a/cdb6d3] process > convertToLower (1) [100%] 2 of 2 ✔
world!
hello
------" \n
"Launching `tutorial.nf` [agitated_mcclintock] - revision: 565bdfd565
executor >  local (3)
[31/f04c9a] process > splitLetters       [100%] 1 of 1 ✔
[6a/4f00d9] process > convertToLower (1) [100%] 2 of 2 ✔
hello
world!"
