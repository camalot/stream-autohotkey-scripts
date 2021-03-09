#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance, Force
; #Warn  ; Enable warnings to as>sist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

LPARAM = %1%

if not LPARAM {
  LPARAM := 30 ; DEFAULT HOW_LONG if not set
}

HOW_LONG := LPARAM * 1000

; The total number of filters
MAX_FILTERS = 30

DEFAULT_HK = ! ; ALT
MODIFIER_HK = ; NONE

; These are the FKeys used for the hotkeys F13-F22
; I dont use F23-F24 because they are used for discord

Keys := [13, 14, 15, 16, 17, 18, 19, 20, 21, 22]

KeyLen := Keys.Length()
Random, choice, 1, %MAX_FILTERS%
; currently supports up to 20 filters
; 10 with ! modifier ALT
; 10 with !+ modifiers ALT + SHIFT
; 10 with !+^ modifiers ALT + SHIFT + CTRL
if  (choice > Keys.Length())
{
  choice := choice - Keys.Length()
  if (choice <= Keys.Length() ) {
    MODIFIER_HK = + ;
  } else {
    choice := choice - Keys.Length()
    MODIFIER_HK = +^
  }
}

key := Keys[choice]

; send hotkey to enable
Send, %DEFAULT_HK%%MODIFIER_HK%{F%key%}
; wait for %HOW_LONG%
Sleep, %HOW_LONG%
; send hotket to disable
Send, %DEFAULT_HK%%MODIFIER_HK%{F%key%}

ExitApp