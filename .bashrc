pfetch

function nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo "$RETVAL"
}

export PS1="\n \H  \[\e[33m\]\u\[\e[m\] \[\e[34m\]\w\[\e[m\] 󰀱  \e[31m\]\`nonzero_return\`\[\e[m\] \r\n "
