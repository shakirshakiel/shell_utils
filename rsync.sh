SOURCE=$1
DEST=$2
rsync -avzh --exclude-from='/Users/ashakiel/pet/shell_utils/rsync-exclude-file' -e ssh $SOURCE $DEST
