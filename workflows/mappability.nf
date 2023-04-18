include { DOWNLOADREADSSE } from '../modules/local/downloadreadsse.nf'
include { DOWNLOADREADSPE } from '../modules/local/downloadreadspe.nf'
// include { GETMINREADLENGTH } from '../modules/local/getminreadlength.nf'
// include { DOWNLOADANNOTATION } from '../modules/local/downloadannotation.nf'
// include { BIGBEDTOBED } from '../modules/local/bigbedtobed.nf'
// include { MAPPINGSTATS } from '../modules/local/mappingstats.nf'
// include { SPECTRALPLOT } from '../modules/local/spectralplot.nf'
// include { RPLOTS } from '../modules/local/rplots.nf'
// include { FINDUNMAPPABLE } from '../modules/local/findunmappable.nf'
// include { FINDUNMAPBASIC } from '../modules/local/findunmapbasic.nf'
// include { BEDTOOLS } from '../modules/local/bedtools.nf'
// include { HISAT3 } from '../modules/local/hisat3.nf'
// include { BEDTOOLSINTERSECT } from '../modules/local/bedtoolsintersect.nf'

// Use this
// wigs = [
//     [
//         "/home/nikitinp/hooman/map_test/test.centromere.chr1.mul.wig",
//         "/home/nikitinp/hooman/map_test/test.centromere.chr1.mur.wig"
//     ],
//     [
//         "/home/nikitinp/hooman/map_test/test.arm.chr1.mul.wig",
//         "/home/nikitinp/hooman/map_test/test.arm.chr1.mur.wig"
//     ],
//     [
//         "/home/nikitinp/hooman/map_test/test.telomere.chr1.mul.wig",
//         "/home/nikitinp/hooman/map_test/test.telomere.chr1.mur.wig"
//     ],
//     [
//         "/home/nikitinp/hooman/map_test/full.chr1.mul.wig",
//         "/home/nikitinp/hooman/map_test/full.chr1.mur.wig"
//     ]
// ]

// wigs_chr1_full = [
//     [
//         "/home/nikitinp/hooman/map_test/full.chr1.mul.wig",
//         "/home/nikitinp/hooman/map_test/full.chr1.mur.wig"
//     ]
// ]

// wigs_full = [
//     [
//         "/home/nikitinp/hooman/map_test/t2t-chm13-v1.1.fa.mul.wig",
//         "/home/nikitinp/hooman/map_test/t2t-chm13-v1.1.fa.mur.wig"
//     ]
// ]

// Use this to specify SRA links

srr_se = [
    [
    [
        id: "CHM13-pro-seq"
    ],
    "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR150/003/SRR15035503/SRR15035503.fastq.gz"
    ],
    [
    [
        id: "RPE1-total"
    ],
    "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR112/036/SRR11201736/SRR11201736.fastq.gz"
    ],
    [
    [
        id: "RPE1-pro-seq"
    ],
    "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR150/001/SRR15035501/SRR15035501.fastq.gz"
    ],
    [
    [
        id: "K562-total"
    ],
    "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR146/027/SRR14638227/SRR14638227.fastq.gz"
    ],
    [
    [
        id: "K562-pro-seq"
    ],
    "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR155/001/SRR1554311/SRR1554311.fastq.gz"
    ],
]

srr_pe = [
    [
    [
        id: "CHM13-polyA"
    ],
    "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR150/002/SRR15054302/SRR15054302_1.fastq.gz",
    "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR150/002/SRR15054302/SRR15054302_2.fastq.gz"
    ],
    [
    [
        id: "RPE1-polyA"
    ],
    "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR367/000/SRR3677550/SRR3677550_1.fastq.gz",
    "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR367/000/SRR3677550/SRR3677550_2.fastq.gz"
    ],
    [
    [
        id: "K562-polyA"
    ],
    "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR319/009/SRR3192409/SRR3192409_1.fastq.gz",
    "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR319/009/SRR3192409/SRR3192409_2.fastq.gz"
    ]
]

// reads = [
//     [
//     [
//         id: ""
//     ],
//     "/home/nikitinp/lizards/pipeline/reads/N_R1.fastq.gz",
//     "/home/nikitinp/lizards/pipeline/reads/N_R2.fastq.gz"
//     ],
//     [
//     [
//         id: ""
//     ],
//     "/home/nikitinp/lizards/pipeline/reads/V_R1.fastq.gz",
//     "/home/nikitinp/lizards/pipeline/reads/V_R2.fastq.gz"
//     ]
// ]

// wigs = [
//     [
//         "/home/nikitinp/hooman/map_test/test.aligned.mul.wig"
//     ],
//     [
//         "/home/nikitinp/hooman/map_test/test.aligned.mur.wig"
//     ]
// ]

// wigs_chr1_full_test = [
//     [
//         "/home/nikitinp/hooman/map_test/test.chr1.mul.wig",
//         "/home/nikitinp/hooman/map_test/test.chr1.mur.wig"
//     ]
// ]

// Channel
//     .from( wigs )
//     .map{ row -> file(row[0]) }
//     .set{ ch_wigs }


// Use this
// Channel
//     .from( wigs )
//     .map{ row -> [ file(row[0]), file(row[1]) ] }
//     .set{ ch_wigs }

// Use this
// Channel
//     .from( wigs_chr1_full )
//     .map{ row -> [ file(row[0]), file(row[1]) ] }
//     .set{ ch_wigs_chr1_full }

// Use this to specify SRRs

Channel
    .from( srr_se )
    .map{ row -> [ row[0], [ row[1] ] ] }
    .set{ ch_srr_se }

Channel
    .from( srr_pe )
    .map{ row -> [ row[0], [ row[1], row[2] ] ] }
    .set{ ch_srr_pe }

// Channel
//     .from( wigs_full )
//     .map{ row -> [ file(row[0]), file(row[1]) ] }
//     .set{ ch_wigs_full }

// Channel
//     .from( wigs_chr1_full_test )
//     .map{ row -> [ file(row[0]), file(row[1]) ] }
//     .set{ ch_wigs_chr1_full_test }

// Channel
//     .from( wigs )
//     .map{ row -> [ row[0], [ file(row[1]), file(row[2]) ] ] }
//     .set{ ch_wigs }

// ch_wigs.view()

workflow MAPPABILITY {
    DOWNLOADREADSSE(
        ch_srr_se
    )

    DOWNLOADREADSPE(
        ch_srr_pe
    )

    // GETMINREADLENGTH()

    // DOWNLOADREADS.out.fastq
    //     .map { it -> [it[0], [it[1], it[2]]]}
    //     .set{ ch_reads }

    // DOWNLOADANNOTATION(  )

    // BIGBEDTOBED( 
    //     DOWNLOADANNOTATION.out.censat,
    //     DOWNLOADANNOTATION.out.rmsk
    // )

    // MAPPINGSTATS( 
    //     // wigs
    //     ch_wigs_chr1_full
    //     // ch_wigs
    //     )

    // SPECTRALPLOT(
    //     ch_wigs_full
    // )

    // RPLOTS(  )

    // FINDUNMAPPABLE(
    //     ch_wigs_chr1_full
    //     // ch_wigs_chr1_full_test
    // )

    // BEDTOOLS(
    //     BIGBEDTOBED.out.censatannot
    //     // FINDUNMAPPABLE.out.singlebed
    //     FINDUNMAPPABLE.out.pairbed
    // )

    // FINDUNMAPBASIC()

    // BEDTOOLS()

    // HISAT3()

    // BEDTOOLSINTERSECT()
}
