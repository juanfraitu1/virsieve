SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

FILE_1=$1


# Stop if any error is found
set -ueox pipefail

mkdir -p $SCRIPTPATH/ORFs 

orfm -t $SCRIPTPATH/ORFs/$(basename ${1}) ${1} 
