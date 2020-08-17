/* 
CoH 2 AHK
Author: Mischke
*/

	#SingleInstance, force
			
	Gui, Color, 0
	Gui, Add, Picture, x0 y0 w330 h250 , gk2-bg.jpg
	Gui, Show, x100 y25 w185 h143, CoH 1 AHK 1.0

	SetTitleMatchMode 1
	Hotkey, IfWinActive, Company Of Heroes 2

	; exit script when exiting CoH
	WinWait, Company Of Heroes 2
		WinWaitClose  ; Wait for the exact window found by WinWait to be closed.
	ExitApp

Return

GuiClose:
	ExitApp

#IfWinActive, Company Of Heroes 2
{
	; Mouse Buttons
		; Mouse back navigation button
		XButton1::
			; Idle infantry (Alt + .)
			Send !.
			; Restore camera to default position
			Send {Backspace}{Backspace}
		Return
		
		; Mouse forward navigation button
		XButton2::
			; Idle vehicle (Alt + /)
			Send !/
			; Restore camera to default position
			Send {Backspace}{Backspace}
		Return

	; Keyboard
		CapsLock::
			; Tactical Map / Tac Map
			Send {Numpad0};
		Return
		
	; Game Openings
	; Wehrmacht & American
	;F7::
	;{
	;	Send {F1} ; selects Headquarters
	;	Send {q} ; starts building a second Pioneer / Engineer Squad
	;	Send {Esc} ; deselects Headquarters
	;	Send {Control Down}{q}{Control Up} ; selects the idle Pioneers / Engineers by your base
	;	Send {s} ; selects Build Base Structures menu for Pioneers / Engineers
	;	Send {q} ; selects Wehrmacht Quarters / Barracks
	;}
	;Return		
	
	LWin::Return ; Disable Windows key
}