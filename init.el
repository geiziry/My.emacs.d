(package-initialize)

(setq url-proxy-services
      '(("no_proxy" . "^\\(localhost\\|10.*\\)")
	("http" . "koc-internet.kockw.com:80")
	("https" . "koc-internet.kockw.com:80")))

(setq url-http-proxy-basic-auth-storage
    (list (list "koc-internet.kockw.com:80"
                (cons "kockw\mgeiziry"
                      (base64-encode-string "Uhbygv@12345")))))

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Remove security vulnerability
(eval-after-load "enriched"
  '(defun enriched-decode-display-prop (start end &optional param)
     (list start end)))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

(require 'package)
(setq package-enable-at-startup nil)

(require 'better-defaults)

(custom-set-variables

 '(package-archives
   (quote
    (("melpa" . "http://melpa.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/")
     ("org" . "http://orgmode.org/elpa/")
     ("marmalade" . "http://marmalade-repo.org/packages/"))))
 '(package-selected-packages (quote (flx-isearch flx-ido better-defaults))))

;; Set path to dependencies
(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path settings-dir)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
