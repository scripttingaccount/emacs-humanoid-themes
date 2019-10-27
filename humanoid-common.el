;;; humanoid-common.el --- Color theme with a dark and light versions.

;; Copyright (C) 2015-2018 Nasser Alshammari

;; Author: Nasser Alshammari
;; URL: <https://github.com/nashamri/spacemacs-theme>
;;
;; Version: 0.1_tasmo
;; Keywords: color, theme
;; Package-Requires: ((emacs "24"))

;; Initially created with the help of emacs-theme-generator, <https://github.com/mswift42/theme-creator>.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;; This file is not part of Emacs.

;;; Commentary:

;; This is a color theme for humanoid <https://github.com/syl20bnr/spacemacs>.
;; It comes with two versions, dark and light and should work well in
;; a 256 color terminal.

;;; Code:

(defmacro dyn-let (varlist fn setfaces setvars)
  (list 'let (append varlist (funcall fn)) setfaces setvars))

(defgroup humanoid-theme nil
  "Humanoid-theme options."
  :group 'faces)

(defcustom humanoid-theme-comment-bg t
  "Use a background for comment lines."
  :type 'boolean
  :group 'humanoid-theme)

(defcustom humanoid-theme-comment-italic nil
  "Enable italics for comments and also disable background."
  :type 'boolean
  :group 'humanoid-theme)

(defcustom humanoid-theme-keyword-italic nil
  "Enable italics for keywords."
  :type 'boolean
  :group 'humanoid-theme)

(defcustom humanoid-theme-org-agenda-height nil
  "If non-nil, use varying text heights for agenda items.

Note that if you change this to a non-nil value, you may want to
also adjust the value of `org-agenda-tags-column'. If that is set
to 'auto, tags may not be properly aligned. "
  :type 'boolean
  :group 'humanoid-theme)

(defcustom humanoid-theme-org-height t
  "Use varying text heights for org headings."
  :type 'boolean
  :group 'humanoid-theme)

(defcustom humanoid-theme-org-bold t
  "Inherit text bold for org headings"
  :type 'boolean
  :group 'humanoid-theme)

(defcustom humanoid-theme-org-priority-bold t
  "Inherit text bold for priority items in agenda view"
  :type 'boolean
  :group 'humanoid-theme)

(defcustom humanoid-theme-org-highlight nil
  "Highlight org headings."
  :type 'boolean
  :group 'humanoid-theme)

(defcustom humanoid-theme-custom-colors nil
  "Specify a list of custom colors."
  :type 'alist
  :group 'humanoid-theme)

(defcustom humanoid-theme-underline-parens t
  "If non-nil, underline matching parens when using `show-paren-mode' or similar."
  :type 'boolean
  :group 'humanoid-theme)

(defun true-color-p ()
  (or
   (display-graphic-p)
   (= (tty-display-color-cells) 16777216)))

(defun custom-colors-override ()
  (mapcar (lambda (x) (list (car x) (cdr x)))
          humanoid-theme-custom-colors))

(defun create-humanoid-theme (variant theme-name)
  (dyn-let
   ((class '((class color) (min-colors 89))) ;;                ~~ Dark ~~                                      ~~ Light ~~
;;;;;                                                        GUI       TER                                   GUI       TER
;;;;; colors
    (black         (if (eq variant 'dark) (if (true-color-p) "#1f2021" "gray12")          (if (true-color-p) "#1f2021" "gray12")))
    (red           (if (eq variant 'dark) (if (true-color-p) "#f44336" "red2")            (if (true-color-p) "#d32f2f" "firebrick3")))
    (red-bg        (if (eq variant 'dark) (if (true-color-p) "#5e1818" "firebrick4")      (if (true-color-p) "#ffc9c9" "MistyRose2")))
    (red-bg-s      (if (eq variant 'dark) (if (true-color-p) "#490d0d" "red4")            (if (true-color-p) "#ffdddd" "seashell")))
    (green         (if (eq variant 'dark) (if (true-color-p) "#4caf50" "green3")          (if (true-color-p) "#388e3c" "SpringGreen4")))
    (green-bg      (if (eq variant 'dark) (if (true-color-p) "#0d5124" "DarkSlateGray")   (if (true-color-p) "#c8f4c8" "honeydew2")))
    (green-bg-s    (if (eq variant 'dark) (if (true-color-p) "#29422d" "DarkOliveGreen")  (if (true-color-p) "#ddffdd" "honeydew")))
    (yellow        (if (eq variant 'dark) (if (true-color-p) "#ffc107" "goldenrod1")      (if (true-color-p) "#ffc107" "DarkOrange2")))
    (yellow-bg     (if (eq variant 'dark) (if (true-color-p) "#32322c" "sienna4")         (if (true-color-p) "#f6f1e0" "linen")))
    (orange        (if (eq variant 'dark) (if (true-color-p) "#ff9800" "DarkOrange")      (if (true-color-p) "#ff3d00" "DarkOrange")))
    (blue          (if (eq variant 'dark) (if (true-color-p) "#00a6fb" "DeepSkyBlue2")    (if (true-color-p) "#2196f3" "DeepSkyBlue3")))
    (blue-bg       (if (eq variant 'dark) (if (true-color-p) "#445566" "RoyalBlue4")      (if (true-color-p) "#b5e6ff" "LightSkyBlue1")))
    (blue-bg-s     (if (eq variant 'dark) (if (true-color-p) "#2d4252" "DodgerBlue4")     (if (true-color-p) "#ddeeff" "LightBlue1")))
    (magenta       (if (eq variant 'dark) (if (true-color-p) "#ff60ee" "DarkOrchid1")     (if (true-color-p) "#5f23a3" "purple")))
    (purple        (if (eq variant 'dark) (if (true-color-p) "#802edd" "purple")          (if (true-color-p) "#ff60ee" "DarkOrchid1")))
    (aqua          (if (eq variant 'dark) (if (true-color-p) "#0ed1d1" "DeepSkyBlue4")    (if (true-color-p) "#0097a7" "cyan4")))
    (aqua-bg       (if (eq variant 'dark) (if (true-color-p) "#061413" "SteelBlue4")      (if (true-color-p) "#ebf9f9" "azure1")))
    (cyan          (if (eq variant 'dark) (if (true-color-p) "#1de9b6" "cyan3")           (if (true-color-p) "#00bfa5" "DeepSkyBlue4")))
    (white         (if (eq variant 'dark) (if (true-color-p) "#fcfcfc" "grey99")          (if (true-color-p) "#fcfcfc" "gray99")))
;;;;; generic
    (act1          (if (eq variant 'dark) (if (true-color-p) "#31363b" "gray20")          (if (true-color-p) "#efeae9" "gray89")))
    (act2          (if (eq variant 'dark) (if (true-color-p) "#3b4045" "gray25")          (if (true-color-p) "#e3dedd" "gray83")))
    (base          (if (eq variant 'dark) (if (true-color-p) "#f8f8f2" "gray97")          (if (true-color-p) "#232629" "gray15")))
    (base-dim      (if (eq variant 'dark) (if (true-color-p) "#686868" "gray41")          (if (true-color-p) "#a49da5" "gray64")))
    (bg0           (if (eq variant 'dark) (if (true-color-p) "#1f2021" "gray12")          (if (true-color-p) "#fcfcfc" "gray99")))
    (bg1           (if (eq variant 'dark) (if (true-color-p) "#232629" "gray15")          (if (true-color-p) "#f8f8f2" "gray97")))
    (bg2           (if (eq variant 'dark) (if (true-color-p) "#292c30" "gray17")          (if (true-color-p) "#f5f3ef" "gray93")))
    (bg3           (if (eq variant 'dark) (if (true-color-p) "#31363b" "gray20")          (if (true-color-p) "#efeae9" "gray89")))
    (bg4           (if (eq variant 'dark) (if (true-color-p) "#3b4045" "gray25")          (if (true-color-p) "#eae7e3" "gray85")))
    (builtin       (if (eq variant 'dark) (if (true-color-p) "#00a6fb" "DeepSkyBlue2")    (if (true-color-p) "#2196f3" "DeepSkyBlue3")))
    (border        (if (eq variant 'dark) (if (true-color-p) "#31363b" "gray20")          (if (true-color-p) "#e3dedd" "gray81")))
    (cblk          (if (eq variant 'dark) (if (true-color-p) "#f5f3ef" "gray89")          (if (true-color-p) "#292c2f" "gray16")))
    (cblk-bg       (if (eq variant 'dark) (if (true-color-p) "#1f2225" "gray16")          (if (true-color-p) "#fcfcf6" "gray93")))
    (cblk-ln       (if (eq variant 'dark) (if (true-color-p) "#a49da4" "gray71")          (if (true-color-p) "#686868" "gray20")))
    (cblk-ln-bg    (if (eq variant 'dark) (if (true-color-p) "#292c2f" "gray17")          (if (true-color-p) "#f5f3ef" "gray89")))
    (comment       (if (eq variant 'dark) (if (true-color-p) "#6b7566" "LemonChiffon4")   (if (true-color-p) "#8b9985" "LemonChiffon4")))
    (comment-bg    (if (eq variant 'dark) (if (true-color-p) "#232629" "gray15")          (if (true-color-p) "#f8f8f2" "gray97")))
    (comment-light (if (eq variant 'dark) (if (true-color-p) "#75715e" "LightGoldenrod4") (if (true-color-p) "#6b7566" "DarkKhaki")))
    (comp          (if (eq variant 'dark) (if (true-color-p) "#0ed1d1" "cyan3")           (if (true-color-p) "#4527a0" "DeepSkyBlue2")))
    (const         (if (eq variant 'dark) (if (true-color-p) "#ff60ee" "DarkOrchid1")     (if (true-color-p) "#5f23a3" "purple")))
    (cursor        (if (eq variant 'dark) (if (true-color-p) "#64dd17" "LimeGreen")       (if (true-color-p) "#64dd17" "LimeGreen")))
    (err           (if (eq variant 'dark) (if (true-color-p) "#e91e63" "red2")            (if (true-color-p) "#d32f2f" "firebrick3")))
    (func          (if (eq variant 'dark) (if (true-color-p) "#c6ff00" "LightSkyBlue1")   (if (true-color-p) "#ff3d00" "DarkOrange2")))
    (head1         (if (eq variant 'dark) (if (true-color-p) "#42a5f5" "DeepSkyBlue1")    (if (true-color-p) "#2376ad" "DodgerBlue4")))
    (head1-bg      (if (eq variant 'dark) (if (true-color-p) "#293239" "gray17")          (if (true-color-p) "#f8f8f2" "gray97")))
    (head2         (if (eq variant 'dark) (if (true-color-p) "#29b6f6" "DeepSkyBlue2")    (if (true-color-p) "#2b6590" "DodgerBlue3")))
    (head2-bg      (if (eq variant 'dark) (if (true-color-p) "#293235" "gray18")          (if (true-color-p) "#f8f8f2" "gray97")))
    (head3         (if (eq variant 'dark) (if (true-color-p) "#26c6da" "DeepSkyBlue3")    (if (true-color-p) "#2d5475" "DeepSkyBlue3")))
    (head3-bg      (if (eq variant 'dark) (if (true-color-p) "#293235" "gray19")          (if (true-color-p) "#f8f8f2" "gray97")))
    (head4         (if (eq variant 'dark) (if (true-color-p) "#26a69a" "DodgerBlue3")     (if (true-color-p) "#2c445b" "DeepSkyBlue2")))
    (head4-bg      (if (eq variant 'dark) (if (true-color-p) "#32322c" "gray20")          (if (true-color-p) "#f8f8f2" "gray97")))
    (head5         (if (eq variant 'dark) (if (true-color-p) "#66bb6a" "DodgerBlue4")     (if (true-color-p) "#293542" "DeepSkyBlue1")))
    (head5-bg      (if (eq variant 'dark) (if (true-color-p) "#32322c" "gray20")          (if (true-color-p) "#f8f8f2" "gray97")))
    (highlight     (if (eq variant 'dark) (if (true-color-p) "#49483e" "gray28")          (if (true-color-p) "#e3dedd" "gray89")))
    (highlight-dim (if (eq variant 'dark) (if (true-color-p) "#3b4045" "gray24")          (if (true-color-p) "#d6d7d9" "gray85")))
    (keyword       (if (eq variant 'dark) (if (true-color-p) "#72ccf9" "DeepSkyBlue3")    (if (true-color-p) "#0069c0" "DeepSkyBlue3")))
    (lnum          (if (eq variant 'dark) (if (true-color-p) "#5d6658" "gray29")          (if (true-color-p) "#98a890" "gray71")))
    (mat           (if (eq variant 'dark) (if (true-color-p) "#dce775" "honeydew2")       (if (true-color-p) "#29422d" "DarkOliveGreen")))
    (meta          (if (eq variant 'dark) (if (true-color-p) "#5d6658" "LightGoldenrod4") (if (true-color-p) "#98a890" "DarkKhaki")))
    (str           (if (eq variant 'dark) (if (true-color-p) "#7ecb20" "DarkOrange")      (if (true-color-p) "#388e3c" "DarkOrange")))
    (suc           (if (eq variant 'dark) (if (true-color-p) "#4caf50" "green3")          (if (true-color-p) "#5a9216" "SpringGreen4")))
    (ttip          (if (eq variant 'dark) (if (true-color-p) "#75715e" "wheat4")          (if (true-color-p) "#232629" "gray15")))
    (ttip-bg       (if (eq variant 'dark) (if (true-color-p) "#3b4045" "gray25")          (if (true-color-p) "#eae7e3" "gray88")))
    (ttip-sl       (if (eq variant 'dark) (if (true-color-p) "#49483e" "gray28")          (if (true-color-p) "#e3dedd" "gray84")))
    (type          (if (eq variant 'dark) (if (true-color-p) "#0097a7" "cyan4")           (if (true-color-p) "#007c91" "cyan3")))
    (var           (if (eq variant 'dark) (if (true-color-p) "#0487c9" "turquoise2")      (if (true-color-p) "#0d47a1" "DeepSkyBlue4")))
    (war           (if (eq variant 'dark) (if (true-color-p) "#ff9800" "goldenrod1")      (if (true-color-p) "#880e4f" "DodgerBlue4"))))


   custom-colors-override

   (custom-theme-set-faces
    theme-name

;;;;; basics
    `(custom-black                        ((,class (:foreground ,black))))
    `(custom-red                          ((,class (:foreground ,red))))
    `(custom-green                        ((,class (:foreground ,green))))
    `(custom-yellow                       ((,class (:foreground ,yellow))))
    `(custom-orange                       ((,class (:foreground ,orange))))
    `(custom-blue                         ((,class (:foreground ,blue))))
    `(custom-magenta                      ((,class (:foreground ,magenta))))
    `(custom-aqua                         ((,class (:foreground ,aqua))))
    `(custom-cyan                         ((,class (:foreground ,cyan))))
    `(custom-white                        ((,class (:foreground ,white))))
    `(custom-gray                         ((,class (:foreground ,base-dim))))

;;;;; basics
    `(cursor                              ((,class (:background ,cursor))))
    `(custom-button                       ((,class (:background ,bg2 :foreground ,base :box (:line-width 2 :style released-button)))))
    `(default                             ((,class (:background ,bg1 :foreground ,base))))
    `(default-italic                      ((,class (:italic t))))
    `(error                               ((,class (:foreground ,err))))
    `(eval-sexp-fu-flash                  ((,class (:background ,suc :foreground ,bg1))))
    `(eval-sexp-fu-flash-error            ((,class (:background ,err :foreground ,bg1))))
    `(font-lock-builtin-face              ((,class (:foreground ,builtin))))
    `(font-lock-comment-face              ((,class (:foreground ,
                                                    (if humanoid-theme-comment-italic comment-light comment) :background ,
                                                    (when humanoid-theme-comment-bg comment-bg) :slant ,
                                                    (if humanoid-theme-comment-italic 'italic 'normal)))))
    `(font-lock-constant-face             ((,class (:foreground ,const))))
    `(font-lock-doc-face                  ((,class (:foreground ,comment-light))))
    `(font-lock-function-name-face        ((,class (:foreground ,func))))
    `(font-lock-keyword-face              ((,class (:foreground ,keyword :bold nil))))
    `(font-lock-negation-char-face        ((,class (:foreground ,const))))
    `(font-lock-preprocessor-face         ((,class (:foreground ,comp))))
    `(font-lock-reference-face            ((,class (:foreground ,const))))
    `(font-lock-regexp-grouping-backslash ((,class (:foreground ,magenta))))
    `(font-lock-regexp-grouping-construct ((,class (:foreground ,yellow))))
    `(font-lock-string-face               ((,class (:foreground ,str))))
    `(font-lock-type-face                 ((,class (:foreground ,type :inherit bold))))
    `(font-lock-variable-name-face        ((,class (:inherit bold :foreground ,var))))
    `(font-lock-warning-face              ((,class (:foreground ,war :background ,bg1))))
    `(fringe                              ((,class (:background ,bg1 :foreground ,lnum))))
    `(header-line                         ((,class (:background ,bg4))))
    `(highlight                           ((,class (:foreground ,base :background ,highlight))))
    `(hl-line                             ((,class (:background ,bg3))))
    `(isearch                             ((,class (:foreground ,bg1 :background ,mat))))
    `(lazy-highlight                      ((,class (:background ,highlight-dim :weight normal))))
    `(link                                ((,class (:foreground ,base :underline t))))
    `(link-visited                        ((,class (:inherit link))))
    `(match                               ((,class (:background ,highlight :foreground ,mat))))
    `(minibuffer-prompt                   ((,class (:inherit bold :foreground ,keyword))))
    `(mouse                               ((,class (:foreground ,bg1 :background ,base :inverse-video t))))
    `(page-break-lines                    ((,class (:foreground ,act2))))
    `(region                              ((,class (:background ,highlight))))
    `(secondary-selection                 ((,class (:background ,bg3))))
    `(shadow                              ((,class (:foreground ,base-dim))))
    `(success                             ((,class (:foreground ,suc))))
    `(tooltip                             ((,class (:background ,ttip-sl :foreground ,base :bold nil :italic nil :underline nil))))
    `(vertical-border                     ((,class (:foreground ,border))))
    `(warning                             ((,class (:foreground ,war))))

;;;;; ace-window
    `(aw-leading-char-face ((,class (:foreground ,func :weight bold :height 2.0 :box (:line-width 1 :color ,keyword :style released-button)))))

;;;;; ahs
    `(ahs-face ((,class (:background ,highlight))))
    `(ahs-plugin-whole-buffer-face ((,class (:background ,mat :foreground ,bg1))))

;;;;; anzu-mode
    `(anzu-mode-line ((,class (:foreground ,yellow :inherit bold))))

;;;;; auto-complete
    `(ac-completion-face ((,class (:background ,ttip-bg :foreground ,ttip))))

;;;;; avy
    `(avy-lead-face   ((,class (:background ,green-bg :foreground ,green))))
    `(avy-lead-face-0 ((,class (:background ,green-bg :foreground ,yellow))))
    `(avy-lead-face-1 ((,class (:background ,green-bg :foreground ,magenta))))
    `(avy-lead-face-2 ((,class (:background ,green-bg :foreground ,blue))))

;;;;; c
    `(c-annotation-face ((,class (:inherit font-lock-constant-face))))

;;;;; calfw
    `(cfw:face-title               ((,class (:foreground ,head1 :height 2.0 :weight bold :inherit variable-pitch))))
    `(cfw:face-header              ((,class (:foreground ,base :weight bold))))
    `(cfw:face-saturday            ((,class (:foreground ,base :weight bold))))
    `(cfw:face-sunday              ((,class (:foreground ,base :weight bold))))
    `(cfw:face-holiday             ((,class (:foreground ,head1 :weight bold))))
    `(cfw:face-grid                ((,class (:foreground ,border))))
    `(cfw:face-default-content     ((,class (:foreground ,green))))
    `(cfw:face-periods             ((,class (:foreground ,cyan))))
    `(cfw:face-day-title           ((,class (:background ,blue-bg))))
    `(cfw:face-default-day         ((,class (:foreground ,base :weight bold))))
    `(cfw:face-annotation          ((,class (:foreground ,aqua))))
    `(cfw:face-disable             ((,class (:foreground ,base-dim))))
    `(cfw:face-today-title         ((,class (:background ,blue :weight bold))))
    `(cfw:face-today               ((,class (:background ,blue-bg :weight bold))))
    `(cfw:face-select              ((,class (:background ,magenta :weight bold))))
    `(cfw:face-toolbar             ((,class (:foreground ,base :background ,bg1))))
    `(cfw:face-toolbar-button-off  ((,class (:foreground ,base :weight bold))))
    `(cfw:face-toolbar-button-on   ((,class (:foreground ,base :weight bold))))

;;;;; cider
    `(cider-enlightened         ((,class      (:background nil :box (:color ,yellow :line-width -1 :style nil) :foreground ,yellow))))
    `(cider-enlightened-local   ((,class      (:foreground ,yellow))))
    `(cider-instrumented-face   ((,class      (:background nil :box (:color ,red :line-width -1 :style nil) :foreground ,red))))
    `(cider-result-overlay-face ((,class      (:background nil :box (:color ,blue :line-width -1 :style nil) :foreground ,blue))))
    `(cider-test-error-face     ((,class      (:background ,war :foreground ,bg1))))
    `(cider-test-failure-face   ((,class      (:background ,err :foreground ,bg1))))
    `(cider-test-success-face   ((,class      (:background ,suc :foreground ,bg1))))
    `(cider-traced-face         ((,class :box (:color ,cyan :line-width -1 :style nil))))

;;;;; company
    `(company-echo-common              ((,class (:background ,base :foreground ,bg1))))
    `(company-preview                  ((,class (:background ,ttip-bg :foreground ,ttip))))
    `(company-preview-common           ((,class (:background ,ttip-bg :foreground ,base))))
    `(company-preview-search           ((,class (:inherit match))))
    `(company-scrollbar-bg             ((,class (:background ,bg2))))
    `(company-scrollbar-fg             ((,class (:background ,act2))))
    `(company-template-field           ((,class (:inherit region))))
    `(company-tooltip                  ((,class (:background ,ttip-bg :foreground ,ttip))))
    `(company-tooltip-annotation       ((,class (:foreground ,type))))
    `(company-tooltip-common           ((,class (:background ,ttip-bg :foreground ,keyword))))
    `(company-tooltip-common-selection ((,class (:foreground ,base))))
    `(company-tooltip-mouse            ((,class (:inherit highlight))))
    `(company-tooltip-search           ((,class (:inherit match))))
    `(company-tooltip-selection        ((,class (:background ,ttip-sl :foreground ,base))))

;;;;; diff
    `(diff-added             ((,class :background ,green-bg-s :foreground ,green)))
    `(diff-changed           ((,class :background nil :foreground ,keyword)))
    `(diff-header            ((,class :background ,cblk-ln-bg :foreground ,func)))
    `(diff-file-header       ((,class :background ,cblk-ln-bg :foreground ,cblk)))
    `(diff-indicator-added   ((,class :background nil :foreground ,green)))
    `(diff-indicator-changed ((,class :background nil :foreground ,keyword)))
    `(diff-indicator-removed ((,class :background nil :foreground ,red)))
    `(diff-refine-added      ((,class :background ,green-bg :foreground ,bg4)))
    `(diff-refine-changed    ((,class :background ,keyword :foreground ,bg4)))
    `(diff-refine-removed    ((,class :background ,red-bg :foreground ,bg4)))
    `(diff-removed           ((,class :background ,red-bg-s :foreground ,red)))

;;;;; diff-hl
    `(diff-hl-change ((,class :background ,blue-bg :foreground ,blue)))
    `(diff-hl-delete ((,class :background ,red-bg :foreground ,red)))
    `(diff-hl-insert ((,class :background ,green-bg :foreground ,green)))

;;;;; dired
    `(dired-directory  ((,class (:foreground ,keyword :background ,bg1 :inherit bold))))
    `(dired-flagged    ((,class (:foreground ,red))))
    `(dired-header     ((,class (:foreground ,comp :inherit bold))))
    `(dired-ignored    ((,class (:inherit shadow))))
    `(dired-mark       ((,class (:foreground ,comp :inherit bold))))
    `(dired-marked     ((,class (:foreground ,magenta :inherit bold))))
    `(dired-perm-write ((,class (:foreground ,base :underline t))))
    `(dired-symlink    ((,class (:foreground ,var :background ,bg1 :inherit bold))))
    `(dired-warning    ((,class (:foreground ,war))))

;;;;; ediff
    `(ediff-current-diff-A        ((,class (:background ,red-bg-s :foreground ,red))))
    `(ediff-current-diff-Ancestor ((,class (:background ,aqua-bg :foreground ,aqua))))
    `(ediff-current-diff-B        ((,class (:background ,green-bg-s :foreground ,green))))
    `(ediff-current-diff-C        ((,class (:background ,blue-bg-s :foreground ,blue))))
    `(ediff-even-diff-A           ((,class (:background ,bg3))))
    `(ediff-even-diff-Ancestor    ((,class (:background ,bg3))))
    `(ediff-even-diff-B           ((,class (:background ,bg3))))
    `(ediff-even-diff-C           ((,class (:background ,bg3))))
    `(ediff-fine-diff-A           ((,class (:background ,red-bg :inherit bold))))
    `(ediff-fine-diff-Ancestor    ((,class (:background nil :inherit bold))))
    `(ediff-fine-diff-B           ((,class (:background ,green-bg :inherit bold))))
    `(ediff-fine-diff-C           ((,class (:background ,blue-bg :inherit bold))))
    `(ediff-odd-diff-A            ((,class (:background ,bg4))))
    `(ediff-odd-diff-Ancestor     ((,class (:background ,bg4))))
    `(ediff-odd-diff-B            ((,class (:background ,bg4))))
    `(ediff-odd-diff-C            ((,class (:background ,bg4))))

;;;;; ein
    `(ein:cell-input-area((,class (:background ,bg2))))
    `(ein:cell-input-prompt ((,class (:foreground ,suc))))
    `(ein:cell-output-prompt ((,class (:foreground ,err))))
    `(ein:notification-tab-normal ((,class (:foreground ,keyword))))
    `(ein:notification-tab-selected ((,class (:foreground ,suc :inherit bold))))

;;;;; eldoc
    `(eldoc-highlight-function-argument ((,class (:foreground ,mat :inherit bold))))

;;;;; elfeed
    `(elfeed-search-date-face ((,class (:foreground ,head2))))
    `(elfeed-search-feed-face ((,class (:foreground ,blue))))
    `(elfeed-search-tag-face ((,class (:foreground ,func))))
    `(elfeed-search-title-face ((,class (:foreground ,var))))
    `(elfeed-search-unread-title-face ((,class (:foreground ,base))))

;;;;; enh-ruby
    `(enh-ruby-op-face ((,class (:background ,bg1 :foreground ,base))))
    `(enh-ruby-string-delimiter-face ((,class (:foreground ,str))))

;;;;; erc
    `(erc-input-face ((,class (:foreground ,func))))
    `(erc-my-nick-face ((,class (:foreground ,keyword))))
    `(erc-nick-default-face ((,class (:foreground ,keyword))))
    `(erc-nick-prefix-face ((,class (:foreground ,yellow))))
    `(erc-notice-face ((,class (:foreground ,str))))
    `(erc-prompt-face ((,class (:foreground ,mat :inherit bold))))
    `(erc-timestamp-face ((,class (:foreground ,keyword))))

;;;;; eshell
    `(eshell-ls-archive ((,class (:foreground ,red :inherit bold))))
    `(eshell-ls-backup ((,class (:inherit font-lock-comment-face))))
    `(eshell-ls-clutter ((,class (:inherit font-lock-comment-face))))
    `(eshell-ls-directory ((,class (:foreground ,keyword :inherit bold))))
    `(eshell-ls-executable ((,class (:foreground ,suc :inherit bold))))
    `(eshell-ls-missing ((,class (:inherit font-lock-warning-face))))
    `(eshell-ls-product ((,class (:inherit font-lock-doc-face))))
    `(eshell-ls-special ((,class (:foreground ,yellow :inherit bold))))
    `(eshell-ls-symlink ((,class (:foreground ,var :inherit bold))))
    `(eshell-ls-unreadable ((,class (:foreground ,base))))
    `(eshell-prompt ((,class (:foreground ,keyword :inherit bold))))

;;;;; ESS
    `(ess-assignment-face ((,class (:foreground ,type :inherit bold))))
    `(ess-backquoted-face ((,class (:foreground ,var))))
    `(ess-constant-face ((,class (:inherit font-lock-constant-face))))
    `(ess-f-t-face ((,class (:inherit font-lock-constant-face))))
    `(ess-function-call-face ((,class (:foreground ,func))))
    `(ess-keyword-face ((,class (:inherit font-lock-keyword-face))))
    `(ess-matrix-face ((,class (:foreground ,base-dim))))
    `(ess-modifiers-face ((,class (:foreground ,keyword))))
    `(ess-numbers-face ((,class (:inherit font-lock-constant-face))))
    `(ess-operator-face ((,class (:foreground ,var))))
    `(ess-paren-face ((,class (:foreground ,blue))))
    `(ess-r-control-flow-keyword-face ((,class (:foreground ,keyword))))
    `(ess-r-signal-keyword-face ((,class (:foreground ,war))))

;;;;; evil
    `(evil-ex-substitute-matches ((,class (:background ,red-bg :foreground ,red))))
    `(evil-ex-substitute-replacement ((,class (:background ,green-bg :foreground ,green))))

;;;;; evil-goggles
    `(evil-goggles--pulse-face ((,class (:background ,yellow-bg :foreground ,yellow))))
    `(evil-goggles-change-face ((,class (:background ,blue-bg-s :foreground ,blue))))
    `(evil-goggles-commentary-face ((,class (:background ,aqua-bg :foreground ,aqua))))
    `(evil-goggles-delete-face ((,class (:background ,red-bg-s :foreground ,red))))
    `(evil-goggles-fill-and-move-face ((,class (:background ,green-bg-s :foreground ,green))))
    `(evil-goggles-indent-face ((,class (:background ,green-bg-s :foreground ,green))))
    `(evil-goggles-join-face ((,class (:background ,green-bg-s :foreground ,green))))
    `(evil-goggles-nerd-commenter-face ((,class (:background ,aqua-bg :foreground ,aqua))))
    `(evil-goggles-paste-face ((,class (:background ,green-bg-s :foreground ,green))))
    `(evil-goggles-record-macro-face ((,class (:background ,blue-bg-s :foreground ,blue))))
    `(evil-goggles-replace-with-register-face ((,class (:background ,yellow-bg :foreground ,yellow))))
    `(evil-goggles-set-marker-face ((,class (:background ,blue-bg-s :foreground ,blue))))
    `(evil-goggles-shift-face ((,class (:background ,blue-bg-s :foreground ,blue))))
    `(evil-goggles-surround-face ((,class (:background ,blue-bg-s :foreground ,blue))))
    `(evil-goggles-yank-face ((,class (:background ,blue-bg-s :foreground ,blue))))
    `(evil-goggles-undo-redo-add-face ((,class (:background ,green-bg-s :foreground ,green))))
    `(evil-goggles-undo-redo-change-face ((,class (:background ,blue-bg-s :foreground ,blue))))
    `(evil-goggles-undo-redo-remove-face ((,class (:background ,red-bg-s :foreground ,red))))

;;;;; flycheck
    `(flycheck-error
      ((,(append '((supports :underline (:style line))) class)
        (:underline (:style line :color ,err)))
       (,class (:foreground ,base :background ,err :inherit bold :underline t))))
    `(flycheck-error-list-checker-name ((,class (:foreground ,keyword))))
    `(flycheck-fringe-error ((,class (:foreground ,err :inherit bold))))
    `(flycheck-fringe-info ((,class (:foreground ,keyword :inherit bold))))
    `(flycheck-fringe-warning ((,class (:foreground ,war :inherit bold))))
    `(flycheck-info
      ((,(append '((supports :underline (:style line))) class)
        (:underline (:style line :color ,keyword)))
       (,class (:foreground ,base :background ,keyword :inherit bold :underline t))))
    `(flycheck-warning
      ((,(append '((supports :underline (:style line))) class)
        (:underline (:style line :color ,war)))
       (,class (:foreground ,base :background ,war :inherit bold :underline t))))

;;;;; flymake
    `(flymake-error ((,(append '((supports :underline (:style line))) class)
                      (:underline (:style line :color ,err)))
                     (,class (:foreground ,base :background ,err :inherit bold :underline t))))
    `(flymake-note ((,(append '((supports :underline (:style line))) class)
                     (:underline (:style wave :color ,keyword)))
                    (,class (:foreground ,base :background ,keyword :inherit bold :underline t))))
    `(flymake-warning ((,(append '((supports :underline (:style line))) class)
                        (:underline (:style line :color ,war)))
                       (,class (:foreground ,base :background ,war :inherit bold :underline t))))

;;;;; flyspell
    `(flyspell-incorrect ((,(append '((supports :underline (:style line))) class)
                           (:underline (:style wave :color ,war)))
                          (,class (:foreground ,base :background ,war :inherit bold :underline t))))
    `(flyspell-duplicate ((,(append '((supports :underline (:style line))) class)
                           (:underline (:style wave :color ,keyword)))
                          (,class (:foreground ,base :background ,keyword :inherit bold :underline t))))

;;;;; jabber
    `(jabber-activity-face ((,class (:inherit bold :foreground ,red))))
    `(jabber-activity-personal-face ((,class (:inherit bold :foreground ,blue))))
    `(jabber-chat-error ((,class (:inherit bold :foreground ,red))))
    `(jabber-chat-prompt-foreign ((,class (:inherit bold :foreground ,red))))
    `(jabber-chat-prompt-local ((,class (:inherit bold :foreground ,blue))))
    `(jabber-chat-prompt-system ((,class (:inherit bold :foreground ,green))))
    `(jabber-chat-text-foreign ((,class (:foreground ,base))))
    `(jabber-chat-text-local ((,class (:foreground ,base))))
    `(jabber-rare-time-face ((,class (:foreground ,green))))
    `(jabber-roster-user-away ((,class (:foreground ,yellow))))
    `(jabber-roster-user-chatty ((,class (:inherit bold :foreground ,green))))
    `(jabber-roster-user-dnd ((,class (:foreground ,red))))
    `(jabber-roster-user-error ((,class (:foreground ,err))))
    `(jabber-roster-user-offline ((,class (:foreground ,base))))
    `(jabber-roster-user-online ((,class (:inherit bold :foreground ,green))))
    `(jabber-roster-user-xa ((,class (:foreground ,aqua))))

;;;;; git
    `(git-commit-summary ((,class (:foreground ,base :inherit bold))))

;;;;; git-gutter-fr
    `(git-gutter-fr:added ((,class (:foreground ,green :inherit bold))))
    `(git-gutter-fr:deleted ((,class (:foreground ,war :inherit bold))))
    `(git-gutter-fr:modified ((,class (:foreground ,keyword :inherit bold))))

;;;;; git-timemachine
    `(git-timemachine-minibuffer-detail-face ((,class (:foreground ,blue :inherit bold :background ,blue-bg))))

;;;;; gnus
    `(gnus-cite-1 ((,class (:foreground ,green :background ,bg2))))
    `(gnus-cite-2 ((,class (:foreground ,blue :background ,bg2))))
    `(gnus-cite-3 ((,class (:foreground ,magenta :background ,bg2))))
    `(gnus-cite-4 ((,class (:foreground ,yellow :background ,bg2))))
    `(gnus-cite-5 ((,class (:foreground ,cyan :background ,bg2))))
    `(gnus-cite-6 ((,class (:foreground ,orange :background ,bg2))))
    `(gnus-cite-7 ((,class (:foreground ,aqua :background ,bg2))))
    `(gnus-emphasis-highlight-words ((,class (:background ,suc :foreground ,bg1))))
    `(gnus-header-content ((,class (:foreground ,str))))
    `(gnus-header-from ((,class (:foreground ,var))))
    `(gnus-header-name ((,class (:foreground ,comp))))
    `(gnus-header-subject ((,class (:foreground ,base :inherit bold))))
    `(gnus-summary-cancelled ((,class (:background ,war :foreground ,bg1))))
    `(message-header-content ((,class (:foreground ,str))))
    `(message-header-from ((,class (:foreground ,var))))
    `(message-header-to ((,class (:foreground ,var))))
    `(message-header-name ((,class (:foreground ,comp))))
    `(message-header-subject ((,class (:foreground ,base :inherit bold))))
    `(message-summary-cancelled ((,class (:background ,war :foreground ,bg1))))
    `(message-cited-text ((,class (:foreground ,green :background ,bg2))))

;;;;; guide-key
    `(guide-key/highlight-command-face ((,class (:foreground ,base))))
    `(guide-key/key-face ((,class (:foreground ,keyword))))
    `(guide-key/prefix-command-face ((,class (:foreground ,keyword :inherit bold))))

;;;;; helm
    `(helm-bookmark-directory ((,class (:inherit helm-ff-directory))))
    `(helm-bookmark-file ((,class (:foreground ,base))))
    `(helm-bookmark-gnus ((,class (:foreground ,comp))))
    `(helm-bookmark-info ((,class (:foreground ,comp))))
    `(helm-bookmark-man ((,class (:foreground ,comp))))
    `(helm-bookmark-w3m ((,class (:foreground ,comp))))
    `(helm-buffer-directory ((,class (:foreground ,base :background ,bg1))))
    `(helm-buffer-file ((,class (:foreground ,base :background ,bg1))))
    `(helm-buffer-not-saved ((,class (:foreground ,comp :background ,bg1))))
    `(helm-buffer-process ((,class (:foreground ,keyword :background ,bg1))))
    `(helm-buffer-saved-out ((,class (:foreground ,base :background ,bg1))))
    `(helm-buffer-size ((,class (:foreground ,base :background ,bg1))))
    `(helm-candidate-number ((,class (:background ,bg1 :foreground ,keyword :inherit bold))))
    `(helm-ff-directory ((,class (:foreground ,keyword :background ,bg1 :inherit bold))))
    `(helm-ff-dotted-directory ((,class (:foreground ,keyword :background ,bg1 :inherit bold))))
    `(helm-ff-dotted-symlink-directory ((,class (:foreground ,var :background ,bg1 :inherit bold))))
    `(helm-ff-executable ((,class (:foreground ,suc :background ,bg1 :weight normal))))
    `(helm-ff-file ((,class (:foreground ,base :background ,bg1 :weight normal))))
    `(helm-ff-invalid-symlink ((,class (:foreground ,err :background ,bg1 :inherit bold))))
    `(helm-ff-prefix ((,class (:foreground ,bg1 :background ,keyword :weight normal))))
    `(helm-ff-symlink ((,class (:foreground ,var :background ,bg1 :inherit bold))))
    `(helm-grep-cmd-line ((,class (:foreground ,base :background ,bg1))))
    `(helm-grep-file ((,class (:foreground ,base :background ,bg1))))
    `(helm-grep-finish ((,class (:foreground ,base :background ,bg1))))
    `(helm-grep-lineno ((,class (:foreground ,type :background ,bg1 :inherit bold))))
    `(helm-grep-match ((,class (:foreground nil :background nil :inherit helm-match))))
    `(helm-header ((,class (:foreground ,base :background ,bg1 :underline nil :box nil))))
    `(helm-header-line-left-margin ((,class (:foreground ,comp :background ,nil))))
    `(helm-match ((,class (:background ,head1-bg :foreground ,head1))))
    `(helm-match-item ((,class (:background ,head1-bg :foreground ,head1))))
    `(helm-moccur-buffer ((,class (:foreground ,var :background ,bg1))))
    `(helm-selection ((,class (:background ,highlight))))
    `(helm-selection-line ((,class (:background ,bg3))))
    `(helm-separator ((,class (:foreground ,comp :background ,bg1))))
    `(helm-source-header ((,class (:background ,head2 :foreground ,bg1 :inherit bold))))
    `(helm-time-zone-current ((,class (:foreground ,keyword :background ,bg1))))
    `(helm-time-zone-home ((,class (:foreground ,comp :background ,bg1))))
    `(helm-visible-mark ((,class (:foreground ,func :background ,bg3))))

;;;;; helm-swoop
    `(helm-swoop-target-line-block-face ((,class (:foreground ,base :background ,highlight))))
    `(helm-swoop-target-line-face ((,class (:background ,highlight))))
    `(helm-swoop-target-word-face ((,class (:background ,highlight :foreground ,mat))))

;;;;; highlights
    `(hi-green  ((,class (:foreground ,green :background ,green-bg))))
    `(hi-yellow ((,class (:foreground ,yellow :background ,yellow-bg))))

;;;;; highlight-indentation
    `(highlight-indentation-face ((,class (:background ,comment-bg))))

;;;;; highlight-symbol
    `(highlight-symbol-face ((,class (:background ,bg2))))

;;;;; hydra
    `(hydra-face-blue ((,class (:foreground ,blue))))
    `(hydra-face-red ((,class (:foreground ,red))))

;;;;; ido
    `(ido-first-match ((,class (:foreground ,comp :inherit bold))))
    `(ido-only-match ((,class (:foreground ,mat :inherit bold))))
    `(ido-subdir ((,class (:foreground ,keyword))))
    `(ido-vertical-match-face ((,class (:foreground ,comp :underline nil))))

;;;;; info
    `(info-header-xref ((,class (:foreground ,func :underline t))))
    `(info-menu ((,class (:foreground ,suc))))
    `(info-node ((,class (:foreground ,func :inherit bold))))
    `(info-quoted-name ((,class (:foreground ,keyword))))
    `(info-reference-item ((,class (:background nil :underline t :inherit bold))))
    `(info-string ((,class (:foreground ,str))))
    `(info-title-1 ((,class (:height 1.4 :inherit bold))))
    `(info-title-2 ((,class (:height 1.3 :inherit bold))))
    `(info-title-3 ((,class (:height 1.3))))
    `(info-title-4 ((,class (:height 1.2))))

;;;;; ivy
    `(ivy-current-match ((,class (:background ,highlight :inherit bold))))
    `(ivy-minibuffer-match-face-1 ((,class (:inherit bold))))
    `(ivy-minibuffer-match-face-2 ((,class (:foreground ,head1 :underline t))))
    `(ivy-minibuffer-match-face-3 ((,class (:foreground ,head4 :underline t))))
    `(ivy-minibuffer-match-face-4 ((,class (:foreground ,head3 :underline t))))
    `(ivy-remote ((,class (:foreground ,cyan))))

;;;;; latex
    `(font-latex-bold-face ((,class (:foreground ,comp))))
    `(font-latex-italic-face ((,class (:foreground ,keyword :italic t))))
    `(font-latex-match-reference-keywords ((,class (:foreground ,const))))
    `(font-latex-match-variable-keywords ((,class (:foreground ,var))))
    `(font-latex-sectioning-0-face ((,class (:inherit bold :foreground ,head3 :height ,(if humanoid-theme-org-height 1.3 1.0) :background ,(when humanoid-theme-org-highlight head3-bg)))))
    `(font-latex-sectioning-1-face ((,class (:inherit bold :foreground ,head4 :height ,(if humanoid-theme-org-height 1.3 1.0) :background ,(when humanoid-theme-org-highlight head4-bg)))))
    `(font-latex-sectioning-2-face ((,class (:inherit bold :foreground ,head1 :height ,(if humanoid-theme-org-height 1.3 1.0) :background ,(when humanoid-theme-org-highlight head1-bg)))))
    `(font-latex-sectioning-3-face ((,class (:inherit bold :foreground ,head2 :height ,(if humanoid-theme-org-height 1.2 1.0) :background ,(when humanoid-theme-org-highlight head2-bg)))))
    `(font-latex-sectioning-4-face ((,class (:bold nil :foreground ,head3 :height ,(if humanoid-theme-org-height 1.1 1.0) :background ,(when humanoid-theme-org-highlight head3-bg)))))
    `(font-latex-sectioning-5-face ((,class (:bold nil :foreground ,head4 :background ,(when humanoid-theme-org-highlight head4-bg)))))
    `(font-latex-string-face ((,class (:foreground ,str))))
    `(font-latex-warning-face ((,class (:foreground ,war))))

;;;;; ledger-mode
    `(ledger-font-directive-face ((,class (:foreground ,meta))))
    `(ledger-font-posting-amount-face ((,class (:foreground ,yellow))))
    `(ledger-font-posting-date-face ((,class (:foreground ,head1))))
    `(ledger-occur-xact-face ((,class (:background ,bg2))))

;;;;; linum-mode
    `(linum ((,class (:foreground ,lnum :background ,bg2 :inherit default))))

;;;;; line-numbers
    `(line-number ((,class (:foreground ,lnum :background ,bg2 :inherit default))))
    `(line-number-current-line ((,class (:foreground ,comment :background ,bg0 :inherit line-number))))

;;;;; linum-relative
    `(linum-relative-current-face ((,class (:foreground ,base))))

;;;;; magit
    `(magit-blame-culprit ((,class :background ,yellow-bg :foreground ,yellow)))
    `(magit-blame-date    ((,class :background ,yellow-bg :foreground ,green)))
    `(magit-blame-hash    ((,class :background ,yellow-bg :foreground ,func)))
    `(magit-blame-header  ((,class :background ,yellow-bg :foreground ,green)))
    `(magit-blame-heading ((,class :background ,yellow-bg :foreground ,green)))
    `(magit-blame-name    ((,class :background ,yellow-bg :foreground ,yellow)))
    `(magit-blame-sha1    ((,class :background ,yellow-bg :foreground ,func)))
    `(magit-blame-subject ((,class :background ,yellow-bg :foreground ,yellow)))
    `(magit-blame-summary ((,class :background ,yellow-bg :foreground ,yellow)))
    `(magit-blame-time    ((,class :background ,yellow-bg :foreground ,green)))
    `(magit-branch ((,class (:foreground ,const :inherit bold))))
    `(magit-branch-current ((,class (:background ,blue-bg :foreground ,blue :inherit bold :box t))))
    `(magit-branch-local ((,class (:background ,blue-bg :foreground ,blue :inherit bold))))
    `(magit-branch-remote ((,class (:background ,aqua-bg :foreground ,aqua :inherit bold))))
    `(magit-diff-added ((,class (:background ,green-bg-s :foreground ,green))))
    `(magit-diff-added-highlight ((,class (:background ,green-bg :foreground ,green))))
    `(magit-diff-removed ((,class (:background ,red-bg-s :foreground ,red))))
    `(magit-diff-removed-highlight ((,class (:background ,red-bg :foreground ,red))))
    `(magit-diff-context ((,class (:background ,bg1 :foreground ,base))))
    `(magit-diff-context-highlight ((,class (:background ,bg0 :foreground ,base))))
    `(magit-diff-hunk-heading ((,class (:background ,ttip-bg :foreground ,ttip))))
    `(magit-diff-hunk-heading-highlight ((,class (:background ,ttip-sl :foreground ,base))))
    `(magit-diffstat-added ((,class (:foreground ,green))))
    `(magit-diffstat-removed ((,class (:foreground ,red))))
    `(magit-hash ((,class (:foreground ,var))))
    `(magit-hunk-heading           ((,class (:background ,bg3))))
    `(magit-hunk-heading-highlight ((,class (:background ,bg3))))
    `(magit-item-highlight ((,class :background ,bg2)))
    `(magit-log-author ((,class (:foreground ,func))))
    `(magit-log-head-label-head ((,class (:background ,yellow :foreground ,bg1 :inherit bold))))
    `(magit-log-head-label-local ((,class (:background ,keyword :foreground ,bg1 :inherit bold))))
    `(magit-log-head-label-remote ((,class (:background ,suc :foreground ,bg1 :inherit bold))))
    `(magit-log-head-label-tags ((,class (:background ,magenta :foreground ,bg1 :inherit bold))))
    `(magit-log-head-label-wip ((,class (:background ,cyan :foreground ,bg1 :inherit bold))))
    `(magit-log-sha1 ((,class (:foreground ,str))))
    `(magit-process-ng ((,class (:foreground ,war :inherit bold))))
    `(magit-process-ok ((,class (:foreground ,func :inherit bold))))
    `(magit-reflog-amend ((,class (:foreground ,magenta))))
    `(magit-reflog-checkout ((,class (:foreground ,blue))))
    `(magit-reflog-cherry-pick ((,class (:foreground ,green))))
    `(magit-reflog-commit ((,class (:foreground ,green))))
    `(magit-reflog-merge ((,class (:foreground ,green))))
    `(magit-reflog-other ((,class (:foreground ,cyan))))
    `(magit-reflog-rebase ((,class (:foreground ,magenta))))
    `(magit-reflog-remote ((,class (:foreground ,cyan))))
    `(magit-reflog-reset ((,class (:foreground ,red))))
    `(magit-section-heading        ((,class (:foreground ,keyword :inherit bold))))
    `(magit-section-highlight      ((,class (:background ,bg2))))
    `(magit-section-title ((,class (:background ,bg1 :foreground ,keyword :inherit bold))))

;;;;; man
    `(Man-overstrike ((,class (:foreground ,head1 :inherit bold))))
    `(Man-reverse ((,class (:foreground ,highlight))))
    `(Man-underline ((,class (:foreground ,comp :underline t))))

;;;;; markdown
    `(markdown-header-face-1 ((,class (:inherit org-level-1))))
    `(markdown-header-face-2 ((,class (:inherit org-level-2))))
    `(markdown-header-face-3 ((,class (:inherit org-level-3))))
    `(markdown-header-face-4 ((,class (:inherit org-level-4))))
    `(markdown-header-face-5 ((,class (:inherit org-level-5))))
    `(markdown-header-face-6 ((,class (:inherit org-level-6))))
    `(markdown-table-face ((,class (:inherit org-table))))
    `(mmm-default-submode-face ((,class (:background ,bg2))))

;;;;; mode-line
    ;; `(mode-line           ((,class (:foreground ,base :background ,act1 :box nil :underline ,act2 :overline ,act2))))
    ;; `(mode-line-inactive  ((,class (:foreground ,base :background ,bg1  :box nil :underline ,act2 :overline ,act2))))
    ;; `(mode-line-buffer-id ((,class (:foreground ,base :weight normal))))
    ;; `(mode-line-highlight ((,class (:foreground ,base :background ,act1 :box nil))))

    `(mode-line           ((,class (:foreground ,base :background ,bg1 :box nil :underline nil))))
    `(mode-line-inactive  ((,class (:foreground ,base :background ,bg1  :box nil :underline nil))))
    `(mode-line-buffer-id ((,class (:foreground ,base :weight normal))))
    `(mode-line-highlight ((,class (:foreground ,base :background ,bg1 :box nil :underline nil))))

    ;; `(mode-line           ((,class (:foreground ,base :background ,act1 :box (:color ,border :line-width 1)))))
    ;; `(mode-line-buffer-id ((,class (:inherit bold :foreground ,func))))
    ;; `(mode-line-inactive  ((,class (:foreground ,base :background ,bg1  :box (:color ,border :line-width 1)))))

;;;;; mu4e
    `(mu4e-attach-number-face ((,class (:foreground ,var))))
    `(mu4e-cited-1-face ((,class (:foreground ,green :background ,bg2))))
    `(mu4e-cited-2-face ((,class (:foreground ,blue :background ,bg2))))
    `(mu4e-cited-3-face ((,class (:foreground ,magenta :background ,bg2))))
    `(mu4e-cited-4-face ((,class (:foreground ,cyan :background ,bg2))))
    `(mu4e-cited-5-face ((,class (:foreground ,orange :background ,bg2))))
    `(mu4e-cited-6-face ((,class (:foreground ,aqua :background ,bg2))))
    `(mu4e-cited-7-face ((,class (:foreground ,red :background ,bg2))))
    `(mu4e-contact-face ((,class (:foreground ,func))))
    `(mu4e-draft-face ((,class (:foreground ,comp))))
    `(mu4e-flagged-face ((,class (:foreground ,builtin :inherit bold))))
    `(mu4e-forwarded-face ((,class (:foreground ,const))))
    `(mu4e-header-highlight-face ((,class (:background ,act2))))
    `(mu4e-header-key-face ((,class (:foreground ,builtin :inherit bold))))
    `(mu4e-header-marks-face ((,class (:foreground ,var))))
    `(mu4e-header-title-face ((,class (:foreground ,base :inherit bold))))
    `(mu4e-header-value-face ((,class (:foreground ,str :inherit bold))))
    `(mu4e-highlight-face ((,class (:foreground ,comp))))
    `(mu4e-modeline-face ((,class (:foreground ,base))))
    `(mu4e-replied-face ((,class (:foreground ,str))))
    `(mu4e-special-header-value-face ((,class (:foreground ,mat))))
    `(mu4e-title-face ((,class (:foreground ,head1 :inherit bold))))
    `(mu4e-unread-face ((,class (:foreground ,func :inherit bold))))
    `(mu4e-view-url-number-face ((,class (:foreground ,comment))))

;;;;; mu4e-maildirs
    `(mu4e-maildirs-extension-maildir-hl-face ((,class (:foreground ,head1 :inherit bold))))

;;;;; notmuch
    `(notmuch-hello-logo-background ((,class (:background ,bg1))))
    `(notmuch-search-date ((,class (:foreground ,str))))
    `(notmuch-search-flagged-face ((,class (:foreground unspecified :underline nil))))
    `(notmuch-search-unread-face ((,class (:background ,cblk-bg :inherit bold :underline t))))
    `(notmuch-tag-face    ((,class (:foreground ,comment))))
    `(notmuch-tag-flagged ((,class (:foreground ,war))))
    `(notmuch-tag-unread  ((,class (:foreground ,func))))
    `(notmuch-tag-red     ((,class (:foreground ,red))))
    `(notmuch-tag-green   ((,class (:foreground ,green))))
    `(notmuch-tag-yellow  ((,class (:foreground ,yellow))))
    `(notmuch-tag-orange  ((,class (:foreground ,orange))))
    `(notmuch-tag-blue    ((,class (:foreground ,blue))))
    `(notmuch-tag-magenta ((,class (:foreground ,magenta))))
    `(notmuch-tag-aqua    ((,class (:foreground ,aqua))))
    `(notmuch-tag-cyan    ((,class (:foreground ,cyan))))
    `(notmuch-tag-gray    ((,class (:foreground ,base-dim))))

;;;;; neotree
    `(neo-dir-link-face ((,class (:foreground ,var :inherit bold))))
    `(neo-expand-btn-face ((,class (:foreground ,base))))
    `(neo-file-link-face ((,class (:foreground ,keyword))))
    `(neo-root-dir-face ((,class (:foreground ,func :inherit bold))))

;;;;; org
    `(org-agenda-clocking ((,class (:background ,highlight :foreground ,comp))))
    `(org-agenda-date ((,class (:foreground ,var :height ,(if humanoid-theme-org-agenda-height 1.1 1.0)))))
    `(org-agenda-date-today ((,class (:foreground ,keyword :inherit bold :height ,(if humanoid-theme-org-agenda-height 1.3 1.0)))))
    `(org-agenda-date-weekend ((,class (:inherit bold :foreground ,var))))
    `(org-agenda-done ((,class (:foreground ,suc :height ,(if humanoid-theme-org-agenda-height 1.2 1.0)))))
    `(org-agenda-structure ((,class (:inherit bold :foreground ,comp))))
    `(org-block ((,class (:background ,cblk-bg :foreground ,cblk))))
    `(org-block-begin-line ((,class (:background ,cblk-ln-bg :foreground ,cblk-ln))))
    `(org-block-end-line ((,class (:background ,cblk-ln-bg :foreground ,cblk-ln))))
    `(org-clock-overlay ((,class (:foreground ,comp))))
    `(org-code ((,class (:foreground ,cyan))))
    `(org-column ((,class (:background ,highlight))))
    `(org-column-title ((,class (:background ,highlight))))
    `(org-date ((,class (:underline t :foreground ,var))))
    `(org-date-selected ((,class (:background ,func :foreground ,bg1))))
    `(org-document-info-keyword ((,class (:foreground ,meta))))
    `(org-document-title ((,class (:foreground ,func :inherit bold :height ,(if humanoid-theme-org-height 1.4 1.0) :underline t))))
    `(org-done ((,class (:foreground ,suc :inherit bold :background ,green-bg))))
    `(org-ellipsis ((,class (:foreground ,keyword))))
    `(org-footnote  ((,class (:underline t :foreground ,base))))
    `(org-hide ((,class (:foreground ,base))))
    `(org-kbd ((,class (:inherit region :foreground ,base :box (:line-width 1 :style released-button)))))
    `(org-level-1 ((,class (:inherit bold :foreground ,head1 :height ,(if humanoid-theme-org-height 1.3 1.0) :background ,(when humanoid-theme-org-highlight head1-bg)))))
    `(org-level-2 ((,class (:inherit bold :foreground ,head2 :height ,(if humanoid-theme-org-height 1.2 1.0) :background ,(when humanoid-theme-org-highlight head2-bg)))))
    `(org-level-3 ((,class (:bold nil :foreground ,head3 :height ,(if humanoid-theme-org-height 1.1 1.0) :background ,(when humanoid-theme-org-highlight head3-bg)))))
    `(org-level-4 ((,class (:bold nil :foreground ,head4 :background ,(when humanoid-theme-org-highlight head4-bg)))))
    `(org-level-5 ((,class (:bold nil :foreground ,head5))))
    `(org-level-6 ((,class (:bold nil :foreground ,head1))))
    `(org-level-7 ((,class (:bold nil :foreground ,head2))))
    `(org-level-8 ((,class (:bold nil :foreground ,head3))))
    `(org-link ((,class (:inherit link))))
    `(org-meta-line ((,class (:foreground ,meta))))
    `(org-mode-line-clock-overrun ((,class (:foreground ,err))))
    `(org-priority ((,class (:foreground ,war :inherit bold))))
    `(org-quote ((,class (:inherit org-block :slant italic))))
    `(org-scheduled ((,class (:foreground ,comp))))
    `(org-scheduled-today ((,class (:foreground ,func :height ,(if humanoid-theme-org-agenda-height 1.2 1.0)))))
    `(org-scheduled-previously ((,class (:foreground ,base :slant italic))))
    `(org-sexp-date ((,class (:foreground ,base))))
    `(org-special-keyword ((,class (:foreground ,func))))
    `(org-table ((,class (:foreground ,base :background ,head1-bg))))
    `(org-tag ((,class (:foreground ,meta))))
    `(org-time-grid ((,class (:foreground ,str))))
    `(org-todo ((,class (:foreground ,war :inherit bold :background ,yellow-bg))))
    `(org-upcoming-deadline ((,class (:foreground ,war :inherit org-priority))))
    `(org-upcoming-distant-deadline ((,class (:foreground ,suc :inherit org-priority))))
    `(org-verbatim ((,class (:foreground ,keyword))))
    `(org-verse ((,class (:inherit org-block :slant italic))))
    `(org-warning ((,class (:foreground ,err :inherit org-priority))))

;;;;; outline
    `(outline-1 ((,class (:inherit org-level-1))))
    `(outline-2 ((,class (:inherit org-level-2))))
    `(outline-3 ((,class (:inherit org-level-3))))
    `(outline-4 ((,class (:inherit org-level-4))))
    `(outline-5 ((,class (:inherit org-level-5))))
    `(outline-6 ((,class (:inherit org-level-6))))
    `(outline-7 ((,class (:inherit org-level-7))))
    `(outline-8 ((,class (:inherit org-level-8))))

;;;;; perspective
    `(persp-selected-face ((,class (:inherit bold :foreground ,func))))

;;;;; popup
    `(popup-enu-selection-face ((,class (:background ,ttip-sl :foreground ,base))))
    `(popup-face ((,class (:background ,ttip-bg :foreground ,ttip))))
    `(popup-isearch-match ((,class (:inherit match))))
    `(popup-menu-face ((,class (:background ,ttip-bg :foreground ,base))))
    `(popup-menu-mouse-face ((,class (:inherit highlight))))
    `(popup-scroll-bar-background-face ((,class (:background ,bg2))))
    `(popup-scroll-bar-foreground-face ((,class (:background ,act2))))
    `(popup-tip-face ((,class (:background ,ttip-sl :foreground ,base :bold nil :italic nil :underline nil))))

;;;;; powerline
    `(powerline-active0 ((,class (:background ,bg1 :foreground ,base))))
    `(powerline-active1 ((,class (:background ,bg3 :foreground ,base))))
    `(powerline-active2 ((,class (:background ,bg2 :foreground ,base))))
    `(powerline-inactive0 ((,class (:background ,bg1 :foreground ,base-dim))))
    `(powerline-inactive1 ((,class (:background ,bg2 :foreground ,base-dim))))
    `(powerline-inactive2 ((,class (:background ,bg2 :foreground ,base-dim))))

;;;;; rainbow-blocks
    `(rainbow-blocks-depth-1-face ((,class (:foreground ,cyan))))
    `(rainbow-blocks-depth-2-face ((,class (:foreground ,yellow))))
    `(rainbow-blocks-depth-3-face ((,class (:foreground ,blue))))
    `(rainbow-blocks-depth-4-face ((,class (:foreground ,magenta))))
    `(rainbow-blocks-depth-5-face ((,class (:foreground ,green))))
    `(rainbow-blocks-depth-6-face ((,class (:foreground ,yellow))))
    `(rainbow-blocks-depth-7-face ((,class (:foreground ,blue))))
    `(rainbow-blocks-depth-8-face ((,class (:foreground ,magenta))))
    `(rainbow-blocks-depth-9-face ((,class (:foreground ,green))))
    `(rainbow-blocks-unmatched-face ((,class (:foreground ,red))))

;;;;; rainbow-delimiters
    `(rainbow-delimiters-depth-1-face ((,class (:foreground ,cyan))))
    `(rainbow-delimiters-depth-2-face ((,class (:foreground ,yellow))))
    `(rainbow-delimiters-depth-3-face ((,class (:foreground ,blue))))
    `(rainbow-delimiters-depth-4-face ((,class (:foreground ,magenta))))
    `(rainbow-delimiters-depth-5-face ((,class (:foreground ,green))))
    `(rainbow-delimiters-depth-6-face ((,class (:foreground ,yellow))))
    `(rainbow-delimiters-depth-7-face ((,class (:foreground ,blue))))
    `(rainbow-delimiters-depth-8-face ((,class (:foreground ,magenta))))
    `(rainbow-delimiters-depth-9-face ((,class (:foreground ,green))))
    `(rainbow-delimiters-depth-10-face ((,class (:foreground ,yellow))))
    `(rainbow-delimiters-depth-11-face ((,class (:foreground ,blue))))
    `(rainbow-delimiters-depth-12-face ((,class (:foreground ,magenta))))
    `(rainbow-delimiters-mismatched-face ((,class :foreground ,err :overline t :inverse-video t)))
    `(rainbow-delimiters-unmatched-face ((,class :foreground ,err :overline t)))

;;;;; rcirc
    `(rcirc-bright-nick ((,class (:background ,aqua-bg :foreground ,cyan))))
    `(rcirc-dim-nick ((,class (:foreground ,base-dim))))
    `(rcirc-keyword ((,class (:background ,green-bg-s :foreground ,green))))
    `(rcirc-timestamp ((,class (:foreground ,keyword))))
    `(rcirc-track-keyword ((,class (:background ,green :foreground ,bg1))))
    `(rcirc-url ((,class (:inherit link))))

;;;;; shell script
    `(sh-quoted-exec ((,class :foreground ,comp)))
    `(sh-heredoc ((,class :foreground ,war)))

;;;;; shm
    `(shm-current-face ((,class (:background ,green-bg-s))))
    `(shm-quarantine-face ((,class (:background ,red-bg-s))))

;;;;; show-paren
    `(show-paren-match ((,class (:foreground ,mat :inherit bold  :underline ,(when humanoid-theme-underline-parens t)))))
    `(show-paren-match-expression ((,class (:background ,green-bg-s))))
    `(show-paren-mismatch ((,class (:foreground ,err :inherit bold :underline ,(when humanoid-theme-underline-parens t)))))

;;;;; smartparens
    `(sp-pair-overlay-face ((,class (:background ,highlight :foreground nil))))
    `(sp-show-pair-match-face ((,class (:foreground ,mat :inherit bold  :underline ,(when humanoid-theme-underline-parens t)))))

;;;;; smerge
    `(smerge-base ((,class (:background ,yellow-bg))))
    `(smerge-markers ((,class (:background ,ttip-bg :foreground ,ttip))))
    `(smerge-mine ((,class (:background ,red-bg))))
    `(smerge-other ((,class (:background ,green-bg))))
    `(smerge-refined-added ((,class (:background ,green-bg-s :foreground ,green))))
    `(smerge-refined-changed ((,class (:background ,blue-bg-s :foreground ,blue))))
    `(smerge-refined-removed ((,class (:background ,red-bg-s :foreground ,red))))

;;;;; spaceline
    `(spaceline-evil-emacs ((,class (:background ,blue))))
    `(spaceline-evil-insert ((,class (:background ,green))))
    `(spaceline-evil-motion ((,class (:background ,purple))))
    `(spaceline-evil-normal ((,class (:foreground ,black :background ,yellow))))
    `(spaceline-evil-replace ((,class (:background ,orange))))
    `(spaceline-evil-visual ((,class (:background ,base-dim))))
    `(spaceline-flycheck-error  ((,class (:foreground ,err))))
    `(spaceline-flycheck-info   ((,class (:foreground ,keyword))))
    `(spaceline-flycheck-warning((,class (:foreground ,war))))
    `(spaceline-highlight-face ((,class (:foreground ,black :background ,yellow))))
    `(spaceline-modified ((,class (:foreground ,bg1 :background ,keyword))))
    `(spaceline-python-venv ((,class (:foreground ,comp))))
    `(spaceline-read-only ((,class (:background ,aqua))))
    `(spaceline-unmodified ((,class (:foreground ,base :background ,lnum))))
    `(spacemacs-emacs-face ((,class (:foreground ,bg1 :background ,blue))))
    `(spacemacs-evilified-face ((,class (:foreground ,bg1 :background ,type))))
    `(spacemacs-hybrid-face ((,class (:foreground ,bg1 :background ,cyan))))
    `(spacemacs-insert-face ((,class (:foreground ,bg1 :background ,green))))
    `(spacemacs-lisp-face ((,class (:foreground ,bg1 :background ,magenta))))
    `(spacemacs-motion-face ((,class (:foreground ,bg1 :background ,purple))))
    `(spacemacs-normal-face ((,class (:foreground ,black :background ,yellow))))
    `(spacemacs-replace-face ((,class (:foreground ,bg1 :background ,orange))))
    `(spacemacs-visual-face ((,class (:foreground ,bg1 :background ,base-dim))))

;;;;; spacemacs-specific
    `(spacemacs-transient-state-title-face ((,class (:background nil :foreground ,comp :box nil :inherit bold))))

;;;;; swiper
    `(swiper-line-face ((,class (:background ,highlight :inherit bold))))
    `(swiper-match-face-1 ((,class (:inherit bold))))
    `(swiper-match-face-2 ((,class (:foreground ,head1 :underline t))))
    `(swiper-match-face-3 ((,class (:foreground ,head4 :underline t))))
    `(swiper-match-face-4 ((,class (:foreground ,head3 :underline t))))

;;;;; tabbar
    `(tabbar-button ((,class (:inherit tabbar-default))))
    `(tabbar-button-highlight ((,class (:inherit tabbar-default))))
    `(tabbar-default ((,class (:background ,bg1 :foreground ,head1 :height 0.9))))
    `(tabbar-highlight ((,class (:underline t))))
    `(tabbar-selected ((,class (:inherit tabbar-default :foreground ,func :weight bold))))
    `(tabbar-separator ((,class (:inherit tabbar-default))))
    `(tabbar-unselected ((,class (:inherit tabbar-default :background ,bg1 :slant italic :weight light))))

;;;;; term
    `(term ((,class (:foreground ,base :background ,bg1))))
    `(term-color-black ((,class (:foreground ,black))))
    `(term-color-blue ((,class (:foreground ,blue))))
    `(term-color-cyan ((,class (:foreground ,cyan))))
    `(term-color-green ((,class (:foreground ,green))))
    `(term-color-magenta ((,class (:foreground ,magenta))))
    `(term-color-red ((,class (:foreground ,red))))
    `(term-color-white ((,class (:foreground ,white))))
    `(term-color-yellow ((,class (:foreground ,yellow))))

;;;;; tide
    `(tide-hl-identifier-face ((,class (:foreground ,yellow :background ,yellow-bg))))

;;;;; treemacs
    `(treemacs-git-added-face ((,class (:foreground ,green :background ,green-bg))))
    `(treemacs-git-conflict-face ((,class (:foreground ,red :background ,red-bg))))
    `(treemacs-git-ignored-face ((,class (:foreground ,yellow))))
    `(treemacs-git-modified-face ((,class (:foreground ,blue :background ,blue-bg))))
    `(treemacs-git-untracked-face ((,class (:foreground ,aqua :background ,aqua-bg))))

;;;;; web-mode
    `(web-mode-builtin-face ((,class (:inherit ,font-lock-builtin-face))))
    `(web-mode-comment-face ((,class (:inherit ,font-lock-comment-face))))
    `(web-mode-constant-face ((,class (:inherit ,font-lock-constant-face))))
    `(web-mode-current-element-highlight-face ((,class (:background ,bg3))))
    `(web-mode-doctype-face ((,class (:inherit ,font-lock-comment-face))))
    `(web-mode-function-name-face ((,class (:inherit ,font-lock-function-name-face))))
    `(web-mode-html-attr-name-face ((,class (:foreground ,func))))
    `(web-mode-html-attr-value-face ((,class (:foreground ,keyword))))
    `(web-mode-html-tag-face ((,class (:foreground ,keyword))))
    `(web-mode-keyword-face ((,class (:foreground ,keyword))))
    `(web-mode-string-face ((,class (:foreground ,str))))
    `(web-mode-symbol-face ((,class (:foreground ,type))))
    `(web-mode-type-face ((,class (:inherit ,font-lock-type-face))))
    `(web-mode-warning-face ((,class (:inherit ,font-lock-warning-face))))

;;;;; which-key
    `(which-key-command-description-face ((,class (:foreground ,base))))
    `(which-key-group-description-face ((,class (:foreground ,keyword))))
    `(which-key-key-face ((,class (:foreground ,func :inherit bold))))
    `(which-key-separator-face ((,class (:background nil :foreground ,str))))
    `(which-key-special-key-face ((,class (:background ,func :foreground ,bg1))))

;;;;; which-function-mode
    `(which-func ((,class (:foreground ,func))))

;;;;; whitespace-mode
    `(whitespace-empty ((,class (:background nil :foreground ,yellow))))
    `(whitespace-indentation ((,class (:background nil :foreground ,war))))
    `(whitespace-line ((,class (:background nil :foreground ,comp))))
    `(whitespace-newline ((,class (:background nil :foreground ,comp))))
    `(whitespace-space ((,class (:background nil :foreground ,act2))))
    `(whitespace-space-after-tab ((,class (:background nil :foreground ,yellow))))
    `(whitespace-space-before-tab ((,class (:background nil :foreground ,yellow))))
    `(whitespace-tab ((,class (:background nil :foreground ,act2))))
    `(whitespace-trailing ((,class (:background ,red-bg-s :foreground ,war))))

;;;;; other, need more work
    `(ac-completion-face ((,class (:underline t :foreground ,keyword))))
    `(escape-glyph ((,class (:foreground ,comment))))
    `(escape-glyph-face ((,class (:foreground ,comment))))
    `(ffap ((,class (:foreground ,base))))
    `(flx-highlight-face ((,class (:foreground ,comp :underline nil))))
    `(icompletep-determined ((,class :foreground ,keyword)))
    `(js2-external-variable ((,class (:foreground ,comp))))
    `(js2-function-param ((,class (:foreground ,const))))
    `(js2-jsdoc-html-tag-delimiter ((,class (:foreground ,str))))
    `(js2-jsdoc-html-tag-name ((,class (:foreground ,keyword))))
    `(js2-jsdoc-value ((,class (:foreground ,str))))
    `(js2-private-function-call ((,class (:foreground ,const))))
    `(js2-private-member ((,class (:foreground ,base))))
    `(js3-error-face ((,class (:underline ,war))))
    `(js3-external-variable-face ((,class (:foreground ,var))))
    `(js3-function-param-face ((,class (:foreground ,keyword))))
    `(js3-instance-member-face ((,class (:foreground ,const))))
    `(js3-jsdoc-tag-face ((,class (:foreground ,keyword))))
    `(js3-warning-face ((,class (:underline ,keyword))))
    `(slime-repl-inputed-output-face ((,class (:foreground ,comp))))
    `(trailing-whitespace ((,class :foreground nil :background ,err)))
    `(undo-tree-visualizer-current-face ((,class :foreground ,keyword)))
    `(undo-tree-visualizer-default-face ((,class :foreground ,base)))
    `(undo-tree-visualizer-register-face ((,class :foreground ,comp)))
    `(undo-tree-visualizer-unmodified-face ((,class :foreground ,var))))

   (custom-theme-set-variables
    theme-name

;;;;; ansi-color-names
    `(ansi-color-names-vector [,bg4 ,red ,green ,yellow ,blue ,magenta ,cyan ,base])

;;;;; hl-todo
    `(hl-todo-keyword-faces '(("TODO"   . ,comp)
                              ("NEXT"   . ,comp)
                              ("THEM"   . ,aqua)
                              ("PROG"   . ,blue)
                              ("OKAY"   . ,blue)
                              ("DONT"   . ,red)
                              ("FAIL"   . ,red)
                              ("DONE"   . ,suc)
                              ("NOTE"   . ,yellow)
                              ("KLUDGE" . ,yellow)
                              ("HACK"   . ,yellow)
                              ("TEMP"   . ,yellow)
                              ("FIXME"  . ,comp)
                              ("XXX"    . ,var)
                              ("XXXX"   . ,var)
                              ("???"    . ,var)))

;;;;; pdf-tools
    `(pdf-view-midnight-colors '(,base . ,bg1)))))



;;;;; autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide 'humanoid-common)

;; Local Variables:
;; mode: emacs-lisp
;; eval: (rainbow-mode t)
;; no-byte-compile: t
;; End:

;;; humanoid-common.el ends here
