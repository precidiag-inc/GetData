# GetData
Get microbiome data from various repos - altered for use with Precidiag hardware

# Installation
Create a new environment, and install prerequisites `deblur` and note preinstalled `sra-tools` is required
```
 conda create --name GetData python=3.5 numpy
 conda activate GetData
 
 conda install -c bioconda -c biocore "VSEARCH=2.7.0" MAFFT=7.310 SortMeRNA=2.0 biom-format deblur
```

Then you can install this repository via
```
pip install git+https://github.com/precidiag-inc/GetData.git
```

# Retrieving and Deblurring amplicon studies on the Sequence Read Archive

Run `process_experiment.py` for the full help menu.

`process_experiment.py` takes as input an SRA table.  
See [here](https://www.ncbi.nlm.nih.gov/Traces/study/?acc=SRP189726&o=acc_s%3Aa) for an example of one of these tables (it can be downloaded under the Download `Metadata`) button.

```
process_experiment.py -i SraRunTable.txt -p /cm/shared/c3ddb/sratoolkit/2.8.0/bin  --num-threads 16
```

# Obtaining SRA Run Tables
These tables can be obtained through using the SRA search engine.  
For example, if one wanted to look up the sequencing data for this [paper](https://www.cell.com/fulltext/S0092-8674(15)01481-6)
they can go to the [SRA website](https://www.ncbi.nlm.nih.gov/sra), and search under `SRA` -> `Personalized Nutrition by Prediction of Glycemic Responses`.
The SRA download page can be found under `Send results to Run selector`. Most of the time this will only contain a subset of the sample metadata, 
so that information will need to be retrieved from either supplemental materials from the paper or from the authors directly.

# Notes
This has been tested on fastq-dump 2.8.0
