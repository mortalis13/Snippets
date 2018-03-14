#include <MsgBoxConstants.au3>

; AutoIt 3 script to export WAV from GuitarPro 6 and close all tabs
; Press Esc to terminate script, Pause/Break to "pause"

Global $Paused

;HotKeySet("^{PAUSE}", "TogglePause")
;HotKeySet("^!d", "Terminate")

HotKeySet("^{PAUSE}", "Terminate")
HotKeySet("{F7}", "ExportGPXNext")
HotKeySet("{F8}", "ExportGPX")
HotKeySet("^+w", "CloseAll")

;;;; Body of program would go here ;;;;
While 1
    Sleep(100)
WEnd
;;;;;;;;

Func TogglePause()
    $Paused = NOT $Paused
    While $Paused
        sleep(100)
        ToolTip('Script is "Paused"',0,0)
    WEnd
    ToolTip("")
EndFunc

Func Terminate()
    Exit 0
EndFunc

Func ShowMessage()
    MsgBox(4096,"","This is a message.")
EndFunc

Func ExportGPXNext()
  Send("^{tab}")
  Sleep(100)

  ExportGPX()
EndFunc

Func ExportGPX()
  Send("{lalt}")

  Send("{down 2}")
  Send("{down 2}")
  Send("{down 2}")
  Send("{down 2}")
  Send("{down 2}")

  Send("{right}")
  Send("{up 3}")
  
  Sleep(100)
  Send("{enter}")
  Sleep(500)
  Send("{enter}")
EndFunc

Func CloseAll()
  Sleep(100)

  Send("^{w 2}")
  Sleep(100)
  Send("^{w 2}")
  Sleep(100)
  Send("^{w 2}")
  Sleep(100)
  Send("^{w 2}")
  Sleep(100)
  Send("^{w 2}")
  
  Sleep(100)
EndFunc
