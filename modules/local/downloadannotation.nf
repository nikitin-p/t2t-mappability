process DOWNLOADANNOTATION {
    label 'process_low'

    container 'sviatsidorov/uniqmaptrack:1.1'

    output:
    path "cenSatAnnotation.bigBed", emit: censat
    path "versions.yml"           , emit: versions

    """
    wget https://t2t.gi.ucsc.edu/chm13/hub/t2t-chm13-v1.1/cenSat/cenSatAnnotation.bigBed

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        wget: \$(wget --version | head -1)
    END_VERSIONS
    """
}
