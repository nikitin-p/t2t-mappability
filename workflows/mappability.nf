include { DOWNLOADANNOTATION } from '../modules/local/downloadannotation.nf'
// include { BIGBEDTOBED } from '../modules/local/bigbedtobed.nf'
// include { PYSCRIPTS } from '../modules/local/pyscripts.nf'
// include { BEDTOOLS } from '../modules/local/bedtools.nf'
// include { RPLOTS } from '../modules/local/rplots.nf'

// wigs = [
//     [
//         "your_path.mul"
//     ],
//     [
//         "your_path.mur"
//     ]
// ]

// Channel
//     .from( wigs )
//     .map{ row -> file(row[0]) }
//     .set{ ch_wigs }

workflow MAPPABILITY {
    DOWNLOADANNOTATION(  )

    // BIGBEDTOBED( DOWNLOADANNOTATION.out.censat )

    // PYSCRIPTS(  )

    // BEDTOOLS(  )

    // RPLOTS(  )
}
