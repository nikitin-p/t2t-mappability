process PYSCRIPTS {
    label 'process_high'

    container 'nikitinpavel/python_bedtools_machine:latest'

    input:
    tuple path(mul), path(mur)

    output:
    path "*.tsv"         , emit: tsv
    path "versions.yml"  , emit: versions

    """ 
    mappability.py ${mul} ${mur}

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        Python: \$(python --version | awk '{print \$2}') 
        Numpy: \$(python -c "import numpy; print(numpy.__version__)")
        Pandas: \$(python -c "import pandas; print(pandas.__version__)")
        Sys: \$(python -c "import sys; print(sys.version)")
        CSV: \$(python -c "import csv; print(csv.__version__)")
        Random: \$(python -c "import random; print(random.version)")
    END_VERSIONS
    """
}
