pfetch

function nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo "$RETVAL"
}

export PS1="\n \H  \[\e[33m\]\u\[\e[m\] \[\e[34m\]\w\[\e[m\] 󰀱  \e[31m\]\`nonzero_return\`\[\e[m\] \r\n "
HISTSIZE=10000  # Replace 10000 with your desired history size
HISTFILESIZE=20000  # Replace 20000 with your desired history file size
