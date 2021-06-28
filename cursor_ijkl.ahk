#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

$*Capslock:: ; when capslock is pressed create an invisible window
press :=  ; clear press variable
Gui, 99:+ToolWindow
Gui, 99:Show,NoActivate x-1 w1 , Capslock Is Down
keywait, Capslock
Gui, 99:Destroy ; destroy window when capslock is released
; press is never set not sure why!
if (press = "" ){ ; if a hotkey was not pressed, toggle CAPSLOCK

SetCapsLockState, % (State:=!State) ? "On" : "Off"
}


return


#IfWinExist Capslock Is Down  ; enable the following hotkeys while invisible Capslock window exists

i::
	Send, {Up}
	press := true
	return
j::
	Send, {Left}
	press := true
	return
l::
	Send, {Right}
	press := true
	return
k::
	Send, {Down}
	press := true
	return

#IfWinExist