#!/bin/bash

#Select which kind of nodes will be used for job
#SBATCH -p sched_mem1TB_centos7

#Output file
#SBATCH -o /home/rhmills/logs/GetData_%j.out

#Error/log file
#SBATCH -e /home/rhmills/logs/GetData_%j.err

#Number of cores
#SBATCH -c 16

#Memory
#SBATCH --mem=32g

#Mail Settings
#SBATCH --mail-user=robert.mills@precidiag.com
#SBATCH --mail-type=END

#The test command
#srun date

# Before running, activate your GetData environment
#conda activate GetData

# Load directories
SCRATCH=/scratch/users/rhmills/mghpcc_precidiag/ASD/External_Data/Ha2021
SRA=/scratch/users/rhmills/mghpcc_precidiag/software/sratoolkit.3.0.0-centos_linux64/bin

# launch the code
cd ${SCRATCH}
srun process_experiment.py -i ${SCRATCH}/SraRunTable.txt -p ${SRA} --fastq --num-threads 16
