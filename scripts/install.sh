#!/bin/bash

# Zed for Laravel - Installation Script
# Installs Zed configuration for Laravel development

set -e

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

# Check if Zed config directory exists
if [ ! -d "$CONFIG_DIR" ]; then
    echo "📂 Creating Zed config directory..."
    mkdir -p "$CONFIG_DIR"
    mkdir -p "$CONFIG_DIR/snippets"
    echo "✅ Created directories"
else
    echo "✅ Zed config directory exists"
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

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

echo ""
echo "📋 Installing configuration files..."

# Copy main config files
if [ -f "$PROJECT_DIR/settings.json" ]; then
    cp "$PROJECT_DIR/settings.json" "$CONFIG_DIR/"
    echo "✅ Installed: settings.json"
fi

if [ -f "$PROJECT_DIR/keymap.json" ]; then
    cp "$PROJECT_DIR/keymap.json" "$CONFIG_DIR/"
    echo "✅ Installed: keymap.json"
fi

if [ -f "$PROJECT_DIR/tasks.json" ]; then
    cp "$PROJECT_DIR/tasks.json" "$CONFIG_DIR/"
    echo "✅ Installed: tasks.json"
fi

# Copy snippets
echo ""
echo "📝 Installing snippets..."
if [ -d "$PROJECT_DIR/snippets" ]; then
    cp -r "$PROJECT_DIR/snippets/"* "$CONFIG_DIR/snippets/" 2>/dev/null || true
    echo "✅ Installed PHP snippets"
    echo "✅ Installed Blade snippets"
    echo "✅ Installed Livewire snippets"
fi

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
