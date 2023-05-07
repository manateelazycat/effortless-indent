;;; effortless-indent.el --- Indent for paste code   -*- lexical-binding: t; -*-

;; Filename: effortless-indent.el
;; Description: Indent for paste code
;; Author: Andy Stewart <lazycat.manatee@gmail.com>
;; Maintainer: Andy Stewart <lazycat.manatee@gmail.com>
;; Copyright (C) 2023, Andy Stewart, all rights reserved.
;; Created: 2023-05-03 17:33:05
;; Version: 0.1
;; Last-Updated: 2023-05-03 17:33:05
;;           By: Andy Stewart
;; URL: https://www.github.org/manateelazycat/effortless-indent
;; Keywords:
;; Compatibility: GNU Emacs 30.0.50
;;
;; Features that might be required by this library:
;;
;;
;;

;;; This file is NOT part of GNU Emacs

;;; License
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.

;;; Commentary:
;;
;; Indent for paste code
;;

;;; Installation:
;;
;; Put effortless-indent.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'effortless-indent)
;;
;; No need more.

;;; Customize:
;;
;;
;;
;; All of the above can customize by:
;;      M-x customize-group RET effortless-indent RET
;;

;;; Change log:
;;
;; 2023/05/03
;;      * First released.
;;

;;; Acknowledgements:
;;
;;
;;

;;; TODO
;;
;;
;;

;;; Require


;;; Code:

(defvar effortless-indent-formatting-indent-alist
  '((c-mode                     . c-basic-offset) ; C
    (c++-mode                   . c-basic-offset) ; C++
    (csharp-mode                . c-basic-offset) ; C#
    (csharp-tree-sitter-mode    . csharp-tree-sitter-indent-offset) ; C#
    (d-mode                     . c-basic-offset)             ; D
    (julia-mode                 . c-basic-offset)             ; Julia
    (java-mode                  . c-basic-offset)             ; Java
    (java-ts-mode               . java-ts-mode-indent-offset) ; Java
    (jde-mode                   . c-basic-offset)     ; Java (JDE)
    (js-mode                    . js-indent-level)    ; JavaScript
    (js2-mode                   . js2-basic-offset)   ; JavaScript-IDE
    (js3-mode                   . js3-indent-level)   ; JavaScript-IDE
    (json-mode                  . js-indent-level)    ; JSON
    (json-ts-mode               . js-indent-level)    ; JSON
    (lua-mode                   . lua-indent-level)   ; Lua
    (objc-mode                  . c-basic-offset)     ; Objective C
    (php-mode                   . c-basic-offset)     ; PHP
    (perl-mode                  . perl-indent-level)  ; Perl
    (cperl-mode                 . cperl-indent-level) ; Perl
    (raku-mode                  . raku-indent-offset) ; Perl6/Raku
    (erlang-mode                . erlang-indent-level)     ; Erlang
    (ada-mode                   . ada-indent)              ; Ada
    (sgml-mode                  . sgml-basic-offset)       ; SGML
    (nxml-mode                  . nxml-child-indent)       ; XML
    (pascal-mode                . pascal-indent-level)     ; Pascal
    (typescript-mode            . typescript-indent-level) ; Typescript
    (typescript-ts-mode         . typescript-ts-mode-indent-offset) ; Typescript
    (tsx-ts-mode                . typescript-ts-mode-indent-offset) ; Typescript[TSX]
    (sh-mode                    . sh-basic-offset)   ; Shell Script
    (ruby-mode                  . ruby-indent-level) ; Ruby
    (enh-ruby-mode              . enh-ruby-indent-level) ; Ruby
    (crystal-mode               . crystal-indent-level) ; Crystal (Ruby)
    (css-mode                   . css-indent-offset)    ; CSS
	(move-mode                  . move-indent-offset)   ; Move
    (rust-mode                  . rust-indent-offset)   ; Rust
    (rust-ts-mode               . rust-ts-mode-indent-offset) ; Rust
    (rustic-mode                . rustic-indent-offset)       ; Rust
    (scala-mode                 . scala-indent:step)          ; Scala
    (powershell-mode            . powershell-indent)  ; PowerShell
    (ess-mode                   . ess-indent-offset)  ; ESS (R)
    (yaml-mode                  . yaml-indent-offset) ; YAML
    (hack-mode                  . hack-indent-offset) ; Hack
    (kotlin-mode                . c-basic-offset)     ; Kotlin
    (verilog-mode               . vhdl-indent-level)  ; Verilog
    (vhdl-mode                  . vhdl-basic-offset)  ; VHDL
    (go-mode                    . c-basic-offset)     ;Golang
    (go-ts-mode                 . c-basic-offset)     ;Golang
    (default                    . standard-indent)) ; default fallback
  "A mapping from `major-mode' to its indent variable.")

(defun effortless-indent--get-indent-width (mode)
  "Get indentation offset for MODE."
  (or (alist-get mode effortless-indent-formatting-indent-alist)
      (effortless-indent--get-indent-width (or (get mode 'derived-mode-parent) 'default))))

(defun effortless-indent ()
  (interactive)
  (let ((indent (symbol-value (effortless-indent--get-indent-width major-mode)))
        (start (mark))
        (end (point)))
    (save-excursion
      (when (>= end start)
        (goto-char start)
        (while (< (point) end)
          (insert (make-string indent ?\s))
          (forward-line 1)))

      ;; Indent last line of paste if last point of paste not beginning of line.
      (goto-char end)
      (unless (bolp)
        (insert (make-string indent ?\s)))
      )))

(provide 'effortless-indent)

;;; effortless-indent.el ends here
