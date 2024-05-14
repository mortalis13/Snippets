; Additional mouse keys, mapped to page up/down with initial delay and repeated action after

#NoTrayicon

;XButton1::PgDn
;XButton2::PgUp

XButton1::
{
  Send "{PgDn Down}"
  Sleep 300
  While GetKeyState("XButton1", "P")
  {
    Send "{PgDn Down}"
    Sleep 100
  }
}

XButton2::
{
  Send "{PgUp Down}"
  Sleep 300
  While GetKeyState("XButton2", "P")
  {
    Send "{PgUp Down}"
    Sleep 100
  }
}
