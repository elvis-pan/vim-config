# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/elvispan/.oh-my-zsh"

#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
#ZSH_THEME="amuse"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
source $ZSH/oh-my-zsh.sh

# zsh-syntax-highlighting and zsh-autosuggestions
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=147,bg=underline"

# Python
export PATH=/Users/elvispan/Library/Python/3.7/bin/:$PATH
export PATH=/Users/elvispan/Library/Python/3.8/bin/:$PATH
export PATH=/usr/bin/:"$PATH"
export PATH=/Users/elvispan/anaconda3/envs/main/:$PATH
export PATH=/Users/elvispan/anaconda3/envs/jbw/:$PATH
# export PYTHONPATH=/usr/bin:"$PATH"
export PYTHONPATH=/Users/elvispan/anaconda3
export PYTHONPATH=/Users/elvispan/anaconda3/envs/main/:$PATH
export PYTHONPATH=/Users/elvispan/anaconda3/envs/jbw/:$PATH

# Set editor to NeoVim
export VISUAL=nvim
export EDITOR=nvim

# SML
export PATH=/usr/local/smlnj/bin:"$PATH"
export PATH=/usr/local//Cellar/llvm/10.0.1_1/bin:"$PATH"

#################### Aliases ####################
# Example aliases
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

# python
#alias pip3="/usr/bin/pip3"
#alias python3="/usr/bin/python3"
#alias python="/usr/bin/python2.7"

alias p="cd .."


# vim
alias vim="nvim"
alias v="vim"
alias nv="cd ~/.config/nvim"
alias vimrc="vim ~/.config/nvim/init.vim"

# proxy
alias http="export http_proxy=http://127.0.0.1:15236"
alias https="export https_proxy=http://127.0.0.1:15236"

alias cc0="~/cc0/bin/cc0"
alias coin="~/cc0/bin/coin"
alias 122="cd ~/Documents/CMU/Course/F19/15-122"
alias 122p="cd ~/Documents/CMU/Course/F19/15-122/Homework/Programming"
alias 213="cd ~/Documents/CMU/Course/M20/15-213"

alias cswp="rm ~/.local/share/nvim/swap/*"

alias cmu="cd ~/Documents/CMU"

# Fall 2020 courses
alias 701="cd ~/Documents/CMU/Course/F20/10-701"
alias 210="cd ~/Documents/CMU/Course/F20/15-210"

# Spring 2021 courses
alias 462="cd ~/Documents/CMU/Course/S21/15-462"
alias 385="cd ~/Documents/CMU/Course/S21/16-385"
alias 725="cd ~/Documents/CMU/Course/S21/10-725"

# Fall 2021 courses
alias 859="cd ~/Documents/CMU/Course/F21/15-859"
alias 451="cd ~/Documents/CMU/Course/F21/15-451"
alias 459="cd ~/Documents/CMU/Course/F21/15-459"
alias 373="cd ~/Documents/CMU/Course/F21/21-373"
# alias 295="cd ~/Documents/CMU/Course/F21/15-295"

# Spring 2022 courses
alias 751="cd ~/Documents/CMU/Course/S22/15-751"
alias 484="cd ~/Documents/CMU/Course/S22/21-484"
alias 356="cd ~/Documents/CMU/Course/S22/21-356"
alias 405="cd ~/Documents/CMU/Course/S22/80-405"
alias 295="cd ~/Documents/CMU/Course/S22/15-295"

# alias s="neofetch"
alias code="cd ~/Documents/code"
alias gh="cd ~/Documents/GitHub"
alias wb="cd ~/Documents/GitHub/panyan7.github.io"
alias music="cd ~/Documents/Miscellaneous/music"
alias cf="cd ~/Documents/CP/Codeforces"
alias algo="cd ~/Documents/GitHub/algorithm"
alias re="cd ~/Documents/Research"
alias mc="cd ~/Documents/Research/MultiComp"
alias cv="cd ~/Documents/CMU/CV"
alias notes="cd ~/Documents/Notes"
alias lt="cd ~/Documents/GitHub/latex-template"
alias rebib="rebiber -i references.bib -o references.bib -r editor,volume,month,url,biburl,address,publisher,bibsource,timestamp,doi"
alias viewbib="vim ~/Documents/GitHub/latex-template/references.bib"
alias renewbib="cp ~/Documents/GitHub/latex-template/references.bib references.bib"

prompt_context(){}
# Competitive Programming
function create () {
  for i;
  do cp ~/Documents/CP/Codeforces/template.cpp $i.cpp
  done
}
function create-python () {
  for i;
  do cp ~/Documents/CP/Codeforces/template.py $i.py
  done
}
function run () {
  g++ $1.cpp -o $1 -std=c++17;
  ./$1
}
function template () {
  cp ~/Documents/GitHub/algorithm/$1.cpp $2.cpp
}
function view-template () {
  vim ~/Documents/GitHub/algorithm/$1.cpp
}
function to-cf () {
  mkdir ~/Documents/CP/Codeforces/$2;
  cp $1.cpp ~/Documents/CP/Codeforces/$2/$3.cpp;
}
function maketex () {
  mkdir $1;
  cp ~/Documents/GitHub/latex-template/template.tex $1/$1.tex;
  cp ~/Documents/GitHub/latex-template/panyan.sty $1;
}
function maketex-bib () {
  mkdir $1;
  cp ~/Documents/GitHub/latex-template/template.tex $1/$1.tex;
  cp ~/Documents/GitHub/latex-template/panyan.sty $1;
  cp ~/Documents/GitHub/latex-template/references.bib $1;
}
function makebeamer () {
  mkdir $1;
  cp ~/Documents/GitHub/latex-template/beamer_template.tex $1/$1.tex;
  cp ~/Documents/GitHub/latex-template/math.tex $1;
}
function cpwb () {
  cp $1 ~/Documents/GitHub/panyan7.github.io/assets/pdf
}
function cpwbn () {
  cp $1 ~/Documents/GitHub/panyan7.github.io/assets/pdf/$2
}

export PATH="$HOME/.poetry/bin:$PATH"
export GUILE_LOAD_PATH="/usr/local/share/guile/site/3.0"
export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"
export CPLUS_INCLUDE_PATH="/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/elvispan/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/elvispan/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/elvispan/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/elvispan/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

