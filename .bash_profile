export PATH=/usr/local:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
alias ll='ls -l'

alias gs='git status'
alias gb='git branch'
alias gc='git checkout'
alias gdf='git diff'
alias gf='git fetch'
alias gl='git log'
alias gp='git pull'
alias gpu='git push'
alias vu='vagrant up'
alias vh='vagrant halt'
alias vs='vagrant ssh'
alias ctags='/usr/local/Cellar/ctags/5.8/bin/ctags'
alias t='tig'
alias ta='tig --all'


peco-select-history() {
    declare l=$(HISTTIMEFORMAT= history | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$READLINE_LINE")
    READLINE_LINE="$l"
    READLINE_POINT=${#l}
    # for OSX
    if [ `uname` = "Darwin" ]; then
        ${READLINE_LINE}
    fi
}
bind -x '"\C-r": peco-select-history'
 
# peco + cd
function pcd {
    local dir="$( find . -maxdepth 1 -type d | sed -e 's;\./;;' | peco )"
    if [ ! -z "$dir" ] ; then
        cd "$dir"
    fi
}
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi


# Mac VIM
if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
  alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
fi
