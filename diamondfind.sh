
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

FILE_1=$1

DATABASE=$2

# Stop if any error is found
set -ueox pipefail

mkdir -p $SCRIPTPATH/Diamond

diamond blastx -d $2 -q $1 -o $SCRIPTPATH/Diamond/$(basename ${1%%.*})_matches.m8 --max-hsps 5  -k 1 --outfmt 6 qseqid sseqid qtitle stitle length evalue score 
