process DOWNLOADREADSSE {
    tag "$meta.id"
    label 'process_low'
    
    conda (params.enable_conda ? "bioconda::magicblast=1.6.0" : null)
    container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
        'https://depot.galaxyproject.org/singularity/magicblast:1.6.0--h95f258a_0':
        'quay.io/biocontainers/magicblast:1.6.0--h95f258a_0' }"

    input:
    tuple val(meta), val(srrs)

    output:
    tuple val(meta), path("*.fastq.gz"), emit: fastq
    path "versions.yml"           , emit: versions

    script:
    """
    wget ${srrs[0]} -O ${meta.id}.fastq.gz
    
    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        wget: \$(wget 2>&1 | head -1 | cut -d" " -f1,2)
    END_VERSIONS
    """
}