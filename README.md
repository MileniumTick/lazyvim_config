# oc-2 LazyVim

Minimal LazyVim base, rebuilt into a more intentional daily-driver setup with an **Opencode-inspired `oc-2` visual language**.

## Goals

- Give the editor a recognizable identity instead of leaving stock defaults untouched.
- Improve everyday UX without bloating the setup.
- Treat **Ghostty as the main external terminal** and Neovim terminal buffers as a contextual companion.

## What changed

### Visual system

- Custom `oc-2` palette layered on top of `tokyonight`
- Cleaner floating windows, borders, bufferline, telescope, notifications and file tree
- Higher-contrast selections, search matches and cursorline cues

### Editor UX

- More intentional defaults for splits, scrolling, completion popups, listchars and statusline
- Better telescope / neo-tree / which-key ergonomics
- Sensible treesitter, mason and Lua LSP defaults for this config repo

### Terminal workflow

- **Ghostty stays primary** for long-lived shell work
- Integrated terminal is optimized for:
  - quick project shell access
  - one-off commands
  - contextual per-file directory shells
  - floating terminal scratch work

## Keymaps

### Core

- `<C-s>` — save
- `<leader>ur` — refresh UI, clear search highlights
- `<leader>fn` — new empty buffer

### Integrated terminal

- `<leader>tt` — bottom terminal in current file directory
- `<leader>tT` — bottom terminal at project root
- `<leader>tf` — floating terminal in current file directory
- `<leader>tF` — floating terminal at project root
- `<Esc><Esc>` in terminal — back to normal mode

### Ghostty

- `<leader>og` — open Ghostty in current file directory
- `<leader>oG` — open Ghostty at project root

## File layout

- `lua/config/options.lua` — editor defaults
- `lua/config/keymaps.lua` — daily workflow mappings
- `lua/config/autocmds.lua` — quality-of-life automation
- `lua/config/theme.lua` — `oc-2` palette + highlight overrides
- `lua/config/terminal.lua` — integrated terminal + Ghostty helpers
- `lua/plugins/ui.lua` — visual and interface tuning
- `lua/plugins/editor.lua` — treesitter, mason, LSP and picker tuning

## Notes

- This is still intentionally small: the goal is a polished LazyVim baseline, not a maximal plugin distro.
- If `ghostty` is not installed or not on `PATH`, Ghostty keymaps will warn instead of failing silently.
