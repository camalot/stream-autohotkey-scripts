#SingleInstance, Force
#WinActivateForce
SendMode Input
SetWorkingDir, %A_ScriptDir%

LOOP_COUNT = 15
;Rainbow Six
If WinExist("ahk_class R6Game") {
  WinActivate
  Loop, %LOOP_COUNT% {
    Send, {c down}
    Sleep, 100
    Send, {c up}
  }
}
ExitApp