1.  Download AHK @ https://autohotkey.com
2. Install.
3. Save the script at the bottom of this page as wooting.ahk with file type "All files"  (Or download it from the repository)
4. Edit in your bind for crouch
5. Test your delay @ https://apexmovement.tech/superglidetrainer/
6. Edit delay if needed in SleepSleep()





;.AHK SCRIPT STARTS BELOW THIS LINE
;#############################################################




; Wooting script by mkos @ http://solo.to/mkos
; Version 1.0
; Test @ https://apexmovement.tech/superglidetrainer/ 



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
}
Return




;#############################################################
;SCRIPT ENDS ABOVE THIS LINE












#########################

LICENSE
#########################

License This project is licensed under the MIT License. See the LICENSE file for details.

Support If you encounter any problems or have any questions, please open an issue on GitHub. 

Alternatively, you can open a ticket or post in #questions on the r5reloaded discord @ http://discord.gg/r5reloaded

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), 

to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,

and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 

INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,

FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.

IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, 

DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 

ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
