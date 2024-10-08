;; BOOTSTRAP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set package manager and enable MELPA Stable repository.
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; `use-package' bootstrap.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Set and load Emacs 'custom-file.el'.
(setq custom-file "~/.emacs.d/custom-file.el")
(load-file custom-file)

;; EMACS CONFIG
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'dired-x)

(setq inhibit-startup-message t) ; Hide startup message.
(setq server-client-instructions nil) ; Hide client instructions.
(menu-bar-mode -1) ; Disable menu-bar.
(tool-bar-mode -1) ; Disable tool-bar.
(scroll-bar-mode -1) ; Disable scroll-bar.
(show-paren-mode 1) ; Show matching parenthesis.
(global-hl-line-mode t) ; Highlight current line.
(savehist-mode 1) ; Save history when restart.
(display-battery-mode 0) ; Hiding remain battery in modeline.
(add-hook 'text-mode-hook 'visual-line-mode) ; Hook visual-line-mode for text documents.
(fset 'yes-or-no-p 'y-or-n-p) ; Only reply single charachter.
(setq visible-bell t) ; Flash for errors.
(setq next-screen-context-lines 4) ; Lines Top/Bottom before scolling.
(setq scroll-margin 1) ; Horizontally scroll only line at point.
(set-face-attribute 'default nil :height 150) ; Default font size.
;;(setq visual-line-fringe-indicators t) ; Fringe indicators at  margins.
;;(setq-default show-trailing-whitespace t) ; Trailing whitespaces end of line.
(column-number-mode) ; Show column numers...
(setq column-number-indicator-zero-based nil) ; ...starting from 1.
(setq-default indicate-empty-lines t) ; Empty lines at bottom of buffer.
(setq tab-width 4) ; Set tab-width.
(setq initial-buffer-choice "~/downloads") ; Show this directory after boot.
;;(add-to-list 'default-frame-alist '(fullscreen . fullboth)) ; Start fullscreen.
(load-theme 'modus-vivendi t) ; Load default theme.
(setq dired-kill-when-opening-new-dired-buffer t) ; Dired open new directory in the same buffer
(setq dired-listing-switches "-al --group-directories-first") ; List directories first
(setq vc-follow-symlinks t) ; Follow symlinks whitout asking confirmation

;; Display date and time in modeline
(setq display-time-string-forms
      '((propertize (concat "(" day "/" month "/" year "-" 24-hours ":" minutes ")"))))
(display-time-mode t)

;; Load some modules.
(require 'org-habit) ; Manage habits in Org Mode
(require 'notmuch) ; Manage emails
(require 'org-tempo) ; Expand '<s' to source block

;; EMAIL STUFFS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Send email with Gmail.
(setq smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-stream-type 'starttls)
(setq message-send-mail-function 'smtpmail-send-it)
(setq smtpmail-servers-requiring-authorization "smtp.gmail.com")
(setq user-full-name "Massimo Fontana")
(setq user-mail-address "maxmatty@gmail.com")
(setq message-default-mail-headers
      "Reply-To: maxmatty@gmail.com\nCc: \nBcc: ")
(setq message-signature t)
(setq message-signature-file "~/.emacs.d/signature")
(setq message-signature-insert-empty-line t)

;; Notmuch customization.
(setq notmuch-search-oldest-first nil)
(setq notmuch-fcc-dirs nil)
(setq notmuch-show-logo nil)
(setq notmuch-tree-unthreaded t)
(setq mail-signature-file "~/.emacs.d/signature")
(setq notmuch-saved-searches '(
			       (:name "new" :query "tag:new" :key "n" :sort-order newest-first)
			       (:name "inbox" :query "tag:inbox" :key "i" :sort-order newest-first)
			       (:name "unread" :query "tag:unread" :key "u" :sort-order newest-first)
			       (:name "leggere" :query "tag:leggere" :key "l" :sort-order newest-first)
			       (:name "important" :query "tag:important" :key "f" :sort-order newest-first)
			       (:name "sent" :query "tag:sent" :key "t" :sort-order newest-first)
			       (:name "drafts" :query "tag:draft" :key "d" :sort-order newest-first)
			       (:name "all mail" :query "*" :key "a" :sort-order newest-first)))
(setq notmuch-hello-sections '(notmuch-hello-insert-header notmuch-hello-insert-saved-searches))
(setq notmuch-tagging-keys'(
			    ("u" ("+unread") "unread")
			    ("r" ("-unread") "read")
			    ("i" ("-trash" "-spam" "+inbox") "inbox")
			    ("a" ("-inbox" "-unread" "-important" "-spam") "arhive")
			    ("t" ("-inbox" "-unread" "-important" "-spam" "+trash") "trash")
			    ("s" ("-inbox" "-unread" "-important" "+spam") "spam")
			    ("f" ("-inbox" "+important") "important")
			    ))
;; Insert signature at point.
(defun message-insert-signature-at-point ()
  "Insert signature at point."
  (interactive)
  (require 'message)
  (save-restriction
    (narrow-to-region (point) (point))
    (message-insert-signature)))



;; PACKAGES
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Inline suggest key-combinations.
(use-package which-key
  :ensure t
  :config
  (which-key-mode 1)
  )

;; Enable rich annotations using the Marginalia package.
(use-package marginalia
  :ensure t
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

;; Vertical selection mode.
(use-package vertico
  :ensure t
  :config
  (vertico-mode 1)
  )

;; Search multiple spaced terms.
(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic)
	completion-category-defaults nil
	completion-category-overrides '((file (styles partial-completion))))
  )

;; Search with preview: 'consult' ecosystem
;; Base package.
(use-package consult
  :ensure t
  :bind (
	 ("C-x b" . consult-buffer)
	 )
  :config
  ;; Enable preview at point (i.e. 'C-x b').
  (add-hook 'completion-list-mode-hook #'consult-preview-at-point-mode)
  ;; Enable recent files in 'switch-buffer'.
  (recentf-mode nil)
  )
;; Search with previews emails with Notmuch.
(use-package consult-notmuch
  :ensure t
  )
;; Searching in different directories.
(use-package consult-dir
  :ensure t
  :bind (("C-x C-d" . consult-dir)
         :map minibuffer-local-completion-map
         ("C-x C-d" . consult-dir)
         ("C-x C-j" . consult-dir-jump-file)))
;; Search with preview 'denote' notes.
(use-package consult-denote
  :ensure t
  )
;; Search in home directory with 'consult'.
(defun my-search-home-dir ()
  "Search everything in home directory"
  (interactive)
  (consult-find "~/")
  )

;; Completion.
(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-tooltip-minimum-width 30)
  )

;; Word wrapping at 'fill-column'
(use-package visual-fill-column
  :ensure t
  :config
  (add-hook 'text-mode-hook 'visual-fill-column-mode)
  (add-hook 'text-mode-hook 'display-fill-column-indicator-mode)
  )

;; Sync CalDav agenda.
(use-package org-caldav
  :ensure t
  :config
  (setq org-caldav-url "https://cal.max73.net/max")
  (setq org-caldav-calendar-id "1396ea95-3b56-74fd-4807-493c511ec123")
  (setq org-caldav-inbox "~/.gtd/caldav.org")
  (setq org-caldav-files '("/srv/http/html/dav/gtd.org"))
  (setq org-icalendar-timezone "Europe/Rome")
  (setq org-icalendar-use-scheduled '(event-if-todo event-if-not-todo event-if-todo-not-done todo-start))
  )

;; Dot files toggle visibility in Dired.
(use-package dired-hide-dotfiles
  :ensure t
  :hook
  (dired-mode . dired-hide-dotfiles-mode)
  :bind
  (:map dired-mode-map ("." . dired-hide-dotfiles-mode))
  )

;; Delete temporary file ('~').
(defun my-dired-delete-backup-files ()
  "Delted backup files (~) in Dired"
  (interactive)
  (dired-mark-files-regexp "~")
  (dired-do-delete)
  )

;; Note taking with 'denote'
;; Base package.
(use-package denote
  :ensure t
  :config
  (setq denote-file-type '("markdown-yaml" "org" "text"))
  (setq denote-directory "~/org/denote/")
  (setq denote-prompts '(title keywords file-type subdirectory))
  (setq denote-known-keywords nil)
  (setq denote-excluded-directories-regexp "assets")
  (setq denote-toml-front-matter
	"+++
title      = %s
date       = %s
summary    = \" \"
tags       = %s
identifier = %S
draft      = false
+++

---

- links:
- zkk:
")
  (setq denote-yaml-front-matter
	"---
title:      %s
date:       %s
summary:    \" \"
tags:       %s
identifier: %S
draft:      false
---

---

- links:
- zkk:
")
  (setq denote-org-front-matter
	"#+startup:    overview shrink
#+title:      %s
#+date:       %s
#+filetags:   %s
#+identifier: %s

")
  )
;; List notes.
(use-package denote-menu
  :ensure t
  )

;; View markdown files
(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" . gfm-mode)
  :init (setq markdown-command "pandoc")
  :config
  (setq markdown-max-image-size '(600 . 600))
  )

;; 'magit' (git interface)
(use-package magit
  :ensure t
  :config
  (setq magit-repository-directories '(
				       ("~/dotfiles" . 1)
				       ("~/mygit/blog-posts" . 1)
				       ))
  (setq magit-repolist-columns '(
				 ("Name" 15 magit-repolist-column-ident nil)
				 ("Version" 25 magit-repolist-column-version nil)
				 ("B<U" 3 magit-repolist-column-unpulled-from-upstream
				  ((:right-align t)
				   (:help-echo "Upstream changes not in branch")))
				 ("B>U" 3 magit-repolist-column-unpushed-to-upstream
				  ((:right-align t)
				   (:help-echo "Local changes not in upstream")))
				 ("FLAG" 4 magit-repolist-column-flag nil)
				 ("Path" 99 magit-repolist-column-path nil)
				 ))
  )

;; Listen music.
(use-package listen
  :ensure t
  :config
  (setq listen-directory "~/hdd/music_audio")
  )

;; Opening file with sudo.
(use-package sudo-edit
  :ensure t
  :commands (sudo-edit)
  )

;; Format all or regions.
(use-package format-all
  :ensure t
  )

;; BLOGGING
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; General configurations.
(require 'ox-publish)
(setq org-descriptive-links nil)
(setq org-image-actual-width 400)

;; Temporary virtual host
(use-package simple-httpd
  :ensure t
  :config
  (setq httpd-port 7373)
  )

;; 'htmlize' package (export as html)
(use-package htmlize
  :ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; With package 'org-static-blog'.
(use-package org-static-blog
  :ensure t
  :config
  (setq org-static-blog-publish-title "Zettelkasten")
;  (setq org-static-blog-publish-url "https://blog.max73.net/")
  (setq org-static-blog-publish-url "https://blog.massimo-fontana.net/")
  (setq org-static-blog-publish-directory "~/web/org-static-blog/")
  (setq org-static-blog-posts-directory "~/org/denote/blog-posts/")
  (setq org-static-blog-drafts-directory "~/org/denote/blog-drafts/")
  (setq org-static-blog-enable-tags t)
  (setq org-export-with-toc t)
  (setq org-export-with-section-numbers t)
  (setq org-static-blog-use-preview t)
  (setq org-static-blog-preview-start nil)
  (setq org-static-blog-preview-end nil)
  (setq org-static-blog-preview-ellipsis nil)
  (setq org-static-blog-preview-link-p nil)
  (setq org-static-blog-page-header 
	"<meta name=\"author\" content=\"max\">
<meta name=\"referrer\" content=\"none\">
<link href= \"assets/style.css\" rel=\"stylesheet\" type=\"text/css\" />
<meta http-equiv=\"content-type\" content=\"application/xhtml+xml; charset=UTF-8\">
<meta name=\"viewport\" content=\"initial-scale=1,width=device-width,minimum-scale=1\">")
  (setq org-static-blog-page-preamble
	"<div class=\"header\">
    <a href=\"https://blog.massimo-fontana.net\">Blog</a> |
    <a href=\"https://blog.massimo-fontana.net/tag-tutorials.html\">Tutorials</a> | 
    <a href=\"https://blog.massimo-fontana.net/tags.html\">Tags</a> | 
    <a href=\"https://blog.massimo-fontana.net/archive.html\">Archive</a>
 </div>")
  (setq org-static-blog-page-postamble "")
  (setq org-static-blog-langcode "en")
  (setq org-static-blog-post-comments "")
  (setq org-static-blog-index-front-matter "")
  (setq org-static-blog-texts
	'((other-posts
	   ("en" . "Other posts")
	   ("it" . "Altri articoli"))
	  (date-format
	   ("en" . "%d %b %Y")
	   ("it" . "%d/%m/%Y"))
	  (tags
	   ("en" . "Tags")
	   ("it" . "Categorie"))
	  (archive
	   ("en" . "Archive")
	   ("it" . "Archivio"))
	  (posts-tagged
	   ("en" . "Posts tagged")
	   ("it" . "Articoli nella categoria"))
	  (no-prev-post
	   ("en" . "There is no previous post")
	   ("it" . "Non c'è nessun articolo precedente"))
	  (no-next-post
	   ("en" . "There is no next post")
	   ("it" . "Non c'è nessun articolo successivo"))
	  (title
	   ("en" . "Title: ")
	   ("it" . "Titolo: "))
	  (filename
	   ("en" . "Filename: ")
           ("it" . "Nome del file: "))
	  ))
  )

;; Rsync to blog.massimo-fontana.net.
(defun my-rsync-blog ()
  "Rsync ~/web/org-static-blog to blog.massimo-fontana.net"
  (interactive)
  (async-shell-command "rsync -LuvrP --delete-after --exclude='*~' /home/max/web/org-static-blog/ root@massimo-fontana.net:/var/www/blog")
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Rsync to zkk.max73.net.
(defun my-rsync-zkk ()
  "Rsync ~/web/hugo-zkk to zkk.max73.net"
  (interactive)
  (async-shell-command "rsync -uvrP --delete-after --exclude='*~' /home/max/web/hugo-zkk/public/ root@max73.net:/var/www/zkk")
  )

;; Rsync to gallery.max73.net.
(defun my-rsync-gallery ()
  "Rsync ~/web/hugo-gallery/public to gallery.max73.net"
  (interactive)
  (async-shell-command "rsync -uvrP --delete-after --exclude='*~' /home/max/web/hugo-gallery/public/ root@max73.net:/var/www/gallery")
  )


;; ORG MODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Do not split line when M-<RET>.
(set 'org-M-RET-may-split-line '((default . nil)))

;; Custom Capture Templates.
(setq org-capture-templates
      '(
	("b" "Blog" entry
	 (file "/srv/http/html/dav/gtd.org")
	 (file "~/.gtd/tpl/blog.txt")
	 :prepend t
	 )
	("g" "GTD" entry
	 (file "/srv/http/html/dav/gtd.org")
	 (file "~/.gtd/tpl/gtd.txt")
	 :prepend t
	 )
	("h" "Habit" entry
	 (file "/srv/http/html/dav/gtd.org")
	 (file "~/.gtd/tpl/habit.txt")
	 :prepend t
	 )
	("n" "Denote" plain
         (file denote-last-path)
         #'denote-org-capture
         :no-save t
         :immediate-finish nil
         :kill-buffer t
         :jump-to-captured t)
	))

;; AGENDA SETTINGS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq org-deadline-warning-days 0) ; Days for deadline warnings.
(setq org-log-into-drawer t) ; Log everything into LOGBOOK drawer.
(setq org-agenda-window-setup 'only-window) ; Show Agenda View in full window...
(setq org-agenda-restore-windows-after-quit nil) ; ... and do not restore them.
(setq org-agenda-skip-archived-trees nil) ; Show archived items.
(setq org-agenda-show-current-time-in-grid nil) ; Not showing 'now' timeline.
(setq org-agenda-include-diary nil) ; Do not include Diary...
(setq diary-show-holidays-flag nil) ; ...and (in case) not show holidays.
(setq org-habit-show-habits t) ; Show habits...
(setq org-habit-show-habits-only-for-today t) ; ...only for today.
(setq org-habit-graph-column 26) ; Column start graph.
(setq org-habit-preceding-days 12) ; Days before today in graph.
(setq org-habit-following-days 3) ; Days before today in graph.
(setq org-agenda-remove-tags t) ; Not showing tags at the and of item.
(setq org-agenda-files '("/srv/http/html/dav/gtd.org" "~/.gtd/caldav.org"))
(setq org-refile-targets '(
			   ("/srv/http/html/dav/gtd.org" :maxlevel . 1)
			   ))
(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps t)
(setq org-reverse-note-order t)

;; Org Projects settings.
(setq org-enforce-todo-dependencies t)
(setq org-track-ordered-property-with-tag t)
(setq org-agenda-dim-blocked-tasks nil)

(setq org-agenda-prefix-format '(
				 (agenda . " %-8T %?-12t")
				 (todo . " %-8T ")
				 (tags . " %-8T ")
				 (search . " %-8T ")
				 ))

(setq org-agenda-time-grid '((daily today require-timed)
			     (800 2000)
			     "......" "--------------------"))

;; Agenda custom commands
(setq org-agenda-custom-commands
      '(("g" "GTD" (
		    (todo "NEXT|WAIT" (
				       (org-agenda-overriding-header "NEXT/WAIT not in Agenda")
				       (org-agenda-skip-function '(org-agenda-skip-entry-if 'timestamp))
				       (org-agenda-sorting-strategy '((tag-up)))
				       ))
		    (agenda "" (
				(org-agenda-overriding-header "Day Agenda")
				(org-agenda-skip-function '(org-agenda-skip-entry-if 'todo '("CAPTURED")))
				(org-agenda-span 1)
				))
		    (agenda "" (
				(org-agenda-overriding-header "Next 3 Days")
				(org-agenda-skip-function '(org-agenda-skip-entry-if 'todo '("CAPTURED")))
				(org-agenda-start-on-weekday nil)
				(org-agenda-start-day "+1d")
				(org-agenda-span 3)
				(org-agenda-show-all-dates nil)
				))
		    (agenda "" (
				(org-agenda-overriding-header "Pending last 30 Days")
				(org-agenda-skip-function '(org-agenda-skip-entry-if 'nottodo '("TODO" "NEXT" "WAIT" "SOMEDAY")))
				(org-agenda-start-on-weekday nil)
				(org-agenda-start-day "-30d")
				(org-agenda-span 30)
				(org-agenda-show-all-dates nil)
				))
		    (todo "CAPTURED" (
				      (org-agenda-overriding-header "To be processed")
				      ))
		    (todo "TODO|SOMEDAY" (
					  (org-agenda-overriding-header "REVIEW")
					  (org-agenda-skip-function '(org-agenda-skip-entry-if 'timestamp))
					  ))
		    (tags-todo "HABIT" (
					(org-agenda-overriding-header "HABITS")
					))
		    )
	 )
	))

;; Show habits graph everyware.
(defvar my-org-habit-show-graphs-everywhere nil
  "If non-nil, show habit graphs in all types of agenda buffers.
Normally, habits display consistency graphs only in
\"agenda\"-type agenda buffers, not in other types of agenda
buffers.  Set this variable to any non-nil variable to show
consistency graphs in all Org mode agendas.")
(defun my-org-agenda-mark-habits ()
  "Mark all habits in current agenda for graph display.
This function enforces `my-org-habit-show-graphs-everywhere' by
marking all habits in the current agenda as such.  When run just
before `org-agenda-finalize' (such as by advice; unfortunately,
`org-agenda-finalize-hook' is run too late), this has the effect
of displaying consistency graphs for these habits.
When `my-org-habit-show-graphs-everywhere' is nil, this function
has no effect."
  (when (and my-org-habit-show-graphs-everywhere
             (not (get-text-property (point) 'org-series)))
    (let ((cursor (point))
          item data)
      (while (setq cursor (next-single-property-change cursor 'org-marker))
        (setq item (get-text-property cursor 'org-marker))
        (when (and item (org-is-habit-p item))
          (with-current-buffer (marker-buffer item)
            (setq data (org-habit-parse-todo item)))
          (put-text-property cursor
                             (next-single-property-change cursor 'org-marker)
                             'org-habit-p data))))))
(setq my-org-habit-show-graphs-everywhere t)
(advice-add #'org-agenda-finalize :before #'my-org-agenda-mark-habits)

;; Function to delete empty Blocks in Agenda View.
(defun my-org-agenda-delete-empty-blocks ()
  "Remove empty agenda blocks.
  A block is identified as empty if there are fewer than 2
  non-empty lines in the block (excluding the line with
  `org-agenda-block-separator' characters)."
  (when org-agenda-compact-blocks
    (user-error "Cannot delete empty compact blocks"))
  (setq buffer-read-only nil)
  (save-excursion
    (goto-char (point-min))
    (let* ((blank-line-re "^\\s-*$")
           (content-line-count (if (looking-at-p blank-line-re) 0 1))
           (start-pos (point))
           (block-re (format "%c\\{10,\\}" org-agenda-block-separator)))
      (while (and (not (eobp)) (forward-line))
        (cond
         ((looking-at-p block-re)
          (when (< content-line-count 2)
            (delete-region start-pos (1+ (point-at-bol))))
          (setq start-pos (point))
          (forward-line)
          (setq content-line-count (if (looking-at-p blank-line-re) 0 1)))
         ((not (looking-at-p blank-line-re))
          (setq content-line-count (1+ content-line-count)))))
      (when (< content-line-count 2)
        (delete-region start-pos (point-max)))
      (goto-char (point-min))
      ;; The above strategy can leave a separator line at the beginning
      ;; of the buffer.
      (when (looking-at-p block-re)
        (delete-region (point) (1+ (point-at-eol))))))
  (setq buffer-read-only t))
(add-hook 'org-agenda-finalize-hook #'my-org-agenda-delete-empty-blocks)

;; KEY BINDINGS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; F1. Org-capture.
(global-set-key [f1] 'org-capture)

;; F2. Set my choice for Agenda View.
(defun my-agenda-choice ()
  "Shortcut for my default Agenda View"
  (interactive)
  (org-agenda nil "g")
  )
(global-set-key [f2] 'my-agenda-choice)

;; F3. Open recent files.
(recentf-mode 1)
(setq recentf-max-menu-items 500)
(setq recentf-max-saved-items 500)
(global-set-key [f3] 'recentf-open)

;; C-c e. Toggle emphasis in Org mode.
(defun my-org-toggle-emphasis ()
  "Toggle hiding/showing of org emphasize markers."
  (interactive)
  (if org-hide-emphasis-markers
      (set-variable 'org-hide-emphasis-markers nil)
    (set-variable 'org-hide-emphasis-markers t))
  (font-lock-flush)
  (font-lock-ensure))
(define-key org-mode-map (kbd "C-c e") 'my-org-toggle-emphasis)
