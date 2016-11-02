dirs=($(find $1 -d 1 -type d))
for dir in "${dirs[@]}"; do
	if [ -d "$dir/.git" ]
	then
		echo "Git pull on $dir"
		cd $dir
		git pull
	fi
done
