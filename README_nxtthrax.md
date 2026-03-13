# NXTTHRAX: Nextstrain Build for Anthrax WGS Data Analysis

## Overview
NXTTHRAX provides a comprehensive workflow for phylogeographic analysis of *Bacillus anthracis* genomes using the Nextstrain platform. This repository contains all scripts, configuration files, and sample data necessary to reproduce the phylogenetic analyses and interactive visualizations for anthrax whole genome sequencing data.

## System Requirements

### Software Dependencies
- **Nextstrain suite** (augur, auspice) - install via conda/mamba
- **Python** 3.8 or higher
- **R** 4.0 or higher (for coverage plots)
- **Snakemake** 7.0 or higher
- **parsnp** 2.0 (for variant calling, optional if using provided VCF)

### Operating Systems
- **Linux** (Ubuntu 20.04+ recommended)
- **Windows** (via Windows Subsystem for Linux)

### Hardware Requirements
- **Memory:** 8GB RAM minimum, 16GB recommended
- **Storage:** 5GB free space
- **CPU:** Multi-core processor recommended

### Tested Versions
- Ubuntu 22.04 LTS
- Python 3.8-3.11
- Nextstrain CLI 8.0+

## Installation

### Step 1: Install Conda/Mamba (if not already installed)
```bash
# Download and install miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
# Restart your terminal or run: source ~/.bashrc
```

### Step 2: Install Nextstrain Suite
```bash
# Create a new conda environment (recommended)
conda create -n nextstrain python=3.9
conda activate nextstrain

# Install Nextstrain CLI
conda install -c conda-forge -c bioconda nextstrain-cli

# Verify installation
nextstrain check-setup
```

### Step 3: Clone This Repository
```bash
git clone https://github.com/maximilianfmayerhoferrochel/nxtthrax.git
cd nxtthrax
```

### Step 4: Install Additional Dependencies
```bash
# Install Snakemake
conda install -c conda-forge snakemake

# Install R packages for coverage plots
conda install -c conda-forge r-base r-ggplot2 r-dplyr
```

**Typical installation time:** 15-30 minutes on a standard desktop computer.

## Quick Demo (5-10 minutes runtime)

### Run the Complete Workflow
```bash
# Activate your conda environment
conda activate nextstrain

# Run the workflow with sample data
snakemake -s snakefile_publication.smk --cores 4

# View results locally in browser
nextstrain view auspice/ --port 4001
```
Open your browser and go to `http://localhost:4001` to view the interactive phylogenetic tree.

### Alternative: View Online
Upload the generated `08_augur_out_export2auspice.json` file to https://auspice.us/ for online viewing.

### Expected Output
- `auspice/` directory with visualization files
- `08_augur_out_export2auspice.json` - main output file for viewing
- Interactive time-resolved phylogenetic tree with geographic metadata
- **Expected runtime:** 5-10 minutes on standard desktop

## File Descriptions

| File | Description |
|------|-------------|
| `snakefile_publication.smk` | Main Snakemake workflow orchestrating the entire analysis |
| `parsnp.vcf` | Sample variant call file (2.2MB) for demonstration |
| `metadata.tsv` | Strain metadata including collection dates and locations |
| `lat_longs.tsv` | Geographic coordinates for sampling locations |
| `colors.tsv` | Color scheme definitions for visualization |
| `clades.tsv` | Genetic clade/group definitions |
| `coverage_plot_ggplot.R` | R script for generating coverage visualization plots |
| `parsnp_w_version212.sh` | Shell script for running parsnp variant calling |
| `file_structure` | Overview of expected file organization |

## Usage Instructions

### Running on Your Own Data

1. **Prepare your variant file:** Use parsnp or another variant caller to generate a VCF file
   ```bash
   # Example using parsnp (optional - you can use the provided script)
   bash parsnp_w_version212.sh
   ```

2. **Update metadata files with your data:**
   - `metadata.tsv` - Update with your strain information, collection dates, locations
   - `lat_longs.tsv` - Add geographic coordinates for your sampling locations
   - `colors.tsv` - Customize color scheme if desired
   - `clades.tsv` - Define genetic groups/clades for your dataset

3. **Run the workflow:**
   ```bash
   # Use appropriate number of CPU cores available
   snakemake -s snakefile_publication.smk --cores 8
   ```

4. **View results:**
   ```bash
   nextstrain view auspice/ --port 4001
   ```

### Generating Coverage Plots
```bash
# Run the R script for coverage visualization
Rscript coverage_plot_ggplot.R
```

### Workflow Steps
The Snakemake workflow performs the following steps:
1. **Data preparation** - Process VCF and metadata files
2. **Tree building** - Construct phylogenetic tree using augur
3. **Time calibration** - Infer temporal signal and date internal nodes
4. **Geographic annotation** - Add location information
5. **Visualization** - Export data for Auspice visualization
6. **Quality control** - Generate coverage and diagnostic plots

## Output Files

- **Main visualization:** `08_augur_out_export2auspice.json` - Upload to https://auspice.us/ or view locally
- **Coverage plots:** Generated by the R script
- **Intermediate files:** Various augur output files stored in workflow directories
- **Log files:** Snakemake generates detailed logs for each step

## Troubleshooting

### Common Issues
1. **Conda environment issues:** Make sure to activate your environment: `conda activate nextstrain`
2. **Permission errors:** Ensure you have write permissions in the directory
3. **Memory errors:** Increase available memory or reduce dataset size for testing
4. **Missing dependencies:** Run `nextstrain check-setup` to verify installation

### Getting Help
- Check the [Nextstrain documentation](https://docs.nextstrain.org/)
- Review [Snakemake documentation](https://snakemake.readthedocs.io/)
- Open an issue on this GitHub repository

## Reproduction Instructions

To reproduce the exact results from our manuscript:
1. Follow the installation instructions above
2. Use the provided sample data (no modifications needed)
3. Run: `snakemake -s snakefile_publication.smk --cores 8`
4. Results will match the analyses presented in the publication
5. The output file corresponds to Supplementary Data 1 in the manuscript

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments
- [Nextstrain team](https://nextstrain.org/) for the phylogenetic analysis platform
- [parsnp developers](https://github.com/marbl/parsnp/) for variant calling tools
- [Snakemake community](https://snakemake.github.io/) for workflow management

## References
- Nextstrain: https://nextstrain.org/
- Augur documentation: https://docs.nextstrain.org/projects/augur/
- Auspice documentation: https://docs.nextstrain.org/projects/auspice/
- Parsnp: https://github.com/marbl/parsnp/
- Snakemake: https://snakemake.readthedocs.io/

---
**Note:** This workflow follows the tutorials at https://docs.nextstrain.org/en/latest/tutorials/ for phylogenetic analysis best practices.
