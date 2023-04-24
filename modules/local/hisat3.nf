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

    maxForks 4
    
    """
    /hisat-3n/hisat-3n -x ${fasta} \
    --sra-acc <SRR> \
    --threads $task.cpus \
    --repeat-limit 1000 \
    --no-mixed --no-discordant \
    --summary-file <file> \
    --met-file <file> | \
    samtools sort \
    -@$task.cpus \
    -o ${meta.id}.bam -
    
    ${srrs[0]}
    ${meta.id}.fastq.gz

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        HISAT-3N: \$(/hisat-3n/hisat-3n --version | head -1 | cut -d" " -f3)
        samtools: \$(/samtools-1.14/samtools --version | head -1 | cut -d" " -f2)
    END_VERSIONS
    """
}