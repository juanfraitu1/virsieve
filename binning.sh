FILE=$1
RP=~/scratch/Beegenome
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
bbsplit.sh in=$1 ref=${RP}/NC_007070.fasta,${RP}/NC_007071.fasta,${RP}/NC_007072.fasta,${RP}/NC_007073.fasta,${RP}/NC_007074.fasta,${RP}/NC_007075.fasta,${RP}/NC_007076.fasta,${RP}/NC_007077.fasta,${RP}/NC_007078.fasta,${RP}/NC_007079.fasta,${RP}/NC_007080.fasta,${RP}/NC_007081.fasta,${RP}/NC_007082.fasta,${RP}/NC_007083.fasta,${RP}/NC_007084.fasta,${RP}/NC_007085.fasta basename=$SCRIPTPATH/Binning/out_%_#.fq.gz outu=$SCRIPTPATH/Binning/nonbee/${1%.*}.fq.gz minratio=0.76 minhits=1
