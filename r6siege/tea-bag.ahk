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
ExitApp
