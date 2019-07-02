; ======================
; variables
; ======================
hpi := "[hgen"
ros := "[rgen"
pe := "[pgen"
mdm := "[mdm"
attest := "[attest"

; ======================
; capslock to hyper key
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


; ======================
; remap f9 navigation
; ======================
~Capslock & Right::
Send {F9 DownTemp}
return

~Capslock & Left::
Send +{F9 DownTemp}
return


; ======================
; miscellaneous
; ======================

; reload ahk (either due to newly added script or to stop running macro)
#x::Reload

; open a blank notepad
~Capslock & n::
IfWinExist Untitled - Notepad
   WinActivate
else
   Run Notepad
return

; get mouse position
; ======================
~Capslock & m::
MouseGetPos, xpos, ypos
MsgBox, The cursor is at X%xpos% Y%ypos%.
return

; opens cerner login
; ======================
#!^F1::Run http://cernerm/

; clear box
; ======================
:*:cc::
Send ^a
Sleep 50
Send {Backspace}
return

; ======================
; combo stuff
; ======================

; open new chart and insert template
; ======================
~Capslock & o::
MouseGetPos x, y
Send !p
Sleep 100
MouseMove 1163, 585
Sleep 100
Send n
Sleep 50
Send d
Sleep 50
Send {Enter}
MouseMove %x%, %y%
SetTitleMatchMode, 2
WinWait, Opened by
Sleep 3000
Click 1080, 395, 2
SetTitleMatchMode, 2
WinWait, Opened by
Sleep 2000
Loop, 3 {
    Sleep 50
    Send {Tab}
    Sleep 50
}
Send %hpi% ; CHANGE to hpi autotext
Sleep 1000
Send {Enter}
Sleep 50
Send {Tab}
Sleep 50
Send %ros%
Sleep 1000
Send {Enter}
Loop, 3 {
    Sleep 50
    Send {Tab}
    Sleep 50
}
Send %pe% 
Sleep 1000
Send {Enter}
Loop, 3 {
    Sleep 50
    Send {Tab}
    Sleep 50
}
Send %mdm% 
Sleep 1200
Send {Enter}
; attestation starts here
Loop, 6 {
    Sleep 50
    Send {Tab}
    Sleep 50
}
Send {Enter}
Sleep 50
Send %attest% 
Sleep 1000
Send {Enter}
Sleep 50
; go back to the hpi
Send ^f
WinWait, Find
Send History of Present
Sleep 50
Send {Escape}
SetTitleMatchMode, 2
WinWait, Opened by
Sleep 50
Send {Tab}
Sleep 50
Send {End}
Sleep 50 
Send {Space}
return

:*:genchart::
Loop, 3 {
    Sleep 50
    Send {Tab}
    Sleep 50
}
Send %hpi% ; CHANGE to hpi autotext
Sleep 1000
Send {Enter}
Sleep 50
Send {Tab}
Sleep 50
Send %ros%
Sleep 1000
Send {Enter}
Loop, 3 {
    Sleep 50
    Send {Tab}
    Sleep 50
}
Send %pe% 
Sleep 1000
Send {Enter}
Loop, 3 {
    Sleep 50
    Send {Tab}
    Sleep 50
}
Send %mdm% 
Sleep 1200
Send {Enter}
; attestation starts here
Loop, 6 {
    Sleep 50
    Send {Tab}
    Sleep 50
}
Send {Enter}
Sleep 50
Send %attest% 
Sleep 1000
Send {Enter}
Sleep 50
; go back to the hpi
Send ^f
WinWait, Find
Send History of Present
Sleep 50
Send {Escape}
SetTitleMatchMode, 2
WinWait, Opened by
Sleep 50
Send {Tab}
Sleep 50
Send {End}
Sleep 50 
Send {Space}
return

; sign
; ======================
!^s::
Send ^g
WinWait, Sign/Submit Note
Sleep 100
MouseGetPos x, y
KeyWait, LButton, D
Sleep 250
Click 948, 664
Sleep 100
MouseMove %x%, %y%
return


; ======================
; bolding
; ======================

; whole line
; ======================
!b::
Send {Home}
Sleep 100
Send +{Down}
Sleep 100
Send ^b
Sleep 100
Send {Right}
return

; bold right of caret
; ======================
~Capslock & l::
Send +{End}
Sleep 200
Send ^b
Sleep 200
Send {Right DownTemp}
return

; bold left of caret
; ======================
~Capslock & j::
Send +{Home}
Sleep 50
Send ^b
Sleep 50
Send {Right DownTemp}
return

; ======================
; change list item and bold
; ======================

; select up the list item ahead of the caret
; ======================
~Capslock & i::
Send {F9}
Sleep 100
Send {Up}
Sleep 100
Send {Enter}
Sleep 100
Send +{F9}
Sleep 100
Send ^b
Sleep 100
Send {Right}
return

; select down the list item ahead of the caret
; ======================
~Capslock & k::
Send {F9}
Sleep 100
Send {Down}
Sleep 100
Send {Enter}
Sleep 100
Send +{F9}
Sleep 100
Send ^b
Sleep 100
Send {Right}
return

; ======================
; printing
; ======================

; print from inside the chart
; ======================
!p::
Sleep 200
Send {Alt}
Sleep 100
Send t
Send {Down 3} ; possible change back, new option above print called report
Sleep 300
Send {Right DownTemp}
Sleep 300
Send {Enter}
Sleep 300
Send {Enter}
Sleep 1000
Send {Enter}
return


; ======================
; navigation
; ======================

; launchpoint
; ======================
^1::
Send !v
Sleep 100
Send {Enter}
return

;tracking list
; ======================
^2::
Send !v
Sleep 100
Send t
return

; open documentation
; ======================
^d::
MouseMove 1163, 585
Sleep 100
Send !c
Sleep 100
Send {Down}
Sleep 100
Send d
Sleep 100
Send {Enter}
return

; save chart
; ======================
~Capslock & s::
Send !d
Sleep 100
Send {Enter}
return

; initial save dialog
; ======================
#s::
Send {Tab 6}
Sleep 100
Send {Enter}
return



; ======================
; Time Stamp
; ======================

; current time
; ======================

~Capslock & t::
Send !c
Sleep 100
Send a
SetTitleMatchMode, 2
WinWait, Ad Hoc
Send {Tab}
Sleep 50
Send u
Sleep 50
Send {Space}
Sleep 50
Send {Tab}
Sleep 50
Send {Enter}
SetTitleMatchMode, 2
WinWait, Time Seen
Sleep 1000
Send t
Sleep 50
Send {Tab}
Sleep 50
Send n
Sleep 50
MouseMove 22, 37
Sleep 500
Click 22, 37
return

; ======================


; ======================
; auto-text
; ======================

; hpi / ros
; ======================

:*:\lace::
Send laceration
return

:*:\dizz::
Send dizziness
return

:*:\naus::
Send nausea
return

:*:\vomi::
Send vomiting
return

:*:\diar::
Send diarrhea
return

:*:\bodya::
Send body aches
return

:*:\rn::
Send runny nose
return

:*:\cp::
Send chest pain
return

:*:\sob::
Send shortness of breath
return

:*:\backp::
Send back pain
return

:*:\fev::
Send fever
return

:*:\disch::
Send discharge
return

:*:\red::
Send redness
return

:*:\swell::
Send swelling
return

:*:\healw::
Send healing wound
return

:*:\resolva::
Send resolving abscess
return

:*:\resolvc::
Send resolving cellulitis
return

:*:\st::
Send sore throat
return

:*:\earp::
Send ear pain
return

:*:\ha::
Send headache
return

:*:\abdp::
Send abdominal pain
return

:*:\nc::
Send nasal congestion
return

:*:\numb::
Send numbness
return

:*:\ting::
Send tingling
return

:*:\ucc::
Send Urgent Care Center
return

:*:\accfam::
Send accompanied by family
return

:*:\accmom::
Send accompanied by mother
return

:*:\accdad::
Send accompanied by father
return

:*:\ptr::
Send Patient reports
return

:*:\pts::
Send Patient states
return

:*:\ptd::
Send Patient denies
return

:*:\loc::
Send loss of consciousness
return

:*:\freq::
Send frequency
return

:*:\dys::
Send dysuria
return

:*:\urg::
Send urgency
return

:*:\fahren::
Send ∞F
return

:*:\rpt::
Send reports
return

:*:\prod::
Send productive
return

; ======================


; history
; ======================

:*:\htn::
Send hypertension
return

:*:\dm::
Send diabetes mellitus
return

; ======================


; severity
; ======================
:*:\mode::
Send moderate
return

:*:\md::
Send mild
return

:*:\seve::
Send severe
return


; pe
; ======================

:*:\tend::
Send tenderness
return

:*:\exud::
Send exudate
return

:*:\eryt::
Send erythema
return

; misc. anatomical
; ======================
:*:\ruq::
Send right upper quadrant
return

:*:\luq::
Send left upper quadrant
return

:*:\llq::
Send left lower quadrant
return

:*:\rlq::
Send right lower quadrant
return


; ======================
; Phrases
; ======================

; hpi
; ======================
:*:\mdc::
Send Patient describes the symptoms as moderate in severity and constant.
return

:*:\mdf::
Send Patient describes the symptoms as moderate in severity and fluctuatin in intensity.
return

:*:\mdsep::
Send Patient describes the symptoms as moderate in severity and several episodes have occurred.
return

:*:\md1ep::
Send Patient describes the symptoms as moderate in severity and 1 episode has occurred.
return

:*:\md2ep::
Send Patient describes the symptoms as moderate in severity and 2 episodes has occurred.
return

:*:\md3ep::
Send Patient describes the symptoms as moderate in severity and 3 episodes has occurred.
return

:*:\md4ep::
Send Patient describes the symptoms as moderate in severity and 4 episodes has occurred.
return

:*:\md5ep::
Send Patient describes the symptoms as moderate in severity and 5 episodes has occurred.
return

:*:\modc::
Send Patient describes the symptoms as moderate in severity and constant.
return

:*:\modf::
Send Patient describes the symptoms as moderate in severity and fluctuatin in intensity.
return

:*:\modsep::
Send Patient describes the symptoms as moderate in severity and several episodes have occurred.
return

:*:\mod1ep::
Send Patient describes the symptoms as moderate in severity and 1 episode has occurred.
return

:*:\mod2ep::
Send Patient describes the symptoms as moderate in severity and 2 episodes has occurred.
return

:*:\mod3ep::
Send Patient describes the symptoms as moderate in severity and 3 episodes has occurred.
return

:*:\mod4ep::
Send Patient describes the symptoms as moderate in severity and 4 episodes has occurred.
return

:*:\mod5ep::
Send Patient describes the symptoms as moderate in severity and 4 episodes has occurred.
return

:*:\sevd::
Send that began "several days ago"
return

:*:\1d::
Send that began 1 day ago
return

:*:\2d::
Send that began 2 day ago
return

:*:\3d::
Send that began 3 day ago
return

:*:\4d::
Send that began 4 day ago
return

:*:\5d::
Send that began 5 day ago
return
