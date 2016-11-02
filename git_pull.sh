dirs=($(find $1 -d 1 -type d))
for dir in "${dirs[@]}"; do
	echo $dir
	if [ -n "$(ls -A $dir/.git)" ]
	then
		cd $dir
		git pull
	fi
done
