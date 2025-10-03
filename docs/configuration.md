# Configuration Guide

Learn how to customize Zed for Laravel to match your preferences and workflow.

## Configuration Files

All configuration files are located in your Zed config directory:

**macOS / Linux:** `~/.config/zed/`
**Windows:** `%APPDATA%\Zed\`

### Main Files

- **`settings.json`** - Editor settings, formatting, LSP configuration
- **`keymap.json`** - Keyboard shortcuts
- **`tasks.json`** - Artisan and build tasks
- **`snippets/`** - Code snippets directory

## Managing Extensions

### Auto-Installed Extensions

By default, these extensions are automatically installed via the `auto_install_extensions` setting in `settings.json`:

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

### Adding More Extensions

To add more extensions to auto-install, edit `settings.json`:

```json
{
  "auto_install_extensions": {
    "php": true,
    "blade": true,
    "env": true,
    "tailwindcss": true,
    "vue": true,          // Add Vue support
    "alpine": true,       // Add Alpine.js support
    "markdown": true      // Add Markdown support
  }
}
```

**Popular Laravel-related extensions:**
- `vue` - Vue.js (for Inertia projects)
- `alpine` - Alpine.js
- `markdown` - Markdown files
- `toml` - TOML configuration files
- `docker` - Docker files
- `sql` - SQL syntax

### Disabling Auto-Install

To prevent an extension from auto-installing:

```json
{
  "auto_install_extensions": {
    "php": true,
    "blade": true,
    "env": true,
    "tailwindcss": false  // Won't install
  }
}
```

Or remove it entirely from the list.

### Manual Extension Management

To manage extensions manually:
1. Press `Cmd/Ctrl + Shift + X`
2. Search for extensions
3. Click "Install" or "Uninstall"

## Customizing Settings

### Theme and Appearance

Change the editor theme in `settings.json`:

```json
{
  "theme": "One Dark"
}
```

**Popular themes:**
- `One Dark` (default)
- `Ayu Dark`
- `Gruvbox Dark`
- `Solarized Dark`
- `Dracula`
- `Nord`

### Font Configuration

Customize font family and size:

```json
{
  "buffer_font_family": "JetBrains Mono",
  "buffer_font_size": 14,
  "ui_font_size": 16
}
```

**Recommended fonts for Laravel:**
- JetBrains Mono
- Fira Code
- Cascadia Code
- SF Mono
- Hack

### Tab Size

Default tab size is 4 for PHP (Laravel convention) and 2 for JavaScript/CSS:

```json
{
  "tab_size": 4,
  "languages": {
    "PHP": {
      "tab_size": 4
    },
    "JavaScript": {
      "tab_size": 2
    }
  }
}
```

### Format on Save

Control automatic formatting:

```json
{
  "format_on_save": "on"
}
```

Options: `"on"`, `"off"`, `"language_default"`

To disable for specific languages:

```json
{
  "languages": {
    "Blade": {
      "format_on_save": "off"
    }
  }
}
```

## Customizing Laravel Pint

### Using a Custom Pint Configuration

If your project has a `pint.json` file, Pint will automatically use it. Example `pint.json`:

```json
{
  "preset": "laravel",
  "rules": {
    "simplified_null_return": true,
    "braces": false,
    "new_with_braces": {
      "named_class": true,
      "anonymous_class": false
    }
  }
}
```

### Alternative Formatter

If you prefer PHP CS Fixer instead of Pint:

```json
{
  "languages": {
    "PHP": {
      "formatter": {
        "external": {
          "command": "bash",
          "arguments": [
            "-c",
            "cat > {buffer_path} && ./vendor/bin/php-cs-fixer fix {buffer_path} --quiet && cat {buffer_path}"
          ]
        }
      }
    }
  }
}
```

### Disable Pint Formatting

To disable Pint and use only manual formatting:

```json
{
  "format_on_save": "off",
  "languages": {
    "PHP": {
      "format_on_save": "off"
    }
  }
}
```

## PHP Language Server Configuration

### Switching to Phpactor

If you prefer phpactor over Intelephense:

```json
{
  "lsp": {
    "phpactor": {
      "settings": {
        "phpactor.enable": true,
        "phpactor.path": "phpactor"
      }
    }
  },
  "languages": {
    "PHP": {
      "language_servers": ["phpactor", "..."]
    }
  }
}
```

### Intelephense License Key

If you have an Intelephense premium license:

```json
{
  "lsp": {
    "intelephense": {
      "settings": {
        "intelephense.licenceKey": "YOUR_LICENSE_KEY"
      }
    }
  }
}
```

### Custom PHP Version

Specify your PHP version for better completion:

```json
{
  "lsp": {
    "intelephense": {
      "settings": {
        "intelephense.environment.phpVersion": "8.3.0"
      }
    }
  }
}
```

## Customizing Keyboard Shortcuts

Edit `keymap.json` to change keyboard shortcuts.

### Adding Custom Shortcuts

```json
[
  {
    "context": "Editor",
    "bindings": {
      "cmd-k cmd-f": "editor::Format",
      "ctrl-k ctrl-f": "editor::Format"
    }
  }
]
```

### Vim Mode

Enable Vim keybindings in `settings.json`:

```json
{
  "vim_mode": true
}
```

### Common Actions

Available actions you can bind:
- `editor::Format`
- `command_palette::Toggle`
- `workspace::ToggleLeftDock`
- `project_panel::ToggleFocus`
- `terminal_panel::ToggleFocus`
- `task::Spawn`
- `file_finder::Toggle`
- `workspace::NewSearch`

## Customizing Tasks

Edit `tasks.json` to modify or add Artisan tasks.

### Adding a Custom Task

```json
{
  "label": "Artisan Optimize",
  "command": "php artisan optimize",
  "use_new_terminal": false,
  "allow_concurrent_runs": false,
  "reveal": "always"
}
```

### Task with Parameters

Use `${1:default}` for prompted parameters:

```json
{
  "label": "Artisan Make Livewire",
  "command": "php artisan make:livewire ${1:ComponentName}",
  "use_new_terminal": false,
  "allow_concurrent_runs": false,
  "reveal": "always"
}
```

### Task Options

- **`label`** - Display name in task list
- **`command`** - Shell command to execute
- **`use_new_terminal`** - Create new terminal window
- **`allow_concurrent_runs`** - Allow multiple instances
- **`reveal`** - When to show terminal (`"always"`, `"never"`)

### Environment Variables

Use environment variables in tasks:

```json
{
  "label": "Run Tests with Env",
  "command": "APP_ENV=testing php artisan test",
  "use_new_terminal": false,
  "allow_concurrent_runs": false,
  "reveal": "always"
}
```

## Creating Custom Snippets

### Adding New PHP Snippets

Edit `snippets/php.json`:

```json
{
  "My Custom Snippet": {
    "prefix": "mysnippet",
    "body": [
      "public function ${1:methodName}(${2:Type} \\${3:parameter})",
      "{",
      "    ${4:// Your code}",
      "}"
    ],
    "description": "My custom method snippet"
  }
}
```

### Snippet Syntax

- **`${1:default}`** - Tab stop with default text
- **`${1|option1,option2|}`** - Choice selector
- **`\\# Configuration Guide

Learn how to customize Zed for Laravel to match your preferences and workflow.

## Configuration Files

All configuration files are located in your Zed config directory:

**macOS / Linux:** `~/.config/zed/`
**Windows:** `%APPDATA%\Zed\`

### Main Files

- **`settings.json`** - Editor settings, formatting, LSP configuration
- **`keymap.json`** - Keyboard shortcuts
- **`tasks.json`** - Artisan and build tasks
- **`snippets/`** - Code snippets directory

## Customizing Settings

### Theme and Appearance

Change the editor theme in `settings.json`:

```json
{
  "theme": "One Dark"
}
```

**Popular themes:**
- `One Dark` (default)
- `Ayu Dark`
- `Gruvbox Dark`
- `Solarized Dark`
- `Dracula`
- `Nord`

### Font Configuration

Customize font family and size:

```json
{
  "buffer_font_family": "JetBrains Mono",
  "buffer_font_size": 14,
  "ui_font_size": 16
}
```

**Recommended fonts for Laravel:**
- JetBrains Mono
- Fira Code
- Cascadia Code
- SF Mono
- Hack

### Tab Size

Default tab size is 4 for PHP (Laravel convention) and 2 for JavaScript/CSS:

```json
{
  "tab_size": 4,
  "languages": {
    "PHP": {
      "tab_size": 4
    },
    "JavaScript": {
      "tab_size": 2
    }
  }
}
```

### Format on Save

Control automatic formatting:

```json
{
  "format_on_save": "on"
}
```

Options: `"on"`, `"off"`, `"language_default"`

To disable for specific languages:

```json
{
  "languages": {
    "Blade": {
      "format_on_save": "off"
    }
  }
}
```

## Customizing Laravel Pint

### Using a Custom Pint Configuration

If your project has a `pint.json` file, Pint will automatically use it. Example `pint.json`:

```json
{
  "preset": "laravel",
  "rules": {
    "simplified_null_return": true,
    "braces": false,
    "new_with_braces": {
      "named_class": true,
      "anonymous_class": false
    }
  }
}
```

### Alternative Formatter

If you prefer PHP CS Fixer instead of Pint:

```json
{
  "languages": {
    "PHP": {
      "formatter": {
        "external": {
          "command": "bash",
          "arguments": [
            "-c",
            "cat > {buffer_path} && ./vendor/bin/php-cs-fixer fix {buffer_path} --quiet && cat {buffer_path}"
          ]
        }
      }
    }
  }
}
```

### Disable Pint Formatting

To disable Pint and use only manual formatting:

```json
{
  "format_on_save": "off",
  "languages": {
    "PHP": {
      "format_on_save": "off"
    }
  }
}
```

## PHP Language Server Configuration

### Switching to Phpactor

If you prefer phpactor over Intelephense:

```json
{
  "lsp": {
    "phpactor": {
      "settings": {
        "phpactor.enable": true,
        "phpactor.path": "phpactor"
      }
    }
  },
  "languages": {
    "PHP": {
      "language_servers": ["phpactor", "..."]
    }
  }
}
```

### Intelephense License Key

If you have an Intelephense premium license:

```json
{
  "lsp": {
    "intelephense": {
      "settings": {
        "intelephense.licenceKey": "YOUR_LICENSE_KEY"
      }
    }
  }
}
```

** - Escaped dollar sign (for PHP variables)
- **`\n`** - New line (in single-line format)

### Adding Blade Snippets

Edit `snippets/blade.json`:

```json
{
  "My Blade Component": {
    "prefix": "mycomponent",
    "body": [
      "<x-my-component ${1::prop=\"value\"}>",
      "    ${2:// Content}",
      "</x-my-component>"
    ],
    "description": "My custom Blade component"
  }
}
```

### Project-Specific Snippets

For project-specific snippets, create a local `.zed` folder:

```bash
mkdir -p .zed/snippets
```

Add snippets in `.zed/snippets/php.json` - they'll override global snippets.

## Git Configuration

### Disable Inline Blame

```json
{
  "git": {
    "inline_blame": {
      "enabled": false
    }
  }
}
```

### Adjust Blame Delay

```json
{
  "git": {
    "inline_blame": {
      "enabled": true,
      "delay_ms": 1000
    }
  }
}
```

### Disable Git Gutter

```json
{
  "git": {
    "git_gutter": "hide"
  }
}
```

## Terminal Configuration

### Change Default Shell

**macOS/Linux:**
```json
{
  "terminal": {
    "shell": {
      "program": "/bin/bash"
    }
  }
}
```

**Windows:**
```json
{
  "terminal": {
    "shell": {
      "program": "pwsh.exe"
    }
  }
}
```

### Terminal Font

```json
{
  "terminal": {
    "font_family": "JetBrains Mono",
    "font_size": 14
  }
}
```

## UI Customization

### Panel Configuration

```json
{
  "project_panel": {
    "dock": "left",
    "default_width": 300
  },
  "outline_panel": {
    "dock": "right",
    "default_width": 240
  }
}
```

### Tab Behavior

```json
{
  "tabs": {
    "close_position": "right",
    "file_icons": true,
    "git_status": true
  }
}
```

### Line Numbers

```json
{
  "relative_line_numbers": true
}
```

## File Associations

### Custom File Extensions

Add custom file extensions for Blade:

```json
{
  "file_types": {
    "Blade": [
      "blade.php",
      "blade.html"
    ]
  }
}
```

### Ignore Files

While Zed respects `.gitignore`, you can add editor-specific ignores in your project's `.zed/settings.json`:

```json
{
  "file_scan_exclusions": [
    "**/.DS_Store",
    "**/node_modules",
    "**/vendor",
    "**/.git"
  ]
}
```

## Performance Tuning

### LSP Performance

Limit LSP indexing for large projects:

```json
{
  "lsp": {
    "intelephense": {
      "settings": {
        "intelephense.files.maxSize": 1000000
      }
    }
  }
}
```

### Disable Telemetry

```json
{
  "telemetry": {
    "diagnostics": false,
    "metrics": false
  }
}
```

## Blade Formatting

Since Blade doesn't have official formatter support in Zed yet, you can:

### Option 1: Disable Blade Formatting

```json
{
  "languages": {
    "Blade": {
      "format_on_save": "off"
    }
  }
}
```

### Option 2: Use Prettier with Blade Plugin

If you have `@shufo/prettier-plugin-blade` installed:

```json
{
  "languages": {
    "Blade": {
      "formatter": {
        "external": {
          "command": "npx",
          "arguments": [
            "prettier",
            "--write",
            "--plugin=@shufo/prettier-plugin-blade",
            "{buffer_path}"
          ]
        }
      }
    }
  }
}
```

## Multi-Cursor Editing

Configure multi-cursor behavior:

```json
{
  "multi_cursor_modifier": "alt"
}
```

Options: `"alt"`, `"cmd"`, `"ctrl"`

## Autosave

Configure autosave behavior:

```json
{
  "autosave": "on_focus_change"
}
```

Options:
- `"off"` - Never autosave
- `"on_focus_change"` - Save when switching files
- `"on_window_change"` - Save when switching windows
- `"after_delay"` - Save after typing stops

## Project-Specific Configuration

Create a `.zed/settings.json` in your Laravel project root for project-specific settings:

```json
{
  "tab_size": 2,
  "lsp": {
    "intelephense": {
      "settings": {
        "intelephense.environment.phpVersion": "8.2.0"
      }
    }
  }
}
```

This overrides global settings for that project only.

## Sharing Configuration

### Export Your Configuration

Share your setup with your team:

```bash
# macOS/Linux
tar -czf my-zed-config.tar.gz -C ~/.config/zed .

# Windows (PowerShell)
Compress-Archive -Path "$env:APPDATA\Zed\*" -DestinationPath my-zed-config.zip
```

### Team Configuration Repository

Create a team config repository:

```bash
git init zed-team-config
cd zed-team-config
cp ~/.config/zed/settings.json .
cp ~/.config/zed/keymap.json .
cp ~/.config/zed/tasks.json .
cp -r ~/.config/zed/snippets .
git add .
git commit -m "Initial team Zed configuration"
```

Team members can then clone and install.

## Troubleshooting

### Reset to Defaults

If something breaks, backup and remove your config:

```bash
# macOS/Linux
mv ~/.config/zed ~/.config/zed.backup
# Restart Zed, then reinstall Zed for Laravel

# Windows
Rename-Item "$env:APPDATA\Zed" "$env:APPDATA\Zed.backup"
# Restart Zed, then reinstall Zed for Laravel
```

### Validate JSON

Always validate JSON after editing:

```bash
# macOS/Linux
cat ~/.config/zed/settings.json | python -m json.tool

# Or use jq
jq . ~/.config/zed/settings.json
```

### Check Logs

View Zed logs for debugging:

**macOS:** `~/Library/Logs/Zed/`
**Linux:** `~/.local/share/zed/logs/`
**Windows:** `%APPDATA%\Zed\logs\`

## Further Customization

For more advanced customization options, check:

- [Zed Documentation](https://zed.dev/docs)
- [Zed Settings Reference](https://zed.dev/docs/configuring-zed)
- [GitHub Discussions](https://github.com/zed-industries/zed/discussions)

## Next Steps

- Return to [Features Overview](features.md)
- Check the [Installation Guide](installation.md)
- Start building with Laravel! 🚀
