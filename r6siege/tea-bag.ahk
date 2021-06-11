#SingleInstance, Force
#WinActivateForce
SendMode Input
SetWorkingDir, %A_ScriptDir%
LPARAM = %1%

if not LPARAM {
  LPARAM = 15 ; DEFAULT LOOP_COUNT if not set
}

LOOP_COUNT := LPARAM

; MsgBox, %LOOP_COUNT%
If WinExist("ahk_class R6Game") {
  WinActivate
  Loop, %LOOP_COUNT% {
    Send, {c down}
    Sleep, 30
    Send, {c up}
    Sleep, 100
  }
}

; MsgBox, %LOOP_COUNT%
If WinExist("ahk_class R6Game") 
   or WinExist("ahk_exe RogueCompany.exe")
   or WinExist("ahk_exe HuntGame.exe") 
   or WinExists("ahk_exe Game.exe") {
  WinActivate
  Loop, %LOOP_COUNT% {
    Send, {LControl down}
    Sleep, 30
    Send, {LControl up}
    Sleep, 100
  }
}

If WinExist("ahk_exe DeadByDaylight.exe") {
  WinActivate
  Loop, %LOOP_COUNT% {
    Send, {z down}
    Sleep, 30
    Send, {z up}
    Sleep, 100
  }
}

ExitApp
