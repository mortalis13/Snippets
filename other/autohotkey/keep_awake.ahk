;Prevents PC from sleeping, virtually toggles ScrollLock every 10 min

#Persistent
SetTimer, Key, 600000

Key:
    Send, {ScrollLock}
    Sleep, 100
    Send, {ScrollLock}
Return
