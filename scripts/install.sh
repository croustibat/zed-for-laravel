#!/bin/bash

# Zed for Laravel - Installation Script
# Installs Zed configuration for Laravel development

set -e

# GitHub raw content base URL
GITHUB_RAW_BASE="https://raw.githubusercontent.com/croustibat/zed-for-laravel/main"

echo "🚀 Zed for Laravel - Installation Script"
echo "=========================================="
echo ""

# Detect OS
OS="$(uname -s)"
case "${OS}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    *)          MACHINE="UNKNOWN:${OS}"
esac

if [ "$MACHINE" = "UNKNOWN:${OS}" ]; then
    echo "❌ Unsupported operating system: ${OS}"
    exit 1
fi

echo "✅ Detected OS: ${MACHINE}"
echo ""

# Set config directory based on OS
if [ "$MACHINE" = "Mac" ]; then
    CONFIG_DIR="$HOME/.config/zed"
elif [ "$MACHINE" = "Linux" ]; then
    CONFIG_DIR="$HOME/.config/zed"
fi

echo "📁 Config directory: ${CONFIG_DIR}"
echo ""

# Detect if running remotely (via curl | bash) or locally
REMOTE_INSTALL=false
if [ -z "${BASH_SOURCE[0]}" ] || [ "${BASH_SOURCE[0]}" = "bash" ] || [ ! -f "${BASH_SOURCE[0]}" ]; then
    REMOTE_INSTALL=true
    echo "📡 Remote installation detected (downloading from GitHub)"
else
    SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
    echo "📂 Local installation detected"
fi
echo ""

# Check if Zed config directory exists
if [ ! -d "$CONFIG_DIR" ]; then
    echo "📂 Creating Zed config directory..."
    mkdir -p "$CONFIG_DIR"
    mkdir -p "$CONFIG_DIR/snippets"
    echo "✅ Created directories"
else
    echo "✅ Zed config directory exists"
fi

# Create snippets directory if it doesn't exist
if [ ! -d "$CONFIG_DIR/snippets" ]; then
    mkdir -p "$CONFIG_DIR/snippets"
fi

# Backup existing configs
BACKUP_DIR="$CONFIG_DIR/backup-$(date +%Y%m%d-%H%M%S)"

backup_if_exists() {
    local file=$1
    if [ -f "$CONFIG_DIR/$file" ]; then
        mkdir -p "$BACKUP_DIR"
        cp "$CONFIG_DIR/$file" "$BACKUP_DIR/"
        echo "   📦 Backed up: $file"
    fi
}

echo ""
echo "📦 Backing up existing configurations..."
backup_if_exists "settings.json"
backup_if_exists "keymap.json"
backup_if_exists "tasks.json"

if [ -d "$BACKUP_DIR" ]; then
    echo "✅ Backup created at: $BACKUP_DIR"
else
    echo "ℹ️  No existing configuration to backup"
fi

echo ""
echo "🎨 Choose your theme configuration:"
echo ""
echo "1) Default (One Dark theme, standard colors)"
echo "2) Dracula Pro (Custom Dracula with enhanced PHP/Laravel syntax colors)"
echo ""
read -p "Enter your choice (1 or 2): " theme_choice

case $theme_choice in
    2)
        SETTINGS_SOURCE="snippets/settings-dracula.json"
        echo "✅ Selected: Dracula Pro theme"
        ;;
    *)
        SETTINGS_SOURCE="snippets/settings.json"
        echo "✅ Selected: Default theme (One Dark)"
        ;;
esac

echo ""
echo "📋 Installing configuration files..."

# Function to download or copy a file
install_file() {
    local source=$1
    local dest=$2
    local filename=$3
    
    if [ "$REMOTE_INSTALL" = true ]; then
        if curl -fsSL "$GITHUB_RAW_BASE/$source" -o "$dest" 2>/dev/null; then
            echo "✅ Installed: $filename"
            return 0
        else
            echo "⚠️  Could not download: $filename"
            return 1
        fi
    else
        if [ -f "$PROJECT_DIR/$source" ]; then
            cp "$PROJECT_DIR/$source" "$dest"
            echo "✅ Installed: $filename"
            return 0
        else
            echo "⚠️  File not found: $source"
            return 1
        fi
    fi
}

# Install settings.json
install_file "$SETTINGS_SOURCE" "$CONFIG_DIR/settings.json" "settings.json"

# Install keymap.json
install_file "snippets/keymap.json" "$CONFIG_DIR/keymap.json" "keymap.json"

# Install tasks.json
install_file "snippets/tasks.json" "$CONFIG_DIR/tasks.json" "tasks.json"

# Install snippets
echo ""
echo "📝 Installing snippets..."

SNIPPET_FILES=("php.json" "blade.json" "livewire.json")

for snippet in "${SNIPPET_FILES[@]}"; do
    install_file "snippets/$snippet" "$CONFIG_DIR/snippets/$snippet" "$snippet"
done

echo ""
echo "=========================================="
echo "✅ Installation complete!"
echo ""
echo "📚 Next steps:"
echo "   1. Restart Zed Editor"
echo "   2. Extensions will auto-install on first launch:"
echo "      - PHP"
echo "      - Laravel Blade"
echo "      - Env"
echo "      - Tailwind CSS"
echo "   3. Open a Laravel project"
echo "   4. Start using snippets with Tab completion"
echo "   5. Run tasks with Cmd/Ctrl+Shift+T"
echo ""
echo "💡 Tips:"
echo "   - Type 'route' and press Tab for a route snippet"
echo "   - Type '@if' and press Tab for a Blade if statement"
echo "   - Type 'livewire-component' for a full Livewire component"
echo "   - Press Cmd/Ctrl+Shift+X to manage extensions"
echo ""
echo "📖 Documentation: https://github.com/croustibat/zed-for-laravel"
echo ""
echo "🙏 Thank you for using Zed for Laravel!"
echo ""
