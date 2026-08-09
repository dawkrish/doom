;;; init.el --- Doom Emacs Module Configuration -*- lexical-binding: t; -*-
;;
;; This file controls which Doom modules are enabled and what order they load in.
;; Each module is a bundle of packages + configuration for a specific feature.
;; Run `doom sync` after changing this file!
;;
;; TIP: Press 'SPC h d h' to access Doom's documentation.
;;      Press 'K' on a module name to view its docs.
;;      Press 'gd' on a module to browse its source code.

(doom! :input
       ;; No input methods needed — add `chinese`, `japanese`, etc. if needed

       :completion
       ;; `company` = auto-completion popup as you type (like VS Code intellisense)
       ;; `corfu` is a newer alternative — using it here for better integration with eglot
       (corfu +orderless +icons)
       ;; `vertico` = fuzzy search for files, commands, buffers, etc.
       ;; Think of it like Ctrl+P / Cmd+P in VS Code — press SPC to start
       (vertico +icons)

       :ui
       ;; `doom` = the Doom look: theme engine, modeline style, etc.
       doom
       ;; `dashboard` = startup screen with recent files and shortcuts
       dashboard
       ;; `doom-quit` = fun quit messages when you try to leave Emacs
       doom-quit
       ;; `emoji` = emoji picker and unicode support (SPC i e)
       (emoji +unicode)
       ;; `hl-todo` = highlight TODO/FIXME/HACK/NOTE keywords in comments
       hl-todo
       ;; `indent-guides` = show vertical lines at indent levels (like VS Code)
       indent-guides
       ;; `ligatures` = display font ligatures (e.g., -> becomes →) if your font supports them
       ;; DISABLED: can cause input lag on macOS — re-enable if you have a ligature font
       ;; ligatures
       ;; `modeline` = the status bar at the bottom (shows file, git branch, errors, etc.)
       modeline
       ;; `ophints` = briefly flash the region you just operated on (yank, paste, etc.)
       ophints
       ;; `popup` = smart popup window management (help, compilation, etc.)
       (popup +defaults)
       ;; `treemacs` = sidebar file explorer (like VS Code's explorer panel)
       ;; Toggle with SPC o p
       treemacs
       ;; `vc-gutter` = show git diff markers in the left gutter (+/~/-)
       (vc-gutter +pretty)
       ;; `vi-tilde-fringe` = show ~ on empty lines beyond end of file (like Vim)
       vi-tilde-fringe
       ;; `window-select` = quickly jump between windows (SPC w w)
       window-select
       ;; `workspaces` = tab-like workspaces per project (SPC TAB)
       workspaces

       :editor
       ;; `evil` = Vim keybindings everywhere — this is your core editing experience
       ;; +everywhere makes evil work in all buffers including help, magit, etc.
       (evil +everywhere)
       ;; `file-templates` = auto-insert boilerplate when creating new files
       file-templates
       ;; `fold` = code folding with za (toggle), zc (close), zo (open)
       fold
       ;; `format` = auto-format code on save using language-specific formatters
       (format +onsave)
       ;; `snippets` = expand abbreviations into code templates (e.g., fn<TAB>)
       snippets
       ;; `whitespace` = auto-detect indent style, trim trailing whitespace on save
       (whitespace +guess +trim)
       ;; `word-wrap` = soft wrap long lines with language-aware indentation
       word-wrap

       :emacs
       ;; `dired` = built-in file manager — navigate your filesystem like a buffer
       ;; +icons adds file type icons
       (dired +icons)
       ;; `electric` = auto-close brackets, auto-indent, smart delimiters
       electric
       ;; `tramp` = edit remote files over SSH as if they were local
       tramp
       ;; `undo` = persistent undo history (survives Emacs restart)
       ;; +tree gives you a visual undo tree (SPC o u or C-x u)
       (undo +tree)
       ;; `vc` = base version control integration (foundation for magit)
       vc

       :term
       ;; `vterm` = full terminal emulator inside Emacs
       ;; Open with SPC o t — this is where you'll run Claude Code, builds, etc.
       ;; Vim bindings work here: press ESC to enter normal mode in the terminal
       vterm

       :checkers
       ;; `syntax` = real-time error/warning checking (squiggly underlines)
       ;; Works with eglot to show LSP diagnostics
       syntax
       ;; `spell` = spell checking in comments, strings, org, markdown
       (spell +flyspell)

       :tools
       ;; `direnv` = auto-load .envrc environment variables per-project
       direnv
       ;; `editorconfig` = respect .editorconfig files for indent style, tab width, etc.
       editorconfig
       ;; `eval` = run code and see results inline (SPC c e)
       (eval +overlay)
       ;; `lookup` = jump to definition (gd), references (gr), documentation (K)
       ;; +dictionary for word definitions, +docsets for Dash.app offline docs
       (lookup +dictionary +docsets)
       ;; `lsp` = Language Server Protocol for IDE features
       ;; +eglot uses the built-in eglot client (lighter/faster than lsp-mode)
       ;; This gives you: completions, go-to-definition, find references,
       ;; rename symbol, code actions, hover docs, etc.
       (lsp +eglot)
       ;; `magit` = the best Git interface — open with SPC g g
       ;; +forge adds GitHub/GitLab integration (PRs, issues, code review)
       ;; Open forge with SPC g ' or @ in magit status buffer
       (magit +forge)
       ;; `pdf` = view PDFs inside Emacs with annotations
       pdf
       ;; `rgb` = preview hex colors inline (#ff0000 shows red background)
       rgb
       ;; `tree-sitter` = fast incremental parsing for better syntax highlighting
       ;; Emacs 30+ has built-in treesit support; Doom's module handles grammar install
       tree-sitter

       :os
       ;; macOS-specific tweaks (clipboard integration, modifier keys, etc.)
       (:if (featurep :system 'macos) macos)

       :lang
       ;; --- Languages you work with ---

       ;; `clojure` = Clojure/ClojureScript development
       ;; +lsp enables clojure-lsp for IDE features
       ;; +tree-sitter for syntax highlighting
       ;; CIDER (the Clojure REPL) is included automatically — it's the heart of
       ;; Clojure development in Emacs. You evaluate code directly in your editor.
       (clojure +lsp +tree-sitter)

       ;; `emacs-lisp` = for editing your Doom config and Emacs packages
       emacs-lisp

       ;; `go` = Go development
       ;; +lsp enables gopls (Go language server) for completions, diagnostics, etc.
       ;; +tree-sitter for fast, accurate syntax highlighting
       ;; Make sure `gopls` is installed: go install golang.org/x/tools/gopls@latest
       (go +lsp +tree-sitter)

       ;; `haskell` = Haskell development
       ;; +lsp enables HLS (Haskell Language Server) — install via ghcup
       ;; +tree-sitter for syntax highlighting
       (haskell +lsp +tree-sitter)

       ;; `javascript` = JavaScript and TypeScript
       ;; +lsp enables typescript-language-server for both JS and TS
       ;; +tree-sitter for syntax highlighting
       ;; Install LSP: npm i -g typescript-language-server typescript
       (javascript +lsp +tree-sitter)

       ;; `json` = JSON editing with validation
       ;; +lsp enables vscode-json-languageserver
       ;; +tree-sitter for syntax highlighting
       (json +lsp +tree-sitter)

       ;; `markdown` = Markdown editing with preview (SPC m p)
       markdown

       ;; `org` = Org mode — notes, TODOs, agenda, and much more
       ;; Your org files live in ~/org/ (configurable in config.el)
       ;; Start simple: create a file.org, use * for headings, - for lists
       ;; SPC m t = toggle TODO, SPC m d = set deadline, SPC o a = agenda view
       (org +tree-sitter)

       ;; `rust` = Rust development
       ;; +lsp enables rust-analyzer for completions, diagnostics, etc.
       ;; +tree-sitter for syntax highlighting
       ;; Make sure rust-analyzer is installed: rustup component add rust-analyzer
       (rust +lsp +tree-sitter)

       ;; `sh` = Shell scripts (bash, zsh, fish)
       ;; +lsp enables bash-language-server
       ;; +tree-sitter for syntax highlighting
       (sh +lsp +tree-sitter)

       ;; `web` = HTML/CSS/templating
       ;; +lsp enables vscode-html-languageserver and css-languageserver
       ;; +tree-sitter for syntax highlighting
       (web +lsp +tree-sitter)

       ;; `yaml` = YAML editing with schema validation
       ;; +lsp enables yaml-language-server
       ;; +tree-sitter for syntax highlighting
       (yaml +lsp +tree-sitter)

       ;; `elm` = Elm development
       ;; +lsp enables elm-language-server
       ;; +tree-sitter for syntax highlighting
       ;; Install LSP: npm i -g @elm-tooling/elm-language-server
       (elm +lsp +tree-sitter)

       ;; `data` = support for CSV, TSV, and other data formats
       data

       :config
       ;; Doom's sensible defaults + SPC-leader keybindings + auto-matching parens
       (default +bindings +smartparens))
