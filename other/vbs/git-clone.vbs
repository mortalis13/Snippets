
Set objHTML = CreateObject("htmlfile")
ClipboardText = objHTML.ParentWindow.ClipboardData.GetData("text")

'msgbox ClipboardText

' Copy git URL and run this script
' Repository will be downloaded to the 'path/[repositoryName]' folder

path="C:\1-Roman\Documents\2-down\"

res=ClipboardText
start=InStrRev(res,"/")
name=Right(res,Len(res)-start)

clonePath=path & name

'com="cmd /k cd /d " & path
com="cmd /c git clone " & ClipboardText & " " & clonePath & " & pause"

'msgbox com

Set objShell = WScript.CreateObject("WScript.Shell")
objShell.Run (com)
