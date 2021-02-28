#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

LPARAM = %1%

if not LPARAM {
  LPARAM = 10 ; DEFAULT HOW_LONG if not set
}
HOW_LONG := LPARAM * 1000 ;

SysGet, Primary, MonitorPrimary
SysGet, Mon, Monitor, %Primary%
; Settings:
width:=MonRight        ; Width of picture.
height:=MonBottom      ; Height of picture.
pictureNames:=["./bsod.png"]	      ; Pictures names, put them in the same folder as this script

pictureNamesLen := pictureNames.Length()
Random, choice, 1, %pictureNamesLen% ;

; Creates the overlay
Gui, -caption -ToolWindow +HWNDguiID +AlwaysOnTop
Gui, add, picture, x0 y0 w%width% h%height% hwndPic, % pictureNames[choice]
Gui, Show, hide x0 y0 w%width% h%height%

Gui, show
Sleep, %HOW_LONG%
Gui, hide
ExitApp