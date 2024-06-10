# ----- Environment variables -----
export LANG=en_US.UTF-8

# ----- Settings -----
# Enable color
autoload -Uz colors
colors

# Set key binds like emacs
bindkey -e

# Settings for history
HISTFILE=~/.zsh_history
HISTSIZE=100000000
SAVEHIST=100000000

# Prompt
# PROMPT="%~ %# "
PROMPT="%{${fg[blue]}%}[%n@%m]%{${reset_color}%} %~
🐼  %# "

# Auto-complete
autoload -Uz compinit
compinit -u

zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format $YELLOW'%d'$DEFAULT
zstyle ':completion:*:descriptions' format $YELLOW'completing %B%d%b'$DEFAULT
zstyle ':completion:*:corrections' format $YELLOW'%B%d '$RED'(errors: %e)%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*' group-name ''

export LSCOLORS=xxfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..

# Auto-complete command name for ps command
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# Auto-complete for sudo
X_COMPPATH=''
X_SUDOPATH=''
for it in `echo $PATH | sed -e 's/:/ /g'`; do
  X_SUDOPATH="$X_SUDOPATH $it"
  [[ ! sbin = `basename $it` ]] && X_COMPPATH="$X_COMPPATH $it"
done

case ${UID} in
  0)
    zstyle ':completion:*' command-path `echo $X_SUDOPATH`
    ;;
  *)
    zstyle ':completion:*' command-path `echo $X_COMPPATH`
    zstyle ':completion:*:sudo:*' command-path `echo $X_SUDOPATH`
    ;;
esac





########################################
# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg


# Multi Byte Character Support
setopt print_eight_bit

# Disable beep
setopt no_beep

# Treat text as comment after '#'
setopt interactive_comments

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt extended_glob

bindkey '^R' history-incremental-pattern-search-backward

# エイリアス

alias ll='ls -la'

# Enable alias after sudo
alias sudo='sudo '

# User standard clipboard
# mollifier delta blog : http://mollifier.hatenablog.com/entry/20100317/p1
if which pbcopy >/dev/null 2>&1 ; then
    # Mac
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then
    # Cygwin
    alias -g C='| putclip'
fi



########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
        ;;
esac


function cd() {
    builtin cd $@ && ls;
}


cat << "EOF"
⣿⢿⣿⣿⣿⣿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿
⡇⠀⠀⠀⠀⠀⠀⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀T⠀⠀⠀⠀⢸
⡇⠀⠀⠀⠀⢀⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀ H⠀⠀⠀⠀⢸
⡇⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠹⣿⣿⠿⣿⢿⡿⣿⣿⣿⣿⡆⠀⠀⠀E⠀⠀⠀⠀⢸
⡇⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⡿⢿⠿⠛⠙⠉⠁⠀⠻⠋⠀⠁⠈⢀⠘⠋⡛⢿⣇⠀⠀⠀⠀⠀⠀⠀⠀⢸
⡇⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⢰⣶⣶⣶⣿⣿⣅⣠⣠⣷⣦⣤⣾⣿⣾⣷⣆⢿⠀⠀⠀M⠀⠀⠀⠀⢸
⡇⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⠟⣸⣿⣿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⠸⠀⠀⠀O⠀⠀⠀⠀⢸
⡇⠀⠀⠀⠀⣿⣿⣿⣿⣿⠟⣡⣾⡟⣉⣖⠛⠿⠷⠶⠍⠻⣿⣿⡟⠋⠒⠛⠋⡅⣠⡀⠀⠀T⠀⠀⠀⠀⢸
⡇⠀⠀⠀⠀⢸⣿⣿⣿⡿⠌⠟⣛⣉⢩⡵⠐⠈⠀⠁⢂⣄⢤⣴⡆⢈⣀⣀⣀⡀⣭⣵⠀⠀H⠀⠀⠀⠀⢸
⡇⠀⠀⠀⠀⢀⡭⠭⠙⢷⡆⢻⣿⣿⣮⡻⢿⣶⣶⡿⠿⣫⣾⣿⣷⡰⣭⣿⣿⣧⡉⠁⠀⠀E⠀⠀⠀⠀⢸
⡇⠀⠀⠀⠀⢠⣾⡿⠆⢇⠻⢸⣿⣿⣿⣿⣷⣶⣶⣶⣿⣿⣿⣿⣿⣧⠻⣿⣿⣿⡇⠀⠀⠀R⠀⠀⠀⠀⢸
⡇⠀⠀⠀⠀⠘⣿⠰⣇⠈⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⠸⢋⠛⡿⠛⢁⣿⣿⣿⡇⠀⠀⠀F⠀⠀⠀⠀⢸
⡇⠀⠀⠀⠀⠀⠘⢧⣤⣶⡘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠁⠀⠀⠀U⠀⠀⠀⠀⢸
⡇⠀⠀⠀⠀⠀⠀⠀⠙⠋⠁⠙⣿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠭⢭⠭⠝⠻⣿⣿⣿⠀⠀⠀⠀C⠀⠀⠀⠀⢸
⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣌⢿⣿⣿⣿⣿⣿⣿⣤⣤⣈⣈⣁⣠⠄⣼⣿⡇⠀⠀⠀⠀K⠀⠀⠀⠀⢸
⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣮⠻⣿⣿⣿⣿⣿⣿⣬⣛⣛⣯⣵⣾⣿⡟⠀⠀⠀⠀⠀E⠀⠀⠀⠀⢸
⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢸⣿⣷⣮⡻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⡄⣿⣄⠀⠀⠀R⠀⠀⠀⠀⢸
⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⢸⣿⣿⣿⣿⣮⣝⡿⣿⣿⣿⣿⣿⠿⣫⣾⡇⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⢸
⡇⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣶⣭⣭⣽⣶⣿⣿⣿⢱⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⢸
⡇⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢣⣿⣿⣿⣿⣿⣿⣷⢠⣄⠀⠀⢸
⣿⣶⣶⣶⣶⣶⣾⣷⣿⣿⣿⣿⣿ ALBERT CUEME ⣿⣿⣿⣾⣿⣿⣿⣿⣷⣿⣿⣶⣾
EOF
