// include { DOWNLOADANNOTATION } from '../modules/local/downloadannotation.nf'
// include { BIGBEDTOBED } from '../modules/local/bigbedtobed.nf'
include { MAPPINGSTATS } from '../modules/local/mappingstats.nf'
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

// test.centromere.chr1.mul.wig
// test.centromere.chr1.mur.wig
// test.main.chr1.mul.wig
// test.main.chr1.mur.wig
// test.telomere.chr1.mul.wig
// test.telomere.chr1.mur.wig
// chr1.mul.wig
// chr1.mur.wig

// Channel
//     .from( wigs )
//     .map{ row -> file(row[0]) }
//     .set{ ch_wigs }

workflow MAPPABILITY {
    // DOWNLOADANNOTATION(  )

    // BIGBEDTOBED( DOWNLOADANNOTATION.out.censat )

    MAPPINGSTATS( 
        wigs
        // ch_wigs
        )

    // BEDTOOLS(  )

    // RPLOTS(  )
}
