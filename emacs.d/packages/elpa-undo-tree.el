;; Generate a traversable undo history for files
(use-package undo-tree
    :ensure t
    :delight undo-tree-mode
    :bind (
        ("C-x u" . undo-tree-visualize)
    )
    :config (progn
        (setq undo-tree-auto-save-history t)
        (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/_undotree")))
        (global-undo-tree-mode 1)
    )
)

(provide 'elpa-undo-tree)
