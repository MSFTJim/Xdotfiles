# tried a shebang but it did not work /bin/bash
# this line tells you what shell is running
ps -p $$

if [ -f ~/dotfiles/DotfilesLog.txt ] 
then
    rm ~/dotfiles/DotfilesLog.txt 
fi

Log_Writer () {
	printf "$(date +%Y-%m-%d_%H:%M:%N): $1  \n" >> ~/dotfiles/DotfilesLog.txt
}

Log_Writer "Start of Script File"
Log_Writer "DOGVAR = $DOGVAR" 

## install powerline moduals & update PWSH profile 
pwsh ~/dotfiles/cmdprmt.ps1
mkdir -p ~/.config/powershell/ && cp ~/dotfiles/myprofile.ps1 ~/.config/powershell/Microsoft.PowerShell_profile.ps1

Log_Writer "Powershell install, profile and command prompt complete"

Log_Writer "End of Script File"
