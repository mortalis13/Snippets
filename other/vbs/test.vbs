
Set objHTML = CreateObject("htmlfile")
ClipboardText = objHTML.ParentWindow.ClipboardData.GetData("text")

res=ClipboardText
start=InStrRev(res,"/")
name=Right(res,Len(res)-start)

msgbox "Name: " & res
