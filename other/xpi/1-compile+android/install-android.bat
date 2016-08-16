set extName=test.xpi
set buildPath=C:\1-Roman\Documents\extensions\output\%extName%

adb push %buildPath% /mnt/sdcard/1-Install
adb shell am start -a android.intent.action.VIEW -c android.intent.category.DEFAULT -d file:///mnt/sdcard/1-Install/test.xpi -n org.mozilla.firefox/.App