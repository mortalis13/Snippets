path "c:\program files\7-zip"
set extName=test.xpi
set sourcePath=C:\1-Roman\Documents\extensions\new1\work\my-panel
set buildPath=C:\1-Roman\Documents\extensions\output\%extName%

del %buildPath%
7z a %buildPath% %sourcePath%\*
rem pause