#!/bin/bash
INDIR=$1;
OUTDIR="$INDIR/TIFF";
MAX_JOBS=$2;

function runner {
  echo "processing " $1 "start"
  OUTNAME=$(basename $i .CR2).tif
  nice -n 20 convert $1 -negate -channel RGB $OUTDIR/$OUTNAME;
  echo "processing " $1 "done"
}

if ! [ -x "$(command -v convert)" ]; then
  echo 'Error: ImageMagick is not available.' >&2
  exit 1
fi

if ! [ -x "$(command -v ufraw-batch)" ]; then
  echo 'Error: ufraw is not available.' >&2
  exit 1
fi

if [ -d "$OUTDIR" ]; then
  echo 'Output directory already exists, EXIT!' >&2
  exit 1
fi

echo "creating output directory:" $OUTDIR
mkdir -p "$OUTDIR"

for i in $(ls $INDIR/* | egrep -i '\.cr2$|\.cr3$'); do
  runner $i &
  sleep 1
  while [ $(jobs -r | wc -l) -ge $MAX_JOBS ]; do sleep 1; done
done

echo "Wating for background processes to finish ..."
wait
echo "conversion done"
