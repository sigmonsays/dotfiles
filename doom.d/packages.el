;; need to find better salt support; disable this
;; I am keeping there enabled just for snippets
;; (package! salt-mode)

;; (package! ef-themes)

; jq-mode https://github.com/ljos/jq-mode
(package! jq-mode
  :recipe (:host github :repo "ljos/jq-mode" ))

;;(package! undo-tree)
(package! go-add-tags)
(package! org-recoll)

(package! restclient
  :recipe (:host github :repo "pashky/restclient.el" ))
(package! ob-restclient
  :recipe (:host github :repo "alf/ob-restclient.el" ))

(package! ibuffer-vc
  :recipe (:host github :repo "purcell/ibuffer-vc" ))

;;(package! org-super-agenda)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)

; https://github.com/ardumont/markdown-toc
(package! markdown-toc
  :recipe (:host github :repo "ardumont/markdown-toc" ))

(package! csv-mode)

; https://github.com/isdamir/ps-ccrypt
;; (package! ps-ccrypt
;;   :recipe (:host github :repo "isdamir/ps-ccrypt" ))

; https://github.com/hlissner/doom-emacs/blob/develop/docs/getting_started.org#usingloading-local-packages
;; (use-package ps-ccrypt
;;   :load-path "extra/ps-ccrypt")
