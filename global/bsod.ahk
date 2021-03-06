#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

LPARAM = %1%
URLS := ["https://twitch.tv/products/darthminos", "https://dixper.gg/darthminos"]
STOP_CODES := ["Y0UV3_B33N_PWN3D", "CHAT_NOT_HYPE_ENOUGH", "NEED_MOAR_POGCHAMPS"]
EMOJIS := [";)", ":(", ":`(", "o.O"]
if not LPARAM {
  LPARAM = 15 ; DEFAULT HOW_LONG if not set
}
HOW_LONG := LPARAM * 1000 ;
Random, EMOJI_CHOICE, 1, EMOJIS.Length()
Random, STOP_CODE_CHOICE, 1, STOP_CODES.Length()
Random, URL_CHOICE, 1, URLS.Length()
URL := % URLS[URL_CHOICE]
STOP_CODE := % STOP_CODES[STOP_CODE_CHOICE]
EMOJI := % EMOJIS[EMOJI_CHOICE]

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

Gui, Font, s156 cWhite w500, Segoe UI 
Gui, Add, Text, x190 y108 BackgroundTrans, %EMOJI%
Gui, Font, s16 cWhite w900, Segoe UI 
Gui, Add, Text, x855 y693 BackgroundTrans, %URL%
Gui, Font, s14 cWhite w900, Segoe UI 
Gui, Add, Text, x418 y795 BackgroundTrans, %STOP_CODE%
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