#SingleInstance, Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

LPARAM = %1%

if not LPARAM {
  LPARAM = 60 ; DEFAULT HOW_LONG if not set (in milliseconds)
}

HOW_LONG := LPARAM

If WinExist("ahk_class R6Game") or WinExist("ahk_exe RogueCompany.exe"){
  WinActivate
  ; make sure the mouse buttons are not swapped, as this wont work if it is
  DllCall("SwapMouseButton",int,false) ;
  Send {lbutton down}
  Sleep, %HOW_LONG%
  Send {lbutton up}
}
ExitApp