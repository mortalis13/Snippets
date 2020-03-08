
' Blank calendar

Sub CreateCalendar1()
  var_month = 1
  var_year = 2015
  
  monr = 1
  monc = 1
  
  dayr = 3
  dayc = 1
  
  var_headerFormat = "mmmm"
  
  ' ----------------------------------------------
  
  Cells.ClearContents
  
  For i = 1 To 3
    For j = 1 To 4
      DateString = CStr(var_month) & "-" & CStr(var_year)
      StartDay = DateValue(DateString)
      
      Dim var_monthCell As Range
      Set var_monthCell = Range(Cells(monr, monc), Cells(monr, monc))
      
      var_monthCell.NumberFormat = var_headerFormat
      
      With Range(Cells(monr, monc), Cells(monr, monc + 6))
          .HorizontalAlignment = xlCenterAcrossSelection
          .VerticalAlignment = xlCenter
          .Font.Size = 12
          .Font.Bold = True
          .RowHeight = 25
      End With
      
      With Range(Cells(monr + 1, monc), Cells(monr + 1, monc + 7))
          .ColumnWidth = 5
          .VerticalAlignment = xlCenter
          .HorizontalAlignment = xlCenter
          .VerticalAlignment = xlCenter
          .Orientation = xlHorizontal
          .Font.Size = 12
          .Font.Bold = True
          .RowHeight = 20
      End With
      
      Range(Cells(monr + 1, monc), Cells(monr + 1, monc)) = "Mon"
      Range(Cells(monr + 1, monc + 1), Cells(monr + 1, monc + 1)) = "Tue"
      Range(Cells(monr + 1, monc + 2), Cells(monr + 1, monc + 2)) = "Wed"
      Range(Cells(monr + 1, monc + 3), Cells(monr + 1, monc + 3)) = "Thu"
      Range(Cells(monr + 1, monc + 4), Cells(monr + 1, monc + 4)) = "Fri"
      Range(Cells(monr + 1, monc + 5), Cells(monr + 1, monc + 5)) = "Sat"
      Range(Cells(monr + 1, monc + 6), Cells(monr + 1, monc + 6)) = "Sun"
      
      With Range(Cells(dayr, dayc), Cells(dayr + 5, dayc + 6))
          .HorizontalAlignment = xlRight
          .VerticalAlignment = xlTop
          .Font.Size = 14
          .RowHeight = 25
      End With
      
      var_monthCell.Value = Application.Text(DateString, "mmmm yyyy")
      var_monthCell.Value = Application.Proper(var_monthCell.Text)          ' "=PROPER(TEXT(" & var_cellAddress & ",""mmmm""))"
      
      DayofWeek = Weekday(StartDay, 2)
      CurYear = Year(StartDay)
      CurMonth = Month(StartDay)
      FinalDay = DateSerial(CurYear, CurMonth + 1, 1)
      
      Select Case DayofWeek
          Case 1
              Cells(dayr, dayc).Value = 1
          Case 2
              Cells(dayr, dayc + 1).Value = 1
          Case 3
              Cells(dayr, dayc + 2).Value = 1
          Case 4
              Cells(dayr, dayc + 3).Value = 1
          Case 5
              Cells(dayr, dayc + 4).Value = 1
          Case 6
              Cells(dayr, dayc + 5).Value = 1
          Case 7
              Cells(dayr, dayc + 6).Value = 1
      End Select
      
      
    '************************************** day numbers *****
    
      For Each cell In Range(Cells(dayr, dayc), Cells(dayr + 5, dayc + 6))
        RowCell = cell.Row
        ColCell = cell.Column
        
        If cell.Column = dayc And cell.Row = dayr Then
        ElseIf cell.Column <> dayc Then
            If cell.Offset(0, -1).Value >= 1 Then
                cell.Value = cell.Offset(0, -1).Value + 1
                If cell.Value > (FinalDay - StartDay) Then
                    cell.Value = ""
                    Exit For
                End If
            End If
        ElseIf cell.Row > dayr And cell.Column = dayc Then
            cell.Value = cell.Offset(-1, 6).Value + 1
            If cell.Value > (FinalDay - StartDay) Then
                cell.Value = ""
                Exit For
            End If
        End If
      Next
      
    '*****************************************
    
      monc = monc + 8
      dayc = dayc + 8
      var_month = var_month + 1
      
      If var_month = 13 Then
        var_month = 1
        var_year = var_year + 1
      End If
    Next j
    
    monr = monr + 9
    monc = 1
    dayr = dayr + 9
    dayc = 1
  Next i

  ActiveWindow.DisplayGridlines = False
  ActiveWindow.WindowState = xlMaximized
  ActiveWindow.ScrollRow = 1
  Application.ScreenUpdating = True
  
End Sub

' With two column-separators and no row-separators
' To use with borders

Sub CreateCalendar2()
  var_month = 1
  var_year = 2015
  
  monr = 1
  monc = 1
  
  dayr = 3
  dayc = 1
  
  var_headerFormat = "mmmm"
  
  ' ----------------------------------------------
  
  Cells.ClearContents
  
  For i = 1 To 3
    For j = 1 To 4
      DateString = CStr(var_month) & "-" & CStr(var_year)
      StartDay = DateValue(DateString)
      
      Dim var_monthCell As Range
      Set var_monthCell = Range(Cells(monr, monc), Cells(monr, monc))
      
      var_monthCell.NumberFormat = var_headerFormat
      
      ' Month name
      
      With Range(Cells(monr, monc), Cells(monr, monc + 6))
          .HorizontalAlignment = xlCenterAcrossSelection
          .VerticalAlignment = xlCenter
          .Font.Size = 12
          .Font.Bold = True
          .RowHeight = 25
      End With
      
      ' Day names
      
      With Range(Cells(monr + 1, monc), Cells(monr + 1, monc + 6))
          .ColumnWidth = 5
          .VerticalAlignment = xlCenter
          .HorizontalAlignment = xlCenter
          .VerticalAlignment = xlCenter
          .Orientation = xlHorizontal
          .Font.Size = 12
          .Font.Bold = True
          .RowHeight = 20
      End With
      
      Range(Cells(monr + 1, monc), Cells(monr + 1, monc)) = "Mon"
      Range(Cells(monr + 1, monc + 1), Cells(monr + 1, monc + 1)) = "Tue"
      Range(Cells(monr + 1, monc + 2), Cells(monr + 1, monc + 2)) = "Wed"
      Range(Cells(monr + 1, monc + 3), Cells(monr + 1, monc + 3)) = "Thu"
      Range(Cells(monr + 1, monc + 4), Cells(monr + 1, monc + 4)) = "Fri"
      Range(Cells(monr + 1, monc + 5), Cells(monr + 1, monc + 5)) = "Sat"
      Range(Cells(monr + 1, monc + 6), Cells(monr + 1, monc + 6)) = "Sun"
      
      ' Day numbers
      
      With Range(Cells(dayr, dayc), Cells(dayr + 5, dayc + 6))
          .HorizontalAlignment = xlRight
          .VerticalAlignment = xlTop
          .Font.Size = 14
          .RowHeight = 25
      End With
      
      ' Vertical spacer
      
      With Range(Cells(monr, monc + 7), Cells(monr, monc + 8))
          .ColumnWidth = 2
      End With
      
      
      var_monthCell.Value = Application.Text(DateString, "mmmm yyyy")
      var_monthCell.Value = Application.Proper(var_monthCell.Text)          ' "=PROPER(TEXT(" & var_cellAddress & ",""mmmm""))"
      
      DayofWeek = Weekday(StartDay, 2)
      CurYear = Year(StartDay)
      CurMonth = Month(StartDay)
      FinalDay = DateSerial(CurYear, CurMonth + 1, 1)
      
      Select Case DayofWeek
          Case 1
              Cells(dayr, dayc).Value = 1
          Case 2
              Cells(dayr, dayc + 1).Value = 1
          Case 3
              Cells(dayr, dayc + 2).Value = 1
          Case 4
              Cells(dayr, dayc + 3).Value = 1
          Case 5
              Cells(dayr, dayc + 4).Value = 1
          Case 6
              Cells(dayr, dayc + 5).Value = 1
          Case 7
              Cells(dayr, dayc + 6).Value = 1
      End Select
      
      
    '************************************** day numbers *****
    
      For Each cell In Range(Cells(dayr, dayc), Cells(dayr + 5, dayc + 6))
        RowCell = cell.Row
        ColCell = cell.Column
        
        If cell.Column = dayc And cell.Row = dayr Then
        ElseIf cell.Column <> dayc Then
            If cell.Offset(0, -1).Value >= 1 Then
                cell.Value = cell.Offset(0, -1).Value + 1
                If cell.Value > (FinalDay - StartDay) Then
                    cell.Value = ""
                    Exit For
                End If
            End If
        ElseIf cell.Row > dayr And cell.Column = dayc Then
            cell.Value = cell.Offset(-1, 6).Value + 1
            If cell.Value > (FinalDay - StartDay) Then
                cell.Value = ""
                Exit For
            End If
        End If
      Next
      
    '*****************************************
    
      monc = monc + 9
      dayc = dayc + 9
      var_month = var_month + 1
      
      If var_month = 13 Then
        var_month = 1
        var_year = var_year + 1
      End If
    Next j
    
    monr = monr + 8
    monc = 1
    dayr = dayr + 8
    dayc = 1
  Next i

  ActiveWindow.DisplayGridlines = False
  ActiveWindow.WindowState = xlMaximized
  ActiveWindow.ScrollRow = 1
  Application.ScreenUpdating = True
  
End Sub
