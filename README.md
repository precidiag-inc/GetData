# GetData
Get microbiome data from various repos - altered for use with Precidiag hardware

# Installation
Create a new environment from requirements.txt & install dependency biopython
```
 conda create --name GetData --file requirements.txt
 pip install biopython==1.76
 conda activate GetData
```

Then you can install this repository via
```
pip install git+https://github.com/precidiag-inc/GetData.git
```

# Retrieving and Deblurring amplicon studies on the Sequence Read Archive

Run `process_experiment.py` for the full help menu.

`process_experiment.py` takes as input an SRA table.  
See [here](https://www.ncbi.nlm.nih.gov/Traces/study/?acc=SRP189726&o=acc_s%3Aa) for an example of one of these tables (it can be downloaded under the Download `Metadata`) button.

Note you may experience errors related to your sratoolkit installation. Precidiag HPC users are encouraged to work from 
preinstalled binaries and only in fastq mode. See example below.
```
process_experiment.py -i SraRunTable.txt -p /scratch/users/rhmills/mghpcc_precidiag/software/sratoolkit.3.0.0-centos_linux64/bin --fastq --num-threads 16
```
# Running GetData using SLURM job script
You can also run GetData using a SLURM job script. An example script is provided in RunGetData.sh.
Users need to modify the script's directories appropriately, then run the following command.

```
sbatch RunGetData.sh
```

# Obtaining SRA Run Tables
These tables can be obtained through using the SRA search engine.  
For example, if one wanted to look up the sequencing data for this [paper](https://www.cell.com/fulltext/S0092-8674(15)01481-6)
they can go to the [SRA website](https://www.ncbi.nlm.nih.gov/sra), and search under `SRA` -> `Personalized Nutrition by Prediction of Glycemic Responses`.
The SRA download page can be found under `Send results to Run selector`. Most of the time this will only contain a subset of the sample metadata, 
so that information will need to be retrieved from either supplemental materials from the paper or from the authors directly.

