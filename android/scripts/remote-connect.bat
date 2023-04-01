rem == Execute from the device
rem su
rem setprop service.adb.tcp.port 5555
rem stop adbd
rem start adbd
rem
rem or create a script 'q'
rem sh q

set IP=
adb connect %IP%:5555
