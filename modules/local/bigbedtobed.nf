process BIGBEDTOBED {
    label 'process_low'

    container 'sviatsidorov/uniqmaptrack:1.1'

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
    bigBedToBed cenSatAnnotation.bigBed cenSatAnnotation.tmp
    awk 'BEGIN{{ OFS="\t" }}{{ split($4,A,"_"); print $1,$2,$3,A[1] }}' cenSatAnnotation.tmp > cenSatAnnotation.bed

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        bigbedtobed: \$(echo \$(samtools --version 2>&1) | sed 's/^.*samtools //; s/Using.*\$//' ))
    END_VERSIONS
    """
}
