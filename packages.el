;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el
;;
;; This file declares extra packages not included in Doom's modules.
;; After adding/removing packages here, run `doom sync` to install them.
;;
;; TIP: Use `package!' to declare packages.
;;      Use `unpin!' to use the latest version instead of Doom's pinned version.

;; ============================================================================
;; AI INTEGRATION
;; ============================================================================
;; `gptel` = Chat with Claude/ChatGPT directly inside Emacs
;; Opens a chat buffer where you can have conversations with AI models.
;; Can also send selected code regions to AI for explanation/refactoring.
(package! gptel)

;; ============================================================================
;; THEME
;; ============================================================================
(package! catppuccin-theme)
