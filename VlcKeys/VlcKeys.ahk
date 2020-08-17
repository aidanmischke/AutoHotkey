/* 
VlcKeys 1.2
Author: Mischke
*/

#SingleInstance, force
; 150 value allows mouse scroll to change max volume to min and back to max again.
#MaxHotkeysPerInterval 150
	
Gui, Color, White
Gui, Add, Picture, x0 y0 w185 h143 , vlc-bg.png
Gui, Show, Hide x100 y25 w185 h143, VlcKeys
Menu, Tray, Icon, vk-tray.ico, , 1

; AHK keys only activate against VLC app.
SetTitleMatchMode 1
Hotkey, IfWinActive, VLC media player

; Close VlcKeys if VLC app closes.
WinWait, ahk_class VLC media player
WinWaitClose
ExitApp

GuiClose:
ExitApp

#IfWinActive ahk_class VLC media player
{	
	; Pointing Device: Mouse / Trackpad.
		LButton::
			Send {space}
		Return

		RButton::
			Send {space}
		Return

	; Keyboard.
		NumpadEnter::
			Send {space}
		Return
		
		NumpadAdd::
			Send {space}
		Return
}