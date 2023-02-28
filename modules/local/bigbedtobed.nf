process BIGBEDTOBED {
    label 'process_low'

    container 'sviatsidorov/uniqmaptrack:1.1'

    input:
    path bigbed

    output:
    path "cenSatAnnotation.bed", emit: bed
    path "versions.yml"           , emit: versions

    """
    /minUniqueKmer/bigBedToBed ${bigbed} cenSatAnnotation.tmp

    awk 'BEGIN{{ OFS="\t" }}{{ split(\$4,A,"_"); print \$1,\$2,\$3,A[1] }}' cenSatAnnotation.tmp > cenSatAnnotation.bed


    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        BIGBEDTOBED: 1.0
    END_VERSIONS
    """
}
