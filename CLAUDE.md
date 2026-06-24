# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A personal dotfiles repo managed with **GNU Stow**. Each top-level directory is a stow "package" whose internal layout mirrors `$HOME`. Stowing a package symlinks its contents into the home directory.

Packages: `nvim`, `zsh`, `tmux`, `ghostty`, `idea`.

## Stow model (read before editing/adding files)

- A package's directory tree replicates the path relative to `~`. Example: `nvim/.config/nvim/init.lua` symlinks to `~/.config/nvim/init.lua`; `zsh/.zshrc` → `~/.zshrc`; `tmux/.tmux.conf` → `~/.tmux.conf`.
- To apply a package: `stow <package>` (run from the repo root). To remove symlinks: `stow -D <package>`. To re-link after restructuring: `stow -R <package>`.
- When adding a new config file, place it at the in-package path matching its real `$HOME` location, not at the package root.
- Editing a stowed file via its `~` symlink edits the repo file directly (same inode) - there is no separate "deploy" step.

## Neovim (the largest package)

Lua config under `nvim/.config/nvim/`, loaded as the `cain` module:

- `init.lua` → `require "cain"` → `lua/cain/init.lua` loads `cain.set` (options), `cain.remap` (core keymaps), `cain.lazy` (plugin manager bootstrap).
- **Plugins use lazy.nvim.** `lua/cain/lazy.lua` imports every file under `lua/cain/plugins/` and `lua/cain/plugins/lsp/` - each file returns a lazy.nvim plugin spec table. To add a plugin, drop a new `.lua` file returning a spec into `plugins/`; no central registration needed.
- `lazy-lock.json` is the pinned plugin lockfile - commit changes to it after `:Lazy update`.
- LSP servers are declared in `lua/cain/plugins/lsp/` and `lua/cain/lsp_servers.lua`; installed via Mason.
- **Formatting** is via conform.nvim (`plugins/conform.lua`): `stylua` for Lua, `tofu fmt` for Terraform/HCL. Bound to `<leader>cf`. Note formatters shell out to `stylua` and `tofu` - they must be on PATH.

### Editing Lua style

Lua is formatted with stylua per `nvim/.config/nvim/.stylua.toml`: 4-space indent, double quotes, no call parentheses (`require "x"` not `require("x")`), 160 column width. Match this style and run stylua rather than hand-formatting.

## zsh

`zsh/.zshrc` uses **zinit** as the plugin manager (auto-clones itself on first run) and **Powerlevel10k** (config in `zsh/.p10k.zsh`). The instant-prompt block must stay at the top of `.zshrc`. Relies on Homebrew, Volta (node), and CLI tools `fzf`, `eza`, `zoxide`, `bat`.

## tmux

`tmux/.tmux.conf` uses **TPM** (Tmux Plugin Manager) and the catppuccin theme. Plugins are declared with `set -g @plugin` lines; install/update them in a running tmux with `prefix + I`.

## Prerequisites (per README)

Install before stowing: `stow`, `fzf`, `eza`, `zoxide`, `bat`. TPM and a Nerd Font (MesloLGS) are needed for tmux/p10k. Neovim additionally needs `node`/`npm`/`yarn`, `ripgrep`, `unzip`.
