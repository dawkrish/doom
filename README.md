# Doom Emacs Config

My personal Doom Emacs setup. Catppuccin macchiato theme, evil mode, eglot LSP, and a bunch of languages I use day to day.

## Before you start

If you have an existing vim/neovim config, back it up:

```bash
mv ~/.vimrc ~/.vimrc.bak
mv ~/.vim ~/.vim.bak
mv ~/.config/nvim ~/.config/nvim.bak
```

Doom uses evil mode (vim keybindings) so your muscle memory carries over. But the config format is completely different, so don't try to port your old vimrc line by line. Start fresh, add things as you miss them.

## Prerequisites

- Emacs 30+ (macOS: `brew install --cask emacs` or emacs-plus)
- [Doom Emacs](https://github.com/doomemacs/doomemacs) installed
- ripgrep, fd (`brew install ripgrep fd`)
- direnv (`brew install direnv`)
- PT Mono font (or change `doom-font` in config.el)

## Install

```bash
git clone https://github.com/dawkrish/doom ~/.config/doom
doom sync
```

Restart Emacs.

## What's in here

**Languages:** Clojure, Go, Rust, Haskell, JavaScript/TypeScript, Elm, YAML, JSON, Web (HTML/CSS), Shell

**Notable modules:** corfu (completion), vertico (fuzzy search), magit + forge (git/GitHub), gptel (Claude AI chat), tree-sitter, format-on-save

**Theme:** Catppuccin Macchiato

## AI (gptel)

Uses Claude via the Anthropic API. Set your key:

```bash
export ANTHROPIC_API_KEY="sk-ant-..."
```

Then `SPC a a` to chat, `SPC a s` to send selected code.

## Language servers

Each language needs its LSP server installed separately:

```bash
# Go
go install golang.org/x/tools/gopls@latest

# Rust
rustup component add rust-analyzer

# JavaScript/TypeScript
npm i -g typescript-language-server typescript

# Clojure
brew install clojure-lsp/brew/clojure-lsp-native

# Web
npm i -g stylelint js-beautify
```

## Key bindings I use most

```
SPC SPC   find file in project
SPC /     search project (ripgrep)
SPC g g   magit status
SPC o t   terminal (vterm)
SPC c a   code actions
SPC a a   AI chat
gd        go to definition
gr        find references
K         hover docs
```
