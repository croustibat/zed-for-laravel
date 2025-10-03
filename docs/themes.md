# Theme Guide

Zed for Laravel comes with two pre-configured theme options optimized for Laravel development.

## 🎨 Available Themes

### 1. Default Theme (One Dark)

**Best for:** Quick setup, familiar VS Code users, standard color preferences

**Characteristics:**
- Based on Atom's iconic One Dark theme
- Balanced colors suitable for long coding sessions
- Standard syntax highlighting
- No custom overrides
- Works out of the box with all Zed themes

**Color Palette:**
- Background: Dark gray (`#282c34`)
- Foreground: Light gray
- Comments: Muted gray
- Strings: Green
- Keywords: Purple
- Functions: Blue

**File:** `settings.json`

---

### 2. Dracula Pro Theme ⭐ (Recommended)

**Best for:** PHP/Laravel developers, enhanced readability, custom color preferences

**Characteristics:**
- Based on the popular Dracula theme
- **Custom syntax overrides** specifically tuned for PHP and Laravel
- Enhanced colors for better code distinction
- Optimized for reduced eye strain
- Carefully selected colors for each syntax element

**Color Palette:**
```
Background:     #282a36 (Dark purple-gray)
Foreground:     #f8f8f2 (Off-white)
Comments:       #6272a4 (Blue-gray, italic)
Strings:        #f1fa8c (Yellow)
Special Strings:#50fa7b (Green)
Numbers:        #bd93f9 (Purple)
Functions:      #50fa7b (Green)
Keywords:       #ff79c6 (Pink, bold)
Types:          #8be9fd (Cyan, italic)
Properties:     #8be9fd (Cyan)
Variables:      #f8f8f2 (Off-white)
Operators:      #ff79c6 (Pink)
```

**File:** `settings-dracula.json`

**PHP/Laravel Specific Optimizations:**
- **Functions & Methods** → Bright green (`#50fa7b`) - Easy to spot Laravel helpers
- **Keywords** → Bold pink (`#ff79c6`) - `class`, `function`, `public`, etc. stand out
- **Types & Classes** → Italic cyan (`#8be9fd`) - Elegant type hints
- **Strings** → Yellow (`#f1fa8c`) - High contrast for string literals
- **Comments** → Italic blue-gray (`#6272a4`) - Readable but not distracting
- **Properties** → Cyan - Laravel model properties are easy to identify
- **Special Strings** → Green - Environment variables, special syntax

---

## 🔄 Switching Themes

### During Installation

The installation script will prompt you to choose:

```bash
🎨 Choose your theme configuration:

1) Default (One Dark theme, standard colors)
2) Dracula Pro (Custom Dracula with enhanced PHP/Laravel syntax colors)

Enter your choice (1 or 2):
```

### After Installation

To switch themes after installation:

#### Method 1: Manual Copy

**macOS / Linux:**
```bash
# Switch to Dracula
cp settings-dracula.json ~/.config/zed/settings.json

# Switch to Default
cp settings.json ~/.config/zed/settings.json
```

**Windows:**
```powershell
# Switch to Dracula
Copy-Item settings-dracula.json $env:APPDATA\Zed\settings.json -Force

# Switch to Default
Copy-Item settings.json $env:APPDATA\Zed\settings.json -Force
```

#### Method 2: Re-run Installation

```bash
# macOS/Linux
./scripts/install.sh

# Windows
.\scripts\install.ps1
```

Select your preferred theme when prompted.

---

## 🎯 Comparison

| Feature | Default (One Dark) | Dracula Pro |
|---------|-------------------|-------------|
| **Setup** | Instant | Instant |
| **PHP Syntax** | Standard | Enhanced |
| **Laravel Optimized** | No | Yes |
| **Custom Colors** | No | Yes |
| **Bold Keywords** | No | Yes |
| **Italic Types** | No | Yes |
| **Eye Strain** | Low | Very Low |
| **Code Distinction** | Good | Excellent |
| **Best For** | General use | PHP/Laravel |

---

## 📸 Visual Examples

### PHP Code Comparison

**Default Theme:**
```php
// Standard colors
public function store(Request $request): JsonResponse
{
    $user = User::create($request->validated());
    return response()->json($user, 201);
}
```
- Functions: Blue
- Keywords: Purple
- Types: Orange
- Variables: Standard
- Comments: Gray

**Dracula Pro:**
```php
// Enhanced colors
public function store(Request $request): JsonResponse
{
    $user = User::create($request->validated());
    return response()->json($user, 201);
}
```
- Functions: **Bright Green** (easy to spot)
- Keywords: **Bold Pink** (stands out)
- Types: **Italic Cyan** (elegant)
- Variables: Off-white
- Comments: **Italic Blue-gray**

### Blade Template Comparison

**Default Theme:**
```blade
@extends('layouts.app')

@section('content')
    <div class="container">
        @foreach($users as $user)
            <p>{{ $user->name }}</p>
        @endforeach
    </div>
@endsection
```

**Dracula Pro:**
```blade
@extends('layouts.app')

@section('content')
    <div class="container">
        @foreach($users as $user)
            <p>{{ $user->name }}</p>
        @endforeach
    </div>
@endsection
```
- Blade directives: **Pink** (clear distinction)
- HTML tags: **Pink**
- Attributes: **Green**
- Strings: **Yellow**
- Variables: **Cyan**

---

## 🎨 Customizing Your Theme

### Modifying Dracula Colors

Edit `~/.config/zed/settings.json` (or `settings-dracula.json` before installation):

```json
{
  "syntax_overrides": {
    "function": {
      "color": "#YOUR_COLOR"
    },
    "keyword": {
      "color": "#YOUR_COLOR",
      "font_weight": 700
    }
  }
}
```

### Available Syntax Elements

```json
"comment"           // Comments
"string"            // String literals
"number"            // Numbers
"boolean"           // true/false
"type"              // Class names, types
"variable"          // Variables
"function"          // Functions
"function.method"   // Methods
"keyword"           // Keywords (if, class, etc.)
"operator"          // Operators (+, -, =, etc.)
"constant"          // Constants
"property"          // Object properties
"constructor"       // Constructors
"tag"               // HTML/XML tags
"attribute"         // HTML attributes
"punctuation"       // Brackets, semicolons
```

### Font Style Options

```json
{
  "color": "#ff79c6",
  "font_weight": 700,      // Bold
  "font_style": "italic"   // Italic
}
```

---

## 💡 Tips

### For Maximum Readability (Dracula Pro)

1. **Increase line height** for comfort:
```json
{
  "buffer_line_height": {
    "custom": 1.5
  }
}
```

2. **Adjust font size** based on your screen:
```json
{
  "buffer_font_size": 14,  // Or 15, 16
  "ui_font_size": 16
}
```

3. **Use JetBrains Mono** (included) or **Fira Code** for ligatures

### For Dark Room Coding

Dracula Pro is specifically designed for low-light environments with reduced blue light.

### For Bright Room Coding

Consider switching to a light theme:
```json
{
  "theme": {
    "mode": "light",
    "light": "One Light"
  }
}
```

---

## 🔗 Resources

- [Dracula Theme Official](https://draculatheme.com/)
- [One Dark Theme](https://github.com/atom/atom/tree/master/packages/one-dark-syntax)
- [Zed Theme Documentation](https://zed.dev/docs/themes)
- [Color Accessibility](https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html)

---

## 🆘 Troubleshooting

### Colors Not Applying

1. Restart Zed completely
2. Check `syntax_overrides` is in the correct location
3. Ensure JSON is valid (no trailing commas)

### Theme Looks Wrong

1. Verify you copied the correct settings file
2. Check the `theme` setting matches your choice
3. Try switching themes in Zed: `Cmd/Ctrl + K, Cmd/Ctrl + T`

### Want to Reset

Copy the original settings file:
```bash
cd /path/to/zed-for-laravel
cp settings.json ~/.config/zed/settings.json  # Default
# or
cp settings-dracula.json ~/.config/zed/settings.json  # Dracula
```

---

**Need help?** Open an issue on [GitHub](https://github.com/croustibat/zed-for-laravel/issues)
