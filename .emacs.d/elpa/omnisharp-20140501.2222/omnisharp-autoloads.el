;;; omnisharp-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (omnisharp-fix-code-issue-at-point omnisharp-check-ready-status
;;;;;;  omnisharp-check-alive-status omnisharp-start-omnisharp-server
;;;;;;  omnisharp-mode) "omnisharp" "omnisharp.el" (21347 35328 0
;;;;;;  0))
;;; Generated autoloads from omnisharp.el

(autoload 'omnisharp-mode "omnisharp" "\
Omnicompletion (intellisense) and more for C# using an OmniSharp
server backend.

\(fn &optional ARG)" t nil)

(autoload 'omnisharp-start-omnisharp-server "omnisharp" "\
Starts an OmniSharpServer for a given solution

\(fn SOLUTION)" nil nil)

(autoload 'omnisharp-check-alive-status "omnisharp" "\
Shows a message to the user describing whether the
OmniSharpServer process specified in the current configuration is
alive.
\"Alive\" means it is running and not stuck. It also means the connection
to the server is functional - I.e. The user has the correct host and
port specified.

\(fn)" t nil)

(autoload 'omnisharp-check-ready-status "omnisharp" "\
Shows a message to the user describing whether the
OmniSharpServer process specified in the current configuration has
finished loading the solution.

\(fn)" t nil)

(autoload 'omnisharp-fix-code-issue-at-point "omnisharp" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("omnisharp-pkg.el") (21347 35328 401517
;;;;;;  0))

;;;***

(provide 'omnisharp-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; omnisharp-autoloads.el ends here
