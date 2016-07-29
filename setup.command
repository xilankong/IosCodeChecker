cd `dirname $0`

echo -e "\033[32m---------------------- IOS code check -------------------------------\033[0m\n"
while :; do echo
echo -e "Would you like to use the code check ?? [ yes / no ]\n"   
echo -n ">  "
read  flag   
if [[ "$flag" == "yes" ]]; then
	while :; do echo
		echo -e "What check-style do you want to use?? [ list / window ]\n"   
		echo -n ">  "
		read  style                  
		if [[ "$style" == "list" ]]; then

			echo -e "\033[32m-------------------- setting code check start -----------------------\033[0m\n"

			if [ ! -d "spacecommander" ]; then
				$(git clone 'https://github.com/xilankong/spacecommander.git')
			fi
			if [ -f "spacecommander/setup-repo.sh" ]; then
		 		$(spacecommander/setup-repo.sh) 
		 	fi
		 	echo -e "\033[32m-------------------- setting code check end -----------------------\033[0m\n"
			if [[ -f "podfile" ]]; then
				 pod install
			fi
		 	break
		 elif [[ "$style" == "window" ]]; then

			echo -e "\033[32m-------------------- setting window code check start -----------------------\033[0m\n"

			if [ ! -d "spacecommander" ]; then
				$(git clone 'https://github.com/xilankong/spacecommander.git')
			fi
			if [ -f "spacecommander/setup-repo-window.sh" ]; then
			 	$(spacecommander/setup-repo-window.sh) 
		 	fi
		 	echo -e "\033[32m-------------------- setting window code check end -----------------------\033[0m\n"
			if [[ -f "podfile" ]]; then
				 pod install
			fi
			break
		 fi 
	done

 elif [[ "$flag" == "no" ]]; then

	if [  -d "spacecommander" ]; then
		$(rm -rf "spacecommander")
	fi
	if [  -f ".git/hooks/pre-commit" ]; then
		$(rm -rf ".git/hooks/pre-commit")
	fi
	echo -e "\033[32m---------- remove the code checker success ------------\033[0m\n"
	if [[ -f "podfile" ]]; then
		 pod install
	fi
	if [[ -L ".clang-format" ]]; then
		 $(rm -rf ".clang-format")
	fi
	break
 fi 
	break

  done
