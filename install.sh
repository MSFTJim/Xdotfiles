if [ -f ~/dotfiles/DotfilesLog.txt ] 
then
    rm ~/dotfiles/DotfilesLog.txt 
fi

function Log_Writer () {
	printf "$(date +%Y-%m-%d_%H:%M:%N): $1  \n" >> ~/dotfiles/DotfilesLog.txt
}

Log_Writer "Start of Script File"
Log_Writer "DOGVAR = $DOGVAR" 

## install powerline moduals & update PWSH profile 
pwsh ~/dotfiles/cmdprmt.ps1
mkdir -p ~/.config/powershell/ && cp ~/dotfiles/myprofile.ps1 ~/.config/powershell/Microsoft.PowerShell_profile.ps1
Log_Writer "Powershell install, profile and command prompt complete"

#Log_Writer "Start of bash powerline"

#cd ~
#apt-get install golang-go --assume-yes
#Log_Writer "Go Install Complete" 

#go get -u github.com/justjanne/powerline-go
#Log_Writer "justjanne powerline complete " 

#echo '_GOPATH=$(go env GOPATH)' >>$HOME/.bashrc
#echo '_GOROOT=$(go env GOROOT)' >>$HOME/.bashrc

#echo 'export GOROOT=$_GOROOT' >>$HOME/.bashrc
#echo 'export GOPATH=$_GOPATH' >>$HOME/.bashrc

#Log_Writer "GOROOT = $_GOROOT"
#Log_Writer "GOPATH =  $_GOPATH"
#Log_Writer "PATH =  $PATH "

#echo 'function _update_ps1() {
#    PS1="$($GOPATH/bin/powerline-go -error $?)"
#}
#if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
#    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#fi' >>$HOME/.bashrc

#Log_Writer "bashrc complete"

Log_Writer "End of Script File"
