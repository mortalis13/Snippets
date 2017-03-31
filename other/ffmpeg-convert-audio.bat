echo off
set in_dir=c:\src
set out_dir=c:\res

set in_dir=c:\1-Datos\Docs\3-desc\2-other\music\Apocalyptica - 2016 - Plays Metallica By Four Cellos (Remastered) [FLAC] [CD]
set out_dir=c:\1-Datos\Docs\3-desc\2-other\music\2016 - Plays Metallica By Four Cellos (Remastered)_1

for %%a in ("%in_dir%\*.flac") do (
  rem echo "%%~na.flac"
  rem fm -hide_banner -i "%%a" -c:v libx264 -crf 26 -bf 2 -vf yadif=0:0:0 -c:a libmp3lame -b:a 128k "%out_dir%\%%~na.mp4"
  fm -hide_banner -y -i "%%a" -c:a libmp3lame -b:a 320k -map_metadata 0 -id3v2_version 3 "%out_dir%\%%~na.mp3"
)
pause
