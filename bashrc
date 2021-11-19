# Path Trim
PROMPT_DIRTRIM=1

# Enable Colors
force_color_prompt=yes
color_prompt=yes

# Show git info
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

get_git_user() {
  git config user.name 2> /dev/null
}

get_git_email() {
  git config user.email 2> /dev/null
}

GIT_BRANCH=$(parse_git_branch)
GIT_USER=$(get_git_user)
GIT_EMAIL=$(get_git_email)

# Build Prompt Header
FG_YELLOW='\[\033[01;33m\]'
FG_PURPLE='\[\033[01;35m\]'
FG_GREEN='\[\033[01;32m\]'
FG_BLUE='\[\033[01;34m\]'
FG_RED='\[\033[01;31m\]'
CLR='\[\033[00m\]'

DIV_TK=' .: '
LINE_AFTER=$FG_YELLOW'··················'$CLR'\n'
DEBIAN_CHROOT='${debian_chroot:+($debian_chroot)}'
USER_HOST_NAME=$FG_GREEN'\u@\h'$CLR
CURRENT_PATH=$FG_BLUE'\w'$CLR

PS1=$LINE_AFTER$DEBIAN_CHROOT$USER_HOST_NAME$DIV_TK$CURRENT_PATH

if [ "$GIT_BRANCH" != "" ]; then
  PS1=$PS1$DIV_TK$FG_RED$GIT_BRANCH$CLR
fi

if [ "$GIT_USER" != "" ]; then
  PS1=$PS1$DIV_TK$FG_PURPLE$GIT_USER$CLR
fi

if [ "$GIT_EMAIL" != "" ]; then
  PS1=$PS1$DIV_TK$FG_PURPLE$GIT_EMAIL$CLR
fi

PS1=$PS1'\n\$ '

#Disable Colors
unset color_prompt force_color_prompt

