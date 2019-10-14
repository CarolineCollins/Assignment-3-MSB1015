#!/usr/bin/env nextflow

params.str = file("./short.tsv")
params.size = 5000

process splitWikidata {

    output:
    file 'chunk_*' into smiChunks

    """
    cat '${params.str}' | tail -n +2 | split -l ${params.size} - chunk_
    """
}

process checkSMILES {
  input: 
  each x from smiChunks

  output:
  stdout results

  script:
    """
    #!/usr/bin/env groovy
    @Grab(group='io.github.egonw.bacting', module='managers-cdk', version='0.0.9')
    workspaceRoot = "."
    def cdk = new net.bioclipse.managers.CDKManager(workspaceRoot);
    new File('${x}').readLines().each {
      def fields = it.split()
      try {
        // println "x: " + fields[1]
        cdk.fromSMILES(fields[1])
      } catch (Exception exc) {
        println "Error in " + fields[0] + ": " + exc.message
      }
    }
    """
}

results.subscribe {
  println it
}
