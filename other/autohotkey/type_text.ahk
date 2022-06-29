;Types a text

; Ctrl+Alt+E
^!e::SendInput an_email

; Alternative
^!e::
  Clipboard = an_email
  Sleep 20
  Send ^v
Return
