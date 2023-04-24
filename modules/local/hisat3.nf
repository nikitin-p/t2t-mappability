process HISAT3 {
    tag "$meta.id"
    label 'process_high'

    container 'nikitinpavel/hisat3_samtools_bedtools_machine:0.2'

    input:
    tuple path(fasta), path(fai)
    tuple val(meta), val(srrs)

    output:
    tuple val(meta), path("*.bam"), emit: fastq
    path "versions.yml"             , emit: versions
    
    """
    /hisat-3n/hisat-3n -x ${fasta} --threads $task.cpus
    wget ${srrs[0]} -O ${meta.id}.fastq.gz --repeat-limit 1000
    
    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        HISAT-3N: \$(/hisat-3n/hisat-3n --version | head -1 | cut -d" " -f3)
        samtools: \$(/samtools-1.14/samtools --version | head -1 | cut -d" " -f2)
    END_VERSIONS
    """
}