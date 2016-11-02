git_pull() {
	dirs=($(find $1 -d 1 -type d))
	for dir in "${dirs[@]}"; do
		if [ -d "$dir/.git" ]
		then
			echo "Git pull on $dir"
			cd $dir
			git pull
		fi
	done
}

git_status() {
	dirs=($(find $1 -d 1 -type d))
	for dir in "${dirs[@]}"; do
		if [ -d "$dir/.git" ]
		then
			echo "Git status on $dir"
			cd $dir
			git st
		fi
	done
}

git_submodule_update() {
	dirs=($(find $1 -d 1 -type d))
	for dir in "${dirs[@]}"; do
		if [ -d "$dir/.git" ]
		then
			if grep -q "submodule" $dir/.git/config
			then
				echo "Git submodule update on $dir"
				cd $dir
				git submodule update
			fi
		fi
	done
}

sync_project() {
	CWD=$(pwd)
	pretty_print "Git pull on all projects"
	git_pull $1
	pretty_print "Git submodule update on all projects"
	git_submodule_update $1
	cd $CWD
}

pretty_print() {
	x=$1
	length=${#x}+1
	sep="*"
	var=""
	for (( i=1; i<=length; i++))
	do
		var+=$sep
	done	
	printf "%s\n%s\n%s\n" "$var" "$1" "$var"
}
