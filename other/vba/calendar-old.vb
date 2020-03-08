Sub CalendarMaker()
  mon = 8
  yr = 2013
  
  monr = 1
  monc = 1
  
  dayr = 3
  dayc = 1
  
  Range("a1:af30").Clear
  
  MyInput = "08-2013"
  StartDay = DateValue(MyInput)
  
  
  
  If Day(StartDay) <> 1 Then
      StartDay = DateValue(Month(StartDay) & "/1/" & _
          Year(StartDay))
  End If
  
For i = 1 To 3
  For j = 1 To 4
    MyInput = CStr(mon) & "-" & CStr(yr)
    StartDay = DateValue(MyInput)
    
    Range(Cells(monr, monc), Cells(monr, monc)).NumberFormat = "mmmm-yy"
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
    
    Range(Cells(monr, monc), Cells(monr, monc)).Value = Application.Text(MyInput, "mmmm yyyy")
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
    
  '**************************************
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
  
    If mon = 12 Then
      Range(Cells(monr, monc + 7), Cells(monr + 7, monc + 7)).Interior.Color = RGB(100, 100, 100)
    End If
    
    monc = monc + 8
    dayc = dayc + 8
    mon = mon + 1
    If mon = 13 Then
      mon = 1
      yr = yr + 1
    End If
  Next j
  
  monr = monr + 9
  monc = 1
  dayr = dayr + 9
  dayc = 1
Next i

 ' If Range("A13").Value = "" Then Range("A13").Offset(0, 0) _
     .Resize(2, 8).EntireRow.Delete
  ActiveWindow.DisplayGridlines = False

  ActiveWindow.WindowState = xlMaximized
  ActiveWindow.ScrollRow = 1

  Application.ScreenUpdating = True
  Exit Sub
End Sub

Sub CreateCalendar1()
  mon = 1
  yr = 2015
  
  monr = 1
  monc = 1
  
  dayr = 3
  dayc = 1
  
  Range("a1:af30").Clear
  
  MyInput = "08-2013"
  StartDay = DateValue(MyInput)
  
  
  If Day(StartDay) <> 1 Then
      StartDay = DateValue(Month(StartDay) & "/1/" & Year(StartDay))
  End If
  
  
  For i = 1 To 3
    For j = 1 To 4
      MyInput = CStr(mon) & "-" & CStr(yr)
      StartDay = DateValue(MyInput)
      
      Range(Cells(monr, monc), Cells(monr, monc)).NumberFormat = "mmmm-yy"
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
      
      Range(Cells(monr, monc), Cells(monr, monc)).Value = Application.Text(MyInput, "mmmm yyyy")
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
      
    '**************************************
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
      mon = mon + 1
      If mon = 13 Then
        mon = 1
        yr = yr + 1
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
  Exit Sub
End Sub

Sub CalendarMakerOriginal()
  Range("a1:g14").Clear
  
  MyInput = "08-01-2013"
  StartDay = DateValue(MyInput)
  If Day(StartDay) <> 1 Then
      StartDay = DateValue(Month(StartDay) & "/1/" & _
          Year(StartDay))
  End If
  
  Range("a1").NumberFormat = "mmmm yyyy"
  'Range("a1").NumberFormat = "[$-340A]dddd, dd" de "mmmm" de "yyyy""
  With Range("a1:g1")
      .HorizontalAlignment = xlCenterAcrossSelection
      .VerticalAlignment = xlCenter
      .Font.Size = 12
      .Font.Bold = True
      .RowHeight = 25
  End With
  
  With Range("a2:g2")
      .ColumnWidth = 5
      .VerticalAlignment = xlCenter
      .HorizontalAlignment = xlCenter
      .VerticalAlignment = xlCenter
      .Orientation = xlHorizontal
      .Font.Size = 12
      .Font.Bold = True
      .RowHeight = 20
  End With
  
  Range("a2") = "Mon"
  Range("b2") = "Tue"
  Range("c2") = "Wed"
  Range("d2") = "Thu"
  Range("e2") = "Fri"
  Range("f2") = "Sat"
  Range("g2") = "Sun"
  
  With Range("a3:g7")
      .HorizontalAlignment = xlRight
      .VerticalAlignment = xlTop
      .Font.Size = 14
      '.Font.Bold = True
      .RowHeight = 25
  End With
  
  Range("a1").Value = Application.Text(MyInput, "mmmm yyyy")
  DayofWeek = Weekday(StartDay, 2)
  CurYear = Year(StartDay)
  CurMonth = Month(StartDay)
  FinalDay = DateSerial(CurYear, CurMonth + 1, 1)
  
  Select Case DayofWeek
      Case 1
          Range("a3").Value = 1
      Case 2
          Range("b3").Value = 1
      Case 3
          Range("c3").Value = 1
      Case 4
          Range("d3").Value = 1
      Case 5
          Range("e3").Value = 1
      Case 6
          Range("f3").Value = 1
      Case 7
          Range("g3").Value = 1
  End Select
  
  For Each cell In Range("a3:g8")
      RowCell = cell.Row
      ColCell = cell.Column
      
      If cell.Column = 1 And cell.Row = 3 Then
      ElseIf cell.Column <> 1 Then
          If cell.Offset(0, -1).Value >= 1 Then
              cell.Value = cell.Offset(0, -1).Value + 1
              If cell.Value > (FinalDay - StartDay) Then
                  cell.Value = ""
                  Exit For
              End If
          End If
      ElseIf cell.Row > 3 And cell.Column = 1 Then
          cell.Value = cell.Offset(-1, 6).Value + 1
          If cell.Value > (FinalDay - StartDay) Then
              cell.Value = ""
              Exit For
          End If
      End If
  Next

  If Range("A13").Value = "" Then Range("A13").Offset(0, 0) _
     .Resize(2, 8).EntireRow.Delete
  ActiveWindow.DisplayGridlines = False

  ActiveWindow.WindowState = xlMaximized
  ActiveWindow.ScrollRow = 1

  Application.ScreenUpdating = True
  Exit Sub
End Sub
