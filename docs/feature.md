# Features Overview

Zed for Laravel comes packed with features designed to make Laravel development faster and more enjoyable.

## 🎨 Automatic Code Formatting

### Laravel Pint Integration

Laravel Pint is configured to format your code automatically on save, ensuring consistent code style across your project.

**How it works:**
- Every time you save a PHP file, Pint formats it automatically
- Uses your project's `pint.json` configuration (if it exists)
- Falls back to Laravel's default style if no config is found

**Manual formatting:**
- Keyboard: `Cmd/Ctrl + Shift + I`
- Command Palette: "Format Document"
- Task Runner: "Pint Format (All)" or "Pint Format (Dirty)"

**Configuration in `settings.json`:**
```json
"formatter": {
  "external": {
    "command": "bash",
    "arguments": [
      "-c",
      "cat > {buffer_path} && ./vendor/bin/pint --quiet {buffer_path} && cat {buffer_path}"
    ]
  }
}
```

## 📝 Code Snippets

### PHP Snippets (50+)

Type the prefix and press `Tab` to expand:

#### Laravel Core

- **`route`** → Route definition
  ```php
  Route::get('uri', [Controller::class, 'method'])->name('name');
  ```

- **`routepost`** → POST Route
  ```php
  Route::post('uri', [Controller::class, 'method'])->name('name');
  ```

- **`routeres`** → Resource Route
  ```php
  Route::resource('uri', Controller::class);
  ```

#### Classes

- **`controller`** → Full Controller class
  ```php
  <?php

  namespace App\Http\Controllers;

  use Illuminate\Http\Request;

  class ControllerName extends Controller
  {
      public function index()
      {
          //
      }
  }
  ```

- **`model`** → Eloquent Model with HasFactory
- **`migration`** → Database migration
- **`factory`** → Model factory
- **`test`** → PHPUnit test class
- **`request`** → Form Request validation
- **`provider`** → Service Provider
- **`job`** → Queued Job
- **`event`** → Event class
- **`listener`** → Event Listener
- **`middleware`** → Middleware class
- **`seeder`** → Database Seeder
- **`policy`** → Authorization Policy

#### Eloquent Relationships

- **`hasMany`** → One-to-many relationship
- **`belongsTo`** → Inverse one-to-many
- **`belongsToMany`** → Many-to-many relationship
- **`hasOne`** → One-to-one relationship

### Blade Snippets (40+)

#### Control Structures

- **`@if`** → If statement
  ```blade
  @if (condition)
      // content
  @endif
  ```

- **`@foreach`** → Foreach loop
  ```blade
  @foreach ($items as $item)
      // content
  @endforeach
  ```

- **`@forelse`** → Forelse loop with empty state
- **`@switch`** → Switch statement

#### Templates

- **`@extends`** → Extend layout
  ```blade
  @extends('layouts.app')
  ```

- **`@section`** → Define section
  ```blade
  @section('name')
      // content
  @endsection
  ```

- **`@yield`** → Yield content
- **`@include`** → Include partial view
- **`component`** → Blade component
- **`slot`** → Named slot

#### Authentication & Authorization

- **`@auth`** → Authenticated user check
- **`@guest`** → Guest user check
- **`@can`** → Authorization check

#### Forms

- **`@csrf`** → CSRF token field
- **`@method`** → HTTP method spoofing
- **`@error`** → Display validation error

#### Helpers

- **`old`** → Retrieve old input
- **`asset`** → Generate asset URL
- **`route`** → Generate route URL
- **`url`** → Generate URL

### Livewire 3 Snippets (30+)

#### Component Structure

- **`livewire-component`** → Full Livewire component class
  ```php
  <?php

  namespace App\Livewire;

  use Livewire\Component;

  class ComponentName extends Component
  {
      public $property;

      public function mount()
      {
          //
      }

      public function render()
      {
          return view('livewire.component-name');
      }
  }
  ```

- **`livewire-property`** → Public property
- **`livewire-validate`** → Property with #[Validate] attribute
  ```php
  #[Validate('required|string|max:255')]
  public string $propertyName = '';
  ```

#### Lifecycle Hooks

- **`livewire-mount`** → Mount hook
- **`livewire-updated`** → Updated hook

#### Actions & Events

- **`livewire-action`** → Action method
- **`livewire-dispatch`** → Dispatch event
  ```php
  $this->dispatch('event-name', ['key' => 'value']);
  ```

- **`livewire-on`** → Event listener with #[On] attribute
  ```php
  #[On('event-name')]
  public function handleEvent($parameter)
  {
      //
  }
  ```

#### Advanced Features

- **`livewire-computed`** → Computed property with #[Computed]
- **`livewire-lazy`** → Lazy loading component
- **`livewire-pagination`** → Component with pagination
- **`livewire-upload`** → File upload handling
- **`livewire-form`** → Form object

#### Wire Directives

- **`wire:model`** → Two-way data binding
- **`wire:click`** → Click event handler
- **`wire:submit`** → Form submission
- **`wire:loading`** → Loading indicator
- **`wire:poll`** → Polling directive
- **`wire:navigate`** → SPA-like navigation

## ⚡ Artisan Tasks

Pre-configured tasks accessible via `Cmd/Ctrl + Shift + T`:

### Development

- **Artisan Serve** - Start development server on port 8000
- **Artisan Tinker** - Open interactive REPL

### Database

- **Artisan Migrate** - Run pending migrations
- **Artisan Migrate Fresh** - Drop all tables and re-run migrations with seeders
- **Artisan Migrate Rollback** - Rollback last migration

### Code Generation

- **Artisan Make Controller** - Create a new controller
- **Artisan Make Model** - Create a new model with migration and factory

### Information

- **Artisan Route List** - Display all registered routes
- **Artisan Queue Work** - Start processing queue jobs

### Formatting & Testing

- **Pint Format (All)** - Format all PHP files
- **Pint Format (Dirty)** - Format only modified files
- **Pint Test** - Test formatting without applying changes
- **PHPUnit (All Tests)** - Run entire test suite
- **PHPUnit (Current File)** - Run tests in current file
- **PHPUnit (Parallel)** - Run tests in parallel
- **PHPUnit (Coverage)** - Generate code coverage report
- **Pest (All Tests)** - Run Pest tests

### Frontend

- **NPM Dev** - Start Vite development server
- **NPM Build** - Build assets for production
- **NPM Install** - Install npm dependencies

### Dependencies

- **Composer Install** - Install PHP dependencies
- **Composer Update** - Update PHP dependencies
- **Composer Dump Autoload** - Regenerate autoload files

### Cache Management

- **Artisan Cache Clear** - Clear all caches (config, routes, views)

## ⌨️ Keyboard Shortcuts

### Workspace

| Shortcut | Action |
|----------|--------|
| `Cmd/Ctrl + Shift + P` | Open command palette |
| `Cmd/Ctrl + B` | Toggle sidebar |
| `Cmd/Ctrl + Shift + E` | Focus project explorer |
| `Cmd/Ctrl + T` | Toggle terminal |
| `Cmd/Ctrl + Shift + T` | Run task |
| `Cmd/Ctrl + K, Cmd/Ctrl + S` | Save all files |

### Editor

| Shortcut | Action |
|----------|--------|
| `Cmd/Ctrl + Shift + I` | Format document |
| `Cmd/Ctrl + D` | Select next occurrence |
| `Cmd/Ctrl + Shift + L` | Select all occurrences |
| `Cmd/Ctrl + /` | Toggle line comment |
| `Cmd/Ctrl + Shift + D` | Duplicate line |
| `Cmd/Ctrl + Shift + K` | Delete line |
| `Alt + Up/Down` | Move line up/down |
| `Cmd/Ctrl + Shift + F` | Global search |
| `Cmd/Ctrl + P` | Quick file open |
| `Cmd/Ctrl + Shift + O` | Go to symbol |

### Project Panel

| Shortcut | Action |
|----------|--------|
| `A` | New file |
| `Shift + A` | New directory |
| `R` | Rename |
| `Delete/Backspace` | Delete |
| `Cmd/Ctrl + C` | Copy |
| `Cmd/Ctrl + X` | Cut |
| `Cmd/Ctrl + V` | Paste |

## 🔧 LSP Configuration

PHP language server (Intelephense) is pre-configured with:

- **PHP 8.2+ stubs** for accurate autocompletion
- **Blade file support** (`.blade.php`)
- **All common PHP extensions** (MySQLi, PDO, Redis, etc.)
- **Laravel-specific autocompletion**

## 📦 Git Integration

- **Git gutter** - See added, modified, and deleted lines
- **Inline blame** - View commit information inline (600ms delay)
- **Git status in tabs** - Visual indicators for file status

## 🎯 Additional Features

### File Type Associations

- **Blade files** (`.blade.php`) recognized automatically
- **Dockerfiles** with any extension

### Terminal Configuration

- Uses Zsh by default on macOS/Linux
- Working directory set to current project
- JetBrains Mono font for consistency

### UI Preferences

- **Tab size**: 4 spaces for PHP, 2 for JS/CSS/JSON
- **Soft wrap** at editor width
- **Trim trailing whitespace** on save
- **Ensure final newline** on save
- **Show whitespace** in selections only

## Next Steps

- Learn how to [customize the configuration](configuration.md)
- Check the [installation guide](installation.md) if you haven't installed yet
