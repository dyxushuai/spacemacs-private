;;; packages.el --- xus layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: xu shuai <guanghui8827@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `xus-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `xus/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `xus/pre-init-PACKAGE' and/or
;;   `xus/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst xus-packages
  '(
    evil)
  "The list of Lisp packages required by the xus layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")


;;; packages.el ends here

(defun xus/post-init-evil ()
    (progn
      ;; n/s-n -> nzz
      (defadvice evil-ex-search-next (after advice-for-evil-search-next activate)
        (evil-scroll-line-to-center (line-number-at-pos)))
      (defadvice evil-ex-search-previous (after advice-for-evil-search-previous activate)
        (evil-scroll-line-to-center (line-number-at-pos)))
      ;; rebind g,k to gj and gk
      (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
      (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
      (define-key evil-normal-state-map (kbd "L") 'evil-end-of-line)
      (define-key evil-normal-state-map (kbd "H") 'evil-first-non-blank)
      (define-key evil-visual-state-map (kbd "L") 'evil-last-non-blank)
      (define-key evil-visual-state-map (kbd "H") 'evil-first-non-blank)
      (define-key evil-normal-state-map (kbd ",w") 'evil-write)
      (define-key evil-normal-state-map (kbd ",q") 'evil-save-and-close)
      ;; (define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
      ;; (define-key evil-normal-state-map (kbd ",n") 'neotree-toggle)
      ;; (define-key evil-normal-state-map (kbd ",s") 'evil-avy-goto-char)
      ;; command mode
      ))
