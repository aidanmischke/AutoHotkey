/* 
FuncKeys
Author: Mischke
*/

#SingleInstance, force

Gui, Color, White
Gui, Add, Picture, x0 y0 w220 h218 , fk-bg.png
Gui, Show, Hide x300 y25 w220 h218, FuncKeys
Menu, Tray, Icon, fk-tray.ico, , 1

; Global FuncKeys
	; Page Left
		LAlt & PgUp::
		RAlt & PgUp::
			Loop 20
			{
				Send {WheelLeft}
			}
		Return
		
	; Page Right
		LAlt & PgDn::
		RAlt & PgDn::
			Loop 20
			{
				Send {WheelRight}
			}
		Return	
	
	; Adjust volume via modifier key and arrow key
		RCtrl & Up::
			Send {Volume_Up}
		Return

		RCtrl & Down::
		RCtrl & Left::
			Send {Volume_Down}
		Return
		
	; Mute volume for x seconds
		AppsKey::
			SoundGet, MuteState, Master, Mute
			If MuteState=Off
				Send {VOLUME_MUTE}

			Sleep, 80000 ; xx000 seconds
			
			SoundGet, MuteState, Master, Mute
			If MuteState=On
				Send {VOLUME_MUTE}
		Return

; Kodi FuncKeys
#IfWinActive ahk_class Kodi
{
	; Remote Control Device
		Browser_Back::
			Send {space} ; Space pauses Kodi
		Return
		
		AppsKey::
			Send {m} ; Show / Hide player controls
		Return
}

; Avast Browser FuncKeys
; Spotify FuncKeys
#IfWinActive ahk_exe AvastBrowser.exe
{
; Avast Browser FuncKeys
	; Bookmark current website (to 2nd position in Firefox bookmarks bar)
		RCtrl & Right::
		Browser_Back::
			MouseClickDrag, Left, 157, 51, 65, 82 ; Maximised window at resolution: 1024 x 768
		Return
		
; Spotify FuncKeys
	;Remote Control Device (and keyboard too)
		RCtrl & Left::
		; Bookmark current website (to 1st position in Chrome bookmarks bar: "get" folder)
			MouseClickDrag, Left, 157, 51, 30, 86 ; Maximised window at resolution: 1024 x 768
		Return
		
		Up::
		; Bookmark current website (to 1st position in Chrome bookmarks bar: "get" folder)
			MouseClickDrag, Left, 157, 51, 30, 86 ; Maximised window at resolution: 1024 x 768
		Return		
		
		Down::
			Send {Media_Play_Pause}
		Return
	
		Left::
			Send {Media_Prev}
		Return
		
		Right::
			Send {Media_Next}
		Return		
}

; Disable Zoom via Ctrl + Mouse Wheel
^WheelUp::
	;intentionally blank
Return

^WheelDown::
	;intentionally blank
Return