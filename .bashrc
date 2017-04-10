export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
export DISABLE_STETIC=1
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
alias vi='emacsclient -t'
alias gs='emacsclient -ct --eval "(magit-status)"'
alias ls='ls -G'
alias nunit='/Library/Frameworks/Mono.framework/Versions/Current/bin/nunit-console4'
alias nunit-console.exe='/Library/Frameworks/Mono.framework/Versions/Current/bin/nunit-console4'
alias omni='cd ~/.vim/bundle/Omnisharp/server/OmniSharp'
alias o='mono ~/.vim/bundle/Omnisharp/server/OmniSharp/bin/Debug/OmniSharp.exe'
#alias atom='cd ~/.atom/packages/atom-sharper'
alias src='cd ~/src'
alias v='vim .'
alias e='/Applications/Emacs.app/Contents/MacOS/Emacs'
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias ll='ls -la'
alias l='ls -la'
alias clone_md_roslyn='git clone git@github.com:mono/monodevelop -b roslyn --recursive && git clone git@github.com:xamarin/md-addins -b roslyn --recursive && (cd monodevelop && ./configure --profile=mac && make) && (cd md-addins && ./configure --profile=mac && make)'
alias cdf='cd ~/src/monodevelop/main/external/fsharpbinding'
alias cdm='cd ~/src/monodevelop'
alias run='cd ~/src/monodevelop/main/build/bin/ && rm gtk-sharp.dll glib-sharp.dll gdk-sharp.dll atk-sharp.dll pango-sharp.dll && cda && make run'
alias cycle7='MONODEVELOP_DEV_ADDINS=/Users/jason/src/cycle7/monodevelop/main/external/fsharpbinding/bin/ && cd ~/src/cycle7/md-addins && make run'
alias cda='cd ~/src/md-addins'
alias ..='cd ..'
alias findhere='find . -name'
alias f='find . -name'
alias xs='export MONODEVELOP_CONSOLE_LOG_LEVEL=All && /Applications/Xamarin\ Studio.app/Contents/MacOS/XamarinStudio --no-redirect'
alias vs='export MONODEVELOP_CONSOLE_LOG_LEVEL=All && /Applications/Visual\ Studio.app/Contents/MacOS/VisualStudio --no-redirect'
alias mdtool='mono /Users/jason/src/monodevelop/main/build/bin/mdtool.exe'
alias pull='git pull'
alias push='git push'
alias mpv='mpv --ontop'
alias kmd='kill -KILL `pgrep "MonoDevelop|Xamarin|Studio"`'
alias kw='pkill Workbook'
alias pw='pkill Workbook'
alias linkmono64='sudo ln -sf /Library/Frameworks/Mono.framework/Versions/Current/bin/mono64 /Library/Frameworks/Mono.framework/Versions/Current/bin/mono'
alias rebase='git pull --rebase origin master'
alias removecrap='cd ~/src/monodevelop/main/build/bin/ && rm gtk-sharp.dll glib-sharp.dll gdk-sharp.dll atk-sharp.dll pango-sharp.dll'
alias ao='git log --date=short --reverse --all --since=3.weeks.ago --author=nosami'
alias ours='git checkout --ours'
alias theirs='git checkout --theirs'
# Customize to your needs...
export PATH=./packages/FAKE/tools:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:./node_modules/.bin:$PATH
export EDITOR=vim
export PYTHONSTARTUP=~/.pystartup
#export MONODEVELOP_DEV_ADDINS="/Users/jason/src/monodevelop/main/external/fsharpbinding/bin/"
#export MDConfigDir="/Users/jason/Library/Preferences/XamarinStudio-6.0"
#export MDBinDir="/Users/jason/src/monodevelop/main/build/bin"
#export MDAddinsDir="/Users/jason/src/monodevelop/main/build/AddIns"
export MONODEVELOP_CONSOLE_LOG_LEVEL=All
export MONO_ENV_OPTIONS=--arch=64
export MONODEVELOP_DEV_ADDINS=/Users/jason/src/XSVim/XSVim/bin/Debug/
#[ -s "/Users/jason/.kre/kvm/kvm.sh" ] && . "/Users/jason/.kre/kvm/kvm.sh" # Load kvm

[ -s "/Users/jason/.dnx/dnvm/dnvm.sh" ] && . "/Users/jason/.dnx/dnvm/dnvm.sh" # Load dnvm
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
killit() {
    # Kills any process that matches a regexp passed to it
    ps aux | grep -v "grep" | grep -i "$@" | awk '{print $2}' | xargs kill
}

fake () {
    mono packages/FAKE/tools/FAKE.exe $1 --fsiargs -d:MONO build.fsx
}

vifind () {
    findhere $1 | xargs emacsclient
}

alias paket='mono .paket/paket.exe'
alias compilerservice='mono ~/src/compilerservice.exe/CompilerService.exe --project'
alias ma='pushd . && cd ~/src/monodevelop/main/src/core/Mono.Texteditor/ && xbuild /v:q && popd && pushd . && cd ~/src/monodevelop/main/external/fsharpbinding/MonoDevelop.FSharp.Tests/ && xbuild && popd && mono64 ../../build/bin/mdtool.exe run-md-tests ../../external/fsharpbinding/MonoDevelop.FSharp.Tests/bin/Debug/MonoDevelop.FSharp.Tests.dll -labels -run=MonoDevelopTests.SyntaxHighlighting'
alias mt='pushd . && cd ~/src/monodevelop/main/external/fsharpbinding/MonoDevelop.FSharp.Tests/ && xbuild MonoDevelop.FSharp.Tests.fastbuild.fsproj /v:q && popd && mono64 ../../build/bin/mdtool.exe run-md-tests ../../external/fsharpbinding/MonoDevelop.FSharp.Tests/bin/Debug/MonoDevelop.FSharp.Tests.dll -labels -run=MonoDevelopTests.SyntaxHighlighting'
alias mp='pushd . && cd ~/src/monodevelop/main/external/fsharpbinding/MonoDevelop.FSharp.Tests/ && xbuild /v:q && popd && mono64 ../../build/bin/mdtool.exe run-md-tests ../../external/fsharpbinding/MonoDevelop.FSharp.Tests/bin/Debug/MonoDevelop.FSharp.Tests.dll -labels -run="MonoDevelopTests.Template tests" && popd'
alias mm='pushd . && cd ~/src/monodevelop/main/src/addins/MonoDevelop.SourceEditor2 && make && popd && mono64 ../../build/bin/mdtool.exe run-md-tests ../../external/fsharpbinding/MonoDevelop.FSharp.Tests/bin/Debug/MonoDevelop.FSharp.Tests.dll -labels -run=MonoDevelopTests.SyntaxHighlighting'

stashgrep() {
  IFS=$'\n'
  for i in `git stash list --format="%gd"`; do
    git stash show -p $i | grep -H --label="$i" "$1"
  done
}

installpkg() {
    sudo installer -pkg $1 -target /
}

alias clean='git clean -xffd'
alias master='git checkout master'
