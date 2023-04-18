process BEDTOOLS {
    label 'process_low'

    conda "bioconda::bedtools=2.30.0"
    container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
        'https://depot.galaxyproject.org/singularity/bedtools:2.30.0--h7d7f7ad_2':
        'quay.io/biocontainers/bedtools:2.30.0--h7d7f7ad_2' }"

    input:
    path bam

    output:
    path "*.bam", emit: bam
    path "versions.yml"           , emit: versions

    when:
    task.ext.when == null || task.ext.when

    script:
    def args = task.ext.args ?: ''
    
    """
    bedtools \\
        intersect \\
        -wa \\
        -u \\
        # -c \\
        -a censatannotation.bed \\
        -b chr1_pair_reads_unmappable.bed > intersected.bed

    bedtools intersect -wa -u -a censatannotation.bed -b chr1_pair_reads_unmappable.bed

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        bedtools: \$(bedtools --version | cut -d" " -f2)
    END_VERSIONS
    """
}
