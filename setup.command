cd `dirname $0`

echo -e "\033[32m>> IOS code checker <<\033[0m\n"
while :; do echo
echo -e "Would you like to use the code check ?? [ yes / no ]\n"   
echo -n ">  "
read  flag_normal
flag=$(echo $flag_normal | tr "[:upper:]" "[:lower:]" )
if [[ "$flag" == "yes" ]]; then
	while :; do echo
		echo -e "What check-style do you want to use?? [ list / window ]\n"   
		echo -n ">  "
		read  style_normal  
		style=$(echo $style_normal | tr "[:upper:]" "[:lower:]" )                
		if [[ "$style" == "list" ]]; then

			echo -e "\033[32m>> setting code checker start \033[0m\n"

			if [ ! -d "spacecommander" ]; then
				$(git clone 'https://github.com/xilankong/spacecommander.git')
			fi
			if [ -f "spacecommander/setup-repo.sh" ]; then
		 		$(spacecommander/setup-repo.sh) 
		 	fi
		 	echo -e "\033[32m>> setting code checker end \033[0m\n"

		 	break
		 elif [[ "$style" == "window" ]]; then

			echo -e "\033[32m>> setting window code checker start \033[0m\n"

			if [ ! -d "spacecommander" ]; then
				$(git clone 'https://github.com/xilankong/spacecommander.git')
			fi
			if [ -f "spacecommander/setup-repo-window.sh" ]; then
			 	$(spacecommander/setup-repo-window.sh) 
		 	fi
		 	echo -e "\033[32m>> setting window code checker end \033[0m\n"

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
  	sed -i.bak '/codelog=/d' ~/.bash_profile
  	sed -i.bak '/codereset=/d' ~/.bash_profile

	if [[ -L ".clang-format" ]]; then
		 $(rm -rf ".clang-format")
	fi
	
	cd ~/Documents &&  $(rm -rf "codeCheckerCache")

	echo -e "\033[32m>> remove the code checker success \033[0m\n"
	break
 else

	 continue
 fi 
     break
  done
