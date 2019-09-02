#!/bin/bash
INDIR=$1;
OUTDIR="$INDIR/TIFF";
MAX_JOBS=$2;

function runner {
  echo "processing " $1 "start"
  OUTNAME=$(basename $i .CR2).tif
  convert $1 -negate -channel RGB $OUTDIR/$OUTNAME;
  echo "processing " $1 "done"
}

if [ ! -d "$OUTDIR" ]
  then
    echo "output-directory not available. creating:" $OUTDIR
    mkdir -p "$OUTDIR"
    for i in $(ls $INDIR/*.CR2); do
      runner $i &
      while [ $(jobs -r | wc -l) -ge $MAX_JOBS ]; do sleep 1; done
    done
    echo "Wating for background processes to finish ..."
    wait
    echo "conversion done"
  else
    echo "Output directory already exists, EXIT!"
fi
