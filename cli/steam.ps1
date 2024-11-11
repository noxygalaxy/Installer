$tempPath = "$env:TEMP\SpaceTheme_for_Steam.zip"
$skinsFolder = "C:\Program Files (x86)\Steam\steamui\skins"
$extractedFolderPath = "$skinsFolder\Steam-main"
$destinationFolder = "$skinsFolder\SpaceTheme For Steam"

if (Test-Path $skinsFolder) {
    Write-Output "Millennium installed! Proceeding with SpaceTheme installation..."

    Write-Output "Downloading SpaceTheme for Steam..."
    Invoke-WebRequest -Uri "https://github.com/SpaceTheme/Steam/archive/refs/heads/main.zip" -OutFile $tempPath

    Write-Output "Extracting files..."
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [System.IO.Compression.ZipFile]::ExtractToDirectory($tempPath, $skinsFolder)

    if (Test-Path $extractedFolderPath) {
        if (!(Test-Path $destinationFolder)) {
            New-Item -ItemType Directory -Path $destinationFolder | Out-Null
        }
            Get-ChildItem -Path $extractedFolderPath -Recurse | ForEach-Object {
            Move-Item -Path $_.FullName -Destination $destinationFolder -Force
        }

        Write-Output "SpaceTheme for Steam installed successfully."
        
        Remove-Item $extractedFolderPath -Recurse -Force
    } else {
        Write-Output "Failed to find the extracted 'Steam-main' folder."
    }

    Remove-Item $tempPath -Force
} else {
    Write-Output "You don't have Millennium installed."
    
    if (Test-Path $tempPath) {
        Remove-Item $tempPath -Force
    }
}
