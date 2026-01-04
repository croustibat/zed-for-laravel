# Zed for Laravel - Installation Script (Windows)
# Installs Zed configuration for Laravel development

$GitHubRawBase = "https://raw.githubusercontent.com/croustibat/zed-for-laravel/main"

Write-Host "🚀 Zed for Laravel - Installation Script" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

$ConfigDir = "$env:APPDATA\Zed"

Write-Host "✅ Detected OS: Windows" -ForegroundColor Green
Write-Host "📁 Config directory: $ConfigDir" -ForegroundColor Cyan
Write-Host ""

$RemoteInstall = $false
if ([string]::IsNullOrEmpty($MyInvocation.MyCommand.Path)) {
    $RemoteInstall = $true
    Write-Host "📡 Remote installation detected (downloading from GitHub)" -ForegroundColor Yellow
} else {
    $ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
    $ProjectDir = Split-Path -Parent $ScriptDir
    Write-Host "📂 Local installation detected" -ForegroundColor Green
}
Write-Host ""

if (-not (Test-Path $ConfigDir)) {
    Write-Host "📂 Creating Zed config directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $ConfigDir -Force | Out-Null
    New-Item -ItemType Directory -Path "$ConfigDir\snippets" -Force | Out-Null
    Write-Host "✅ Created directories" -ForegroundColor Green
} else {
    Write-Host "✅ Zed config directory exists" -ForegroundColor Green
}

if (-not (Test-Path "$ConfigDir\snippets")) {
    New-Item -ItemType Directory -Path "$ConfigDir\snippets" -Force | Out-Null
}

$BackupDir = "$ConfigDir\backup-$(Get-Date -Format 'yyyyMMdd-HHmmss')"

function Backup-IfExists {
    param($File)
    $FilePath = Join-Path $ConfigDir $File
    if (Test-Path $FilePath) {
        if (-not (Test-Path $BackupDir)) {
            New-Item -ItemType Directory -Path $BackupDir -Force | Out-Null
        }
        Copy-Item $FilePath -Destination $BackupDir
        Write-Host "   📦 Backed up: $File" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "📦 Backing up existing configurations..." -ForegroundColor Cyan
Backup-IfExists "settings.json"
Backup-IfExists "keymap.json"
Backup-IfExists "tasks.json"

if (Test-Path $BackupDir) {
    Write-Host "✅ Backup created at: $BackupDir" -ForegroundColor Green
} else {
    Write-Host "ℹ️  No existing configuration to backup" -ForegroundColor Gray
}

Write-Host ""
Write-Host "🎨 Choose your theme configuration:" -ForegroundColor Cyan
Write-Host ""
Write-Host "1) Default (One Dark theme, standard colors)" -ForegroundColor White
Write-Host "2) Dracula Pro (Custom Dracula with enhanced PHP/Laravel syntax colors)" -ForegroundColor Magenta
Write-Host ""
$ThemeChoice = Read-Host "Enter your choice (1 or 2)"

switch ($ThemeChoice) {
    "2" {
        $SettingsSource = "snippets/settings-dracula.json"
        Write-Host "✅ Selected: Dracula Pro theme" -ForegroundColor Green
    }
    default {
        $SettingsSource = "snippets/settings.json"
        Write-Host "✅ Selected: Default theme (One Dark)" -ForegroundColor Green
    }
}

function Install-ConfigFile {
    param(
        [string]$Source,
        [string]$Destination,
        [string]$FileName
    )
    
    if ($RemoteInstall) {
        try {
            $Url = "$GitHubRawBase/$Source"
            Invoke-WebRequest -Uri $Url -OutFile $Destination -UseBasicParsing -ErrorAction Stop
            Write-Host "✅ Installed: $FileName" -ForegroundColor Green
            return $true
        } catch {
            Write-Host "⚠️  Could not download: $FileName" -ForegroundColor Yellow
            return $false
        }
    } else {
        $LocalPath = Join-Path $ProjectDir $Source
        if (Test-Path $LocalPath) {
            Copy-Item $LocalPath -Destination $Destination -Force
            Write-Host "✅ Installed: $FileName" -ForegroundColor Green
            return $true
        } else {
            Write-Host "⚠️  File not found: $Source" -ForegroundColor Yellow
            return $false
        }
    }
}

Write-Host ""
Write-Host "📋 Installing configuration files..." -ForegroundColor Cyan

Install-ConfigFile -Source $SettingsSource -Destination (Join-Path $ConfigDir "settings.json") -FileName "settings.json"
Install-ConfigFile -Source "snippets/keymap.json" -Destination (Join-Path $ConfigDir "keymap.json") -FileName "keymap.json"
Install-ConfigFile -Source "snippets/tasks.json" -Destination (Join-Path $ConfigDir "tasks.json") -FileName "tasks.json"

Write-Host ""
Write-Host "📝 Installing snippets..." -ForegroundColor Cyan

$SnippetFiles = @("php.json", "blade.json", "livewire.json")

foreach ($Snippet in $SnippetFiles) {
    Install-ConfigFile -Source "snippets/$Snippet" -Destination (Join-Path "$ConfigDir\snippets" $Snippet) -FileName $Snippet
}

Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "✅ Installation complete!" -ForegroundColor Green
Write-Host ""
Write-Host "📚 Next steps:" -ForegroundColor Cyan
Write-Host "   1. Restart Zed Editor"
Write-Host "   2. Extensions will auto-install on first launch:"
Write-Host "      - PHP"
Write-Host "      - Laravel Blade"
Write-Host "      - Env"
Write-Host "      - Tailwind CSS"
Write-Host "   3. Open a Laravel project"
Write-Host "   4. Start using snippets with Tab completion"
Write-Host "   5. Run tasks with Ctrl+Shift+T"
Write-Host ""
Write-Host "💡 Tips:" -ForegroundColor Yellow
Write-Host "   - Type 'route' and press Tab for a route snippet"
Write-Host "   - Type '@if' and press Tab for a Blade if statement"
Write-Host "   - Type 'livewire-component' for a full Livewire component"
Write-Host "   - Press Ctrl+Shift+X to manage extensions"
Write-Host ""
Write-Host "📖 Documentation: https://github.com/croustibat/zed-for-laravel" -ForegroundColor Cyan
Write-Host ""
Write-Host "🙏 Thank you for using Zed for Laravel!" -ForegroundColor Magenta
Write-Host ""
