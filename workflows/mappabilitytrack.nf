include { DOWNLOADANNOTATION } from '../modules/nf-core/modules/local/downloadannotation.nf'
include { BIGBEDTOBED } from '../modules/nf-core/modules/local/bigbedtobed.nf'
include { PYSCRIPTS } from '../modules/nf-core/modules/local/pyscripts.nf'
include { BEDTOOLS } from '../modules/nf-core/modules/local/bedtools.nf'
include { RPLOTS } from '../modules/nf-core/modules/local/rplots.nf'

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

workflow NF_EXAMPLE {
    DOWNLOADANNOTATION()

    BIGBEDTOBED()

    PYSCRIPTS()

    BEDTOOLS()

    RPLOTS()
}
