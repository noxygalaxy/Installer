$betterDiscordThemes = "$env:APPDATA\BetterDiscord\themes"
$vencordThemes = "$env:APPDATA\Vencord\themes"

$themeUrl = "https://raw.githubusercontent.com/SpaceTheme/Discord/refs/heads/main/SpaceTheme.theme.css"

function Install-Theme ($themePath) {
    $themeFile = Join-Path -Path $themePath -ChildPath "SpaceTheme.theme.css"
    Invoke-RestMethod -Uri $themeUrl -OutFile $themeFile
    Write-Host "SpaceTheme for Discord installed in $themePath"
}

$betterDiscordExists = Test-Path -Path $betterDiscordThemes
$vencordExists = Test-Path -Path $vencordThemes

if ($betterDiscordExists) {
    Install-Theme $betterDiscordThemes
}

if ($vencordExists) {
    Install-Theme $vencordThemes
}

if (-not $betterDiscordExists -and -not $vencordExists) {
    Write-Host "You don't have BetterDiscord or Vencord installed! Install them from the official website."
}
