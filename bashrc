# Path Trim
PROMPT_DIRTRIM=1

# Enable Colors
force_color_prompt=yes
color_prompt=yes

# Graphic defines
FG_YELLOW='\033[01;33m'
FG_PURPLE='\033[01;35m'
FG_GREEN='\033[01;32m'
FG_BLUE='\033[01;34m'
FG_RED='\033[01;31m'
CLR='\033[00m'
DIV_TK=' .: '

# Extract git info
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/${DIV_TK}`printf ${FG_RED}`\1`printf ${CLR}`/"
}

get_git_user() {
  git config user.name 2> /dev/null | sed -e "s/\(.*\)/${DIV_TK}`printf ${FG_PURPLE}`\1`printf ${CLR}`/"
}

get_git_email() {
  git config user.email 2> /dev/null | sed -e "s/\(.*\)/${DIV_TK}`printf ${FG_PURPLE}`\1`printf ${CLR}`/"
}

GIT_BRANCH="\$(parse_git_branch)"
GIT_USER="\$(get_git_user)"
GIT_EMAIL="\$(get_git_email)"

# Build Prompt Header
LINE_AFTER=$FG_YELLOW'··················'$CLR'\n'
DEBIAN_CHROOT='${debian_chroot:+($debian_chroot)}'
USER_HOST_NAME=$FG_GREEN'\u@\h'$CLR
CURRENT_PATH=$FG_BLUE'\w'$CLR
PS1=$LINE_AFTER$DEBIAN_CHROOT$USER_HOST_NAME$DIV_TK$CURRENT_PATH
PS1=$PS1$GIT_BRANCH$GIT_USER$GIT_EMAIL'\n\$ '

#Disable Colors
unset color_prompt force_color_prompt

