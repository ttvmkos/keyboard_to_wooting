; Wooting script by mkos @ http://solo.to/mkos
; Version 1.0
; Test @ https://apexmovement.tech/superglidetrainer/ 
; DISCLAIMER
; THIS script AS IS only sets a delay to a single keypress, emulating wooting keyboard actuation points
; Your set delay = increases / decreases your actuation point. 


; PERFORMANCE SETTINGS
#NoEnv
#HotkeyModifierTimeout -1
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
#MaxThreadsPerHotkey 9000
ListLines Off
Process, Priority, , Realtime
SetBatchLines, -1
SetKeyDelay, -1, -1
SetWinDelay, -1
SetControlDelay, -1
SendMode Input


; PERFORMANCE TIMER SETTINGS
SleepSleep(s)
{
    SetBatchLines, -1

    DllCall("QueryPerformanceFrequency", "Int64*", freq)
    DllCall("QueryPerformanceCounter", "Int64*", CounterBefore)
    
    While (((counterAfter - CounterBefore) / freq * 1000) < s)
        DllCall("QueryPerformanceCounter", "Int64*", CounterAfter)

    return ((counterAfter - CounterBefore) / freq * 1000) 
}


; BIND CONFIG

$c:: ;change the letter c to YOUR crouch key bind
KeyIsHeldDown := false
Critical
SetTimer, KeyCheck, 5 ; Time in ms to check if key is held down
SleepSleep(6) ; | ADJUST THIS FOR YOUR DELAY | https://apexmovement.tech/superglidetrainer/ |
SendInput {c Down} ; | change c to your key |
Return

KeyCheck:
if (GetKeyState("c", "P")) ; | change c to your key |
{
    KeyIsHeldDown := true
}
else
{
    SetTimer, KeyCheck, off ; 
    if (!KeyIsHeldDown) ; 
    {
        SendInput {c Up} ; | change c to your key |
    }
    SendInput {c Up} ; ; | change c to your key |
}
Return
