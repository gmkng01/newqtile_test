Clock(){
	TIME=$(date "+%H:%M")
	echo -e -n " ${TIME} " 
}

Cal() {
    DATE=$(date "+%d, %b %y")
    echo -e -n " ${DATE} "
}