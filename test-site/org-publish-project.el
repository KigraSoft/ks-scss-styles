
;; Org Publish Project Config

(setq org-html-htmlize-output-type "css")

(setq org-publish-project-alist
      '(
        ;;
        ("ksss-test-site-index"
         :base-directory "./"
         :publishing-function org-html-publish-to-html
         :publishing-directory "./html"
         :exclude "org"
         :include ("index.org")
         ;; Standard minimum config
         :section-numbers nil
         :with-toc nil
         :html-head ""
         :html-head-include-default-style nil
         :html-head-include-scripts nil
         :html-preamble nil
         :html-postamble nil
         :html-use-infojs nil
         :html-validation-link nil
         ;;
         :recursive nil
         :html-doctype "html5"
         :html-html5-fancy t
         :html-head-extra "\
<link rel=\"stylesheet\" type=\"text/css\" href=\"./style.css\"" 
         :html-postamble "\
<footer>
  Copyright (c) 2025
  Unless otherwise noted, all original content is licensed under
  <a href=\"https://creativecomons.org/licenses/by-nc-sa/4.0/\">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)</a>
  for text and
  <a href=\"https://www.gnu.org/licenses/gpl-3.0.html\">GNU General Public License Version 3.0 or later (GPL)</a>
  for code.
</footer>"
         )
        ;;
        ;;
        ("ksss-test-site-logs"
         :base-directory "./"
         :publishing-function org-html-publish-to-html
         :publishing-directory "./html"
         :exclude "index.org"
         ;; Standard minimum config
         :section-numbers nil
         :with-toc nil
         :html-head ""
         :html-head-include-default-style nil
         :html-head-include-scripts nil
         :html-preamble nil
         :html-postamble nil
         :html-use-infojs nil
         :html-validation-link nil
         ;;
         :recursive t
         :html-doctype "html5"
         :html-html5-fancy t
         :html-htmlize-output-type "css"
         :html-head-extra "\
<link rel=\"stylesheet\" type=\"text/css\" href=\"/style.css\""
         :auto-sitemap t
         :sitemap-style list
         :sitemap-title "Programmer Logs"
         :sitemap-filename "logs.org"
         :sitemap-sort-files anti-chronologically
         :html-preamble "\
<nav>
  <ul>
    <li><a href=\"/\">KigraSoft</a></li>
    <li><a href=\"/logs/logs.html\">Programmer Logs</a></li>
  </ul>
</nav>"
         :html-postamble "\
<footer>
  Copyright (c) 2025
  Unless otherwise noted, all original content is licensed under
  <a href=\"https://creativecomons.org/licenses/by-nc-sa/4.0/\">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)</a>
  for text and
  <a href=\"https://www.gnu.org/licenses/gpl-3.0.html\">GNU General Public License Version 3.0 or later (GPL)</a>
  for code.
</footer>"
         :preparation-function (lambda (project-plist)
                                 (message "type %s" org-html-htmlize-output-type))
         )
        ;;
        ;;
        ("org-scss-test"
         :base-directory "../scss"
         :base-extension "css"
         :publishing-function org-publish-attachment
         :publishing-directory "./html"
         :recursive t
         :preparation-function (lambda (project-plist)
                                 (message "%s" (plist-get project-plist :base-directory))
                                 (call-process "sass" nil nil nil
                                               (expand-file-name
                                                (plist-get project-plist :base-directory)))
                                 (message "type %s" org-html-htmlize-output-type)
                                 ))
        ))



