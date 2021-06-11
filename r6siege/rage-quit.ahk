#SingleInstance, Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

If WinExist("ahk_class R6Game") or WinExist("ahk_exe HuntGame.exe") or WinExists("ahk_exe Game.exe") {
  WinActivate
  Send, {LAlt down}{F4 down}
  Sleep, 20
  Send, {LAlt up}{F4 up}
}
ExitApp