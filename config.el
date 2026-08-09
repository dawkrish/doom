;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;;
;; This is your personal configuration file. Unlike init.el, you do NOT need
;; to run `doom sync` after changing this file — just restart Emacs or
;; press SPC h r r (doom/reload).
;;
;; TIP: Use `after!' to configure packages after they load.
;;      Use `map!' to define custom keybindings.
;;      Use `setq' to set variables.

;; ============================================================================
;; IDENTITY
;; ============================================================================
;; Used by GPG, email clients, git forge, and file templates
(setq user-full-name "Krishnansh Agarwal"
      user-mail-address "krishnansh710@gmail.com")

;; ============================================================================
;; FONTS
;; ============================================================================
;; `doom-font` = your main coding font (monospace)
;; `doom-variable-pitch-font` = used in org-mode prose, markdown, etc.
;; `doom-big-font` = for presentations/streaming (toggle with SPC t b)
;;
;; TIP: Run M-x describe-font to see available fonts on your system
;;      Run M-x doom/reload-font after changes
(setq doom-font (font-spec :family "PT Mono" :size 16 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "PT Mono" :size 17))

;; ============================================================================
;; THEME & APPEARANCE
;; ============================================================================
;; Catppuccin theme — flavors: 'latte (light), 'frappe, 'macchiato, 'mocha (darkest)
(setq doom-theme 'catppuccin)
(setq catppuccin-flavor 'macchiato)

;; Line numbers: t = absolute, 'relative = vim-style relative, nil = off
;; Relative line numbers are great with evil — use 5j to jump 5 lines down
(setq display-line-numbers-type 'relative)

;; Start Emacs fullscreen
(add-hook 'window-setup-hook #'toggle-frame-fullscreen t)

;; ============================================================================
;; ORG MODE
;; ============================================================================
;; Where your org files live — create this directory if it doesn't exist
;; Org is a powerful plain-text system for notes, TODOs, and more.
;;
;; Quick start:
;;   1. Create ~/org/todo.org
;;   2. Use * for headings (** for sub-headings)
;;   3. Type TODO before a heading to make it a task: * TODO Buy groceries
;;   4. SPC m t = cycle TODO states (TODO -> DONE)
;;   5. SPC o a = open agenda (shows your scheduled tasks)
;;   6. SPC m d = add a deadline or schedule date
(setq org-directory "~/org/")

;; ============================================================================
;; EGLOT (LSP)
;; ============================================================================
;; Eglot is the built-in LSP client. It connects to language servers to give
;; you IDE features: completions, diagnostics, go-to-definition, etc.
;;
;; Key bindings (in any code buffer with LSP active):
;;   gd        = go to definition
;;   gr        = find references
;;   K         = show hover documentation
;;   SPC c a   = code actions (quick fixes, refactors)
;;   SPC c r   = rename symbol across project
;;   SPC c f   = format buffer

;; Don't spam the minibuffer with LSP progress messages
(after! eglot
  (setq eglot-events-buffer-config '(:size 0))
  ;; Disable eglot logging for performance (enable for debugging LSP issues)
  ;; To debug: set size to 2000000 and check *EGLOT events* buffer
  )

;; ============================================================================
;; MAGIT & FORGE
;; ============================================================================
;; Magit is a Git porcelain — the best way to use Git.
;;
;; Key bindings:
;;   SPC g g   = open magit status (your main Git dashboard)
;;   SPC g b   = blame current file
;;   SPC g l   = git log
;;
;; In magit status buffer:
;;   s         = stage file/hunk
;;   u         = unstage
;;   c c       = commit (write message, then C-c C-c to confirm)
;;   P p       = push
;;   F p       = pull
;;   b c       = create branch
;;   b b       = switch branch
;;
;; Forge (GitHub/GitLab integration):
;;   @ or '    = open forge menu in magit
;;   SPC g '   = forge dispatch
;;   You need a GitHub token: create one at github.com/settings/tokens
;;   Then add to ~/.authinfo: machine api.github.com login YOUR_USERNAME^forge password YOUR_TOKEN

;; ============================================================================
;; VTERM (TERMINAL)
;; ============================================================================
;; Full terminal emulator inside Emacs — great for running Claude Code.
;;
;; Key bindings:
;;   SPC o t   = open vterm in current project
;;   SPC o T   = open vterm in current directory
;;
;; Inside vterm:
;;   Press ESC or C-\ to toggle between terminal insert and evil normal mode
;;   In normal mode, you can use vim motions to scroll/copy text
;;   Press i or a to go back to terminal insert mode
(after! vterm
  ;; Increase scrollback buffer (default is 1000 lines)
  (setq vterm-max-scrollback 10000)
  ;; Set shell to zsh
  (setq vterm-shell "/bin/zsh"))

;; ============================================================================
;; TREEMACS (FILE EXPLORER)
;; ============================================================================
;; Sidebar file tree like VS Code's explorer.
;;
;; Key bindings:
;;   SPC o p   = toggle treemacs sidebar
;;   SPC o P   = focus treemacs (if already open)
;;
;; Inside treemacs:
;;   RET       = open file
;;   o         = open file in other window
;;   cf        = create file
;;   cd        = create directory
;;   R         = rename
;;   d         = delete
;;   q         = quit treemacs

;; ============================================================================
;; TREE-SITTER
;; ============================================================================
;; Tree-sitter provides fast, accurate syntax highlighting and code navigation.
;; Your Emacs 31 was compiled with tree-sitter support.
;; Doom auto-installs grammar files for enabled languages.

;; ============================================================================
;; AI INTEGRATION (gptel)
;; ============================================================================
;; gptel lets you chat with Claude/ChatGPT directly inside Emacs.
;; Configure it in config.el after installing (see packages.el).
;;
;; Key bindings (defined below):
;;   SPC a a   = open gptel chat buffer
;;   SPC a s   = send region/buffer to AI
;;   SPC a m   = select AI model
;;
;; Usage:
;;   1. SPC a a opens a chat buffer — type your question and press C-c RET to send
;;   2. Select code, then SPC a s to send it with a prompt
;;   3. Responses stream in real-time

(after! gptel
  ;; Set Claude as the default backend
  ;; You need an API key: export ANTHROPIC_API_KEY="sk-..." in your shell
  ;; Or set it here (not recommended for security):
  ;; (setq gptel-api-key "sk-...")
  (setq gptel-model 'claude-sonnet-5-20250601
        gptel-backend (gptel-make-anthropic "Claude"
                        :stream t
                        :models '(claude-sonnet-5-20250601
                                  claude-opus-5-20250601
                                  claude-haiku-4-5-20251001))))

;; Keybindings for AI under SPC a (for "ai")
(map! :leader
      :desc "AI" "a" nil  ; create the prefix
      (:prefix ("a" . "ai")
       :desc "Open AI chat"      "a" #'gptel
       :desc "Send to AI"        "s" #'gptel-send
       :desc "Select AI model"   "m" #'gptel-menu
       :desc "Abort AI request"  "x" #'gptel-abort))

;; ============================================================================
;; GENERAL EDITOR SETTINGS
;; ============================================================================

;; Auto-save files when switching buffers or losing focus
(setq auto-save-default t)

;; Scroll smoothly instead of jumping half-page
(setq scroll-margin 5
      scroll-conservatively 101)

;; Show matching parentheses instantly
(setq show-paren-delay 0)

;; Increase undo limit (default is quite low)
(setq undo-limit 80000000
      undo-strong-limit 120000000
      undo-outer-limit 360000000)

;; Which-key popup delay — shows available keys after pressing a prefix
;; Lower = faster popup. Default is 1 second.
(setq which-key-idle-delay 0.3)

;; ============================================================================
;; QUICK REFERENCE CARD
;; ============================================================================
;; SPC = leader key (the starting point for most commands)
;; SPC SPC = find file in project (like Cmd+P)
;; SPC .   = find file from current directory
;; SPC ,   = switch buffer
;; SPC /   = search in project (ripgrep)
;; SPC :   = execute command (M-x)
;;
;; SPC f   = file commands (save, recent, etc.)
;; SPC b   = buffer commands (kill, switch, etc.)
;; SPC w   = window commands (split, close, move)
;; SPC p   = project commands (switch project, etc.)
;; SPC g   = git commands (magit, blame, etc.)
;; SPC c   = code commands (LSP actions, format, etc.)
;; SPC o   = open commands (vterm, treemacs, etc.)
;; SPC h   = help commands (describe function, variable, key, etc.)
;; SPC t   = toggle commands (line numbers, theme, etc.)
;; SPC a   = AI commands (gptel chat, send, model select)
;;
;; In evil normal mode:
;;   gd = go to definition
;;   gr = find references
;;   K  = hover docs
;;   gcc = comment/uncomment line
;;   gc = comment/uncomment selection (in visual mode)
