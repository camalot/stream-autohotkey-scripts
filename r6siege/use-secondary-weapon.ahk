#SingleInstance, Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

If WinExist("ahk_class R6Game") {
  WinActivate
  Send, {2 down}
  Sleep 20
  Send, {2 up}
}
ExitApp