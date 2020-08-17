/* 
KodiKeys 1.2
Author: Mischke
*/

#SingleInstance, force
; 150 value allows mouse scroll to change max volume to min and back to max again.
#MaxHotkeysPerInterval 150
	
Gui, Color, White
Gui, Add, Picture, x0 y0 w185 h143, kk-bg.png
Gui, Show, Hide x100 y25 w185 h143, KodiKeys
;Gui, Show, Minimized x100 y25 w185 h143, KodiKeys
Menu, Tray, Icon, kk-tray.ico, , 1

; AHK keys only activate against Kodi app.
SetTitleMatchMode 1
Hotkey, IfWinActive, Kodi

#IfWinActive ahk_class Kodi
{	
	; Remote Control Device
		Browser_Back:: ; Aidan Remote
		Browser_Home:: ; Kay Remote
			Send {space}
		Return
		
		End::
			Send {LWin}
		Return

	; Pointing Device: Mouse / Trackpad.
		LButton::
			Send {'}
		Return

		RButton::
			Send {space}
		Return
		
		; Back button
		Xbutton1::
			Send {'}
		Return 

		; Forward button
		XButton2::
			Send {space}
		Return
	
		; Adjust volume via scroll of mouse wheel or track pad
		$WheelUp::
			Send {Volume_Up}
		Return

		$WheelDown::
			Send {Volume_Down}
		Return

	; Keyboard.
		LCtrl::
			Send {'}
		Return
		
		Shift::
			Send {space}
		Return

		Alt::
			Send {m}
		Return

		LWin::
			Send {x}
		Return
		
		NumpadEnter::
			Send {'}
		Return
		
		NumpadAdd::
			Send {space}
		Return

	; Macros
		; Volume Amplification by 10 dB.
		; Ctrl + Z
		^z::
			sleepTime := 1000
			BlockInput, On
			Send {m}
			Loop, 4
			{
				Send {Left}
			}
			Send {Enter}
			Send {Down}
			Loop, 10
			{
				Send {Right}
			}
			Send {Escape}sleep %sleepTime%{m}
			BlockInput, Off
		Return
}