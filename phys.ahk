; ======================
; variables
; ======================

; charting
; ======================
hpi := "//uchpi"
ros := "//ucros"
pe := "//ucpe"
mdm := "[mdm"
attest := "[attest"

; timing
; ======================
pause1 = 50
pause2 = 100
pause3 = 200
pause4 = 1000
pause5 = 2000
pause6 = 3000

:*:genchart::
GoSub genchart
return


genchart:
GoSub gotoHPI
Send %hpi% 
Send %clipboard%
Sleep %pause4%
Send {Enter}
GoSub gotoROS
Send %ros%
Send %clipboard%
Sleep %pause4%
Send {Enter}
GoSub gotoPE
Send %pe% 
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


; ======================
; physician specific macros
; ======================

; discharge print
F10::
Send !c
Sleep 50
Send {Enter}
Sleep 2500
Click 274, 564
Sleep 4000
Click 1577, 975
Sleep 1500
Click 845, 651
Sleep 1900
Click 240, 400
return
