#!/bin/bash

# Terminal + Powerlevel10k + Aliases

echo "==> Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "==> Cleaning .zshrc and installing Powerlevel10k..."
rm -f ~/.zshrc
touch ~/.zshrc
brew install romkatv/powerlevel10k/powerlevel10k
brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font

cat << 'EOF' >> ~/.zshrc
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)
source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/.aliases
EOF

cat << 'EOF' > ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time background_jobs time)
typeset -g POWERLEVEL9K_PROMPT_ON_NEWLINE=true
typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="↪ "
typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="❯ "
typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'
EOF

echo "==> Adding aliases..."
cat << 'EOF' > ~/.aliases
#!/usr/bin/env bash

# # use `hub` as git wrapper
# # http://defunkt.github.com/hub/
# hub_path=$(which hub)
# if (($ + commands[hub])); then
# 	alias git=$hub_path
# fi

alias g="git"

# one letter aliases w/o options
alias ga="git add"
alias gb="git branch"
alias gf="git fetch"
alias gg="git grep"
alias gl="git log"
alias gm="git merge"
alias gr="git remote"
alias gs="git status"
alias gw="git whatchanged"

# merge
alias gmc="git merge --continue"
alias gma="git merge --abort"

# pull
alias gpl="git pull"

# adding
alias gaa="git add ."
alias gap="git add --patch"
alias gau="git add --update"

# branches
alias gbe="git branch --edit-description"
alias gbd="git branch -d"
alias gbdd="git branch -D"
alias gch="git checkout"
alias gcb="git checkout -b"
alias gbm="git branch --merged"
alias gbnm="git branch --no-merged"

# cherry-pick
alias gchp="git cherry-pick"

# clone
alias gcl="git clone"

# commit
alias gc="git commit -am"
alias gcm="git commit --amend --message"

# diff
alias gdt="git difftool"
alias gd="git diff --color"
alias gitfix="git diff --name-only | uniq | xargs code"

# grep
alias ggl="git grep --line-number"
alias ggg="git grep --break --heading --line-number"

# log
alias glg="git log --graph"
alias glo="git log --oneline"

# changelog
alias changelog="git log --pretty=format:"%h %ad%x09%an%x09%s" --date=short"

# push
alias gp="git push"
alias gpu="git push -u origin"
alias undopush="git push -f origin HEAD^:master"

# rebase
alias gre="git rebase"

# remote
alias gra="git remote add origin"

# stash
alias gst="git stash"
alias gsa="git stash apply"
alias gsp="git stash pop"
alias gsd="git stash drop"

# view issues
alias gbi="git browse -- issues"

# pull-request
alias gpr="git pull-request"

# better navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"
alias dev -="cd ~/dev"

# better ls
alias l="ls -lF ${colorflag}"
alias la="ls -laF ${colorflag}"
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# IP & DNS utils
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# k8s
alias ktx="kubectx"

###
# coreutils
###

# files output
alias tail="gtail -F" # follows log rotations
alias split="gsplit"
alias csplit="gcsplit"

# summarizing files
alias sum="gsum"
alias cksum="cksum"
alias md5sum="gmd5sum"
alias sha1sum="gsha1sum"

# operating on fields
alias cut="gcut"
alias paste="gpaste"
alias join="gjoin"

# basic ops
alias cp="gcp -v"
alias mv="gmv -v"
alias rm="grm -v"
alias shred="gshred"

# special filetypes
alias link="glink"
alias unlink="gunlink"
alias mkdir="gmkdir -v"
alias rmdir="grmdir -v"
alias readlink="greadlink"

# changing file attributes
alias chmod="gchmod -v"
alias chown="gchown -v"
alias chgrp="gchgrp -v"
alias touch="gtouch"

# disk usage
alias df="gdf"
alias du="gdu"
alias stat="gstat"
alias sync="gsync"
alias truncate="gtruncate"

# printing text
alias echo="gecho"
alias printf="gprintf"

# redirection
alias tee="gtee"

# the rest
alias awk="gawk"
alias grep="ggrep --color"

alias ln="gln"
alias ln-sym="gln -nsf" # symlinks

# findutils
alias find="gfind"
alias locate="glocate"
alias updatedb="gupdatedb"
alias xargs="gxargs"

# binutils
alias addr2line="gaddr2line"
alias ar="gar"
alias c++filt="gc++filt"
alias dlltool="gdlltool"
alias nlmconv="gnlmconv"
alias nm="gnm"
alias objcopy="gobjcopy"
alias objdump="gobjdump"
alias ranlib="granlib"
alias readelf="greadelf"
alias size="gsize"
alias strings="gstrings" # lol
alias strip="gstrip"

# tar
alias tar="gtar"

# sed
alias sed="gsed"

# which
alias which="gwhich"

# npm
alias nin="npm init"
alias ni="npm i"
alias nig="npm i -g"
alias nis="npm i --save"
alias nid="npm i --save-dev"
alias nu="npm uninstall"
alias nus="npm uninstall --save"
alias nud="npm uninstall --save-dev"
alias nup="npm update"
alias nug="npm upgrade"
alias nr="npm run"
alias nt="npm test"
alias ndd="npm dedupe"
alias npr="npm prune"
alias nod="npm outdated"
alias nrb="npm rebuild"
alias nls="npm list"
alias nlsg="npm list -g"
alias ncc="npm cache clean"
alias nf="npm cache clean && rm -rf node_modules && npm i"

# yarn
alias y="yarn"
alias yi="yarn init"
alias ya="yarn add"
alias yad="yarn add --dev"
alias yga="yarn global add"
alias yr="yarn run"
alias ys="yarn start"
alias yis="yarn install && yarn start"
alias yrm="yarn remove"
alias yup="yarn upgrade"
alias ycl="yarn clean"
alias ych="yarn check"
alias yt="yarn test"
alias ycc="yarn cache clean"

# shortcuts
alias md="mkdir"
alias t="touch"
alias x="exit"
alias c="clear"
alias o="open ."
alias vi="nvim"
alias vim="nvim"
alias v="nvim"
alias x+="chmod +x"
alias restart="sudo reboot"
alias bye="sudo shutdown -r now"
alias get="curl -O -L"
alias vi="vim"
alias reload="source ~/.zshrc"

# use ccat
alias cat="ccat"

# commonly used dirs
alias dev="cd ~/dev"
alias work="cd ~/dev/work"
alias desk="cd ~/desktop"
alias docs="cd ~/documents"
alias dl="cd ~/downloads"
alias home="cd ~"
alias dots="cd ~/bootstrap"

# python
alias pip="pip3"

# make a pdf
alias mergepdf="/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py"

# spotlight
alias spotoff="sudo mdutil -a -i off"
alias spoton="sudo mdutil -a -i on"

# remove DS_Store
alias rm_ds="find . -name '*.DS_Store' -type f -ls -delete"

# show/hide files
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# show/hide desktop items
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# kill all chrome tabs to free memory
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# lock scren when going afk
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# 🔇
alias stfu="osascript -e 'set volume output muted true'"

# remove cached xcode build data
alias xcodepurge="rm -rf ~/Library/Developer/Xcode/DerivedData"

# use gitignore.io cmd line tool
gi() {
	curl -L -s https://www.gitignore.io/api/$@
}

# create a remote repo
create-repo() {
	# Get user input
	echo "Enter name for new repo"
	read REPONAME
	echo "Do you want to make it private? (y/n)"
	read -r -n PRIVATE_ANSWER

	if [[ "$PRIVATE_ANSWER" =~ ^[Yy]$ ]]; then
		PRIVATE_TF=true
	else
		PRIVATE_TF=false
	fi

	# Curl some json to the github API oh damn we so fancy
	curl -u danieldop https://api.github.com/user/repos -d "{\"name\": \"$REPONAME\", \"private\": $PRIVATE_TF}" >/dev/null

	# first commit
	git init 1>/dev/null
	gi macos,visualstudiocode >>.gitignore 1>/dev/null
	print_success ".gitignore added"
	git add . 1>/dev/null
	git commit -m "initial commit" 1>/dev/null
	print_success "initial commit"
	git remote add origin https://github.com/danieldop/$REPONAME.git 1>/dev/null
	git push -u origin master --force 1>/dev/null

	sleep 0.5
	print_success "\nRepo created"
	print_in_cyan "You can view your new repo at https://github.com/danieldop/$REPONAME.git"
}

# make new dir and cd into it
take() {
	mkdir -p $1
	cd $1
}
alias tk="take"

# change dir
up() {
	local cdir="$(pwd)"
	if [[ "${1}" == "" ]]; then
		cdir="$(dirname) "${cdir}")"
	elif ! [[ "${1}" =~ ^[0-9]+$ ]]; then
		echo "🛂  Arg must be a number"
	elif ! [[ "${1}" -gt "0" ]]; then
		echo "a POSITIVE number"
	else
		for i in {1..${1}}; do
			local ncdir="$(dirname "${cdir}")"
			if [[ "${cdir}" == "${ncdir}" ]]; then
				break
			else
				cdir="${ncdir}"
			fi
		done
	fi
	cd "${cdir}"
}

# animated gifs from any video
# https://gist.github.com/SlexAxton/4989674
gifify() {
	if [[ -n "$1" ]]; then
		if [[ $2 == '--good' ]]; then
			ffmpeg -i "$1" -r 10 -vcodec png out-static-%05d.png
			time convert -verbose +dither -layers Optimize -resize 900x900\> out-static*.png GIF:- | gifsicle --colors 128 --delay=5 --loop --optimize=3 --multifile - >"$1.gif"
			rm out-static*.png
		else
			ffmpeg -i "$1" -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 >"$1.gif"
		fi
	else
		echo "✋  proper usage: gifify <input_movie.mov>. You DO need to include extension."
	fi
}

# 🗑
emptytrash() {
	print_header "🗑  Emptying trashes..."
	sudo rm -rfv /Volumes/*/.Trashes 1>/dev/null
	rm -rfv ~/.Trash/* 1>/dev/null
	sudo rm -v /private/var/vm/sleepimage 1>/dev/null

}

pyenv() {
  local command
  command="${1:-}"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  rehash|shell)
    eval "$(pyenv "sh-$command" "$@")"
    ;;
  *)
    command pyenv "$command" "$@"
    ;;
  esac
}

EOF
