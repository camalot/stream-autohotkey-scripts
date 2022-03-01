#SingleInstance, Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; #Include ../shared/WebSocket.ahk

; ws = new WebSocket("ws://127.0.0.1:9090/")
LPARAM = %1%

Keys := [ "W", "A", "S", "D", "Q", "E" ]
EKeys:= [ "⬆", "⬅", "⬇", "➡", "↩", "↪" ]
KeyLen := Keys.Length()

if not LPARAM {
  LPARAM = 30 ; DEFAULT HOW_LONG if not set
}
HOW_LONG := LPARAM * 1000 ;
REMAIN_TIME = 0 ;

if WinExist("ahk_exe Game.exe") or WinExist("ahk_exe PortalWars-Win64-Shipping.exe") {
  Keys := [ "W", "A", "S", "D" ]
  KeyLen := Keys.Length()
}

; SysGet, Primary, MonitorPrimary ; get the primary monitor
; SysGet, Mon, Monitor, %Primary% ; Get the monitor info for the primary monitor


; If WinExist("ahk_exe notepad2.exe") {
If WinExist("ahk_class R6Game") 
    or WinExist("ahk_exe notepad2.exe") 
    or WinExist("ahk_exe RogueCompany.exe") 
    or WinExist("ahk_exe HuntGame.exe") 
    or WinExist("ahk_exe Game.exe") 
    or WinExist("ahk_exe PortalWars-Win64-Shipping.exe") {
  ; ;;; Creates the overlay ;;;
  ; width:=MonRight        ; Width of picture and window.
  ; height:=MonBottom      ; Height of picture and window.
  ; tleft:=width/2 ;
  ; ttop:=height/2 ;

  ; Gui, +HWNDguiID  ; define the window
  ; Gui, Color, 808080 ; define the color of the window
  ; Gui, Show, hide x0 y0 w%width% h%height% ; size the window
  ; Gui, Font, s196 cWhite w500, Segoe UI ; Set the font
  ; Gui, Add, Text, x%tleft% y%ttop% vKeyPressLabel BackgroundTrans, ; 
  ; Gui +LastFound +AlwaysOnTop +ToolWindow
  ; WinSet, TransColor, 808080 ; define the transparent color of the window
  ; Gui -Caption
  ; Gui, show ; show the window

  WinActivate
  Loop {
    Random, choice, 1, %KeyLen% ;
    Random, timeLen, 1, 6 ;
    cKey := Keys[choice]
    displayKey := EKeys[choice]
    ; MsgBox, %cKey%
    delay := 250 * timeLen ;
    ; GuiControl,,KeyPressLabel,%displayKey%
    ws.Send("{ ""data"": { ""key"": """ + displayKey + """ }, ""event"": ""AHK_DW_KEY"" }") ;

    Send, {%cKey% down}
    Sleep, %delay% ;
    Send, {%cKey% up}
    REMAIN_TIME += %delay%
  } Until  (REMAIN_TIME > HOW_LONG)

  ; Gui, hide ; hide the window
}
ExitApp