; ======================
; ======VARIABLES=======
; ======================

; charting - general auto-texts
; ======================
hpi := "[hgen"
ros := "[rgen"
pe := "[pgen"
mdm := "[mdm"

; charting - template auto-texts
; ======================
thpi := "//uchpi"
tros := "//ucros"
tpe := "//ucpe"

; covid specific auto-texts
chpi := "//uchpiuri"
cros := "//ucrosuri"
cmdm := "[mdmcov"

; charting - attestations
; ======================
; provider 
attest := "[attest"
; mid-level
mattest := "[mattest"

; timing
; ======================
pause1 = 50
pause2 = 100
pause3 = 200
pause4 = 1000
pause5 = 2000
pause6 = 3000


; ======================
; ====miscellaneous=====
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


; remap jumping to lists
; ======================
~Capslock & Right::
Send {F9 DownTemp}
return
~Capslock & Left::
Send +{F9 DownTemp}
return

; reload ahk (either due to newly added script or to stop running macro)
; ======================
#x::Reload

; open a blank notepad
; ======================
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

; get window title
; ======================
^#!t::
WinGetTitle, Title, A
MsgBox, The active window is "%Title%".
return

; opens cerner login
; ======================
#!^F1::Run http://cernerm/


; ======================
; ===txt manipulation===
; ======================

; clear box
; ======================
:*:cc::
Send ^a
Sleep %pause1%
Send {Backspace}
return

; clear line
; ======================
:*:dd::
Send +{Home}
Sleep %pause2%
Send ^c
Sleep 200
colon := ":"
string := clipboard
cleanstring := SubStr(String, 1, InStr(string, ":") - 1)
IfInString, string, %colon% 
{
Send %cleanstring%%colon%
Sleep %pause1%
Send {Space}
}
else {
Send {Backspace}
}
return

; delete left of caret
; ======================
:*:\dl::
Send +{Home}
Send {Delete}
return

; delete right of caret
; ======================
:*:\dr::
Send +{End}
Send {Delete}
return

; ======================
; bolding text
; ======================

; whole line
; ======================
!b::
Send {Home}
Sleep %pause2%
Send +{Down}
Sleep %pause2%
Send ^b
Sleep %pause2%
Send {Right}
return

; right of caret
; ======================
~Capslock & l::
Send +{End}
Sleep %pause2%
Send ^b
Sleep %pause2%
Send {Right DownTemp}
return

; left of caret
; ======================
~Capslock & j::
Send +{Home}
Sleep %pause2%
Send ^b
Sleep %pause2%
Send {Right DownTemp}
return

; bolding words in front of caret
; ======================

:*:\1bw::
Loop, 1 {
Send ^+{Right}
}
Sleep %pause3%
Send ^b
Send {Right}
return

:*:\2bw::
Loop, 2 {
Send ^+{Right}
}
Sleep %pause3%
Send ^b
Send {Right}
return

:*:\3bw::
Loop, 3 {
Send ^+{Right}
}
Sleep %pause3%
Send ^b
Send {Right}
return

:*:\4bw::
Loop, 4 {
Send ^+{Right}
}
Sleep %pause3%
Send ^b
Send {Right}
return

:*:\5bw::
Loop, 4 {
Send ^+{Right}
}
Sleep %pause3%
Send ^b
Send {Right}
return


; ======================
; changing list items
; ======================

; select up the list item ahead of the caret
; ======================
~Capslock & i::
Send {F9}
Sleep %pause2%
Send {Up}
Sleep %pause2%
Send {Enter}
Sleep %pause2%
Send +{F9}
Sleep %pause2%
Send {Right}
return

; select down the list item ahead of the caret
; ======================
~Capslock & k::
Send {F9}
Sleep %pause2%
Send {Down}
Sleep %pause2%
Send {Enter}
Sleep %pause2%
Send +{F9}
Sleep %pause2%
Send {Right}
return


; ======================
; ========macros========
; ======================

; open new chart
; ======================
~Capslock & o::
GoSub openNEWDOC
return

; insert general chart
; ======================
:*:genchart::
GoSub genchart
return

; insert template chart
; ======================
Insert::
GoSub tchart
return

; insert mid-level chart
; ======================
^Insert::
GoSub mchart
return

; auto-insert hpi and ros
; ======================
~Capslock & r::
Send +{Home}
Sleep %pause1%
Send ^x
Sleep %pause3%
GoSub autoinsert
return

; sign chart
; ======================
!^s::
Send ^g
WinWait, Sign/Submit Note
Sleep %pause2%
MouseGetPos x, y
KeyWait, LButton, D
Sleep 250
Click 1740, 995
Sleep %pause2%
MouseMove %x%, %y%
Sleep %pause4%
WinClose A
return

; print from inside the chart
; ======================
!p::
Sleep %pause3%
Send {Alt}
Sleep %pause3%
Send t
Send {Down 3}
Sleep %pause3%
Send {Right DownTemp}
Sleep %pause3%
Send {Enter}
Sleep %pause3%
Send {Enter}
Sleep %pause4%
Send {Enter}
return

; save chart
; ======================
~Capslock & s::
Send !d
Sleep %pause2%
Send {Enter}
Sleep %pause4%
SetTitleMatchMode, 2
if(winActive("Save"))
{
Send {Enter}
}
else
{
}
return

; insert discharge
; ======================
:*:\dc::
Send //ucdischarge
Sleep %pause4%
Send {Enter}
Sleep %pause3%
Send {Enter}
Sleep %pause3%
Send {Enter}
Sleep %pause2%
Send [script
Sleep %pause4%
Send {Enter}
return


; ======================
; ======navigation======
; ======================

; select patient tabs
; ======================
!1::
Send {LWin Down}
Sleep %pause1%
Loop, 2 {
Sleep %pause1%
Send 1
Sleep %pause1%
}
Send {LWin Up}
return

!2::
Send {LWin Down}
Sleep %pause1%
Loop, 3 {
Sleep %pause1%
Send 1
Sleep %pause1%
}
Send {LWin Up}
return

!3::
Send {LWin Down}
Sleep %pause1%
Loop, 4 {
Sleep %pause1%
Send 1
Sleep %pause1%
}
Send {LWin Up}
return

!4::
Send {LWin Down}
Sleep %pause1%
Loop, 5 {
Sleep %pause1%
Send 1
Sleep %pause1%
}
Send {LWin Up}
return

; launchpoint
; ======================
^1::
SetTitleMatchMode, 2
WinActivate, FirstNet Organizer
return

; tracking list
; ======================
^2::
Send !v
Sleep %pause2%
Send t
return

; open documentation
; ======================
^d::
MouseMove 1163, 585
Sleep %pause2%
Send !c
Sleep %pause2%
Send {Down}
Sleep %pause2%
Send d
Sleep %pause2%
Send {Enter}
Sleep %pause4%
SetTitleMatchMode, 2
if(winActive("Discern"))
{
Send {Enter}
}
else
{
}
return


; ======================
; =======timestamp======
; ======================

; current time
; ======================
~Capslock & t::
Send !c
Sleep %pause2%
Send a
SetTitleMatchMode, 2
WinWait, Ad Hoc
Send {Tab}
Sleep %pause1%
Send u
Sleep %pause1%
Send {Space}
Sleep %pause1%
Send {Tab}
Sleep %pause1%
Send {Enter}
SetTitleMatchMode, 2
WinWait, Time Seen
Sleep %pause4%
Send t
Sleep %pause1%
Send {Tab}
Sleep %pause1%
Send n
Sleep %pause1%
MouseMove 22, 37
Sleep %pause3%
Click 22, 37
return

; use time on clipboard
; ======================
^!t::
Send ^a
Send ^x
Sleep 300
Send !c
Sleep %pause2%
Send a
SetTitleMatchMode, 2
WinWait, Ad Hoc
Send {Tab}
Sleep %pause1%
Send u
Sleep %pause1%
Send {Space}
Sleep %pause1%
Send {Tab}
Sleep %pause1%
Send {Enter}
SetTitleMatchMode, 2
WinWait, Time Seen
Sleep %pause4%
Send t
Sleep %pause1%
Send {Tab}
Sleep %pause1%
Send ^v
Sleep %pause1%
MouseMove 257, 79
Sleep %pause2%
Click 257, 79
Sleep %pause2%
Send ^a
Send ^v
MouseMove 22, 37
Sleep %pause3%
Click 22, 37
return


; hpi / ros
; ======================

; ======================
; hpi / ros
; ======================

; CONSTITUTIONAL
; ======================
:*:+fev::
Send ^a
Sleep %pause2%
Send ^c
Sleep %pause3%
StringReplace, Clipboard, Clipboard, denies fever, admits fever, All
StringReplace, Clipboard, Clipboard, no fever, reports fever, All
Sleep %pause3%
Send ^v
return

:*:+chills::
Send ^a
Sleep %pause2%
Send ^c
Sleep %pause3%
StringReplace, Clipboard, Clipboard, denies chills, admits chills, All
StringReplace, Clipboard, Clipboard, no chills, reports chills, All
Sleep %pause3%
Send ^v
return

:*:+fatigue::
Send ^a
Sleep %pause2%
Send ^c
Sleep %pause3%
StringReplace, Clipboard, Clipboard, denies fatigue, admits fatigue, All
StringReplace, Clipboard, Clipboard, no fatigue, reports fatigue, All
Sleep %pause3%
Send ^v
return

:*:+bodya::
Send ^a
Sleep %pause2%
Send ^c
Sleep %pause3%
StringReplace, Clipboard, Clipboard, denies body aches, admits body aches, All
StringReplace, Clipboard, Clipboard, no body aches, reports body aches, All
Sleep %pause3%
Send ^v
return

:*:+cough::
Send ^a
Sleep %pause2%
Send ^c
Sleep %pause2%
StringReplace, Clipboard, Clipboard, denies cough, admits cough, All
StringReplace, Clipboard, Clipboard, no cough, reports cough, All
Sleep %pause3%
Send ^v
return

:*:+nc::
Send ^a
Sleep %pause2%
Send ^c
Sleep %pause2%
StringReplace, Clipboard, Clipboard, denies nasal congestion, admits nasal congestion, All
StringReplace, Clipboard, Clipboard, no nasal congestion, reports nasal congestion, All
Sleep %pause3%
Send ^v
return

:*:+backp::
Send ^a
Sleep %pause2%
Send ^c
Sleep %pause2%
StringReplace, Clipboard, Clipboard, denies back pain, admits back pain, All
StringReplace, Clipboard, Clipboard, no back pain, reports back pain, All
Sleep %pause3%
Send ^v
return

:*:+chestp::
Send ^a
Sleep %pause2%
Send ^c
Sleep %pause2%
StringReplace, Clipboard, Clipboard, denies chest pain, admits chest pain, All
StringReplace, Clipboard, Clipboard, no chest pain, reports chest pain, All
Sleep %pause3%
Send ^v
return

:*:+palp::
Send ^a
Sleep %pause2%
Send ^c
Sleep %pause2%
StringReplace, Clipboard, Clipboard, denies palpitations, admits palpitations, All
StringReplace, Clipboard, Clipboard, no palpitations, reports palpitations, All
Sleep %pause3%
Send ^v
return

:*:+naus::
Send ^a
Sleep %pause2%
Send ^c
Sleep %pause2%
StringReplace, Clipboard, Clipboard, denies nausea, admits nausea, All
StringReplace, Clipboard, Clipboard, no nausea, reports nausea, All
Sleep %pause3%
Send ^v
return

; pe
; ======================
; clear normal inspection, no tenderness
:*:\cit::
Send +{Home}
Send ^c
Sleep 300
StringReplace, Clipboard, Clipboard, no tenderness`,` , , All
StringReplace, Clipboard, Clipboard, normal inspection`,` , , All
StringReplace, Clipboard, Clipboard, `_` , , All
Sleep %pause3%
Send ^v
return

; clear normal inspection, no tenderness, no swelling
:*:\ciwt::
Send +{Home}
Send ^c
Sleep 300
StringReplace, Clipboard, Clipboard, no tenderness`,` , , All
StringReplace, Clipboard, Clipboard, normal inspection`,` , , All
StringReplace, Clipboard, Clipboard, no swelling`,` , , All
StringReplace, Clipboard, Clipboard, `_` , , All
Sleep %pause3%
Send ^v
return

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
Send urgent care center
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
Send {ASC 00176}
Send F
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

:*:\dist::
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

:*:\bilat::
Send right
return

; ======================
; Phrases
; ======================

; hpi
; ======================

:*:\mdc::
sxs := "Patient describes the symptoms as mild in severity and constant."
Sleep %pause2%
Send %sxs%
Sleep %pause2%
Send {Space}
return

:*:\mdf::
sxs := "Patient describes the symptoms as mild in severity and fluctuating in intensity."
Sleep %pause2%
Send %sxs%
Sleep %pause2%
Send {Space}
return

:*:\mdsep::
sxs := "Patient describes the symptoms as mild in severity and several episodes have occurred."
Sleep %pause2%
Send %sxs%
Sleep %pause2%
Send {Space}
return

:*:\md1ep::
sxs := "Patient describes the symptoms as mild in severity and 1 episode has occurred."
clipboard = %sxs%
Sleep %pause2%
Send %sxs%
Sleep %pause2%
Send {Space}
return

:*:\md2ep::
sxs := "Patient describes the symptoms as mild in severity and 2 episodes has occurred."
Sleep %pause2%
Send %sxs%
Sleep %pause2%
Send {Space}
return

:*:\md3ep::
sxs := "Patient describes the symptoms as mild in severity and 3 episodes has occurred."
Sleep %pause2%
Send %sxs%
Sleep %pause2%
Send {Space}
return

:*:\md4ep::
sxs := "Patient describes the symptoms as mild in severity and 4 episodes has occurred."
Sleep %pause2%
Send %sxs%
Sleep %pause2%
Send {Space}
return

:*:\md5ep::
sxs := "Patient describes the symptoms as mild in severity and 5 episodes has occurred."
Sleep %pause2%
Send %sxs%
Sleep %pause2%
Send {Space}
return

:*:\modc::
sxs := "Patient describes the symptoms as moderate in severity and constant."
Sleep %pause2%
Send %sxs%
Sleep %pause2%
Send {Space}
return

:*:\modf::
sxs := "Patient describes the symptoms as moderate in severity and fluctuating in intensity."
Sleep %pause2%
Send %sxs%
Sleep %pause2%
Send {Space}
return

:*:\modsep::
sxs := "Patient describes the symptoms as moderate in severity and several episodes have occurred."
Sleep %pause2%
Send %sxs%
Sleep %pause2%
Send {Space}
return

:*:\mod1ep::
clipboard = %old%
sxs := "Patient describes the symptoms as moderate in severity and 1 episode has occurred."
clipboard = %sxs%
Sleep %pause2%
Send ^v
Sleep %pause2%
Send {Space}
clipboard = %old%
return

:*:\mod2ep::
sxs := "Patient describes the symptoms as moderate in severity and 2 episodes has occurred."
Sleep %pause2%
Send %sxs%
Sleep %pause2%
Send {Space}
return

:*:\mod3ep::
sxs := "Patient describes the symptoms as moderate in severity and 3 episodes has occurred."
Sleep %pause2%
Send %sxs%
Sleep %pause2%
Send {Space}
return

:*:\mod4ep::
sxs := "Patient describes the symptoms as moderate in severity and 4 episodes has occurred."
Sleep %pause2%
Send %sxs%
Sleep %pause2%
Send {Space}
return

:*:\mod5ep::
sxs := "Patient describes the symptoms as moderate in severity and 5 episodes has occurred."
Sleep %pause2%
Send %sxs%
Sleep %pause2%
Send {Space}
return

:*:\sevd::
Send "several days ago".
Send {Space}
return

:*:\tod::
Send today
Send {Space}
return

:*:\1d::
Send 1 day ago
Send {Space}
return

:*:\2d::
Send 2 days ago
Send {Space}
return

:*:\3d::
Send 3 days ago
Send {Space}
return

:*:\4d::
Send 4 days ago
Send {Space}
return

:*:\5d::
Send 5 days ago
Send {Space}
return

:*:\6d::
Send 6 days ago
Send {Space}
return

:*:\8d::
Send 8 days ago
Send {Space}
return

:*:\9d::
Send 9 days ago
Send {Space}
return

:*:\10d::
Send 10 days ago
Send {Space}
return

:*:\11d::
Send 11 days ago
Send {Space}
return

:*:\12d::
Send 12 days ago
Send {Space}
return

:*:\13d::
Send 13 days ago
Send {Space}
return

:*:\15d::
Send 15 days ago
Send {Space}
return

:*:\16d::
Send 16 days ago
Send {Space}
return

:*:\17d::
Send 17 days ago
Send {Space}
return

:*:\18d::
Send 18 days ago
Send {Space}
return

:*:\19d::
Send 19 days ago
Send {Space}
return

:*:\20d::
Send 20 days ago
Send {Space}
return

:*:\1w::
Send 1 week ago
Send {Space}
return

:*:\2w::
Send 2 weeks ago
Send {Space}
return

:*:\3w::
Send 3 weeks ago
Send {Space}
return

:*:\4w::
Send 4 weeks ago
Send {Space}
return

:*:\1m::
Send 1 month ago
Send {Space}
return

:*:\2m::
Send 2 months ago
Send {Space}
return

:*:\3m::
Send 3 months ago
Send {Space}
return

:*:\4m::
Send 4 months ago
Send {Space}
return

:*:\5m::
Send 5 months ago
Send {Space}
return

:*:\6m::
Send 6 months ago
Send {Space}
return

:*:\7m::
Send 7 months ago
Send {Space}
return

:*:\8m::
Send 8 months ago
Send {Space}
return

:*:\9m::
Send 9 months ago
Send {Space}
return

:*:\10m::
Send 10 months ago
Send {Space}
return

:*:\11m::
Send 11 months ago
Send {Space}
return

:*:\1y::
Send 1 year ago
Send {Space}
return

; =======================
; mdm phrases
; =======================

:*:\dpain::
Send ^b 
Send Notes:
Send {Space}
Send ^b
Send Patient declines pain medication at the urgent care center. 
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

; make Patient convert to Patients family
:*:\makepeds::
Send ^a
Sleep %pause1%
Send ^c
Sleep %pause3%
StringReplace, Clipboard, Clipboard, Patient, Patients family, All
Sleep %pause3%
Send ^v
return

; =======================
; subroutines
; =======================

jumptoHPI:
; go back to the hpi
Send ^f
WinWait, Find
Send History of Present
Sleep %pause1%
Send {Escape}
SetTitleMatchMode, 2
WinWait, Opened by
Sleep %pause1%
Send {Tab}
Sleep %pause1%
Send {End}
Sleep %pause1%
Send {Space}
return

gotoPE:
Loop, 3 {
    Sleep %pause1%
    Send {Tab}
    Sleep %pause1%
}
return

gotoHPI:
Loop, 3 {
    Sleep %pause1%
    Send {Tab}
    Sleep %pause1%
}
return

gotoMDM:
Loop, 3 {
    Sleep %pause1%
    Send {Tab}
    Sleep %pause1%
}
return

gotoATTESTATION:
Loop, 6 {
    Sleep %pause1%
    Send {Tab}
    Sleep %pause1%
}
Send {Enter}
Sleep %pause1%
return

gotoROS:
Sleep %pause1%
Send {Tab}
Sleep %pause1%
Send {Tab}
return

openNEWDOC:
MouseGetPos x, y
Send !p
Sleep %pause1%
MouseMove 1163, 585
Sleep %pause1%
Send n
Sleep %pause1%
Send d
Sleep %pause1%
Send {Enter}
MouseMove %x%, %y%
SetTitleMatchMode, 2
WinWait, Opened by
Sleep 3000
Click 1080, 395, 2
return

genchart:
Send ^a
Sleep %pause2%
Send ^x
Sleep %pause3%
GoSub gotoHPI
Send %hpi% 
Sleep %pause4%
Send {Enter}
GoSub gotoROS
Send %ros%
Sleep %pause4%
Send {Enter}
GoSub gotoPE
Send %pe% 
Sleep 1200
Send {Enter}
GoSub gotoMDM
Send %mdm% 
Sleep 1200
Send {Enter}
GoSub gotoATTESTATION
Send %attest% 
Sleep %pause4%
Send {Enter}
GoSub jumptoHPI
return

tchart:
Send ^a
Sleep %pause2%
Send ^x
Sleep %pause3%
GoSub gotoHPI
Send %thpi% 
Send %clipboard%
Sleep %pause4%
Send {Enter}
GoSub gotoROS
Send %tros%
Send %clipboard%
Sleep %pause4%
Send {Enter}
GoSub gotoPE
Send %tpe% 
Send %clipboard%
Sleep 1200
Send {Enter}
GoSub gotoMDM
Send %mdm% 
Sleep 1200
Send {Enter}
GoSub gotoATTESTATION
Send %attest% 
Sleep %pause4%
Send {Enter}
GoSub jumptoHPI
return

mchart:
GoSub gotoHPI
Send %thpi% 
Send %clipboard%
Sleep %pause4%
Send {Enter}
GoSub gotoROS
Send %tros%
Send %clipboard%
Sleep %pause4%
Send {Enter}
GoSub gotoPE
Send %tpe% 
Send %clipboard%
Sleep 1200
Send {Enter}
GoSub gotoMDM
Send %mdm% 
Sleep 1200
Send {Enter}
GoSub gotoATTESTATION
Send %mattest% 
Sleep %pause4%
Send {Enter}
GoSub jumptoHPI
return

autoinsert:
Clipboard := RegExReplace(Clipboard, "and")
str:= clipboard
s:=StrSplit(str, ", ")
Loop, % s.MaxIndex()
{
Sleep 50
Send ^c
Sleep 50
Send ^f
WinWait, Find
Sleep 50
Send Review of Systems
Sleep 50
Send {Escape}
SetTitleMatchMode, 2
WinWait, Opened by
Sleep 500
Send {Tab}
Sleep 50
Send ^f
WinWait, Find
Sleep 50
Send % s[A_Index]
Sleep 50
Send {Escape}
SetTitleMatchMode, 2
WinWait, Opened by
Sleep 500
Send +{F9}
Sleep 100
Send {Down}
Sleep 100
Send {Enter}
Sleep 100
Send +{F9}
Sleep 50
Send ^b
Sleep 50
Send {Right}
Sleep 50
Send +^{Right}
Sleep 50
Send +^{Right}
Send ^b
Sleep 50
Send ^f
WinWait, Find
Sleep 50
Send History of Present Illness
Sleep 50
Send {Escape}
SetTitleMatchMode, 2
WinWait, Opened by
Sleep 500
Send {Tab}
Sleep 50
Send ^f
WinWait, Find
Sleep 50
Send % s[A_Index]
Sleep 50
Send {Escape}
SetTitleMatchMode, 2
WinWait, Opened by
Sleep 500
Send +{F9}
Sleep 100
Send {Down}
Sleep 100
Send {Enter}
Sleep 100
Send +{F9}
Sleep 50
}
return


:*:\denexposure::
Send Patient denies COVID-19 exposure.
return

:*:\exposure::
Send Patient reports COVID-19 exposure
return

:*:\coronachart::
GoSub cchart
return

cchart:
GoSub gotoHPI
Send %chpi%
Sleep %pause4%
Send {Enter}
GoSub gotoROS
Send %cros%
Sleep %pause4%
Send {Enter}
GoSub gotoPE
Send //ucpeuri
Sleep 1200
Send {Enter}
GoSub gotoMDM
Send %cmdm%
Sleep %pause4%
Send {Enter}
GoSub gotoATTESTATION
Send %attest% 
Sleep %pause4%
Send {Enter}
return
