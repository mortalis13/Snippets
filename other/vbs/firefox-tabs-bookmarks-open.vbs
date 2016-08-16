Set WshShell = WScript.CreateObject("WScript.Shell") 
WScript.Sleep 10000

'********************************* Basic, Portal login ***********************************************
wshShell.SendKeys "{tab}"
WshShell.SendKeys "{enter}"
WshShell.SendKeys "^{tab}"
WScript.Sleep 2000
WshShell.SendKeys "{enter}"

'********************************* Open Basic Bookmarks ***********************************************

'  ------- new tab in new window --------
WScript.Sleep 1000
WshShell.SendKeys "^t"
WshShell.SendKeys "{tab}"
WshShell.SendKeys "{tab}"
WshShell.SendKeys "+{f10}"

WScript.Sleep 500
for i=1 to 3
 WshShell.SendKeys "{down}"
next
WshShell.SendKeys "{enter}"

'  ------- open bookmarks from the last folder (***Basic***) --------
WScript.Sleep 500
WshShell.SendKeys "%"
for i=1 to 3
 WshShell.SendKeys "{left}"
next

for i=1 to 5
 WshShell.SendKeys "{down}"
next

WshShell.SendKeys "{right}"
WshShell.SendKeys "{up}"
WshShell.SendKeys "{right}"
WshShell.SendKeys "{up}"

WScript.Sleep 500
WshShell.SendKeys "{enter}"

'  ------- open bookmarks from the **AddFiles** folder --------
WScript.Sleep 1000
WshShell.SendKeys "^t"
WScript.Sleep 500

WshShell.SendKeys "%"
for i=1 to 3
 WshShell.SendKeys "{left}"
next

for i=1 to 5
 WshShell.SendKeys "{down}"
next

WshShell.SendKeys "{right}"
WshShell.SendKeys "{up}"
WshShell.SendKeys "{up}"
WshShell.SendKeys "{right}"
WshShell.SendKeys "{up}"

WScript.Sleep 500
WshShell.SendKeys "{enter}"

WScript.Sleep 3000

'  ------- close empty tabs and go the second tab (transactions problems) --------
WshShell.AppActivate "Mozilla"
WScript.Sleep 500

for i=1 to 2
 WScript.Sleep 500
 WshShell.SendKeys "^w"
next
WScript.Sleep 500
WshShell.SendKeys "^2"

'  ------- open new window for forum tabs --------
WScript.Sleep 500
WshShell.SendKeys "^t"
WshShell.SendKeys "{tab}"
WshShell.SendKeys "{tab}"
WshShell.SendKeys "+{f10}"

WScript.Sleep 500
for i=1 to 3
 WshShell.SendKeys "{down}"
next
WshShell.SendKeys "{enter}"