Sub AddShortcut()
    Application.OnKey "^q", "DeleteSheet"
End Sub

Sub DeleteSheet()
  Application.DisplayAlerts = False
  ActiveSheet.Delete
  Application.DisplayAlerts = True
End Sub
