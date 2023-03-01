process BIGBEDTOBED {
    label 'process_low'

    container 'sviatsidorov/uniqmaptrack:1.1'

    input:
    path bigbed

    output:
    path "*.bed", emit: bed
    path "versions.yml"           , emit: versions

    """
    /bigBedToBed ${bigbed} cenSatAnnotation.tmp

    awk 'BEGIN{{ OFS="\t" }}{{ split(\$4,A,"_"); print \$1,\$2,\$3,A[1] }}' cenSatAnnotation.tmp > cenSatAnnotation.bed

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        BIGBEDTOBED: \$(/bigBedToBed 2>&1 | head -1 | cut -d" " -f2)
    END_VERSIONS
    """
}
