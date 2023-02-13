include { DOWNLOADGENOME } from '../modules/nf-core/modules/local/downloadgenome.nf'
include { UNIQMAPTRACK } from '../modules/nf-core/modules/local/uniqmaptrack.nf'
include { PARSETRACK } from '../modules/nf-core/modules/local/parsetrack.nf'

reads = [
    [
        [
            id: "testx"
        ],
        "https://github.com/hartwigmedical/testdata/raw/master/100k_reads_hiseq/TESTX/TESTX_H7YRLADXX_S1_L001_R1_001.fastq.gz"
    ],
    [
        [
            id: "testy"
        ],
        "https://github.com/hartwigmedical/testdata/raw/master/100k_reads_hiseq/TESTY/TESTY_H7YRLADXX_S1_L001_R1_001.fastq.gz"
    ]
]

Channel
    .from( reads )
    .map{ row -> [ row[0], file(row[1], checkIfExists: true) ] }
    .set{ ch_reads }

workflow NF_EXAMPLE {
    FASTQC( ch_reads )

    READ_NAMES( ch_reads )
}
