#SingleInstance, Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

HOW_LONG := 5 * 1000

If WinExist("ahk_class R6Game") {
  WinActivate
  Send, {LAlt down}
  Sleep %HOW_LONG%
  Send, {LAlt up}
}
ExitApp