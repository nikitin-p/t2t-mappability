process HISAT3BUILD {
    label 'process_high'

    container 'nikitinpavel/hisat3_samtools_bedtools_machine:0.2'

    input:
    path fasta

    output:
    path "t2t-chm13-v1.1.fa*"       , emit: index
    path "versions.yml"             , emit: versions
    
    """
    /hisat-3n/hisat-3n-build \
    --ref ${fasta} \
    --output-name ${fasta} \
    --threads $task.cpus
    
    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        HISAT-3N: \$(/hisat-3n/hisat-3n --version | head -1 | cut -d" " -f3)
    END_VERSIONS
    """
}