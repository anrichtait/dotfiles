;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; general settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq user-full-name "Anrich Tait")
(setq user-mail-address "anrichjtait@gmail.com")
(setq doom-font (font-spec :family "Iosevka SS04" :size 14 :weight 'semi-light))
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq c-basic-offset 4)
(setq doom-theme 'doom-acario-light)
(setq display-line-numbers-type `relative)
(setq truncate-string-ellipsis "…")
(setq scroll-margin 10)
(setq confirm-kill-emacs nil)
(setq doom-modeline-enable-word-count t)
(setq undo-limit 80000000)
(setq evil-want-fine-undo t) ; Smaller undo steps
(setq-default history-length 1000)
(setq-default prescient-history-length 1000)
;;(setq projectile-project-search-path '("~/Documents/" "~/Projects/"))

;; vterm
(after! vterm (setq vterm-shell "/sbin/zsh"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; general keybinds
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun open-notes-directory ()
  "Open notes directory in dired."
  (interactive)
  (dired "~/Projects/cloudnotes/cs/"))

(map! :leader
      :desc "Open notes directory"
      "n d" #'open-notes-directory)
(map! :leader
      :prefix "r"
      :desc "Run async shell command"
      "t" #'async-shell-command)
(map! :leader
      :prefix "f"
      :desc "Create a new file called FILE"
      "n" #'dired-create-empty-file)

(define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(setq-default evil-cross-lines t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; fast line jump
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(map! :leader
      :prefix "j"
      :desc "Avy goto line"
      "l" #'avy-goto-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; find n replace (on steroids!)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package! visual-regexp-steroids
  :defer 3
  :config
  (require 'pcre2el)
  (setq vr/engine 'pcre2el)
  (map! "C-c s r" #'vr/replace)
  (map! "C-c s q" #'vr/query-replace))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; dashboard
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq fancy-splash-image (concat doom-private-dir "splash/emacs-logo.png"))
(setq +doom-dashboard-menu-sections
      '(("Recently opened files"
         :icon (nerd-icons-faicon "nf-fa-file_text" :face 'doom-dashboard-menu-title)
         :action recentf-open-files)
        ("Reload last session"
         :icon (nerd-icons-octicon "nf-oct-history" :face 'doom-dashboard-menu-title)
         :when (cond ((modulep! :ui workspaces)
                      (file-exists-p (expand-file-name persp-auto-save-fname persp-save-dir)))
                     ((require 'desktop nil t)
                      (file-exists-p (desktop-full-file-name))))
         :action doom/quickload-session)
        ("Open org-agenda"
         :icon (nerd-icons-octicon "nf-oct-calendar" :face 'doom-dashboard-menu-title)
         :when (fboundp 'org-agenda)
         :action org-agenda)
        ("Open project"
         :icon (nerd-icons-octicon "nf-oct-briefcase" :face 'doom-dashboard-menu-title)
         :action projectile-switch-project)
        ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; jump to matching parens
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(after! smartparens
  (defun zz/goto-match-paren (arg)
    "Go to the matching paren/bracket, otherwise (or if ARG is not
    nil) insert %.  vi style of % jumping to matching brace."
    (interactive "p")
    (if (not (memq last-command '(set-mark
                                  cua-set-mark
                                  zz/goto-match-paren
                                  down-list
                                  up-list
                                  end-of-defun
                                  beginning-of-defun
                                  backward-sexp
                                  forward-sexp
                                  backward-up-list
                                  forward-paragraph
                                  backward-paragraph
                                  end-of-buffer
                                  beginning-of-buffer
                                  backward-word
                                  forward-word
                                  mwheel-scroll
                                  backward-word
                                  forward-word
                                  mouse-start-secondary
                                  mouse-yank-secondary
                                  mouse-secondary-save-then-kill
                                  move-end-of-line
                                  move-beginning-of-line
                                  backward-char
                                  forward-char
                                  scroll-up
                                  scroll-down
                                  scroll-left
                                  scroll-right
                                  mouse-set-point
                                  next-buffer
                                  previous-buffer
                                  previous-line
                                  next-line
                                  back-to-indentation
                                  doom/backward-to-bol-or-indent
                                  doom/forward-to-last-non-comment-or-eol
                                  )))
        (self-insert-command (or arg 1))
      (cond ((looking-at "\\s\(") (sp-forward-sexp) (backward-char 1))
            ((looking-at "\\s\)") (forward-char 1) (sp-backward-sexp))
            (t (self-insert-command (or arg 1))))))
  (map! "%" 'zz/goto-match-paren))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; seperators
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-lisp-separator ()
  "Insert a separator line of semicolons matching the current window width."
  (interactive)
  (let ((sep (make-string (window-width) ?\;)))
    (insert sep)))

(map! :leader
      :desc "Insert lisp separator"
      "l l" #'my-lisp-separator)

(defun my-cpp-separator ()
  "Insert a C++ style separator line in the current buffer.
The line will begin with ‘// ’ followed by enough ‘=’ characters to fill the window width."
  (interactive)
  (let* ((width (window-width))
         (sep (concat "// " (make-string (max 0 (- width 3)) ?=))))
    (insert sep "\n")))

(map! :leader
      :desc "Insert C++ separator"
      "l c" #'my-cpp-separator)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; shader syntax highlighting
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq auto-mode-alist
      (append '(("\\.any$"  . c++-mode)
                ("\\.vrt$"  . c++-mode)
                ("\\.pix$"  . c++-mode)
                ("\\.geo$"  . c++-mode)
                ("\\.glsl$" . c++-mode))
              auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Projectile
;;
;; Always create a new (or matching existing) project when switching to a project.
;; Ignore the package repositories cloned by straight.el. Having a lot of projects seem to slow down Emacs.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq projectile-ignored-projects '("~/" "/tmp" "~/.emacs.d/.local/straight/repos/"))
(defun projectile-ignored-project-function (filepath)
  "Return t if FILEPATH is within any of `projectile-ignored-projects'"
  (or (mapcar (lambda (p) (s-starts-with-p p filepath)) projectile-ignored-projects)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; completion
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package! company-box
  :hook (company-mode . company-box-mode))

(after! company
  (map! :map company-active-map
        "<tab>" nil    ;; Remove tab
        "<return>" nil ;; Remove enter
        "C-y" #'company-complete-selection))
(after! company
  (setq company-idle-delay 0.1)) ;; Default is 0.2 or higher, lower is faster


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; orgmode related
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; where our org notes are stored, i use one main directory to easily back these notes up to github.
(setq org-directory "~/Projects/cloudnotes/cs/")
(setq org-agenda-files (directory-files-recursively "~/Projects/cloudnotes/cs/" "\\.org$"))
(defun custom/gtd-file (filename)
  (let ((gtd-directory (concat (file-name-as-directory org-directory) "gtd/")))
    (concat gtd-directory filename)))
(setq org-hide-emphasis-markers 't)

(custom-set-faces
 '(org-document-title ((t (:height 1.6 :weight bold))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.3 :spacing 2))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.3 :spacing 2))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.3))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.2))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.2))))
 '(org-level-6 ((t (:inherit outline-5 :height 1.2))))
 '(org-level-7 ((t (:inherit outline-5 :height 1.2)))))

;; Evil keybinds to move headings up or down (unchanged)
(after! org
  (map! :map org-mode-map
        :n "M-j" #'org-metadown
        :n "M-k" #'org-metaup
        ))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-bullets-bullet-list '("⁖"))
(setq org-ellipsis " ▾ ")

(after! org
  (setq org-log-into-drawer "LOGBOOK"))

;; -------------------------
;; TODO STATES & TAGS
;; -------------------------
(after! org
  (setq org-todo-keywords
        '((sequence "TODO(t!)" "NEXT(n!)" "WAIT(w@!)" "|" "DONE(d!)")
          (sequence "RESEARCH(r!)" "|" "DONE(d!)")
          (sequence "READ-Later(R!)" "|" "DONE(d!)")))

  ;; Tags configuration for easier filtering
  (setq org-tag-alist
        '(("idea" . ?i)
          ("review" . ?r)
          ("security+" . ?s)
          ("@cs" . ?c)
          ("@life" . ?l)))

  ;; Configure appearance of TODO states
  (setq org-todo-keyword-faces
        '(("TODO" . (:foreground "#bd93f9" :weight bold))
         ("NEXT" . (:foreground "#8be9fd" :weight bold))
         ("WAIT" . (:foreground "#ff79c6" :weight bold))
         ("RESEARCH" . (:foreground "#f1fa8c" :weight bold))
         ("READ-Later" . (:foreground "#50fa7b" :weight bold))
         ("DONE" . (:foreground "#6272a4" :weight bold)))))

;; Logging configuration
(after! org
  (setq org-log-done 'time          ;; Log the time at which items are closed
        org-log-reschedule 'note    ;; Prompt for a note when rescheduling an item
        org-agenda-log-mode-items '(clock closed)  ;; Shows log information in agenda view
        org-agenda-start-with-log-mode t))         ;; Starts the agenda with log mode enabled.

;; Capture templates with direct filing based on type
(setq org-capture-templates
      `(("t" "todo" entry (file ,(custom/gtd-file "tasks.org"))
         "* TODO %?\n:PROPERTIES:\n:CREATED: %U\n:END:")
        ("s" "scheduled" entry (file ,(custom/gtd-file "tasks.org"))
         "* TODO %?\n:PROPERTIES:\n:CREATED: %U\n:END:\nSCHEDULED: %^t")
        ("d" "deadline" entry (file ,(custom/gtd-file "tasks.org"))
         "* TODO %?\n:PROPERTIES:\n:CREATED: %U\n:END:\nDEADLINE: %^t")
        ("r" "research" entry (file ,(custom/gtd-file "study.org"))
         "* RESEARCH %?\n:PROPERTIES:\n:CREATED: %U\n:END:")
        ("R" "read later" entry (file ,(custom/gtd-file "readings.org"))
         "* READ-Later %?\n:PROPERTIES:\n:CREATED: %U\n:END:")))

;; Refiling configuration
(setq org-refile-use-outline-path 'file
      org-outline-path-complete-in-steps nil)
(setq org-refile-allow-creating-parent-nodes 'confirm)  ;; Allow creation of headings when refiling
(setq org-refile-targets '(("tasks.org" :level . 1)
                           ("study.org" :level . 1)
                           ("readings.org" :level . 1)))

;; Configure the simplified custom org agenda view
(after! org (setq org-agenda-custom-commands
                  '((" " "Agenda"
                     ((agenda ""
                              ((org-agenda-span 1)
                               (org-agenda-start-on-weekday nil)
                               (org-agenda-start-day "+0d")
                               (org-deadline-warning-days 365)))
                      ;; Regular tasks
                      (todo "TODO|NEXT"
                            ((org-agenda-overriding-header " Tasks")
                             (org-agenda-files (list
                                                (custom/gtd-file "tasks.org")))))
                      ;; Research items - specifically for Security+ study
                      (todo "RESEARCH"
                            ((org-agenda-overriding-header " Research")
                             (org-agenda-files (list
                                                (custom/gtd-file "study.org")))))
                      ;; Reading list
                      (todo "READ-Later"
                            ((org-agenda-overriding-header " Reading List")
                             (org-agenda-files (list
                                                (custom/gtd-file "readings.org")))))
                      ;; Blocked/waiting tasks
                      (todo "WAIT"
                            ((org-agenda-overriding-header " Blocked Tasks")
                             (org-agenda-files (list
                                                (custom/gtd-file "tasks.org")
                                                (custom/gtd-file "study.org")
                                                (custom/gtd-file "readings.org")))
                             ))
                      nil))

                    ;; Add a tag-based search view for your idea and review tags
                    ("i" "Ideas" tags "idea"
                     ((org-agenda-files (directory-files-recursively org-directory "\\.org$"))))
                    ("r" "To Review" tags "review"
                     ((org-agenda-files (directory-files-recursively org-directory "\\.org$"))))
                    ("s" "Security+ Notes" tags "security+"
                     ((org-agenda-files (directory-files-recursively org-directory "\\.org$"))))
                    )))

(setq org-agenda-skip-deadline-if-done t
      org-agenda-skip-scheduled-if-done t)

;; Set up a shortcut to open custom agenda view (unchanged)
(defun custom/switch-to-agenda ()
  (interactive)
  (org-agenda nil " "))

(map! :leader
      "o A" #'custom/switch-to-agenda)

;; Add shortcuts for tag-based searches
(map! :leader
      "o i" (lambda () (interactive) (org-agenda nil "i"))
      "o r" (lambda () (interactive) (org-agenda nil "r"))
      "o s" (lambda () (interactive) (org-agenda nil "s")))

;; org-protocol for browser capture (unchanged)
(after! org (require 'org-protocol))

;; org-roam configuration (unchanged)
(setq org-roam-directory "~/Projects/cloudnotes/cs/")

;; org-roam-ui configuration (unchanged)
(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Latex
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq
 +latex-viewers '(zathura)            ;; Set the viewer in which to open previews
 TeX-fold-unfold-around-mark 't       ;; ???
 lsp-tex-server 'texlab               ;; lsp
 TeX-electric-sub-and-superscript 't  ;; Show subscript and superscript below and above the line.
 )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EMMS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(emms-all)
(emms-default-players)
(emms-mode-line 1)
(emms-playing-time 1)
(setq emms-source-file-default-directory "~/Music/"
      emms-playlist-buffer-name "*Music*"
      emms-info-asynchronously t
      emms-source-file-directory-tree-function 'emms-source-file-directory-tree-find)
(map! :leader
      (:prefix ("e" . "EMMS audio player")
       :desc "Go to emms playlist"      "e e" #'emms-playlist-mode-go
       :desc "Emms pause track"         "p" #'emms-pause
       :desc "Emms stop track"          "s" #'emms-stop
       :desc "Shuffle" "e S" #'emms-shuffle
       :desc "Change playlist" "e q" #'emms-playlist-clear
       :desc "Emms play previous track" "P" #'emms-previous
       :desc "Emms play next track"     "N" #'emms-next))



