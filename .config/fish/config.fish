if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes 
set -g fish_prompt_pwd_dir_length 0
starship init fish | source
set HISTSIZE 10000

pfetch

export PS1="\n \H  \[\e[33m\]\u\[\e[m\] \[\e[34m\]\w\[\e[m\] 󰀱  \e[31m\]\`nonzero_return\`\[\e[m\] \r\n "
