#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

LPARAM = %1%

if not LPARAM {
  LPARAM = 30 ; DEFAULT HOW_LONG if not set
}

HOW_LONG := %LPARAM% * 1000

If WinExist("ahk_class R6Game") {
  WinActivate
  DllCall("SwapMouseButton",int,true) ; false
  Sleep, %HOW_LONG% ;
  DllCall("SwapMouseButton",int,false) ;
}

ExitApp