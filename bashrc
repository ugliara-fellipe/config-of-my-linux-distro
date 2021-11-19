# Path Trim
PROMPT_DIRTRIM=1

# Enable Colors
force_color_prompt=yes
color_prompt=yes

# Show git info
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

get_git_user() {
  git config user.name
}

get_git_email() {
  git config user.email
}

if [ "$color_prompt" = yes ]; then
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;36m\] $(parse_git_branch) $(get_git_user) $(get_git_email)\[\033[00m\]\n\$ '
else
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w $(parse_git_branch) $(get_git_user) $(get_git_email)\n\$ '
fi

# Draw Line After Command
PS1='\[\033[01;33m\]··················\[\033[00m\]\n'$PS1

#Disable Colors
unset color_prompt force_color_prompt