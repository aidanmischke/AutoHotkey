/* 
CoH 1 AHK 1.0
Author: Mischke

MButton code by d4m1ty.
Post #55 in the GridKeys 3.0 thread available here:
http://www.gamereplays.org/community/index.php?showtopic=733549&st=40

Modifications and updates by Mischke.
*/

	#SingleInstance, force
			
	Gui, Color, 0
	Gui, Add, Picture, x0 y0 w330 h250 , gk-bg.jpg
	Gui, Show, x100 y25 w185 h143, CoH 1 AHK 1.0
	Menu, Tray, Icon, gk-tray.ico, , 1
	
	SetTitleMatchMode 1
	Hotkey, IfWinActive, Company Of Heroes

	; exit script when exiting CoH
	WinWait, Company Of Heroes
		WinWaitClose  ; Wait for the exact window found by WinWait to be closed.
	ExitApp

Return

GuiClose:
	ExitApp

#IfWinActive, Company Of Heroes
{

	; Mouse Buttons
		; Mouse back navigation button
		XButton1::
			; intentionally blank, calls Tac Map below
		CapsLock::
			; Send {Control Down}{s}{Control Up} ; Original Inverse FlakGrid
			Send {Numpad0} ; Mischke's modification to FlakGrid with TacMap as Numpad0
		Return
		
		; Auto Reinforce
		; reinforce up to 5 troops on one highlighted squad
		; Mouse forward navigation button
		XButton2::
		{
			Loop 5
			{
			  Send {y}
			}
		}
		Return
		
		; unit & vehicle path painting, for vehicle reversing
		; Mouse middle button. Hold click and paint away.
		$MButton::
			Send {Shift Down}
			Loop
			{
				if not GetKeyState("MButton", "P")
					break
				Send {Rbutton};
				;sleep 50
				sleep 15
			}
			Send {Shift Up}
		Return
	
	; camera movement. Alt + wasd
	!w::up
	!a::left
	!s::down
	!d::right	
	
	; Game Openings
	; Wehrmacht & American
	F7::
	{
		Send {F1} ; selects Headquarters
		Send {q} ; starts building a second Pioneer / Engineer Squad
		Send {Esc} ; deselects Headquarters
		Send {Control Down}{q}{Control Up} ; selects the idle Pioneers / Engineers by your base
		Send {s} ; selects Build Base Structures menu for Pioneers / Engineers
		Send {q} ; selects Wehrmacht Quarters / Barracks
	}
	Return		
	
	; switch windowed mode to full screen windowed mode
		^!a::
		WinSet, Style, -0xC40000, a
		WinMove, a, , 0, 0, % A_ScreenWidth, % A_ScreenHeight
	Return	

	; switch full screen windowed mode back to windowed mode 
		^!s::
		WinSet, Style, +0xC40000, a
		WinMove, a, , 0, 0, % A_ScreenWidth, % A_ScreenHeight
	Return
	
	LWin::Return ; Disable Windows key
	
	; Backup most recent replay
	^!d::
		Run C:\Users\%username%\Dropbox\CoH 1 AHK\backup replay.bat, C:\Users\%username%\Documents\My Games\Company of Heroes Relaunch\playback\
	Return
}