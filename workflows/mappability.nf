// include { DOWNLOADANNOTATION } from '../modules/local/downloadannotation.nf'
// include { BIGBEDTOBED } from '../modules/local/bigbedtobed.nf'
include { PYSCRIPTS } from '../modules/local/pyscripts.nf'
// include { BEDTOOLS } from '../modules/local/bedtools.nf'
// include { RPLOTS } from '../modules/local/rplots.nf'

wigs = [
    [
        "/home/nikitinp/hooman/map_test/test.aligned.mul.wig"
    ],
    [
        "/home/nikitinp/hooman/map_test/test.aligned.mur.wig"
    ]
]

// Channel
//     .from( wigs )
//     .map{ row -> file(row[0]) }
//     .set{ ch_wigs }

workflow MAPPABILITY {
    // DOWNLOADANNOTATION(  )

    // BIGBEDTOBED( DOWNLOADANNOTATION.out.censat )

    PYSCRIPTS( wigs )

    // BEDTOOLS(  )

    // RPLOTS(  )
}
