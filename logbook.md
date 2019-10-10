#### Day 1: 
after a lecture on Monday I went home and installed Nextflow through the Ubuntu App.
This involved wrestling with the command line, so I have put a command line glossary in my repo
for the benefit of future me and any other beginners that pass this way.
On Monday we picked up a lot of resources about NextFlow and ideas about parallel computing, 
today Wednesday was a practical session during which I set up the Assignment 3 repository and peopled it with some files.
Egon provided us with templates,  simple for Nextflow, and a short .tsv file to start us off.
#### Lecture 1: 
- emphasis on parallel computing
- examples of workflow systems : KNIME, Apache Taverna, BIOVIA
- a very important abstraction is the drawing of boundaries around each component (node), 
once that is done INPUT and OUTPUT can be clearly defined, OUTPUT can be cached, passed around, stored
eg in KNIME in a relational database (ie not in memory) and a consequence is that you can parallelise.
- the structure is Open Source
- It is useful to ask yourself: can I explain the code in my assignments as a workflow?
#### Nextflow:
Why yet another workflow?
` https://www.nextflow.io/index.html#Features `

Recent, since 2017. One design decision was not to make it graphical. 
Information channels link nodes.
You can see some examples on `openrisknet.org`

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
Feeling more happy after some time spent on the tutorial.
