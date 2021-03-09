#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

LPARAM = %1% ; argument that can be passed for the length to show

;;; Settings ;;;
URLS := ["https://twitch.tv/products/darthminos", "https://dixper.gg/darthminos"] ;
STOP_CODES := ["Y0UV3_B33N_PWN3D", "CHAT_NOT_HYPE_ENOUGH", "NEED_MOAR_POGCHAMPS"] ;
EMOJIS := [";)", ":(", ":`(", "o.O"] ;
DEFAULT_SHOW_LENGTH = 15 ;
pictureNames:=["./bsod.png"] ; Pictures names, put them in the same folder as this script

if not LPARAM {
  LPARAM := DEFAULT_SHOW_LENGTH ; DEFAULT HOW_LONG if not set
}
HOW_LONG := LPARAM * 1000 ; set the length in seconds
Random, EMOJI_CHOICE, 1, EMOJIS.Length() ; get a random index for the emoji
Random, STOP_CODE_CHOICE, 1, STOP_CODES.Length() ; get a random index for the stop codes
Random, URL_CHOICE, 1, URLS.Length() ; get a random index for the url
URL := % URLS[URL_CHOICE] ; the random url
STOP_CODE := % STOP_CODES[STOP_CODE_CHOICE] ; the random stop code
EMOJI := % EMOJIS[EMOJI_CHOICE] ; The random emoji

SysGet, Primary, MonitorPrimary ; get the primary monitor
SysGet, Mon, Monitor, %Primary% ; Get the monitor info for the primary monitor

width:=MonRight        ; Width of picture and window.
height:=MonBottom      ; Height of picture and window.
pictureNamesLen := pictureNames.Length()
Random, choice, 1, %pictureNamesLen% ; A random image from pictureNames
escapedURL := UrlEncode(URL) ; The url encoded url for creating the qr code
; download the qr code so we can use it on the window
UrlDownloadToFile, https://api.qrserver.com/v1/create-qr-code/?size=120x120&color=0078d7&bgcolor=ffffff&data=%escapedURL%&margin=5, % f := A_Temp "\bsod_qr" ;

;;; Creates the overlay ;;;
Gui, -caption -ToolWindow +HWNDguiID +AlwaysOnTop ; define the window
Gui, add, picture, x0 y0 w%width% h%height% hwndPic, % pictureNames[choice] ; add the background
Gui, add, picture, x205 y697 w120 h120 hwndPic, % f ; position and add the qr code

Gui, Font, s156 cWhite w500, Segoe UI ; Set the emoji font
Gui, Add, Text, x190 y108 BackgroundTrans, %EMOJI% ; Add the emoji text
Gui, Font, s16 cWhite w900, Segoe UI ; set the url font
Gui, Add, Text, x855 y693 BackgroundTrans, %URL% ; add the url text
Gui, Font, s14 cWhite w900, Segoe UI ; set the stop code font
Gui, Add, Text, x418 y795 BackgroundTrans, %STOP_CODE% ; add the font code
Gui, Font, norm ; reset the fonts
Gui, Show, hide x0 y0 w%width% h%height% ; size the window

Gui, show ; show the window
Sleep, %HOW_LONG% ; wait
Gui, hide ; hide the window
ExitApp ; we are done. exit.

;;; Functions ;;;
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