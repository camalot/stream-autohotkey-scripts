#SingleInstance, Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

If WinExist("ahk_class R6Game") or WinExist("ahk_exe RogueCompany.exe") or WinExist("ahk_exe HuntGame.exe") or WinExist("ahk_exe Game.exe") {
  WinActivate
  Send, {2 down}
  Sleep 30
  Send, {2 up}
}
ExitApp
