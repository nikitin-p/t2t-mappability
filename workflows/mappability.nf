// include { DOWNLOADANNOTATION } from '../modules/local/downloadannotation.nf'
// include { BIGBEDTOBED } from '../modules/local/bigbedtobed.nf'
include { MAPPINGSTATS } from '../modules/local/mappingstats.nf'
// include { BEDTOOLS } from '../modules/local/bedtools.nf'
// include { RPLOTS } from '../modules/local/rplots.nf'

wigs = [
    [
        "/home/nikitinp/hooman/map_test/test.centromere.chr1.mul.wig",
        "/home/nikitinp/hooman/map_test/test.centromere.chr1.mur.wig"
    ],
    [
        "/home/nikitinp/hooman/map_test/test.main.chr1.mul.wig",
        "/home/nikitinp/hooman/map_test/test.main.chr1.mur.wig"
    ],
    [
        "/home/nikitinp/hooman/map_test/test.telomere.chr1.mul.wig",
        "/home/nikitinp/hooman/map_test/test.telomere.chr1.mur.wig"
    ],
    [
        "/home/nikitinp/hooman/map_test/chr1.mul.wig",
        "/home/nikitinp/hooman/map_test/chr1.mur.wig"
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

// Channel
//     .from( wigs )
//     .map{ row -> file(row[0]) }
//     .set{ ch_wigs }

Channel
    .from( wigs )
    .map{ row -> [ file(row[0]), file(row[1]) ] }
    .set{ ch_wigs }

// Channel
//     .from( wigs )
//     .map{ row -> [ row[0], [ file(row[1]), file(row[2]) ] ] }
//     .set{ ch_wigs }

// ch_wigs.view()

workflow MAPPABILITY {
    // DOWNLOADANNOTATION(  )

    // BIGBEDTOBED( DOWNLOADANNOTATION.out.censat )

    MAPPINGSTATS( 
        // wigs
        ch_wigs
        )

    // BEDTOOLS(  )

    // RPLOTS(  )
}
