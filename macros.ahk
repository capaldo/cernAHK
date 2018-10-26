; ======================
; notes
; ======================
; set the launchpoint zoom to 75%, this is to prevent the assignment window from appearing above the 
; selected patient

; ======================
; CAPSLOCK TO HYPER
; ======================

#NoEnv ; recommended for performance and compatibility with future autohotkey releases.
#UseHook
#InstallKeybdHook
#SingleInstance force

SendMode Input

;; deactivate capslock completely
SetCapslockState, AlwaysOff

;; remap capslock to hyper
;; if capslock is toggled, remap it to esc

;; note: must use tidle prefix to fire hotkey once it is pressed
;; not until the hotkey is released
~Capslock::
;; must use downtemp to emulate hyper key, you cannot use down in this case
;; according to https://autohotkey.com/docs/commands/Send.htm, downtemp is as same as down except for ctrl/alt/shift/win keys
;; in those cases, downtemp tells subsequent sends that the key is not permanently down, and may be
;; released whenever a keystroke calls for it.
;; for example, Send {Ctrl Downtemp} followed later by Send {Left} would produce a normal {Left}
;; keystroke, not a Ctrl{Left} keystroke
 Send {Ctrl DownTemp}{Shift DownTemp}{Alt DownTemp}{LWin DownTemp}
 KeyWait, Capslock
 Send {Ctrl Up}{Shift Up}{Alt Up}{LWin Up}
 if (A_PriorKey = "Capslock") {
     Send {Esc}
 }
return

; ======================
; miscellaneous
; ======================

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

; dialog which sets the clipboard contents, useful for prior to inserting diagnosis
#Space::
InputBox, Clipboard, clipscrap
return

; ======================
; launchpoint
; ======================

; assign staff
; ======================
; pp: 
; ======================

; scribe and doc
; ======================
!^a::
MouseGetPos x, y
Sleep 100
MouseMove 335, %y%
Sleep 100
MouseMove 335, %y%
Sleep 100
MouseGetPos x, y
Click, left
Sleep 100
MouseMove 430, 190, 0, R
Sleep 1000
Click, left
Sleep 1500
MouseMove %x%, %y%
Sleep 200
Click, right
Sleep 200
MouseMove, 15, 200, 0, R
Sleep 500
Click, left
Sleep 2000
Click, 155, 178 ; CHANGE based on site, staff selection varies
Sleep 200
Send DOC ; CHANGE based on name
Sleep 100
Send {Enter}
Sleep 100
Send {Enter}
return

; assign dr only
; ======================
!a::
MouseGetPos x, y
Sleep 100
MouseMove 335, %y%
Sleep 100
MouseMove 335, %y%
Sleep 100
MouseGetPos x, y
MouseMove %x%, %y%
Sleep 200
Click, right
Sleep 200
MouseMove, 15, 200, 0, R
Sleep 500
Click, left
Sleep 2000
Click, 165, 220 ; CHANGE to modify staff selection
Sleep 200
Send cab ; CHANGE based on name
Sleep 100
Send {Enter}
Sleep 100
Send {Enter}
return


; alternate doc
; ======================
~Capslock & z::
MouseGetPos x, y
Sleep 100
MouseMove 335, %y%
Sleep 100
MouseMove 335, %y%
Sleep 100
MouseGetPos x, y
Click, left
Sleep 100
MouseMove 430, 190, 0, R
Sleep 1000
Click, left
Sleep 1500
MouseMove %x%, %y%
Sleep 200
Click, right
Sleep 200
MouseMove, 15, 200, 0, R
Sleep 500
Click, left
Sleep 2000
Click, 165, 220 ; CHANGE to modify staff selection
Sleep 200
Send DOC ; CHANGE based on name
Sleep 100
Send {Enter}
Sleep 100
Send {Enter}
return

; assign mid-level too
^Numpad0::
MouseGetPos x, y
Sleep 100
MouseMove 335, %y%
Sleep 100
MouseMove 335, %y%
Sleep 100
MouseGetPos x, y
Click, left
Sleep 100
MouseMove 430, 190, 0, R
Sleep 1000
Click, left
Sleep 1500
MouseMove %x%, %y%
Sleep 200
Click, right
Sleep 200
MouseMove, 15, 200, 0, R
Sleep 500
Click, left
Sleep 2000
Click, 72, 176 ; CHANGE to modify ap selection
Sleep 200
Send DOC ; CHANGE based on ap
Sleep 100
Send {Enter}
Sleep 200
Click, 72, 355 ; CHANGE to modify mlp selection
Sleep 200
Send MLP ; CHANGE based on mlp name
Sleep 100
Send {Enter}
Sleep 100
Send {Enter}
return


; open new chart
; ======================
~Capslock & o::
MouseMove 1163, 585
Send {Alt}
Sleep 500
Send !p
Sleep 100
Send {Down 3}
Sleep 100
Send {Right}
Sleep 100
Send {Down}
Sleep 100
Send {Enter}
Send {Enter}
Sleep 4000
Click 1080, 455, 2
return

; refresh at main screen
; ======================
!^`::
Sleep 300
Send {Alt}
Sleep 300
Send t
Send {Down 3}
Sleep 300
Send {Enter}
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
Sleep 200
Send ^b
Sleep 200
Send {Right DownTemp}
return

; ======================
; printing
; ======================

; print from inside the chart
; ======================
^!p::
Sleep 300
Send {Alt}
Sleep 800
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
; discharge
; ======================

; insert diagnosis
; ======================
~Capslock & d::
MouseMove 1163, 585
Sleep 300
Send {Alt}
Sleep 300
Send !c
Sleep 100
Send {Down}
Sleep 100
Send {Enter}
Sleep 500
Click, 320, 400 ; click dx
Sleep 500
Click, 1376, 422 ; click white box
Sleep 500
Click, 1376, 422 ; click white box
Sleep 300
Send ^v
return

; insert follow-up
; ======================
~Capslock & f::
MouseMove 1163, 585
Sleep 300
Send {Alt}
Sleep 300
Send !c
Sleep 100
Send {Down}
Sleep 100
Send {Enter}
Sleep 1000
Click, 326, 380 ; click follow-up
Sleep 300
Click, 1527, 333 ; click plus
Sleep 2500
Click, 164, 570, 2 ; CHANGE double click basic follow-up
Sleep 400
Click, 776, 990 ; click 'Ok'
return

; insert education
; ======================
~Capslock & e::
MouseMove 1163, 585
Sleep 300
Send {Alt}
Sleep 300
Send !c
Sleep 100
Send {Down}
Sleep 100
Send {Enter}
Sleep 1000
Click, 333, 426 ; click education
Sleep 1000
MouseMove 849, 491
Sleep 100
Click, 849, 491, 2
return

; insert AMA follow-up
; ======================
:*:fuama::
MouseMove 1163, 585
Sleep 300
Send {Alt}
Sleep 300
Send !c
Sleep 100
Send {Down}
Sleep 100
Send {Enter}
Sleep 3000
Click, 326, 380 ; click follow-up
Sleep 300
Click, 1752, 333 ; click plus
Sleep 2000
Click, 186, 383, 2 ; CHANGE double click follow-up AMA
Sleep 300
Click, 776, 1014 ; click ok when the follow-up is right aligned
return

; ======================
; navigation
; ======================

; go to workflow
; ======================
^!w::
MouseMove 1163, 585
Sleep 300
Send {Alt}
Sleep 300
Send !c
Sleep 100
Send {Down}
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
Send {Tab 5}
Sleep 100
Send {Enter}
return

; launchpoint
; ======================
^1::
Sleep 200
Send !v
Sleep 200
Send {Enter}
return

;tracking list
; ======================
^2::
Sleep 200
Send !v
Sleep 200
Send {Down}
Send {Enter}
return

; select tab 1
; ======================
!1::
Sleep 100
Click, 115, 140
return

; select tab 2
; ======================
!2::
Sleep 100
Click, 265, 140
return

; select tab 3
; ======================
!3::
Sleep 100
Click, 450, 140
return

; select tab 4
; ======================
!4::
Sleep 100
Click, 630, 140
return

; select line left or right
; ======================
~Capslock & Up::
Send +{Home}
return

~Capslock & Down::
Send +{End}
return


; open documentation
; ======================
!^d::
MouseMove 1163, 585
Sleep 300
Send {Alt}
Sleep 300
Send !c
Sleep 100
Send {Down}
Sleep 100
Send d
Sleep 300
Send {Enter}
return

; sign
; ======================
!^s::
Sleep 100
Send ^g
Sleep 3500
MouseGetPos, StartX, StartY
Click 948, 664
MouseMove, StartX, StartY
return

; refresh
; ======================
!^r::
MouseGetPos, StartX, StartY
Sleep 50
Click, 1637, 176
Sleep 50
MouseMove, StartX, StartY
return

; open work note
; ======================
~Capslock & w::
Send !p
Sleep 50
Send {Enter}
Sleep 100
Send n
Sleep 100
Send d
Sleep 3000
MouseMove 688, 422
Click, 688, 422, 2
return

; open patient pharmacy
; ======================
^p::
Send !c
Sleep 100
Send {Enter}
Sleep 50
Send pa
Sleep 50
Click, 149, 162
return

; tracking select
^Numpad1::
Sleep 100
MouseMove 65,327
Sleep 50
Click 65, 327
return

^Numpad2::
Sleep 100
MouseMove 65, 355
Sleep 50
Click 65, 355
return

^Numpad3::
Sleep 100
MouseMove 65,399
Sleep 50
Click 65, 390
return

^Numpad4::
Sleep 100
MouseMove 65,420
Sleep 50
Click 65, 420
return

^Numpad5::
Sleep 100
MouseMove 65,465
Sleep 50
Click 65, 465
return

^Numpad6::
Sleep 100
MouseMove 65, 490
Sleep 50
Click 65, 490
return

^Numpad7::
Sleep 100
MouseMove 65, 530
Sleep 50
Click 65, 530
return

^Numpad8::
Sleep 100
MouseMove 65, 570
Sleep 50
Click 65, 570					
return

^Numpad9::
Sleep 100
MouseMove 65, 600
Sleep 50
Click 65, 600
return

; temp macro because the physician time isnt auto-importing
~Capslock & F1::
Sleep 200
SendEvent {Click 892, 499, down}{click 1023, 499, up} ; CHANGE if resized
Sleep 200
Click 1039, 510
return

; search for fin

F1::
Send !p
Sleep 100
Send {Enter}
Sleep 50
Send {Enter}
Sleep 500
Send {Tab}
Sleep 50
Send ^v
Sleep 100
Send {Enter}
Sleep 50
Send {Enter}
return

; select tab1 inside chart
^]::
Sleep 50
MouseMove 421, 289
Sleep 50
Click 421, 289
return

; select tab2 inside chart
^[::
Sleep 50
MouseMove 290, 289
Sleep 50
Click 290, 289
return

; ======================
; remap keys
; ======================

; end
!e::
Send {End}
return

; home
!h::
Send {Home}
return

; ctrl + g saves the chart, this is built-in

; remap close tab to hyper + escape
~Capslock & Esc::
Send !{F4}
return

; remap f9 navigation
~Capslock & Right::
Send {F9}
return

~Capslock & Left::
Send +{F9}
return

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

:*:\tend::
Send tenderness
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
Send °F
return

:*:\rpt::
Send reports
return
; ======================



; history
; =================
:*:\htn::
Send hypertension
return

:*:\dm::
Send diabetes mellitus
return
; =================



; severity
; ======================
:*:\moder::
Send moderate
return

:*:\md::
Send mild
return
; =================




; pe
; =================
:*:\nms::
Send no meningeal signs
return

:*:\eryth::
Send erythema
return

:*:\macu::
Send macular
return

:*:\nvi::
Send neurovascular intact
return

:*:\exud::
Send exudate
return

:*:\dull::
Send dullness
return

:*:\perf::
Send perforation
return

:*:\nfnd::
Send no focal neurological deficits
return

:*:\guard::
Send guarding
return

:*:\rebo::
Send rebound
return

:*:\ecch::
Send ecchymosis
return
; ======================



; anatomical position
; ======================
:*:\dist::
Send distal
return

:*:\medi::
Send medial
return

:*:\late::
Send lateral
return

:*:\llq::
Send left lower quadrant
return

:*:\rlq::
Send right lower quadrant
return

:*:\ruq::
Send right upper quadrant
return

:*:\luq::
Send left upper quadrant
return
; ======================



; diagnosis
; ======================
:*:=uri::
Send infection J06.9
return

:*:=phar::
Send phary j02.9
return

:*:=uti::
Send urinary tract N39.0
return

:*:=fu::
Send z09
return
; ======================



; ======================
; other functions
; ======================

; general
; ======================

; delete line
:*:dd::
Send {End}
Sleep 50
Send +{Home}
Sleep 50
Send {Delete}
Sleep 50
Send {Backspace}
return

; hpi
; =================

; change hpi to peds
:*:\hpeds::
Sleep 100
Send +{F9}
Sleep 100
Send {Down}
Sleep 100
Send {Down}
Sleep 100
Send {Enter}
Sleep 100
Send {End}
return

:*:\ptd::
Send ptd
Sleep 500
Send {Enter}
return


; physical exam
; ======================

; pediatric PE (general section)
:*:\pgenpeds::
Send {End}
Sleep 50
Send +{Home}
Sleep 50
Send {Delete}
Sleep 50
Send [pGeneral_peds
Sleep 1000
Send {Enter}
return

; pe skin, clears the line
:*:\pskin::
Send {End}
Sleep 50
Send +{Home}
Sleep 50
Send {Delete}
Sleep 50
Send Skin
Send :
Sleep 50
Send +{Home}
Sleep 50
Send ^b
Sleep 50
Send {Right}
Sleep 50
Send {Space}
return

; pe neck, clears the line
:*:\pneck::
Send {End}
Sleep 50
Send +{Home}
Sleep 50
Send {Delete}
Sleep 50
Send Neck
Send :
Sleep 50
Send +{Home}
Sleep 50
Send ^b
Sleep 50
Send {Right}
Sleep 50
Send {Space}
return

; pe enmt, clears the line
:*:\penmt::
Send +{Home}
Sleep 50
Send {Delete}
Sleep 50
Send ENMT
Send :
Sleep 50
Send +{Home}
Sleep 50
Send ^b
Sleep 50
Send {Right}
Sleep 50
Send {Space}
return

; pe eye, clears the line
:*:\peye::
Send +{Home}
Sleep 50
Send {Delete}
Sleep 50
Send Eyes
Send :
Sleep 50
Send +{Home}
Sleep 50
Send ^b
Sleep 50
Send {Right}
Sleep 50
Send {Space}
return


; pe neuro, clears the line
:*:\pneuro::
Send +{Home}
Sleep 50
Send {Delete}
Sleep 50
Send Neurological
Send :
Sleep 50
Send +{Home}
Sleep 50
Send ^b
Sleep 50
Send {Right}
Sleep 50
Send {Space}
return


; pe head, clears the line
:*:\phead::
Send +{Home}
Sleep 50
Send {Delete}
Sleep 50
Send Head
Send :
Sleep 50
Send +{Home}
Sleep 50
Send ^b
Sleep 50
Send {Right}
Sleep 50
Send {Space}
return

; pe back, clears the line
:*:\pback::
Send +{Home}
Sleep 50
Send {Delete}
Sleep 50
Send +{Home}
Sleep 50
Send {Delete}
Sleep 50
Send Back
Send :
Sleep 50
Send {Right}
Sleep 50
Send {Space}
return

; pe musculoskseletal, clears the line
:*:\pmusc::
Send +{Home}
Sleep 50
Send {Delete}
Sleep 50
Send Musculoskeletal
Send :
Sleep 50
Send +{Home}
Sleep 50
Send ^b
Sleep 50
Send {Right}
Sleep 50
Send {Space}
return

:*:\pgastro::
Send +{Home}
Sleep 50
Send {Delete}
Sleep 50
Send Gastrointestinal
Send :
Sleep 50
Send +{Home}
Sleep 50
Send ^b
Sleep 50
Send {Right}
Sleep 50
Send {Space}
return

; discharge
; ======================

; change discharge to peds
:*:\dpeds::
Sleep 100
Send +{F9}
Send {Down}
Send {Enter}
Send +{F9}
Send +{F9}
Send {Down}
Send {Enter}
Sleep 100
Send {End}
Send {End}
Send {End}
return

; mdm
; =================
:*:\declinepain::
Send [notes
Sleep 1000
Send {Enter}
Send Patient declined pain medication.
return

; =================
; blurbs
; =================

; ama blurb
:*:\ama::
Send [ama
Sleep 300
Send {Enter}
return

; insert moderate + constant blurb
:*:\hmodc::
Send hmo
Sleep 500
Send {Enter}
return

; insert moderate + fluctuating blurb
:*:\hmodf::
Send hmo
Sleep 500
Send {Down 2}
Sleep 300
Send {Enter}
return

; insert exacerbated blurb
:*:\hexac::
Send hexac
Sleep 500
Send {Enter}
return

; deletes neuro and adds expanded normal exam
:*:\normalneuro::
Sleep 100
Send +{Home}
Sleep 100
Send {Backspace}
Sleep 100
Send [pNEURO
Sleep 1000
Send {Enter}
Sleep 100
Send +{Home}
Sleep 100
Send ^b
Sleep 100
Send {Right}
return


; =================
; Time Stamp
; =================

; current time
~Capslock & t::
Send !c
Sleep 100
Send {Enter}
Sleep 100
Send a
Sleep 500
Send {Tab}
Sleep 50
Send u
Sleep 50
Send {Space}
Sleep 50
Send {Tab}
Sleep 50
Send {Enter}
Sleep 300
Send t
Sleep 50
Send {Tab}
Sleep 50
Send n
Sleep 50
MouseMove 22, 37
Sleep 50
Click 22, 37
return

; edit time with clipboard
!^t::
MouseMove 1163, 585
Sleep 300
Send {Alt}
Sleep 300
Send !c
Sleep 100
Send {Down}
Sleep 100
Send {Enter}
Sleep 1000
Click, 315, 325
Sleep 300
Click, 1765, 330
Sleep 300
Click, 1730, 365
Sleep 300
Send t
Sleep 300
Send {Tab}
Sleep 300
Send n
Sleep 300
Send ^a
Sleep 300
Send ^v
Sleep 300
Click 17, 44
return

; =================
; chart framework
; =================

; general chart
:*:genchart::
Sleep 100
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send [hgen
Sleep 1200
Send {Enter}
Sleep 100
Send {Tab}
Sleep 100
Send [rgen
Sleep 1200
Send {Enter}
Sleep 100
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send [pgen
Sleep 1200
Send {Enter}
Sleep 100
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send [mdm_per
Sleep 1200
Send {Enter}
Sleep 100
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send [dmed
Sleep 1200
Send {Enter}
Sleep 100
Send {Enter}
Send [script
Sleep 1200
Send {Enter}
Sleep 100
Send {Tab} ; attestation starts here
Sleep 100
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send {Enter}
Sleep 100
Send [attest
Sleep 1200
Send {Enter}
return

; ml chart
:*:midchart::
Sleep 100
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send [hgen
Sleep 1200
Send {Enter}
Sleep 100
Send {Tab}
Sleep 100
Send [rgen
Sleep 1200
Send {Enter}
Sleep 100
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send [pgen
Sleep 1200
Send {Enter}
Sleep 100
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send [mdm_per
Sleep 1200
Send {Enter}
Sleep 100
Send {Tab}
Sleep 100
Send [dmed
Sleep 1200
Send {Enter}
Sleep 100
Send {Enter}
Send [script
Sleep 1200
Send {Enter}
Sleep 100
Send {Tab} ; attestation starts here
Sleep 100
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send {Enter}
Sleep 100
Send [attemp
Sleep 1200
Send {Enter}
return
; =================
; Work Note Template
; =================

:*:work1::
Send [workexcuse1
Sleep 1200
Send {Enter}
Sleep 100
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send {Enter}
return

:*:work2::
Send [workexcuse2
Sleep 1200
Send {Enter}
Sleep 100
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send {Enter}
return

:*:work3::
Send [workexcuse3
Sleep 1200
Send {Enter}
Sleep 100
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send {Enter}
return

:*:work4::
Send [workexcuse4
Sleep 1200
Send {Enter}
Sleep 100
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send {Enter}
return

:*:work5::
Send [workexcuse4
Sleep 1200
Send {Enter}
Sleep 100
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send {Enter}
return

:*:school1::
Send [schoolexcuse1
Sleep 1100
Send {Enter}
Sleep 100
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send {Enter}
return

:*:school2::
Send [schoolexcuse2
Sleep 1100
Send {Enter}
Sleep 100
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send {Enter}
return

:*:school3::
Send [schoolexcuse3
Sleep 1100
Send {Enter}
Sleep 100
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send {Enter}
return

:*:school4::
Send [schoolexcuse4
Sleep 1100
Send {Enter}
Sleep 100
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send {Enter}
return

:*:school5::
Send [schoolexcuse5
Sleep 1100
Send {Enter}
Sleep 100
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send {Enter}
return

; =================
; =================
; =================
; =================
; =================
; =================
; =================
; =================
; =================


; =================
; beta
; =================

; combo run 
F8::
MouseMove 1163, 585   ; STEP 1 - OPEN CHART
Send {Alt}
Sleep 500
Send !p
Sleep 100
Send {Down 3}
Sleep 100
Send {Right}
Sleep 100
Send {Down}
Sleep 100
Send {Enter}
Send {Enter}
Sleep 7000
Click 1080, 455, 2
Sleep 5000
Sleep 100 ; STEP 1.5 - INSERT GENERAL CHART
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send [hgen
Sleep 1200
Send {Enter}
Sleep 100
Send {Tab}
Sleep 100
Send [rgen
Sleep 1200
Send {Enter}
Sleep 100
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send [pgen
Sleep 1200
Send {Enter}
Sleep 100
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send [mdm_per
Sleep 1200
Send {Enter}
Sleep 100
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send [dmed
Sleep 1200
Send {Enter}
Sleep 100
Send {Enter}
Send [script
Sleep 1200
Send {Enter}
Sleep 100
Send {Tab} ; attestation starts here
Sleep 100
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send {Tab}
Sleep 100
Send {Enter}
Sleep 100
Send [attest
Sleep 1200
Send {Enter}
MouseGetPos x, y ; STEP 2 - SAVE CHART
Click, 1690, 975
MouseMove %x%, %y%
Sleep 3000
Send {Tab 5} ; STEP 3 - SAVE OK
Sleep 100
Send {Enter}
MouseMove 1163, 585  ; STEP 4 - GO TO WORKFLOW
Sleep 300
Send {Alt}
Sleep 300
Send !c
Sleep 100
Send {Down}
Sleep 100
Send {Enter}
Sleep 5000
MouseMove 1163, 585 ; STEP 5 - ADD FOLLOW-UP
Sleep 500
Send {Alt}
Sleep 300
Send !c
Sleep 300
Send {Down}
Sleep 300
Send {Enter}
Sleep 3000
Click, 326, 380 ; click follow-up
Sleep 500
Click, 1752, 333 ; click plus
Sleep 3000
Click, 186, 333, 2 ; CHANGE double click basic follow-up
Sleep 1000
Click, 776, 1010 ; click 'Ok'
Sleep 4000
MouseMove 1163, 585
Sleep 300
Send {Alt}
Sleep 300
Send !c
Sleep 100
Send {Down}
Sleep 100
Send {Enter} ; Step 5.5 - ADD TIME SEEN
Sleep 3000
Click, 315, 325
Sleep 500
Click, 1765, 330
Sleep 300
Click, 1730, 365
Sleep 300
Send t
Sleep 300
Send {Tab}
Sleep 300
Send n
Sleep 300
Click 17, 44
Sleep 5000
MouseMove 1163, 585 ; STEP 6 - GO BACK TO DOCUMENTATION
Sleep 1000
Send {Alt}
Sleep 500
Send !c
Sleep 300
Send {Down}
Sleep 300
Send d
Sleep 300
Send {Enter}
return




; =================
; TODO
; =================

; add auto-texts for 4 and 5 days + parents excuse notes

; add inputbox to clipboard for quick input of time and pertinent negatives/positives/dictations

; hyper + a for follow-up (ama)
; \return2 for follow-up return in 2d

; autoexpanding diagnosis'
; https://www.icd10data.com/ICD10CM/Codes
;  =conj(l/r) - conjunctivitis -
;  =lumb - lumbar (?) -
;  =ank(l/r) - ankle sprain -
;  =cp - chest pain
;  =abd - abdominal pain
;  =bronc - bronchitis - J20.9 -
;  =abs - abscess
;     L02.212 - back
;  =shing - shingles -
;  =oe(l/r) - otitis externa
;  =om(l/r) - otitis media


; =================
; Notes: 
; =================

; utilize the find function to navigate through the workflow
;; then either tab to navigate further or possible click script function on behalf of dragon/possible launch application function?
