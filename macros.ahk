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


#a::
Sleep 50
Send ^c
Sleep 50
Send ^f
WinWait, Find
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
Send ^v
Sleep 50
Send {Escape}
SetTitleMatchMode, 2
WinWait, Opened by
Sleep 200
Send +{F9}
Sleep 50
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

#Space::
InputBox, ros1,,Positive 1:
Send ^f
WinWait, Find
Send Review of Systems
Sleep 50
Send {Escape}
SetTitleMatchMode, 2
WinWait, Opened by
Sleep 500
Send {Tab}
Send ^f
Send %ros1%
Sleep 50
Send {Escape}
SetTitleMatchMode, 2
WinWait, Opened by
Sleep 200
Send +{F9}
Sleep 50
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
Send ngu ; CHANGE based on name
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
; ======================
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
Click, 72, 176 ; CHANGE to modify selection
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
Send {Alt}
Sleep 100
MouseMove 1163, 585
Sleep 100
Send !p
Sleep 100
Send {Enter}
Sleep 100
Send n
Sleep 100
Send d
Sleep 100
Send {Enter}
SetTitleMatchMode, 2
WinWait, Opened by
Sleep 3500
Click 1080, 455, 2
Sleep 200
SetTitleMatchMode, 2
WinWait, Opened by
Sleep 2000
Send {Tab}
Sleep 50
Send {Tab}
Sleep 50
Send [hgen
Sleep 1200
Send {Enter}
Sleep 50
Send {Tab}
Sleep 50
Send [rgen
Sleep 1200
Send {Enter}
Sleep 50
Send {Tab}
Sleep 50
Send {Tab}
Sleep 50
Send [pgen
Sleep 1200
Send {Enter}
Sleep 50
Send {Tab}
Sleep 50
Send {Tab}
Sleep 50
Send {Tab}
Sleep 50
Send [mdm_per
Sleep 1200
Send {Enter}
Sleep 50
Send {Tab}
Sleep 50
Send {Tab}
Sleep 50
Send {Tab} ; attestation starts here
Sleep 50
Send {Tab}
Sleep 50
Send {Tab}
Sleep 50
Send {Tab}
Sleep 50
Send {Enter}
Sleep 50
Send [attest
Sleep 1200
Send {Enter}
Sleep 50
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
Sleep 300d

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
Click, 1750, 333 ; click plus
WinWait, Patient Education
Click, 160, 595, 2 ; CHANGE double click basic follow-up
Sleep 400
Click, 770, 1022 ; click 'Ok'
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
Click, 849, 491, 1
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
Sleep 200
Send !c
Sleep 200
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

; select tab 1
; ======================
!1::
Sleep 50
Click, 115, 140
return

; select tab 2
; ======================
!2::
Sleep 50
Click, 265, 140
return

; select tab 3
; ======================
!3::
Sleep 50
Click, 450, 140
return

; select tab 4
; ======================
!4::
Sleep 50
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

; sign
; ======================
!^s::
Send ^g
WinWait, Sign/Submit Note
Sleep 100
MouseGetPos, StartX, StartY
Sleep 2500
Click 948, 664
Sleep 100
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
; ======================
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
;; good example on how to use the drag function for the mouse, will not remove
; ======================
~Capslock & F1::
Sleep 200
SendEvent {Click 892, 499, down}{click 1023, 499, up} ; CHANGE if resized
Sleep 200
Click 1039, 510
return

; search for fin
; ======================
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
; ======================
^]::
Sleep 50
MouseMove 421, 289
Sleep 50
Click 421, 289
return

; select tab2 inside chart
; ======================
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

; remap f9 navigation
; ======================
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

; clear box
:*:cc::
Send ^a
Sleep 50
Send {Backspace}
return

; immunizations utd
:*:\imm::
Send ^f
WinWait, Find
Send Immunizations
Sleep 50
Send {Enter}
Sleep 50
Send {Escape}
Sleep 50
Send {Tab}
Sleep 50
Send [immUTD
Sleep 1200
Send {Enter}
return

; immunizations utd
:*:\teta::
Send ^f
WinWait, Find
Send Immunizations: up-to-date
Sleep 50
Send {Enter}
Sleep 50
Send {Escape}
Sleep 50
Send {Right}
Sleep 50
Send {Enter}
Sleep 50
Send [teta
Sleep 1200
Send {Enter}
return

; hpi
; =================

; change hpi to peds
; ======================
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

; patient denies shortcut
; ======================
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
Sleep 200
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

; edit time with clipboard
^t::
Send ^a
Sleep 50
Send ^x
Sleep 100
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
Send ^v
Sleep 50
MouseMove 22, 37
Sleep 50
Click 22, 37
return

; =================
; chart framework
; =================

; general chart
:*:genchart::
Sleep 50
Send {Tab}
Sleep 50
Send {Tab}
Sleep 50
Send [hgen
Sleep 1200
Send {Enter}
Sleep 50
Send {Tab}
Sleep 50
Send [rgen
Sleep 1200
Send {Enter}
Sleep 50
Send {Tab}
Sleep 50
Send {Tab}
Sleep 50
Send [pgen
Sleep 1200
Send {Enter}
Sleep 50
Send {Tab}
Sleep 50
Send {Tab}
Sleep 50
Send {Tab}
Sleep 50
Send [mdm_per
Sleep 1200
Send {Enter}
Sleep 50
Send {Tab}
Sleep 50
Send {Tab}
Sleep 50
Send [dmed
Sleep 1200
Send {Enter}
Sleep 50
Send {Enter}
Sleep 50
Send [script
Sleep 1200
Send {Enter}
Sleep 50
Send {Tab} ; attestation starts here
Sleep 50
Send {Tab}
Sleep 50
Send {Tab}
Sleep 50
Send {Tab}
Sleep 50
Send {Enter}
Sleep 50
Send [attest
Sleep 1200
Send {Enter}
Sleep 50
Send ^f
WinWait, Find
Send History of Present
Sleep 50
Send {Escape}
SetTitleMatchMode, 2
WinWait, Opened by
Sleep 500
Send {Tab}
Sleep 50
Send {End}
Sleep 50 
Send {Space}
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


; smart clear line
~Capslock & c::
Send ^f
WinWait, Find
Send :
Sleep 20
Send {Tab}
Sleep 20
Send {Tab}
Sleep 20
Send {Tab}
Sleep 20
Send {Tab}
Sleep 20
Send {Enter}
Sleep 20
Send {Escape}
SetTitleMatchMode, 2
WinWait, Opened by
Send {Right}
Sleep 20
Send +{End}
Sleep 20
Send {Backspace}
Sleep 20
Send {Space}
return

; smart bold title
!t::
Send ^f
WinWait, Find
Send :
Sleep 20
Send {Tab}
Sleep 20
Send {Tab}
Sleep 20
Send {Tab}
Sleep 20
Send {Tab}
Sleep 20
Send {Enter}
Sleep 20
Send {Escape}
SetTitleMatchMode, 2
WinWait, Opened by
Send {Right}
Sleep 20
Send +{Home}
Sleep 20
Send ^b
Sleep 20
Send {End}
return


F6::
Send !c
Sleep 100
Send {Enter}
Sleep 50
Send c
Sleep 50
Send c
Sleep 50
Send {Enter}
return

F10::
Send ^w
Sleep 300
Send {Tab}
Sleep 50
Send {Space}
Sleep 50
Send {Tab}
Sleep 50
Send ^v
Sleep 50
Send {Tab}
Sleep 50
Send {Tab}
Sleep 50
Send {Tab}
Sleep 50
Send {Tab}
Sleep 50
Send {Tab}
Sleep 50
Send {Enter}
return


; macro2macro miami lakes
^!+8::
Send CHART general
Sleep 150
Send {Tab}
Sleep 150
Send inserts the general chart template
Sleep 150
Send {Tab}
Sleep 150
Send insert general chart
Sleep 150
Send {Tab}
Sleep 150
Send {Space}
Sleep 350
Click, 1100, 315
Sleep 150
Send {Tab}
Sleep 150
Click, 1100, 320
Sleep 350
Click, 1100, 360
Sleep 150
Send 100
Sleep 150
Click, 1100, 375
Sleep 350
Click, 1100, 460
Sleep 150
Send {Tab}
Sleep 150
Click, 1100, 455
Sleep 350
Click, 1100, 490
Sleep 150
Send 100
Sleep 100
Click, 1100, 515
Sleep 350
Click, 1100, 555
Sleep 150
Send //uchpigen
Sleep 150
Click, 1100, 568
Sleep 350
Click, 1100, 600
Sleep 150
Send 1200
Sleep 150
Click, 1100, 630
Sleep 350
Click, 1100, 700
Sleep 150
Send {Enter}
Sleep 150
Click, 1100, 705
Sleep 350
Click, 1100, 735
Sleep 150
Send 100 
Sleep 100
Send {Tab}
Sleep 100
Click, 1100, 755
Sleep 350
Click, 1100, 845
Sleep 150
Send {Tab}
Sleep 100
Click, 300, 240 ; MAKE SMALL START
Sleep 150
Click, 300, 260
Sleep 150
Click, 300, 290
Sleep 150
Click, 300, 315
Sleep 150
Click, 300, 340
Sleep 150
Click, 300, 365
Sleep 150
Click, 300, 385
Sleep 150
Click, 300, 415
Sleep 150
Click, 300, 440 ; MAKE SMALL END
Sleep 150
Click, 1100, 460
Sleep 350
Click, 1100, 495
Sleep 150
Send 100
Click, 1100, 515
Sleep 350
Click, 1100, 565
Sleep 150
Send //ucrosgen
Sleep 150
Click, 1100, 570
Sleep 350
Click, 1100, 605
Sleep 150
Send 1200
Sleep 150
Click, 1100, 625
Sleep 350
Click, 1100, 710
Sleep 150
Send {Enter}
Sleep 150
Click, 1100, 710
Sleep 350
Click, 1100, 735
Sleep 150
Send 100
Sleep 100
Click, 1100, 755
Sleep 350
Click, 1100, 850
Sleep 150
Send {Tab}
Sleep 150
Click, 1100, 840
Sleep 350
Click, 1100, 870
Sleep 150
Send 100
Sleep 100
Click, 300, 460 ; MAKE SMALL START
Sleep 100
Click, 300, 485
Sleep 150
Click, 300, 515
Sleep 150
Click, 300, 540
Sleep 150
Click, 300, 560
Sleep 150
Click, 300, 590
Sleep 150
Click, 300, 610 ; MAKE SMALL END
Sleep 150
Click, 1100, 635
Sleep 350
Click, 1100, 720
Sleep 150
Send {Tab}
Sleep 150
Click, 1100, 720
Sleep 350
Click, 1100, 750
Sleep 150
Send 100
Sleep 150
Click, 1100, 770
Sleep 350
Click, 1100, 825
Sleep 150
Send //ucpegen
Sleep 150
Click, 1100, 825
Sleep 350
Click, 1100, 875
Sleep 150
Send 1200
Sleep 150
Click, 1100, 880
Sleep 350
Click, 1100, 965
Sleep 150
Send {Enter}
Click, 300, 630 ; MAKE SMALL START
Sleep 100
Click, 300, 666
Sleep 150
Click, 300, 685
Sleep 150
Click, 300, 715
Sleep 150
Click, 300, 740 ; MAKE SMALL END
Sleep 150
Click, 1100, 765
Sleep 350
Click, 1100, 800
Sleep 150
Send 100
Sleep 100
Click, 1100, 815
Sleep 350
Click, 1100, 900
Sleep 150
Send {Tab}
Sleep 150
Click, 1100, 900
Sleep 350
Click, 1100, 930
Sleep 150
Send 100
Sleep 150
Click, 1100, 955
Sleep 350
Click, 1100, 1035
Sleep 150
Send {Tab}
Sleep 150
Click, 1100, 955
Sleep 350
Click, 1100, 988
Sleep 150
Send 100
Sleep 150
Click, 1100, 955
Sleep 350
Click, 1100, 1035
Sleep 150
Send {Tab}
Sleep 150
Click, 1100, 955
Sleep 350
Click, 1100, 988
Send 100
Sleep 150
Click, 1100, 955
Sleep 350
Click, 1100, 1010
Sleep 150
Send //ucmdm
Sleep 150
Click, 1100, 955
Sleep 350
Click, 1100, 988
Sleep 150
Send 1200
Sleep 150
Click, 1100, 955
Sleep 350
Click, 1100, 1035
Sleep 150
Send {Enter}
Sleep 150
return

; auto-closing around text
; ========================
:*:"::
Send ""
Sleep 20
Send {Left}
return

:*:(::
Send ()
Sleep 20
Send {Left}
return

#!^F1::Run http://cernerm/


#^`::
Loop 15
{
Send {Enter}
Sleep 2000
}
return


; airtable check and copy
NumpadMult::
Send {Right}
Sleep 50
Send {Enter}
Sleep 50
Send {Down}
Sleep 50
Send {Left}
Sleep 50
Send ^c
Sleep 50
Click, 1300, 530
return

;airtable cleanup name
~Capslock & =::
Send {Enter}
Sleep 50
Send ^{Backspace}
Sleep 50
Send ^{Left}
Sleep 50
Send ^{Backspace}
Sleep 50
Send {Enter}
return

; copy phys name
!F1::
Sleep 200
SendEvent {Click 854, 771, down}{click 1800, 771, up}
Sleep 100
Send ^c
return
