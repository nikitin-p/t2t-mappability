#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { MAPPABILITY } from './workflows/mappability.nf'

workflow {
    MAPPABILITY()
}
