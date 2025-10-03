# Zed Extensions for Laravel

Complete guide to Zed extensions that enhance Laravel development.

## 🔌 Auto-Installed Extensions

These extensions are **automatically installed** when you use Zed for Laravel, configured via the `auto_install_extensions` setting:

### PHP
- **Repository:** [zed-extensions/php](https://github.com/zed-extensions/php)
- **Purpose:** PHP syntax highlighting and language server support
- **Why:** Essential for PHP development, provides IntelliSense, code completion, and diagnostics

### Laravel Blade
- **Repository:** [bajrangCoder/zed-laravel-blade](https://github.com/bajrangCoder/zed-laravel-blade)
- **Purpose:** Blade template engine syntax support
- **Why:** Proper syntax highlighting and formatting for `.blade.php` files

### Env
- **Repository:** [zed-extensions/env](https://github.com/zed-extensions/env)
- **Purpose:** `.env` file syntax highlighting
- **Why:** Makes environment variables easier to read and edit

### Tailwind CSS
- **Repository:** [zed-extensions/tailwindcss](https://github.com/zed-extensions/tailwindcss)
- **Purpose:** Tailwind CSS IntelliSense
- **Why:** Most Laravel projects use Tailwind - provides class name completion and hover documentation

## 📦 Recommended Optional Extensions

Install these manually based on your project needs.

### Vue
- **Repository:** [zed-extensions/vue](https://github.com/zed-extensions/vue)
- **Purpose:** Vue.js syntax and language support
- **When to use:** If using Inertia.js with Vue
- **Installation:**
  ```json
  "auto_install_extensions": {
    "vue": true
  }
  ```

### Alpine.js
- **Repository:** [zed-extensions/alpine](https://github.com/zed-extensions/alpine)
- **Purpose:** Alpine.js syntax support
- **When to use:** If using Alpine.js for interactivity
- **Installation:**
  ```json
  "auto_install_extensions": {
    "alpine": true
  }
  ```

### Markdown
- **Repository:** [zed-extensions/markdown](https://github.com/zed-extensions/markdown)
- **Purpose:** Enhanced Markdown support with preview
- **When to use:** For README files and documentation
- **Installation:**
  ```json
  "auto_install_extensions": {
    "markdown": true
  }
  ```

### Docker
- **Repository:** [zed-extensions/docker](https://github.com/zed-extensions/docker)
- **Purpose:** Dockerfile and docker-compose.yml syntax
- **When to use:** If using Docker or Laravel Sail
- **Installation:**
  ```json
  "auto_install_extensions": {
    "docker": true
  }
  ```

### TOML
- **Repository:** [zed-extensions/toml](https://github.com/zed-extensions/toml)
- **Purpose:** TOML file syntax highlighting
- **When to use:** For Rust dependencies or configuration files
- **Installation:**
  ```json
  "auto_install_extensions": {
    "toml": true
  }
  ```

### SQL
- **Repository:** [zed-extensions/sql](https://github.com/zed-extensions/sql)
- **Purpose:** SQL syntax highlighting
- **When to use:** For raw SQL queries and migrations
- **Installation:**
  ```json
  "auto_install_extensions": {
    "sql": true
  }
  ```

### YAML
- **Repository:** [zed-extensions/yaml](https://github.com/zed-extensions/yaml)
- **Purpose:** YAML syntax support
- **When to use:** For GitHub Actions, Docker Compose, etc.
- **Installation:**
  ```json
  "auto_install_extensions": {
    "yaml": true
  }
  ```

### GraphQL
- **Repository:** [zed-extensions/graphql](https://github.com/zed-extensions/graphql)
- **Purpose:** GraphQL schema and query syntax
- **When to use:** If using Laravel Lighthouse or similar
- **Installation:**
  ```json
  "auto_install_extensions": {
    "graphql": true
  }
  ```

## 🎨 Theme Extensions

### Popular Themes
- **One Dark** (default) - Atom's iconic theme
- **Gruvbox** - Retro groove color scheme
- **Dracula** - Dark theme
- **Nord** - Arctic-inspired palette
- **Solarized** - Precision colors for machines and people

Install themes through the Extensions panel (`Cmd/Ctrl + Shift + X`).

## 🚀 How to Install Extensions

### Method 1: Auto-Install (Recommended)

Edit `~/.config/zed/settings.json` (macOS/Linux) or `%APPDATA%\Zed\settings.json` (Windows):

```json
{
  "auto_install_extensions": {
    "php": true,
    "blade": true,
    "env": true,
    "tailwindcss": true,
    "vue": true,
    "alpine": true,
    "markdown": true,
    "docker": true
  }
}
```

Extensions will install automatically on next Zed launch.

### Method 2: Manual Install

1. Open Zed
2. Press `Cmd/Ctrl + Shift + X` to open Extensions panel
3. Search for the extension by name
4. Click "Install"

### Method 3: Command Palette

1. Press `Cmd/Ctrl + Shift + P`
2. Type "Extensions: Install Extension"
3. Search and select the extension

## 🔧 Managing Extensions

### View Installed Extensions
- Press `Cmd/Ctrl + Shift + X`
- See all installed extensions with status

### Disable an Extension
- Open Extensions panel
- Click on the extension
- Click "Disable"

### Uninstall an Extension
- Open Extensions panel
- Click on the extension
- Click "Uninstall"

### Update Extensions
Extensions update automatically by default. To check for updates:
- Press `Cmd/Ctrl + Shift + X`
- Look for "Update Available" badges

## 📝 Creating Custom Extensions

Want to create your own extension? Check out:
- [Zed Extension Documentation](https://zed.dev/docs/extensions)
- [Extension API Reference](https://zed.dev/docs/extensions/developing-extensions)

## 🎯 Extension Recommendations by Project Type

### Standard Laravel with Blade
```json
{
  "auto_install_extensions": {
    "php": true,
    "blade": true,
    "env": true,
    "tailwindcss": true
  }
}
```

### Laravel + Inertia.js + Vue
```json
{
  "auto_install_extensions": {
    "php": true,
    "blade": true,
    "env": true,
    "tailwindcss": true,
    "vue": true
  }
}
```

### Laravel + Livewire + Alpine
```json
{
  "auto_install_extensions": {
    "php": true,
    "blade": true,
    "env": true,
    "tailwindcss": true,
    "alpine": true
  }
}
```

### Laravel API with GraphQL
```json
{
  "auto_install_extensions": {
    "php": true,
    "env": true,
    "graphql": true,
    "markdown": true
  }
}
```

### Laravel with Docker/Sail
```json
{
  "auto_install_extensions": {
    "php": true,
    "blade": true,
    "env": true,
    "tailwindcss": true,
    "docker": true,
    "yaml": true
  }
}
```

## 🆘 Troubleshooting

### Extension Won't Install

1. **Check internet connection** - Extensions download from the internet
2. **Restart Zed** - Sometimes a restart helps
3. **Check Zed version** - Ensure you have the latest Zed version
4. **Manual install** - Try installing through the Extensions panel UI

### Extension Conflicts

If multiple extensions provide similar features:
1. Disable one extension
2. Restart Zed
3. Test which works better for your workflow

### Extension Not Working

1. Check if the extension is enabled (Extensions panel)
2. Restart Zed
3. Check extension requirements (some need additional tools)
4. Report issues on the extension's GitHub repository

## 🔗 Useful Links

- [Zed Extensions Directory](https://github.com/zed-extensions)
- [Zed Documentation](https://zed.dev/docs)
- [Creating Extensions](https://zed.dev/docs/extensions/developing-extensions)
- [Extension API](https://zed.dev/docs/extensions/languages)

---

**Need more help?** Open an issue on [GitHub](https://github.com/croustibat/zed-for-laravel/issues)
