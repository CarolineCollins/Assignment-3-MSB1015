#### Day 1: 
after a lecture on Monday I went home and installed Nextflow through the Ubuntu App.
This involved wrestling with the command line, so I have put a command line glossary in my repo
for the benefit of future me and any other beginners that pass this way.
On Monday we picked up a lot of resources about NextFlow and ideas about parallel computing, 
today Wednesday was a practical session during which I set up the Assignment 3 repository and peopled it with some files.
Egon provided us with templates,  `simple.nf` for Nextflow, and a `short.tsv` file to start us off.
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
 I cannot see easily how many processes have started
- NB reading from a channel is not at all the same as reading from a file eg
 the *order is not guaranteed*
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
 It is quite funny to sometimes get world Hello! instead of Hello world!"  
 
 "Launching `tutorial.nf` [fabulous_blackwell] - revision: 565bdfd565
executor >  local (3)
[c5/0cafad] process > splitLetters       [100%] 1 of 1 ✔
[2a/cdb6d3] process > convertToLower (1) [100%] 2 of 2 ✔
world!
hello"  

"Launching `tutorial.nf` [agitated_mcclintock] - revision: 565bdfd565
executor >  local (3)
[31/f04c9a] process > splitLetters       [100%] 1 of 1 ✔
[6a/4f00d9] process > convertToLower (1) [100%] 2 of 2 ✔
hello
world!"  

 The it identifier is an implicit variable that represents the value that is passed to the function when it is invoked.
 run -resume   cached
 pipeline parameters  params.thing that can be overridden on the command line with --thing   double dash
 {} a closure defines a block of code that can then be passed around as if it were a string or an integer
 can have an anonymous closure ie just defined in the moment when needed
 
 #### Day 6 
 #### Day 7
 ##### restricting CPUs and parallelising
 **email** from Egon: 
 this weekend I played more with the various options that Nextflow offers to control the number of processes,   
 but found this hard to use this clearly.   
 Basically, I did not get much beyond "try to use all" and "use only one".  
 The slides for this week (week 7) have some pointers, regarding my attempts.  
 The underlying problem may have to do with the fact that the calculation of the parsing of a SMILES and (logP) descriptor  
 calculation of a single compound is just way too fast, which may be confusing Nextflow in its scheduling.
 For the assignment, please do look into it, but also *do not worry if you actually do not see the speedup that we would expect*.  
 Just report what you found. 
 ##### Lecture and Skills w Martina
 - Possible that terminal cannot print out all 5 even on successful process
 retry magic fix does not fix
 sometimes process NOT successful
 unsuccessfully attempt include code to write to file to overcome this.
 - Possible that it is required to use JavaDoc style commenting, which involves @link, @author, @param
 and uses "</p>" html type formatting.
 - Make a list of questions (user interface, cdk book and groovy, 
 buffer, pseudocode) for Martina and Egon that will help us to move forward.
 - Trialled running simple with the buffering line inserted but that creates error 'tuples'* see below
 - Trialled maxForks = 1 - this seems to work without error but doesn't affect timing much
 - Trialled using "time" and "date" on the runs of simple  
 
$ time ./nextflow run simple.nf gives  

stuff
real    0m3.825s
user    0m10.172s
sys     0m1.203s
$ date; ./nextflow run simple.nf; date  

Mon Oct 14 15:18:45 CEST 2019
stuff
Mon Oct 14 15:18:48 CEST 2019
- buffer tuples error
N E X T F L O W  ~  version 19.07.0
Launching `simple.nf` [amazing_mclean] - revision: 229fd47a88
[-        ] process > printSMILES -
WARN: Input tuple does not match input set cardinality declared by process `printSMILES` -- offending value: [[<http://www.wikidata.org/entity/Q27145494>, CC1=C(C=CC(=C1)Cl)OC(C)C(=O)O], [<http://www.wikidata.org/entity/Q161656>, CC1=CC=CC2=CC=CC=C12  ], [<http://www.wikidata.org/entity/Q169326>, CC1CCCC(=O)CCCC=CC2=CC(=CC(=C2C(=O)O1)O)O], [<http://www.wikidata.org/entity/Q27216081>, CC1CCCC(=O)CCCC=CC2=CC(=CC(=C2C(=O)O1)O)O], [<http://www.wikidata.org/entity/Q
executor >  local (1)
[52/32869d] process > printSMILES (1) [100%] 1 of 1 ✔
WARN: Input tuple does not match input set cardinality declared by process `printSMILES` -- offending value: [[<http://www.wikidata.org/entity/Q27145494>, CC1=C(C=CC(=C1)Cl)OC(C)C(=O)O], [<http://www.wikidata.org/entity/Q161656>, CC1=CC=CC2=CC=CC=C12  ], [<http://www.wikidata.org/entity/Q169326>, CC1CCCC(=O)CCCC=CC2=CC(=CC(=C2C(=O)O1)O)O], [<http://www.wikidata.org/entity/Q27216081>, CC1CCCC(=O)CCCC=CC2=CC(=CC(=C2C(=O)O1)O)O], [<http://www.wikidata.org/entity/Q168790>, CC1CCCC=CC2CC(CC2C(C=CC(=O)O1)O)O]]

#### Day 10 
##### clarification of the Assignment task
Martina replied to class email: 
###### User interface
You provide the user with a .nf and .tsv file. 
The readme should instruct the user on how to run the nextflow script 
and give detailed information on how you obtained the .tsv file *(including the query)*.

In your .nf file, you will have a process with multiple steps (you can split it in functions or not – up to you!). 
The process is the part that will be parallelized.
For each molecule, the process will be started 
- parse smiles, 
- calculate plog, 
- write result. 
You will time the complete .nf run (until all molecules are processed).

The output can either be a .tsv file with a logP value for each wikidata entry – calculation of average, median, max, min can then be done in R or Excel afterwards (not part of the parallelization script) or you can try to do it with NextFlow (more difficult since it cannot be done in the same process).
Rewrite `pseudocode.nf` based on this clarification.
##### error handling
Egon sent an email
"as additional note: it is normal in scientific computing that not all computations go well 
(bad input, limitations of the algorithms, etc).

*It is how your software handles incorrectly calculated logP's that I find more interesting.* 
How can the user see which compounds failed (e.g. missing in the output)? 
How well does your README describe how users can see what works and what does not? 
Does your code describe what situations are well handled, what not?
It is your task (think lab notebook), to record your observations, and describe what the user should expect. 
Clue to possible reasons behind errors:
Please remember that data is always dirty, and algorithms can be picky... 
does the logP descriptor work for metals? 
Do you try to calculate it for metals?
Egon directs us to a part of the [cdk website](https://egonw.github.io/cdkbook/properties.html#logp)
The *CDK* has implemented an algorithm based on the *XLogP* algorithm.  
The code is available via the descriptor API. 
It can be used to calculate the LogP for a single molecule. 
The implementation expects explicit hydrogens, 
so you need to add those if not present yet (see Section 14.4). 
The calculation returns a DoubleResult following the descriptor API
useful from this: `DoubleResult` and syntax `new`
But we have been asked to calculate the JPlogP value as opposed to the XLogP.
##### What is logP in molecules?
The partition coefficient describes how a molecular structure distributes itself over two immiscible solvents. 
The logarithm of the partition coefficient (LogP) between octanol and water 
is often used in cheminformatics to describe hydrophobicity.

#### Day 11
Toy data set runs to get JPlogP values correctly
but there are at least two problems with converting this to the big dataset: - I've got a superfluous println in there because the print that outputs the full set of 5 molecules does not include the wikidata ID and so I am too scared to delete one or other, - the full dataset of all molecules has 3 columns instead of 2 : ID, SMILES, isoSMILES

Let's look at the result of running:
caroliine@DESKTOP-ENJSVUC:~/tmp/Assignment-3-MSB1015$ time ./nextflow run printSMILES.nf
N E X T F L O W  ~  version 19.07.0
Launching `printSMILES.nf` [mad_fourier] - revision: 81e9d98c1e
[-        ] process > printSMILES -
Running..
Running..
Running..
executor >  local (4)
[ae/ff4165] process > printSMILES (1) [  0%] 0 of 4


JPLogP : 3.364195829454932
JPLogP : 2.797978430439075
Running..
JPLogP : 2.742736673289171
JPLogP : 3.476281307136401
JPLogP : 3.476281307136401
Output line: <http://www.wikidata.org/entity/Q161656> has JPlogP: 3.364195829454932
Output line: <http://www.wikidata.org/entity/Q169326> has JPlogP: 3.476281307136401
Output line: <http://www.wikidata.org/entity/Q27145494> has JPlogP: 2.797978430439075
executor >  local (5)
[30/d56ea2] process > printSMILES (5) [100%] 5 of 5 ✔


real    0m7.093s
user    0m18.844s
sys     0m2.219s

#### Day 18
The last week was devoted to Network Biology completing research project and studying for today's exam.
Tbh I was also very demotivated by the assignment.
I felt, when the assignment task was redefined for the nth time, like I had done a lot of work on trying to achieve some functionality that  was now not part of the goal.
Feeling better now, rationalising this as:  
- good training for IRL, goals are constantly being redefined
- good training for programming skills, even if they don't go to the Assignment, they go towards my overall experience.

##### Where I am 
Challenges remaining:
- buffer question: buffer induces tuples error
- choice of maxForks / cpus / where does buffer fit into this - explanations unsatisfactory to me
- still questioning re Egon's email whether we will see any speeding up with more CPUs
- short.tsv had only 2 columns , data has 3 columns. This means that when you input data to the process, it needs to say `set wikidata, smiles, isosmiles` (keep naming consistent over all three) `from channel`. Also when you create the `channel`, you need to make sure that isosmiles appears twice, in the `splitCsv` and the `tuple` inside the `map`
