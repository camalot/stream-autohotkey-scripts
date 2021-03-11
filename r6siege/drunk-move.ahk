#SingleInstance, Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

LPARAM = %1%

Keys := [ "W", "A", "S", "D", "Q", "E" ]
KeyLen := Keys.Length()

if not LPARAM {
  LPARAM = 30 ; DEFAULT HOW_LONG if not set
}
HOW_LONG := LPARAM * 1000 ;
REMAIN_TIME = 0 ;
; If WinExist("ahk_exe notepad2.exe") {
If WinExist("ahk_class R6Game") 
    or WinExist("ahk_exe RogueCompany.exe") {
  WinActivate
  Loop {
    Random, choice, 1, %KeyLen% ;
    Random, timeLen, 1, 6 ;
    cKey := Keys[choice]
    ; MsgBox, %cKey%
    delay := 250 * timeLen ;
    Send, {%cKey% down}
    Sleep, %delay% ;
    Send, {%cKey% up}
    REMAIN_TIME += %delay%
  } Until  (REMAIN_TIME > HOW_LONG)
}
ExitApp