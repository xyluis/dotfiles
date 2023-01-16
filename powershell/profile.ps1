# Set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Oh My Posh
# winget install JanDeDobbeleer.OhMyPosh -s winget
# Install-Module posh-git -Scope CurrentUser -Force
# Import-Module posh-git

# $ThemePath = Join-Path $env:USERPROFILE ".config\powershell"
# $Theme = Join-Path $ThemePath "spaceship.omp.json"

# oh-my-posh init pwsh --config $Theme | Invoke-Expression

# Starship (https://starship.rs)
# winget install --id Starship.Starship
$env:STARSHIP_CONFIG = Join-Path $env:USERPROFILE ".config\powershell\starship.toml"
Invoke-Expression (&starship init powershell)

# Terminal-Icons
# Install-Module -Name Terminal-Icons -Repository PSGallery
Import-Module -Name Terminal-Icons

# PSReadLine
# Install-Module -Name PSReadLine -Scope CurrentUser -Force -SkipPublisherCheck
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# Aliases
Set-Alias grep findstr
# Only when using "Visual Studio Code Insiders"
# Set-Alias code code-insiders

# Utilities
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# NOTE: In main Powershell profile, insert: ". $env:USERPROFILE\.config\powershell\profile.ps1"