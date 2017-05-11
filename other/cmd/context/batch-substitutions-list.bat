@echo off

rem Run the script from a directory/file context menu to check the arguments
rem To create a context menu for this .bat use the cmd/batch-context.reg file (or search for "Batch file in directory context menu")
rem The list is from the C:/Windows/Help/ntcmds.chm => 'for' comand (or search for Command Line Reference if no .chm file)

echo call_dir %cd%

echo ~1 %~1
echo ~f1 %~f1
echo ~d1 %~d1
echo ~p1 %~p1
echo ~n1 %~n1
echo ~x1 %~x1
echo ~s1 %~s1
echo ~a1 %~a1
echo ~t1 %~t1
echo ~z1 %~z1

echo ~dp1 %~dp1
echo ~nx1 %~nx1
echo ~fs1 %~fs1
echo ~ftza1 %~ftza1

pause
