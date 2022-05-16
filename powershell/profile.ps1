# Set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Oh My Posh
Import-Module posh-git
Import-Module oh-my-posh

$ThemePath = Join-Path $env:USERPROFILE "AppData\Local\oh-my-posh\themes"
$Theme = Join-Path $ThemePath "spaceship.omp.json"

oh-my-posh init pwsh --config $Theme | Invoke-Expression

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# Alias
Set-Alias grep findstr

# Utilities
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# NOTE: In main Powershell profile, insert: ". $env:USERPROFILE\.config\profile.ps1"