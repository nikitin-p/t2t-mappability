process RPLOTS {
    label 'process_low'
    stageInMode 'copy'

    container 'sviatsidorov/r_machine:1.1'

    input:
    path rmd
    path spectral_plot
    // path test_single
    // path test_pair
    // path test_mate_pair
    path telomere_single
    path arm_single
    path centromere_single
    path telomere_pair
    path arm_pair
    path centromere_pair
    path telomere_mate_pair
    path arm_mate_pair
    path centromere_mate_pair

    output:
    path "spec_plot.pdf",     emit: specplot
    path "fig_long.pdf",      emit: figlong
    path "fig_short.pdf",        emit: figshort
    path "plot_mappability_analysis.html", emit: knitted_html
    path "versions.yml"            ,  emit: versions
    
    script:
    """
    render_rmd.R $rmd ${spectral_plot} ${telomere_single} ${arm_single} ${centromere_single} ${telomere_pair} ${arm_pair} ${centromere_pair} ${telomere_mate_pair} ${arm_mate_pair} ${centromere_mate_pair}

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        R: \$(R --version | head -1 | awk '{print \$3}')
        R_dplyr: \$(Rscript -e 'packageVersion("dplyr")' | awk '{print \$2}' | tr -d "‘’")
        R_ggplot2: \$(Rscript -e 'packageVersion("ggplot2")' | awk '{print \$2}' | tr -d "‘’")
        
    END_VERSIONS
    """
}
