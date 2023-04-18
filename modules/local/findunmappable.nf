process FINDUNMAPPABLE {
    label 'process_high'

    container 'nikitinpavel/python_bedtools_machine:latest'

    input:
    tuple path(mul), path(mur)

    output:
    path "*_single_reads_unmappable.bed", emit: singlebed
    path "_pair_reads_unmappable.bed", emit: pairbed
    path "versions.yml"  , emit: versions

    script:
    """ 
    findunmappable.py ${mul} ${mur}

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        Python: \$(python --version | awk '{print \$2}') 
        Numpy: \$(python -c "import numpy; print(numpy.__version__)")
        Pandas: \$(python -c "import pandas; print(pandas.__version__)")
        Sys: \$(python -c "import sys; print(sys.version)" 2>&1 | head -1 | cut -d" " -f1)
        CSV: \$(python -c "import csv; print(csv.__version__)")
    END_VERSIONS
    """
}
