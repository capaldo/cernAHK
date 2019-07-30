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
return

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

; clear line
; ======================
:*:dd::
Send +{Home}
Sleep 100
Send ^c
Sleep 100
colon := ": "
string := clipboard
cleanstring := SubStr(String, 1, InStr(string, ":") - 1)
Sleep 100
IfInString, %cleanstring%, %colon% {
Send %cleanstring%%colon%
}
else {
Send {Backspace}
}
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
Send %hpi%
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
Sleep 1200
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
Send %hpi% 
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
Sleep 1200
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

^!t::
Send ^a
Send ^x
Sleep 300
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
Send ^v
Sleep 50
MouseMove 257, 79
Sleep 100
Click 257, 79
Sleep 100
Send ^a
Send ^v
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
:*:\usx::
Send urinary symptoms
return 

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

:*:\chestp::
Send chest pain
return

:*:\neckp::
Send neck pain
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

:*:\radp::
Send radiation of pain
return

:*:\toep::
Send toe pain
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

:*:\ptc::
Send Patient characterizes
return

:*:\pts::
Send Patient states
return

:*:\ptd::
Send Patient denies
return

:*:\ptfd::
Send Patients family denies
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

:*:\jointp::
Send joint pain
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

:*:\fluc::
Send fluctuance
return

:*:\stre::
Send streaking
Send {Space}
return

:*:\nrom::
Send normal ROM
return

:*:\lrom::
Send limited ROM
return

:*:\lprom::
Send limited ROM due to pain
return

:*:\lymphi::
Send lymphangitis
return

; misc. anatomical
; ======================
:*:\ruq::
Send right upper quadrant
Send {Space}
return

:*:\luq::
Send left upper quadrant
Send {Space}
return

:*:\llq::
Send left lower quadrant
Send {Space}
return

:*:\rlq::
Send right lower quadrant
Send {Space}
return

:*:\medi::
Send medial
return

:*:\dis::
Send distal
return

:*:\lat::
Send lateral
return

:*:\lt::
Send left
return

:*:\rt::
Send right
return

; ======================
; Phrases
; ======================

; hpi
; ======================

:*:\mdc::
clipboard = %old%
sxs := "Patient describes the symptoms as mild in severity and constant."
clipboard = %sxs%
Sleep 100
Send ^v
Sleep 100
Send {Space}
clipboard = %old%
return

:*:\mdf::
clipboard = %old%
sxs := "Patient describes the symptoms as mild in severity and fluctuating in intensity."
clipboard = %sxs%
Sleep 100
Send ^v
Sleep 100
Send {Space}
clipboard = %old%
return

:*:\mdsep::
clipboard = %old%
sxs := "Patient describes the symptoms as mild in severity and several episodes have occurred."
clipboard = %sxs%
Sleep 200
Send ^v
Sleep 100
Send {Space}
clipboard = %old%
return

:*:\md1ep::
clipboard = %old%
sxs := "Patient describes the symptoms as mild in severity and 1 episode has occurred."
clipboard = %sxs%
Sleep 100
Send ^v
Sleep 100
Send {Space}
clipboard = %old%
return

:*:\md2ep::
clipboard = %old%
sxs := "Patient describes the symptoms as mild in severity and 2 episodes has occurred."
clipboard = %sxs%
Sleep 100
Send ^v
Sleep 100
Send {Space}
clipboard = %old%
return

:*:\md3ep::
clipboard = %old%
sxs := "Patient describes the symptoms as mild in severity and 3 episodes has occurred."
clipboard = %sxs%
Sleep 100
Send ^v
Sleep 100
Send {Space}
clipboard = %old%
return

:*:\md4ep::
clipboard = %old%
sxs := "Patient describes the symptoms as mild in severity and 4 episodes has occurred."
clipboard = %sxs%
Sleep 100
Send ^v
Sleep 100
Send {Space}
clipboard = %old%
return

:*:\md5ep::
clipboard = %old%
sxs := "Patient describes the symptoms as mild in severity and 5 episodes has occurred."
clipboard = %sxs%
Sleep 100
Send ^v
Sleep 100
Send {Space}
clipboard = %old%
return

:*:\modc::
clipboard = %old%
sxs := "Patient describes the symptoms as moderate in severity and constant."
clipboard = %sxs%
Sleep 100
Send ^v
Sleep 100
Send {Space}
clipboard = %old%
return

:*:\modf::
clipboard = %old%
sxs := "Patient describes the symptoms as moderate in severity and fluctuating in intensity."
clipboard = %sxs%
Sleep 100
Send ^v
Sleep 100
Send {Space}
clipboard = %old%
return

:*:\modsep::
clipboard = %old%
sxs := "Patient describes the symptoms as moderate in severity and several episodes have occurred."
clipboard = %sxs%
Sleep 100
Send ^v
Sleep 100
Send {Space}
clipboard = %old%
return

:*:\mod1ep::
clipboard = %old%
sxs := "Patient describes the symptoms as moderate in severity and 1 episode has occurred."
clipboard = %sxs%
Sleep 100
Send ^v
Sleep 100
Send {Space}
clipboard = %old%
return

:*:\mod2ep::
clipboard = %old%
sxs := "Patient describes the symptoms as moderate in severity and 2 episodes has occurred."
clipboard = %sxs%
Sleep 100
Send ^v
Sleep 100
Send {Space}
clipboard = %old%
return

:*:\mod3ep::
clipboard = %old%
sxs := "Patient describes the symptoms as moderate in severity and 3 episodes has occurred."
clipboard = %sxs%
Sleep 100
Send ^v
Sleep 100
Send {Space}
clipboard = %old%
return

:*:\mod4ep::
clipboard = %old%
sxs := "Patient describes the symptoms as moderate in severity and 4 episodes has occurred."
clipboard = %sxs%
Sleep 100
Send ^v
Sleep 100
Send {Space}
clipboard = %old%
return

:*:\mod5ep::
clipboard = %old%
sxs := "Patient describes the symptoms as moderate in severity and 5 episodes has occurred."
clipboard = %sxs%
Sleep 100
Send ^v
Sleep 100
Send {Space}
clipboard = %old%
return

:*:\sevd::
Send that began "several days ago".
Send {Space}
return

:*:\tod::
Send that began today.
Send {Space}
return

:*:\1d::
Send that began 1 day ago.
Send {Space}
return

:*:\2d::
Send that began 2 days ago.
Send {Space}
return

:*:\3d::
Send that began 3 days ago.
Send {Space}
return

:*:\4d::
Send that began 4 days ago.
Send {Space}
return

:*:\5d::
Send that began 5 days ago.
Send {Space}
return

:*:\6d::
Send that began 6 days ago.
Send {Space}
return

:*:\8d::
Send that began 8 days ago.
Send {Space}
return

:*:\9d::
Send that began 9 days ago.
Send {Space}
return

:*:\10d::
Send that began 10 days ago.
Send {Space}
return

:*:\11d::
Send that began 11 days ago.
Send {Space}
return

:*:\12d::
Send that began 12 days ago.
Send {Space}
return

:*:\13d::
Send that began 13 days ago.
Send {Space}
return

:*:\15d::
Send that began 15 days ago.
Send {Space}
return

:*:\16d::
Send that began 16 days ago.
Send {Space}
return

:*:\17d::
Send that began 17 days ago.
Send {Space}
return

:*:\18d::
Send that began 18 days ago.
Send {Space}
return

:*:\19d::
Send that began 19 days ago.
Send {Space}
return

:*:\20d::
Send that began 20 days ago.
Send {Space}
return

:*:\1w::
Send that began 1 week ago.
Send {Space}
return

:*:\2w::
Send that began 2 weeks ago.
Send {Space}
return

:*:\3w::
Send that began 3 weeks ago.
Send {Space}
return

:*:\4w::
Send that began 4 weeks ago.
Send {Space}
return

:*:\1m::
Send that began 1 month ago.
Send {Space}
return

:*:\2m::
Send that began 2 months ago.
Send {Space}
return

:*:\3m::
Send that began 3 months ago.
Send {Space}
return

:*:\4m::
Send that began 4 months ago.
Send {Space}
return

:*:\5m::
Send that began 5 months ago.
Send {Space}
return

:*:\6m::
Send that began 6 months ago.
Send {Space}
return

:*:\7m::
Send that began 7 months ago.
Send {Space}
return

:*:\8m::
Send that began 8 months ago.
Send {Space}
return

:*:\9m::
Send that began 9 months ago.
Send {Space}
return

:*:\10m::
Send that began 10 months ago.
Send {Space}
return

:*:\11m::
Send that began 11 months ago.
Send {Space}
return

:*:\1y::
Send that began 1 year ago.
Send {Space}
return

; =======================
; miscellaneous
; =======================
:*:\bull::
Send {ASC 00149}
return

:*:\deg::
Send {ASC 00176}
return

; =======================
; diagnosis codes
; =======================

; abscess
; =======================

scalp_abscess := "L02.811 scalp"
face_abscess := "L02.01 facial"
leftear_abscess := "H60.02 external ear"
rightear_abscess := "H60.01 external ear"
mouth_abscess := "K12.2 mouth abscess"
