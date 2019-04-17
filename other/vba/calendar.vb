Sub CreateCalendar()
  var_month = 1
  var_year = 2015
  
  showGrid = 1
  adjustPrint = 1
  
  startRow = 2
  startCol = 3
  
  monr = startRow
  monc = startCol
  
  dayr = startRow + 2
  dayc = startCol
  
  
  firstRow = startRow
  firstCol = startCol - 1
  
  monthRows = 3
  monthCols = 4
  
  rowSeparators = 0 * (monthRows - 1)
  colSeparators = 2 * (monthCols - 1)
  
  lastRow = firstRow + 8 * monthRows - 1 + rowSeparators
  lastCol = firstCol + 7 * monthCols + colSeparators + (startCol - firstCol)
  
  
  var_headerFormat = "mmmm"
  
  ' ----------------------------------------------
  
  Application.ScreenUpdating = False
  Cells.ClearContents
  
  For i = 1 To 3
    For j = 1 To 4
      DateString = CStr(var_month) & "-" & CStr(var_year)
      StartDay = DateValue(DateString)
      
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
      
      With Range(Cells(monr + 1, monc - 1), Cells(monr + 1, monc + 6 + 1)).Interior
          .ColorIndex = 15
          .Pattern = xlSolid
          .PatternColorIndex = xlAutomatic
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
      
      Range(Cells(monr, monc + 7), Cells(monr, monc + 8)).ColumnWidth = 2
      
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
    Next j
    
    monr = monr + 8
    monc = startCol
    dayr = dayr + 8
    dayc = startCol
  Next i

  
  '************************************************** Format Environment **********************************
  
  Range(Cells(1, startCol - 1), Cells(1, startCol - 1)).ColumnWidth = 2
  
  Set var_yearCell = Range(Cells(startRow - 1, firstCol), Cells(startRow - 1, firstCol))
  var_yearCell.Value = var_year
  
  With Range(Cells(startRow - 1, firstCol), Cells(startRow - 1, lastCol))
      .HorizontalAlignment = xlCenterAcrossSelection
      .VerticalAlignment = xlCenter
      .Font.Size = 16
      .Font.Bold = True
      .RowHeight = 30
  End With
  
  ActiveWindow.Zoom = 85
  
  
  '************************************************** Grid **********************************
  
  If showGrid = 1 Then
    
    ' Set var_wholeRange = Range("A1", "AI24")
    Set var_wholeRange = Range(Cells(firstRow, firstCol), Cells(lastRow, lastCol))
    
    var_wholeRange.Borders(xlEdgeLeft).LineStyle = xlContinuous
    var_wholeRange.Borders(xlEdgeLeft).Weight = xlThin
    var_wholeRange.Borders(xlEdgeTop).LineStyle = xlContinuous
    var_wholeRange.Borders(xlEdgeTop).Weight = xlThin
    var_wholeRange.Borders(xlEdgeRight).LineStyle = xlContinuous
    var_wholeRange.Borders(xlEdgeRight).Weight = xlThin
    var_wholeRange.Borders(xlEdgeBottom).LineStyle = xlContinuous
    var_wholeRange.Borders(xlEdgeBottom).Weight = xlThin
    
    
    For i = 1 To monthCols - 1
      row1 = firstRow
      row2 = lastRow
      col = firstCol + i * (6 + 2) + i - 1                                  ' correct the offset (now it's harcoded, doesn't depend on separator columns count)
      
      ' Set var_columnRange = Range("H1", "H24")
      Set var_columnRange = Range(Cells(row1, col), Cells(row2, col))
      
      var_columnRange.Borders(xlEdgeRight).LineStyle = xlContinuous
      var_columnRange.Borders(xlEdgeRight).Weight = xlThin
    Next i
    
    
    For i = 1 To monthRows - 1
      col1 = firstCol
      col2 = lastCol
      borderRow = firstRow + i * 7 + i - 1                                            ' correct row offsets too
      
      ' Set var_rowRange1 = Range("A8", "AI8")
      Set var_rowRange = Range(Cells(borderRow, col1), Cells(borderRow, col2))
      
      var_rowRange.Borders(xlEdgeBottom).LineStyle = xlContinuous
      var_rowRange.Borders(xlEdgeBottom).Weight = xlThin
    Next i
  End If
  
  
  '************************************************** Print Properties **********************************
  
  If adjustPrint = 1 Then
    With ActiveSheet.PageSetup
          .LeftHeader = ""
          .CenterHeader = ""
          .RightHeader = ""
          .LeftFooter = ""
          .CenterFooter = ""
          .RightFooter = ""
          .LeftMargin = Application.CentimetersToPoints(0.5)
          .RightMargin = Application.CentimetersToPoints(0.5)
          .TopMargin = Application.InchesToPoints(0)
          .BottomMargin = Application.InchesToPoints(0)
          .HeaderMargin = Application.InchesToPoints(0)
          .FooterMargin = Application.InchesToPoints(0)
          .PrintHeadings = False
          .PrintGridlines = False
          .PrintComments = xlPrintNoComments
          .PrintQuality = 600
          .CenterHorizontally = True
          .CenterVertically = True
          .Orientation = xlLandscape
          .Draft = False
          .PaperSize = xlPaperA4
          .FirstPageNumber = xlAutomatic
          .Order = xlDownThenOver
          .BlackAndWhite = False
          .Zoom = False
          .FitToPagesWide = 1
          .FitToPagesTall = 1
          .PrintErrors = xlPrintErrorsDisplayed
    End With
    ActiveWindow.View = xlPageBreakPreview
    ActiveWindow.Zoom = 85
    
    ActiveSheet.PageSetup.PrintArea = Range(Cells(firstRow, firstCol), Cells(lastRow, lastCol)).Address
  End If
  
  ActiveWindow.DisplayGridlines = False
  ActiveWindow.WindowState = xlMaximized
  ActiveWindow.ScrollRow = 1
  Application.ScreenUpdating = True
  
End Sub

