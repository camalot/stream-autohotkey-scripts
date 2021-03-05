#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

LPARAM = %1%
URL := "https://twitch.tv/products/darthminos"
STOP_CODES := ["Y0UV3_B33N_PWN3D", "CHAT_NOT_HYPE_ENOUGH", "NEED_MOAR_POGCHAMPS"]

if not LPARAM {
  LPARAM = 15 ; DEFAULT HOW_LONG if not set
}
HOW_LONG := LPARAM * 1000 ;

Random, SCChoice, 1, STOP_CODES.Length()
STOP_CODE := % STOP_CODES[SCChoice]

SysGet, Primary, MonitorPrimary
SysGet, Mon, Monitor, %Primary%
; Settings:
width:=MonRight        ; Width of picture.
height:=MonBottom      ; Height of picture.
pictureNames:=["./bsod.png"]	      ; Pictures names, put them in the same folder as this script

pictureNamesLen := pictureNames.Length()
Random, choice, 1, %pictureNamesLen% ;
escapedURL := UrlEncode(URL)
UrlDownloadToFile, https://api.qrserver.com/v1/create-qr-code/?size=120x120&color=0078d7&bgcolor=ffffff&data=%escapedURL%&margin=5, % f := A_Temp "\bsod_qr"

; Creates the overlay
Gui, -caption -ToolWindow +HWNDguiID +AlwaysOnTop
Gui, add, picture, x0 y0 w%width% h%height% hwndPic, % pictureNames[choice]
Gui, add, picture, x205 y697 w120 h120 hwndPic, % f

Gui, Font, s16 cWhite w900, Arial
Gui, Add, Text, x855 y698 BackgroundTrans, %URL%
Gui, Font, s14 cWhite w900, Arial
Gui, Add, Text, x418 y798 BackgroundTrans, %STOP_CODE%
Gui, Font, norm
Gui, Show, hide x0 y0 w%width% h%height%

Gui, show
Sleep, %HOW_LONG%
Gui, hide
ExitApp

UrlEncode( String )
{
	OldFormat := A_FormatInteger
	SetFormat, Integer, H
	Loop, Parse, String
	{
		if A_LoopField is alnum
		{
			Out .= A_LoopField
			continue
		}
		Hex := SubStr( Asc( A_LoopField ), 3 )
		Out .= "%" . ( StrLen( Hex ) = 1 ? "0" . Hex : Hex )
	}

	SetFormat, Integer, %OldFormat%
	return Out
}