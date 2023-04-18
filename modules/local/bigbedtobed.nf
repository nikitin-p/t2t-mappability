process BIGBEDTOBED {
    label 'process_low'

    container 'sviatsidorov/uniqmaptrack:1.1'

    input:
    path bigbedcensat
    path bigbedrmsk

    output:
    path "censatannotation.bed", emit: censatannot
    path "rmskannotation.bed", emit: rmskannot
    path "versions.yml"           , emit: versions

    """
    /bigBedToBed ${bigbedcensat} censatannotation.tmp

    awk '{ { OFS="\t" }; print \$1,\$2,\$3,\$4 }' censatannotation.tmp | \
    tr "(" "\t" | tr -d ")" | \
    awk 'BEGIN{{ OFS="\t" }}{{ split(\$4,A,"_"); print \$1,\$2,\$3,A[1],\$5 }}' | \
    tr "_" "-" | \
    awk '{{ OFS="\t" }; if (\$5) {print \$1,\$2,\$3,\$4"_"\$5} else {print \$1,\$2,\$3,\$4} }' > censatannotation.bed

    /bigBedToBed ${bigbedrmsk} rmskannotation.tmp

    awk 'BEGIN{{ OFS="\t" }}{{ split(\$4,A,"_"); print \$1,\$2,\$3,A[1] }}' rmskannotation.tmp > rmskannotation.bed

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        BIGBEDTOBED: \$(/bigBedToBed 2>&1 | head -1 | cut -d" " -f2)
    END_VERSIONS
    """
}
