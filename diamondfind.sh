SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

FILE_1=$1

DATABASE=$2

# Stop if any error is found
set -ueox pipefail

mkdir -p $SCRIPTPATH/Diamond

diamond blastp -d $2 -q $1 -o $SCRIPTPATH/Diamond/$(basename ${1%%.*})_matches.m8
