/* 
ToggleKeys
Author: Mischke

Development Notes
=================
; colon (:) cannot be passed to a function

*/

#SingleInstance, force
		
Gui, Color, 0

Gui, Add, StatusBar
SB_SetText("State: OFF", 1)

Gui, Show, x100 y25 w225 h20, ToggleKeys

IniRead, Activate, settings.ini, ActivationKeys, Activate
IniRead, Deactivate, settings.ini, ActivationKeys, Deactivate

Menu, Tray, Icon, off.ico, , 1

SetTitleMatchMode 1
	
Hotkey, %Activate%, Activate
Hotkey, %Deactivate%, Deactivate

; Activate
Suspend, Permit
Suspend, Off
SB_SetText("State: ON")
SoundPlay, on.wav
trayIcon()

return

GuiClose:
ExitApp


;#######################################################################
;Functions
;#######################################################################

PlayActivationTone()
{
    if not (A_IsSuspended)
    {
        SoundPlay, on.wav
    }    
        else
    {
	    SoundPlay, off.wav
    }
}
return

trayIcon()
{
if (A_IsSuspended = 1)
	{
	Menu, Tray, Icon, off.ico, , 1
	}
else
	{
	Menu, Tray, Icon, on.ico, , 1
	}
}
return

;;==================HOTKEY ACTIVATIONS
; activate with the Open Square Bracket key '['
Activate:
	Suspend, Permit
	Suspend, Off
	SB_SetText("State: ON")
	SoundPlay, on.wav
	trayIcon()
return

; deactivate with the Close Square Bracket key ']'
Deactivate:
	Suspend, Permit
	Suspend, On
	SB_SetText("State: OFF")
	SoundPlay, off.wav
	trayIcon()
return

z::
	Loop
	if (A_IsSuspended)
		break
	else
		Click, WheelUp
return

