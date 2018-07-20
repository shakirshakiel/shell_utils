SOURCE=$1
DEST=$2
rsync -avzh --exclude-from='./rsync-exclude-file' -e ssh $SOURCE $DEST
