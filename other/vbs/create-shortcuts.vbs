set wsc=WScript.CreateObject("WScript.Shell")
scPath=wsc.SpecialFolders("startmenu") & "\shortcuts"
runPath="z:\progs\run"
progsPath="z:\progs"
passPath="z:\progs\run\2-vbs\pass"

'--------------------------------------------------------------------------------------------------------------
set fso=CreateObject("Scripting.FileSystemObject")
if not fso.folderexists(scPath) then
 fso.CreateFolder(scPath)
end if

WScript.Sleep 1000

'  ------------------------------------------------------ pass ------------------------------------------------
Set lnk = wsc.CreateShortcut(scPath & "\sb.lnk")
lnk.targetpath = passPath & "\sb.vbs"
lnk.workingdirectory = passPath 
lnk.hotkey="ctrl+alt+1"
lnk.save

'  ------------------------------------------------------ progs ------------------------------------------------
Set lnk = wsc.CreateShortcut(scPath & "\firefox.lnk")
lnk.targetpath = progsPath & "\FirefoxPortable4_0\FirefoxPortable.exe"
lnk.workingdirectory = progsPath & "\FirefoxPortable4_0" 
lnk.hotkey="ctrl+alt+f"
lnk.save

Set lnk = wsc.CreateShortcut(scPath & "\thunderbird1.5.lnk")
lnk.targetpath = progsPath & "\ThunderbirdPortable 1.5\ThunderbirdPortable.exe"
lnk.workingdirectory = progsPath & "\ThunderbirdPortable 1.5" 
lnk.hotkey="ctrl+alt+t"
lnk.save

Set lnk = wsc.CreateShortcut(scPath & "\notepad.lnk")
lnk.targetpath = "notepad"
lnk.workingdirectory = "%windir%"
lnk.hotkey="shift+alt+1"
lnk.save

Set lnk = wsc.CreateShortcut(scPath & "\calculator.lnk")
lnk.targetpath = "calc"
lnk.workingdirectory = "%windir%"
lnk.hotkey="shift+alt+2"
lnk.save

Set lnk = wsc.CreateShortcut(scPath & "\word.lnk")
lnk.targetpath = "c:\program files\microsoft office\office11\winword.exe"
lnk.workingdirectory = "c:\program files\microsoft office\office11"
lnk.hotkey="ctrl+alt+w"
lnk.save

Set lnk = wsc.CreateShortcut(scPath & "\excel.lnk")
lnk.targetpath = "c:\program files\microsoft office\office11\excel.exe"
lnk.workingdirectory = "c:\program files\microsoft office\office11"
lnk.hotkey="ctrl+alt+e"
lnk.save

Set lnk = wsc.CreateShortcut(scPath & "\paint.lnk")
lnk.targetpath = progsPath & "\mspaint"
lnk.workingdirectory = progsPath
lnk.hotkey="ctrl+alt+p"
lnk.save

'  ------------------------------------------------------ adds ------------------------------------------------
Set lnk = wsc.CreateShortcut(scPath & "\mydocs.lnk")
lnk.targetpath = "z:"
lnk.workingdirectory = "z:"
lnk.hotkey="shift+alt+3"
lnk.save

Set lnk = wsc.CreateShortcut(scPath & "\shutdown.lnk")
lnk.targetpath = runPath & "\1-bat\shutdown.bat"
lnk.workingdirectory = "C:\Windows\system32"
lnk.hotkey="shift+alt+q"
lnk.save
