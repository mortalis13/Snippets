Set objHTML = CreateObject("htmlfile")
ClipboardText = objHTML.ParentWindow.ClipboardData.GetData("text")

msgbox "Text from Clipboard: "&ClipboardText
