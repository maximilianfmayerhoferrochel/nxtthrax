This Github contains all parts for the usage of the NXTTHRAX database for the phylogeographic analysis of B. anthracis genomes.
To setup the installation of the nextstrain suite, please follow the instructions found at https://docs.nextstrain.org/en/latest/install.html
After installation, you can find the config files containing the strain metadata (metadata.tsv), lat-lons of geolocations (lat_longs.tsv), colours of nodes(colors.tsv) and genetic subgroups (clades.tsv) in this Github together with the main file, the snakefile_publication.smk
The snakefile uses a vcf-file as input to calculate a nextstrain phylogenetic tree with augur and visualize all data with auspice (both are part of the nextstrain installation).
The vcf-file is generated using parsnp 2.0 (no-partition mode) which can be found here: https://github.com/marbl/parsnp/. We have also included our parsnp.vcf file so that you dont have to run the variant calling yourself, as this demands increased computational power.

This workflow follows the instructions found in https://docs.nextstrain.org/en/latest/tutorials/running-a-phylogenetic-workflow.html and https://docs.nextstrain.org/en/latest/tutorials/creating-a-phylogenetic-workflow.html
The results can be viewed locally or viewed by using the resulting .json file at https://auspice.us/ in your browser.

pseudo structure for the code:
project/
│
├── data/
│   ├── genomes/
│   │   ├── genome1.fna
│   │   ├── genome2.fna
│   │   ├── genome3.fna
│   │   ├── ...
│   ├── reference/
│   │   ├──Ames-Ancestor.fna
│   │   ├──Ames-Ancestor.gff3
├── config/
│   ├── clades.tsv
│   ├── colors.tsv
│   ├── lat_longs.tsv
│   ├── metadata.tsv
├── scripts/
│   ├── parsnp.bash # This is not needed when using the parsnp.vcf in this github
├── 01_parsnp_out/
│   ├── parsnp.vcf
