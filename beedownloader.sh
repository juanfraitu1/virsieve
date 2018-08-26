
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

# Stop if any error is found
set -ueox pipefail

esearch -db sra -query PRJNA407112 | efetch --format runinfo |cut -d "," -f 1 | grep SRR | xargs fastq-dump --split-files
