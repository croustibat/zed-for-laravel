# Zed for Laravel - Installation Script (Windows)
# Installs Zed configuration for Laravel development

Write-Host "🚀 Zed for Laravel - Installation Script" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

# Set config directory
$ConfigDir = "$env:APPDATA\Zed"

Write-Host "✅ Detected OS: Windows" -ForegroundColor Green
Write-Host "📁 Config directory: $ConfigDir" -ForegroundColor Cyan
Write-Host ""

# Check if Zed config directory exists
if (-not (Test-Path $ConfigDir)) {
    Write-Host "📂 Creating Zed config directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $ConfigDir -Force | Out-Null
    New-Item -ItemType Directory -Path "$ConfigDir\snippets" -Force | Out-Null
    Write-Host "✅ Created directories" -ForegroundColor Green
} else {
    Write-Host "✅ Zed config directory exists" -ForegroundColor Green
}

# Create snippets directory if it doesn't exist
if (-not (Test-Path "$ConfigDir\snippets")) {
    New-Item -ItemType Directory -Path "$ConfigDir\snippets" -Force | Out-Null
}

# Backup existing configs
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

# Get script directory
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ProjectDir = Split-Path -Parent $ScriptDir

Write-Host ""
Write-Host "🎨 Choose your theme configuration:" -ForegroundColor Cyan
Write-Host ""
Write-Host "1) Default (One Dark theme, standard colors)" -ForegroundColor White
Write-Host "2) Dracula Pro (Custom Dracula with enhanced PHP/Laravel syntax colors)" -ForegroundColor Magenta
Write-Host ""
$ThemeChoice = Read-Host "Enter your choice (1 or 2)"

switch ($ThemeChoice) {
    "2" {
        $SettingsFile = Join-Path $ProjectDir "settings-dracula.json"
        Write-Host "✅ Selected: Dracula Pro theme" -ForegroundColor Green
    }
    default {
        $SettingsFile = Join-Path $ProjectDir "settings.json"
        Write-Host "✅ Selected: Default theme (One Dark)" -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "📋 Installing configuration files..." -ForegroundColor Cyan

# Copy main config files
if (Test-Path $SettingsFile) {
    Copy-Item $SettingsFile -Destination (Join-Path $ConfigDir "settings.json") -Force
    Write-Host "✅ Installed: settings.json" -ForegroundColor Green
}

# Copy snippets
Write-Host ""
Write-Host "📝 Installing snippets..." -ForegroundColor Cyan
$SnippetsDir = Join-Path $ProjectDir "snippets"

if (Test-Path $SnippetsDir) {
    $SnippetFiles = Get-ChildItem -Path $SnippetsDir -Filter "*.json"
    foreach ($SnippetFile in $SnippetFiles) {
        $DestPath = Join-Path "$ConfigDir\snippets" $SnippetFile.Name
        Copy-Item $SnippetFile.FullName -Destination $DestPath -Force
    }
    Write-Host "✅ Installed PHP snippets" -ForegroundColor Green
    Write-Host "✅ Installed Blade snippets" -ForegroundColor Green
    Write-Host "✅ Installed Livewire snippets" -ForegroundColor Green
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
