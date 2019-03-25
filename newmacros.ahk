; ======================
; notes
; ======================
; set the launchpoint zoom to 75%, this is to prevent the assignment window from appearing above the 
; selected patient

; ======================
; CAPSLOCK TO HYPER
; ======================

#NoEnv 
#UseHook
#InstallKeybdHook
#SingleInstance force
SendMode Input
SetCapslockState, AlwaysOff

~Capslock::
 Send {Ctrl DownTemp}{Shift DownTemp}{Alt DownTemp}{LWin DownTemp}
 KeyWait, Capslock
 Send {Ctrl Up}{Shift Up}{Alt Up}{LWin Up}
 if (A_PriorKey = "Capslock") {
     Send {Esc}

 }
return

; open blank notepad
~Capslock & n::
IfWinExist Untitled - Notepad
   WinActivate
else
   Run Notepad
return

; open chrome
