process PYSCRIPTS {
    label 'process_high'

    container 'nikitinpavel/python_bedtools_machine:1.0'

    input:
    tuple path(mul), path(mur)

    output:
    path "*.tsv", emit: tsv
    path "versions.yml"           , emit: versions

    """
    mappability.py $mul $mur > output.tsv

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        Python: \$(python --version | awk '{print \$2}') 
        Numpy: python -c "import numpy; print(numpy.__version__)"
        Pandas: python -c "import pandas; print(pandas.__version__)"
    END_VERSIONS
    """
}
