for i in {71..73}; do esearch -db nuccore -query NC_0070${i} | efetch --format fasta > NC_0070${i} ; done
