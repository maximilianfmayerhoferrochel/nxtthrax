#!/usr/bin/env bash

conda activate eurothrax

## Create vcf
rm -rf 01_parsnp_out
parsnp -p 8 -v --vcf -C 1000 -e -u --no-partition -d ./data/genomes/*.fna -r ./data/reference/Ames-Ancestor.fna -c -o 01_parsnp_out
