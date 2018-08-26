SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

FILE_1=$1

Contaminants=$2

# Stop if any error is found
set -ueox pipefail

mkdir -p $SCRIPTPATH/NorRNA

bbduk.sh ${1} $SCRIPTPATH/NorRNA/$(basename ${1%%.*})"_processed.fastq" ${2} --overwrite=true

