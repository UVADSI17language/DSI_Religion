#!/bin/bash

# Co-Occ Window Parameter
for i in {2..6};
do
# Context Vector Window Parameter
for j in {2..6};
do
# Start Word Freq Parameter
for k in {10,20,30,40,50};
do
# Eigenvector Angle Parameter 
for l in {15,30,45,60};
do

cat <<EOF > run_hyperparaop.sbatch
#!/bin/bash

#SBATCH --nodes=1
#SBATCH --time=08:00:00
#SBATCH --partition=serial
#SBATCH --mem=5000
#SBATCH --account=dsOne

module load anaconda/2.4
python 'masterScript.py' $i $j $k $l

EOF

#sbatch run_hyperparaop.sbatch

done
done
done
done
