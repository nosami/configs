#if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux
#fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME=agnoster
ZSH_THEME=amuse

setopt rmstarsilent

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh
# bindkey '^P' up-history
# bindkey '^N' down-history
# bindkey '^?' backward-delete-char
# bindkey '^h' backward-delete-char
# bindkey '^w' backward-kill-word
# bindkey '^r' history-incremental-search-backward
# bindkey -s '^[3' \#

mkcd () {
    mkdir -p "$*"
    cd "$*"
}

#ctrl-z suspends _and_ resumes
# fancy-ctrl-z () {
#     if [[ $#BUFFER -eq 0 ]]; then
#         fg
#         zle redisplay
#     else
#         zle push-input
#     fi
# }

# zle -N fancy-ctrl-z
# bindkey '^Z' fancy-ctrl-z
# export MONO_ENV_OPTIONS=--arch=64
export DISABLE_STETIC=1
export EDITOR=vim
export MONODEVELOP_CONSOLE_LOG_LEVEL=All
#export MONODEVELOP_DEV_ADDINS=/Users/jason/src/XSVim/XSVim/bin/Debug/
export MONODEVELOP_SDB_TEST=1
export MONO_THREADS_SUSPEND=preemptive
export PATH=$HOME/.dotnet/tools:/opt/homebrew/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:./node_modules/.bin:$PATH
export PYTHONSTARTUP=~/.pystartup
export XAMARIN_UPDATER_IGNORE_LOCK=13
export XAMARIN_UPDATER_TIMEOUT=10000 # The default 

# Save and reload the history after each command finishes
#alias atom='cd ~/.atom/packages/atom-sharper'
alias ..='cd ..'
alias ao='git log --date=short --reverse --all --since=3.weeks.ago --author=nosami'
alias buildfs='pushd . && cd ~/src/vsmac/main/external/fsharpbinding/MonoDevelop.FSharpBinding && msbuild *.fastbuild.fsproj && popd'
alias cda='cd ~/src/md-addins'
alias cdf='cd ~/src/vsmac/main/external/fsharp-editor'
alias cdfb='cd ~/src/vsmac/main/external/fsharpbinding'
alias cdm='cd ~/src/monodevelop'
alias cdv='cd ~/src/vsmac'
alias cdn='cd ~/src/net6'
alias cdmono='cd /Library/Frameworks/Mono.framework/Versions/Current'
alias cdmono='cd /Library/Frameworks/Mono.framework/Versions/Current'
alias cdp='cd ~/src/vsmac/main/build/AddIns/FSharpBinding/'
alias clean='git clean -xffd'
alias clone_md_roslyn='git clone git@github.com:mono/monodevelop -b roslyn --recursive && git clone git@github.com:xamarin/md-addins -b roslyn --recursive && (cd monodevelop && ./configure --profile=mac && make) && (cd md-addins && ./configure --profile=mac && make)'
alias cycle7='MONODEVELOP_DEV_ADDINS=/Users/jason/src/cycle7/monodevelop/main/external/fsharpbinding/bin/ && cd ~/src/cycle7/md-addins && make run'
alias deletetrailingwhitespace="find . -iname '*.fs*' -type f -exec sed -i '' 's/[[:space:]]\{1,\}$//' {} \+"
alias e='/Applications/Emacs.app/Contents/MacOS/Emacs'
alias f='find .  -name'
alias fd="fd --no-ignore-vcs"
alias findhere='find . -name'
alias got='git'
alias gs='emacsclient -ct --eval "(magit-status-here)"'
alias kmd='kill -KILL `pgrep "MonoDevelop|Xamarin|Studio|mono"` && pkill mono'
alias kw='pkill Workbook'
alias l='exa -lF'
alias linkmono64='sudo ln -sf /Library/Frameworks/Mono.framework/Versions/Current/bin/mono64 /Library/Frameworks/Mono.framework/Versions/Current/bin/mono'
alias ll='exa -lFa'
alias ls='exa'
alias main='git checkout main'
alias master='git checkout master'
alias mdtool='mono ~/src/vsmac/main/build/bin/mdtool.exe'
alias mpv='mpv --ontop'
alias nunit='/Library/Frameworks/Mono.framework/Versions/Current/bin/nunit-console4'
alias o='mono ~/.vim/bundle/Omnisharp/server/OmniSharp/bin/Debug/OmniSharp.exe'
alias omni='cd ~/.vim/bundle/Omnisharp/server/OmniSharp'
alias ours='git checkout --ours'
alias pull='git pull'
alias push='git push'
alias pw='pkill Workbook'
alias rebase='git pull --rebase origin master'
alias run='pushd . && cda && make run && popd'
alias src='cd ~/src'
alias theirs='git checkout --theirs'
alias telemetrymonitor='mono ~/src/telemetry-monitor/VisualStudioTelemetryMonitor.Xwt/bin/Debug/VisualStudioTelemetryMonitor.exe'
alias tree='exa -T'
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias v='vim .'
alias vi='emacsclient -t'
alias vs='MONODEVELOP_CONSOLE_LOG_LEVEL=All /Applications/Visual\ Studio.app/Contents/MacOS/VisualStudio --no-redirect'
alias vspreview='MONODEVELOP_CONSOLE_LOG_LEVEL=All /Applications/Visual\ Studio\ \(Preview\).app/Contents/MacOS/VisualStudio --no-redirect'
alias wgetmdpkgs="grep azureedge ~/src/md-addins/bot-provisioning/Make.config | sed 's/.*=//' | xargs wget -nc"
alias xs='MONODEVELOP_CONSOLE_LOG_LEVEL=All /Applications/Xamarin\ Studio.app/Contents/MacOS/XamarinStudio --no-redirect'
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
# Customize to your needs...
killit() {
    # Kills any process that matches a regexp passed to it
    ps aux | grep -v "grep" | grep -i "$@" | awk '{print $2}' | xargs kill -KILL
}

# fake () {
#     mono packages/FAKE/tools/FAKE.exe $1 --fsiargs -d:MONO build.fsx
# }

vifind () {
  fd $1 | xargs -o emacsclient -t
}

batfind () {
    fd $1 | xargs bat
}

# alias paket='mono .paket/paket.exe'
alias ma='pushd . && cd ~/src/monodevelop/main/src/core/Mono.Texteditor/ && xbuild /v:q && popd && pushd . && cd ~/src/monodevelop/main/external/fsharpbinding/MonoDevelop.FSharp.Tests/ && xbuild && popd && mono64 ../../build/bin/mdtool.exe run-md-tests ../../external/fsharpbinding/MonoDevelop.FSharp.Tests/bin/Debug/MonoDevelop.FSharp.Tests.dll -labels -run=MonoDevelopTests.SyntaxHighlighting'
alias makeupdater="pushd ~/src/md-addins/MacUpdater && xcodebuild -project 'Visual Studio Update.xcodeproj' -alltargets && popd"
alias mt='pushd . && cd ~/src/monodevelop/main/external/fsharpbinding/MonoDevelop.FSharp.Tests/ && xbuild MonoDevelop.FSharp.Tests.fastbuild.fsproj /v:q && popd && mono64 ../../build/bin/mdtool.exe run-md-tests ../../external/fsharpbinding/MonoDevelop.FSharp.Tests/bin/Debug/MonoDevelop.FSharp.Tests.dll -labels -run=MonoDevelopTests.SyntaxHighlighting'
alias mp='pushd . && cd ~/src/monodevelop/main/external/fsharpbinding/MonoDevelop.FSharp.Tests/ && xbuild /v:q && popd && mono64 ../../build/bin/mdtool.exe run-md-tests ../../external/fsharpbinding/MonoDevelop.FSharp.Tests/bin/Debug/MonoDevelop.FSharp.Tests.dll -labels -run="MonoDevelopTests.Template tests" && popd'
alias mm='pushd . && cd ~/src/monodevelop/main/src/addins/MonoDevelop.SourceEditor2 && make && mono64 ../../../build/bin/mdtool.exe run-md-tests ../../../external/fsharpbinding/MonoDevelop.FSharp.Tests/bin/Debug/MonoDevelop.FSharp.Tests.dll -labels -run=MonoDevelopTests.SyntaxHighlighting'
alias tree='exa -T'

stashgrep() {
  IFS=$'\n'
  for i in `git stash list --format="%gd"`; do
    git stash show -p $i | grep -H --label="$i" "$1"
  done
}

installpkg() {
    sudo installer -pkg $1 -target /
}

# added by travis gem
# [ -f /Users/jason/.travis/travis.sh ] && source /Users/jason/.travis/travis.sh

function s() {
    mdfind -onlyin . $1 | xargs grep  -inH $1
}

function mono-compile-method {
    MONO_VERBOSE_METHOD="$1" mono --compile "$1" "$2"
}

_dotnet_zsh_complete()
{
    local completions=("$(dotnet complete "$words")")

    reply=( "${(ps:\n:)completions}" )
}

compctl -K _dotnet_zsh_complete dotnet

#eval $(thefuck --alias)
# export PROMPT=""
