


read MYCOMM
case $MYCOMM in
	calc*)
		MYCOMM=${MYCOMM#* }
		case $MYCOMM in
			sum*)
				echo "summa"
				;;
			sub*)
				echo "sub"
				;;
			mul*)
				echo "mul"
				;;
			div*)
				echo "div"
				;;
			*)
				echo "ERROR COMMAND"
			;;
			esac







	
