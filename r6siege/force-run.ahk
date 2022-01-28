#SingleInstance, Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

LPARAM = %1%

if not LPARAM {
  LPARAM = 5 ; DEFAULT HOW_LONG if not set
}
HOW_LONG := LPARAM * 1000 ;

If WinExist("ahk_class R6Game") 
  or WinExist("ahk_exe PortalWars-Win64-Shipping.exe") {
  WinActivate
  Send, {LShift down}
  Sleep, %HOW_LONG%
  Send, {LShift up}
}
ExitApp