omnisharp-emacs is a port of the awesome OmniSharp server to the
Emacs text editor. It provides IDE-like features for editing files
in C# solutions in Emacs, provided by an OmniSharp server instance
that works in the background.

See the project home page for more information.

Work in progress! Judge gently!
(require 'json)
(with-no-warnings
  (require 'cl))
(require 'files)
(require 'ido)
(require 'thingatpt)
(require 'dash)
(require 'compile)
(require 'dired)
(require 'popup)
(require 'etags)
(require 'flycheck)
(require 'auto-complete)

(defgroup omnisharp ()
  "Omnisharp-emacs is a port of the awesome OmniSharp server to
the Emacs text editor. It provides IDE-like features for editing
files in C# solutions in Emacs, provided by an OmniSharp server
instance that works in the background."
  :group 'external
  :group 'csharp)
