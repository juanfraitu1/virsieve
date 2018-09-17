
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

FILE_1=$1

# Stop if any error is found
set -ueox pipefail

mkdir -p $SCRIPTPATH/Prokkannot 

prokka --force --metagenome --outdir $SCRIPTPATH/Prokkannot/$(basename ${1%%.*}) --prefix $(basename ${1%%.*}) ${1}
