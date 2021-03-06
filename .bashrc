#if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#    exec tmux
#fi

export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it
export DISABLE_STETIC=1
export MONODEVELOP_SDB_TEST=1
export XAMARIN_UPDATER_IGNORE_LOCK=13
export XAMARIN_UPDATER_TIMEOUT=10000 # The default 
export MONO_THREADS_SUSPEND=preemptive
# Save and reload the history after each command finishes
#alias atom='cd ~/.atom/packages/atom-sharper'
alias ..='cd ..'
alias ao='git log --date=short --reverse --all --since=3.weeks.ago --author=nosami'
alias buildfs='pushd . && cd ~/src/monodevelop/main/external/fsharpbinding/MonoDevelop.FSharpBinding && msbuild *.fastbuild.fsproj && popd'
alias cda='cd ~/src/md-addins'
alias cdf='cd ~/src/monodevelop/main/external/fsharpbinding'
alias cdm='cd ~/src/monodevelop'
alias cdmono='cd /Library/Frameworks/Mono.framework/Versions/Current'
alias cdmono='cd /Library/Frameworks/Mono.framework/Versions/Current'
alias cdp='cd ~/src/monodevelop/main/build/AddIns/FSharpBinding/'
alias clean='git clean -xffd'
alias clone_md_roslyn='git clone git@github.com:mono/monodevelop -b roslyn --recursive && git clone git@github.com:xamarin/md-addins -b roslyn --recursive && (cd monodevelop && ./configure --profile=mac && make) && (cd md-addins && ./configure --profile=mac && make)'
alias cycle7='MONODEVELOP_DEV_ADDINS=/Users/jason/src/cycle7/monodevelop/main/external/fsharpbinding/bin/ && cd ~/src/cycle7/md-addins && make run'
alias deletetrailingwhitespace="find . -iname '*.fs*' -type f -exec sed -i '' 's/[[:space:]]\{1,\}$//' {} \+"
alias e='/Applications/Emacs.app/Contents/MacOS/Emacs'
alias f='find .  -name'
alias findhere='find . -name'
alias got='git'
alias gs='emacsclient -ct --eval "(delete-other-windows) (magit-status)"'
alias kmd='kill -KILL `pgrep "MonoDevelop|Xamarin|Studio"` && pkill mono'
alias kw='pkill Workbook'
alias l='ls -la'
alias linkmono64='sudo ln -sf /Library/Frameworks/Mono.framework/Versions/Current/bin/mono64 /Library/Frameworks/Mono.framework/Versions/Current/bin/mono'
alias ll='ls -la'
alias ls='ls -G'
alias master='git checkout master'
alias mdtool='mono /Users/jason/src/monodevelop/main/build/bin/mdtool.exe'
alias mpv='mpv --ontop'
alias nunit-console.exe='/Library/Frameworks/Mono.framework/Versions/Current/bin/nunit-console4'
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
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias v='vim .'
alias vi='emacsclient -t'
alias vs='MONODEVELOP_CONSOLE_LOG_LEVEL=All /Applications/Visual\ Studio.app/Contents/MacOS/VisualStudio --no-redirect'
alias vspreview='MONODEVELOP_CONSOLE_LOG_LEVEL=All /Applications/Visual\ Studio\ \(Preview\).app/Contents/MacOS/VisualStudio --no-redirect'
alias wgetmdpkgs="grep azureedge ~/src/md-addins/bot-provisioning/Make.config | sed 's/.*=//' | xargs wget -nc"
alias xs='MONODEVELOP_CONSOLE_LOG_LEVEL=All /Applications/Xamarin\ Studio.app/Contents/MacOS/XamarinStudio --no-redirect'
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Customize to your needs...
export PATH=$HOME/.dotnet/tools:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:./node_modules/.bin:$PATH
export PATH=/usr/local/opt/sudo-touchid/bin:$PATH
export EDITOR=vim
export PYTHONSTARTUP=~/.pystartup
#export MONODEVELOP_DEV_ADDINS="/Users/jason/src/monodevelop/main/external/fsharpbinding/bin/"
#export MDConfigDir="/Users/jason/Library/Preferences/XamarinStudio-6.0"
#export MDBinDir="/Users/jason/src/monodevelop/main/build/bin"
#export MDAddinsDir="/Users/jason/src/monodevelop/main/build/AddIns"
export MONODEVELOP_CONSOLE_LOG_LEVEL=All
# export MONO_ENV_OPTIONS=--arch=64
export MONODEVELOP_DEV_ADDINS=/Users/jason/src/XSVim/XSVim/bin/Debug/
killit() {
    # Kills any process that matches a regexp passed to it
    ps aux | grep -v "grep" | grep -i "$@" | awk '{print $2}' | xargs kill
}

# fake () {
#     mono packages/FAKE/tools/FAKE.exe $1 --fsiargs -d:MONO build.fsx
# }

vifind () {
    findhere $1 | xargs emacsclient
}

batfind () {
    findhere $1 | xargs bat
}

# alias paket='mono .paket/paket.exe'
alias compilerservice='mono ~/src/compilerservice.exe/CompilerService.exe --project'
alias ma='pushd . && cd ~/src/monodevelop/main/src/core/Mono.Texteditor/ && xbuild /v:q && popd && pushd . && cd ~/src/monodevelop/main/external/fsharpbinding/MonoDevelop.FSharp.Tests/ && xbuild && popd && mono64 ../../build/bin/mdtool.exe run-md-tests ../../external/fsharpbinding/MonoDevelop.FSharp.Tests/bin/Debug/MonoDevelop.FSharp.Tests.dll -labels -run=MonoDevelopTests.SyntaxHighlighting'
alias mt='pushd . && cd ~/src/monodevelop/main/external/fsharpbinding/MonoDevelop.FSharp.Tests/ && xbuild MonoDevelop.FSharp.Tests.fastbuild.fsproj /v:q && popd && mono64 ../../build/bin/mdtool.exe run-md-tests ../../external/fsharpbinding/MonoDevelop.FSharp.Tests/bin/Debug/MonoDevelop.FSharp.Tests.dll -labels -run=MonoDevelopTests.SyntaxHighlighting'
alias mp='pushd . && cd ~/src/monodevelop/main/external/fsharpbinding/MonoDevelop.FSharp.Tests/ && xbuild /v:q && popd && mono64 ../../build/bin/mdtool.exe run-md-tests ../../external/fsharpbinding/MonoDevelop.FSharp.Tests/bin/Debug/MonoDevelop.FSharp.Tests.dll -labels -run="MonoDevelopTests.Template tests" && popd'
alias mm='pushd . && cd ~/src/monodevelop/main/src/addins/MonoDevelop.SourceEditor2 && make && mono64 ../../../build/bin/mdtool.exe run-md-tests ../../../external/fsharpbinding/MonoDevelop.FSharp.Tests/bin/Debug/MonoDevelop.FSharp.Tests.dll -labels -run=MonoDevelopTests.SyntaxHighlighting'

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
[ -f /Users/jason/.travis/travis.sh ] && source /Users/jason/.travis/travis.sh
