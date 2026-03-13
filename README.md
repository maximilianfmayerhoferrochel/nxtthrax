This Github contains all parts for the usage of the NXTTHRAX database for the phylogeographic analysis of B. anthracis genomes and the R script for generating coverage plots for the reference genome of B. anthracis.
To setup the installation of the nextstrain suite, please follow the instructions found at https://docs.nextstrain.org/en/latest/install.html
After installation, you can find the config files containing the strain metadata (metadata.tsv), lat-lons of geolocations (lat_longs.tsv), colours of nodes(colors.tsv) and genetic subgroups (clades.tsv) in this Github together with the main file, the snakefile_publication.smk
The snakefile uses a vcf-file as input to calculate a nextstrain phylogenetic tree with augur and visualize all data with auspice (both are part of the nextstrain installation).
The vcf-file is generated using parsnp 2.0 (no-partition mode) which can be found here: https://github.com/marbl/parsnp/. We have also included our parsnp.vcf file so that you dont have to run the variant calling yourself, as this demands increased computational power.

This workflow follows the instructions found in https://docs.nextstrain.org/en/latest/tutorials/running-a-phylogenetic-workflow.html and https://docs.nextstrain.org/en/latest/tutorials/creating-a-phylogenetic-workflow.html
The results can be viewed locally or viewed by using the resulting 08_augur_out_export2auspice.json (or Supplementary Data 1) file at https://auspice.us/ in your browser.

