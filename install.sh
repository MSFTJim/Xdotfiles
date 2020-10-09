if [ -f ~/dotfiles/DotfilesLog.txt ] 
then
    rm ~/dotfiles/DotfilesLog.txt 
fi

function Log_Writer () {
	printf "$(date +%Y-%m-%d_%H:%M): $1  \n" >> ~/workspace/CS-ImageTag/WhatDidIWrite.txt
}

Log_Writer "Start of Script File"
Log_Writer "DOGVAR= $DOGVAR"


## Update to the latest PowerShell
curl -sSL https://raw.githubusercontent.com/PowerShell/PowerShell/master/tools/install-powershell.sh | bash

## update PWSH profile and fancy command prompt
pwsh cmdprmt.ps1
mkdir -p /root/.config/powershell/ && cp ~/dotfiles/myprofile.ps1 /root/.config/powershell/Microsoft.PowerShell_profile.ps1
Log_Writer "Powershell install, profile and command prompt complete"

Log_Writer "Start of bash powerline"

cd ~
wget https://golang.org/dl/go1.15.2.linux-amd64.tar.gz
tar xvf go1.15.2.linux-amd64.tar.gz
mv go /usr/local
mkdir go

rm go1.15.2.linux-amd64.tar.gz

Log_Writer "wget, tar, etc  complete" 
	
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH 

Log_Writer "export complete"

cd ~
go get -u github.com/justjanne/powerline-go

Log_Writer "powerline complete " 

echo 'export GOROOT=/usr/local/go' >>/root/.bashrc
echo 'export GOPATH=$HOME/go' >>/root/.bashrc
echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH' >>/root/.bashrc

Log_Writer "GOROOT = $GOROOT "
Log_Writer "GOPATH =  $GOPATH "
Log_Writer "PATH =  $PATH "


echo 'function _update_ps1() {
    PS1="$($GOPATH/bin/powerline-go -error $?)"
}
if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi' >>/root/.bashrc

Log_Writer "bashrc complete"

Log_Writer "End of Script File"
