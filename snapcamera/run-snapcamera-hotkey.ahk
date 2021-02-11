#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance, Force
; #Warn  ; Enable warnings to as>sist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

MAX_FILTERS = 16
DEFAULT_HK = !
MODIFIER_HK =
delay = 30000

Keys := [13, 14, 15, 16, 17, 18, 19, 20, 21, 22]
; Keys := ["A", "B", "C", "D", "E", "F", "AA", "BB", "CC", "DD", "EE", "FF", "AAA", "BBB", "CCC", "DDD", "EEE", "FFF"]
KeyLen := Keys.Length()
Random, choice, 1, %MAX_FILTERS%
if  (choice > Keys.Length())
{
  MODIFIER_HK = +
  choice := choice - Keys.Length()
}

key := Keys[choice]

Send, %DEFAULT_HK%%MODIFIER_HK%{F%key%}
Sleep, %delay%
Send, %DEFAULT_HK%%MODIFIER_HK%{F%key%}

ExitApp