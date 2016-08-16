Set WshShell = WScript.CreateObject("WScript.Shell") 
WScript.Sleep 500
WshShell.SendKeys "name"
WshShell.SendKeys "{tab}"
WshShell.SendKeys "pass"

WScript.Sleep 500
'WshShell.SendKeys "{enter}"