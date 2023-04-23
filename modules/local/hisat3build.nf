process HISAT3 {
    label 'process_high'

    container 'nikitinpavel/hisat3_samtools_bedtools_machine:0.2'

    input:
    tuple path(fasta), path(fai)
    path fasta

    output:
    path "t2t-chm13-v1.1.fa*"       , emit: index
    path "versions.yml"             , emit: versions
    
    """
    /hisat-3n/hisat-3n ${fasta} $task.cpus
    
    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        HISAT-3N: \$(echo 'add later')
    END_VERSIONS
    """
}