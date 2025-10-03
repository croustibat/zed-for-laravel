# Installation Guide

This guide will walk you through installing Zed for Laravel on your system.

## Prerequisites

Before installing, ensure you have:

- **Zed Editor** - Download from [zed.dev](https://zed.dev)
- **PHP 8.1+** - Required for Laravel development
- **Composer** - PHP dependency manager
- **Laravel Project** - Or ready to create one
- **Laravel Pint** - Install with `composer require laravel/pint --dev`

## Quick Installation

### macOS / Linux

The fastest way to install is using the automated installation script:

```bash
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/zed-for-laravel/main/scripts/install.sh | bash
```

This will:
1. Detect your operating system
2. Backup existing Zed configurations
3. Install all configuration files
4. Install PHP, Blade, and Livewire snippets
5. Configure Zed for Laravel development

### Windows

Use PowerShell to run the installation script:

```powershell
irm https://raw.githubusercontent.com/YOUR_USERNAME/zed-for-laravel/main/scripts/install.ps1 | iex
```

## Manual Installation

If you prefer to install manually or want more control over the process:

### Step 1: Clone the Repository

```bash
git clone https://github.com/YOUR_USERNAME/zed-for-laravel.git
cd zed-for-laravel
```

### Step 2: Locate Your Zed Config Directory

**macOS / Linux:**
```
~/.config/zed/
```

**Windows:**
```
%APPDATA%\Zed\
```

### Step 3: Backup Existing Configuration (Optional but Recommended)

**macOS / Linux:**
```bash
mkdir -p ~/.config/zed/backup
cp ~/.config/zed/settings.json ~/.config/zed/backup/ 2>/dev/null || true
cp ~/.config/zed/keymap.json ~/.config/zed/backup/ 2>/dev/null || true
cp ~/.config/zed/tasks.json ~/.config/zed/backup/ 2>/dev/null || true
```

**Windows (PowerShell):**
```powershell
New-Item -ItemType Directory -Path "$env:APPDATA\Zed\backup" -Force
Copy-Item "$env:APPDATA\Zed\settings.json" "$env:APPDATA\Zed\backup\" -ErrorAction SilentlyContinue
Copy-Item "$env:APPDATA\Zed\keymap.json" "$env:APPDATA\Zed\backup\" -ErrorAction SilentlyContinue
Copy-Item "$env:APPDATA\Zed\tasks.json" "$env:APPDATA\Zed\backup\" -ErrorAction SilentlyContinue
```

### Step 4: Copy Configuration Files

**macOS / Linux:**
```bash
cp settings.json ~/.config/zed/
cp keymap.json ~/.config/zed/
cp tasks.json ~/.config/zed/
mkdir -p ~/.config/zed/snippets
cp snippets/* ~/.config/zed/snippets/
```

**Windows (PowerShell):**
```powershell
Copy-Item settings.json "$env:APPDATA\Zed\"
Copy-Item keymap.json "$env:APPDATA\Zed\"
Copy-Item tasks.json "$env:APPDATA\Zed\"
New-Item -ItemType Directory -Path "$env:APPDATA\Zed\snippets" -Force
Copy-Item snippets\* "$env:APPDATA\Zed\snippets\"
```

### Step 5: Restart Zed Editor

Close and reopen Zed to apply the new configuration.

## Verifying Installation

After installation, verify everything is working:

1. **Open Zed Editor**
2. **Open a Laravel project**
3. **Test a snippet:**
   - Create a new PHP file
   - Type `route` and press `Tab`
   - You should see a Route definition snippet expand

4. **Test formatting:**
   - Open a PHP file
   - Press `Cmd/Ctrl + Shift + I`
   - The file should be formatted with Laravel Pint

5. **Test tasks:**
   - Press `Cmd/Ctrl + Shift + T`
   - You should see the task list with Artisan commands

## Troubleshooting

### Laravel Pint Not Working

**Error:** "Command not found: pint"

**Solution:** Make sure Laravel Pint is installed in your project:

```bash
cd your-laravel-project
composer require laravel/pint --dev
```

### Snippets Not Appearing

**Solution:** Ensure snippets are in the correct directory and restart Zed:

**macOS / Linux:**
```bash
ls ~/.config/zed/snippets/
# Should show: php.json, blade.json, livewire.json
```

**Windows:**
```powershell
Get-ChildItem "$env:APPDATA\Zed\snippets"
# Should show: php.json, blade.json, livewire.json
```

### Configuration Not Applied

**Solution:** 
1. Close Zed completely
2. Verify files are in the correct location
3. Check file permissions (should be readable)
4. Restart Zed

### Tasks Not Working

**Solution:** 
1. Ensure you're in a Laravel project directory
2. Verify `tasks.json` is in the Zed config directory
3. Some tasks require specific dependencies (e.g., PHPUnit, Pint)

## Updating

To update to the latest version:

```bash
cd zed-for-laravel
git pull origin main
# Then run the installation script again
./scripts/install.sh  # macOS/Linux
# or
.\scripts\install.ps1  # Windows
```

## Uninstalling

To remove Zed for Laravel configuration:

**macOS / Linux:**
```bash
rm ~/.config/zed/settings.json
rm ~/.config/zed/keymap.json
rm ~/.config/zed/tasks.json
rm ~/.config/zed/snippets/php.json
rm ~/.config/zed/snippets/blade.json
rm ~/.config/zed/snippets/livewire.json
```

**Windows:**
```powershell
Remove-Item "$env:APPDATA\Zed\settings.json"
Remove-Item "$env:APPDATA\Zed\keymap.json"
Remove-Item "$env:APPDATA\Zed\tasks.json"
Remove-Item "$env:APPDATA\Zed\snippets\php.json"
Remove-Item "$env:APPDATA\Zed\snippets\blade.json"
Remove-Item "$env:APPDATA\Zed\snippets\livewire.json"
```

If you created a backup, you can restore it from `~/.config/zed/backup/` or `%APPDATA%\Zed\backup\`.

## Next Steps

- Read the [Features Overview](features.md) to learn about all available features
- Check out the [Configuration Guide](configuration.md) for customization options
- Start coding with Laravel in Zed! 🚀