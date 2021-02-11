#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

HOW_LONG := 30 * 1000

If WinExist("ahk_class R6Game") {
  WinActivate
  DllCall("SwapMouseButton",int,true) ; false
  Sleep, %HOW_LONG% ;
  DllCall("SwapMouseButton",int,false) ;
}

ExitApp