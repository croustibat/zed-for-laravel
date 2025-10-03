# 🚀 Zed for Laravel Starter Kit

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
[![Laravel](https://img.shields.io/badge/Laravel-11.x-FF2D20?logo=laravel)](https://laravel.com)
[![Zed](https://img.shields.io/badge/Zed-Editor-blue)](https://zed.dev)

A complete configuration kit for [Zed Editor](https://zed.dev) optimized for Laravel development. Get started with Laravel in Zed in seconds with pre-configured settings, snippets, tasks, and keyboard shortcuts.

## 🎨 Theme Options

Choose between two pre-configured themes during installation:

### 1. Default Theme (One Dark)
- Clean and modern One Dark color scheme
- Standard syntax highlighting
- Perfect for getting started quickly

### 2. Dracula Blurred Theme  ⭐
- Custom Dracula theme with enhanced colors
- Optimized syntax highlighting for PHP and Laravel
- Carefully tuned colors for:
  - PHP functions and methods (`#50fa7b` green)
  - Keywords and operators (`#ff79c6` pink, bold)
  - Types and classes (`#8be9fd` cyan, italic)
  - Strings (`#f1fa8c` yellow)
  - Comments (`#6272a4` blue-gray, italic)
- Enhanced readability for long coding sessions

The installation script will prompt you to choose your preferred theme.

## ✨ Features

- 🎨 **Laravel Pint Integration** - Automatic code formatting on save
- 📝 **130+ Snippets** - PHP, Blade, and Livewire 3 snippets
- ⚡ **Artisan Tasks** - Pre-configured tasks for common Artisan commands
- ⌨️ **Keyboard Shortcuts** - Laravel-friendly keybindings
- 🔧 **LSP Configuration** - PHP language server optimized for Laravel
- 🎯 **Blade Support** - Full syntax highlighting and formatting
- 🔌 **Auto Extension Install** - Installs essential Zed extensions automatically
- 📦 **Git Integration** - Inline blame and gutter indicators
- 🚀 **One-command Installation** - Automated setup scripts

## 📋 Requirements

- [Zed Editor](https://zed.dev) (latest version)
- PHP 8.1+ with Intelephense or phpactor
- Laravel 10.x or 11.x project
- Laravel Pint installed in your project (`composer require laravel/pint --dev`)

## 🔌 Included Extensions

These Zed extensions are **automatically installed** on first launch via the `auto_install_extensions` setting:

- **[PHP](https://github.com/zed-extensions/php)** - PHP syntax highlighting and language server support
- **[Laravel Blade](https://github.com/bajrangCoder/zed-laravel-blade)** - Blade template syntax support
- **[Env](https://github.com/zed-extensions/env)** - .env file syntax highlighting
- **[Tailwind CSS](https://github.com/zed-extensions/tailwindcss)** - Tailwind IntelliSense

**Recommended optional extensions** (install manually via `Cmd/Ctrl + Shift + X`):
- **[Vue](https://github.com/zed-extensions/vue)** - For Inertia.js projects with Vue
- **[Alpine.js](https://github.com/zed-extensions/alpine)** - For Alpine.js syntax support

Extensions will install automatically when you first launch Zed after installation. No manual action required! 🎉

## 🔧 Installation

### Automatic Installation (Recommended)

#### macOS / Linux
```bash
curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/zed-for-laravel/main/scripts/install.sh | bash
```

Or download and run:
```bash
git clone https://github.com/YOUR_USERNAME/zed-for-laravel.git
cd zed-for-laravel
chmod +x scripts/install.sh
./scripts/install.sh
```

#### Windows (PowerShell)
```powershell
irm https://raw.githubusercontent.com/YOUR_USERNAME/zed-for-laravel/main/scripts/install.ps1 | iex
```

Or download and run:
```powershell
git clone https://github.com/YOUR_USERNAME/zed-for-laravel.git
cd zed-for-laravel
.\scripts\install.ps1
```

### Manual Installation

1. Clone this repository
2. Copy configuration files to your Zed config directory:

**macOS / Linux:**
```bash
cp settings.json ~/.config/zed/settings.json
cp keymap.json ~/.config/zed/keymap.json
cp tasks.json ~/.config/zed/tasks.json
cp -r snippets/* ~/.config/zed/snippets/
```

**Windows:**
```powershell
Copy-Item settings.json $env:APPDATA\Zed\settings.json
Copy-Item keymap.json $env:APPDATA\Zed\keymap.json
Copy-Item tasks.json $env:APPDATA\Zed\tasks.json
Copy-Item -Recurse snippets\* $env:APPDATA\Zed\snippets\
```

## 📚 Usage

### Snippets

All snippets support **Tab completion**. Type the prefix and press `Tab` to expand.

#### PHP Snippets
- `route` → Route definition
- `controller` → Controller class
- `model` → Eloquent model with HasFactory
- `migration` → Migration class
- `factory` → Model factory
- `test` → PHPUnit test class
- `request` → Form Request validation
- `hasMany` → hasMany relationship
- `belongsTo` → belongsTo relationship
- `belongsToMany` → belongsToMany relationship
- `provider` → Service Provider
- `job` → Queued Job class

#### Blade Snippets
- `@if` → If statement
- `@foreach` → Foreach loop
- `@forelse` → Forelse loop
- `@switch` → Switch statement
- `@extends` → Template extension
- `@section` → Section definition
- `@yield` → Yield content
- `component` → Blade component
- `@auth` → Auth check
- `@guest` → Guest check
- `@can` → Authorization check
- `@csrf` → CSRF token
- `@method` → HTTP method spoofing
- `@error` → Validation error

#### Livewire 3 Snippets
- `livewire-component` → Full Livewire component class
- `livewire-property` → Public property
- `livewire-validate` → Property with validation attribute
- `livewire-mount` → Mount lifecycle hook
- `livewire-updated` → Updated lifecycle hook
- `livewire-action` → Action method
- `livewire-dispatch` → Dispatch event
- `livewire-on` → Event listener with attribute
- `wire:model` → Wire model directive
- `wire:click` → Wire click directive

### Tasks (Cmd/Ctrl + Shift + T)

Pre-configured tasks for common Laravel operations:

- **Artisan Serve** - Start development server
- **Artisan Migrate** - Run migrations
- **Artisan Migrate Fresh** - Fresh migration with seeding
- **Artisan Tinker** - Open Tinker REPL
- **Artisan Route List** - Display all routes
- **Pint Format (All)** - Format all PHP files
- **Pint Format (Dirty)** - Format only modified files
- **PHPUnit** - Run all tests
- **PHPUnit (Current)** - Run current test file
- **NPM Dev** - Start Vite dev server
- **NPM Build** - Build for production
- **Composer Install** - Install dependencies
- **Composer Update** - Update dependencies

### Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| `Cmd/Ctrl + Shift + P` | Command palette |
| `Cmd/Ctrl + Shift + I` | Format document |
| `Cmd/Ctrl + T` | Toggle terminal |
| `Cmd/Ctrl + Shift + T` | Run task |
| `Cmd/Ctrl + B` | Toggle sidebar |
| `Cmd/Ctrl + Shift + E` | Project explorer |

## 🎨 Formatting

Laravel Pint is configured to run automatically on save for all PHP files. The configuration uses a bash wrapper to ensure compatibility:

```json
"bash -c \"cat > {buffer_path} && ./vendor/bin/pint --quiet {buffer_path} && cat {buffer_path}\""
```

You can also manually format using:
- Keyboard: `Cmd/Ctrl + Shift + I`
- Command Palette: "Format Document"
- Task Runner: "Pint Format (All)" or "Pint Format (Dirty)"

## 📖 Documentation

- [Installation Guide](docs/installation.md)
- [Features Overview](docs/features.md)
- [Configuration Guide](docs/configuration.md)
- [Extensions Guide](docs/extensions.md)
- [Theme Guide](docs/themes.md)

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Zed Editor](https://zed.dev) - The high-performance, multiplayer code editor
- [Laravel](https://laravel.com) - The PHP framework for web artisans
- [Laravel Pint](https://laravel.com/docs/pint) - Opinionated PHP code style fixer

## 💖 Support

If you find this project helpful, please consider:
- Starring the repository ⭐
- Sharing it with other Laravel developers
- [Sponsoring the project](https://github.com/sponsors/YOUR_USERNAME)

---

Made with ❤️ for the Laravel community
