# Updates
*This section is to provide in easy-to-read area for users to read up on what changes have been made and what is being worked on.*

* **11/21/18:** Adding README, explanations, and broken down code for user customization (IN PROGRESS)

# Warnings
All scripts have been tested to prevent any errors which may have clinical implications. Several safeguards have been put in place to prevent any
ramifications on patient care. Although this is the case, as always, **use at your own risk** and make sure to test all commands on a test patient. It is generally recommended to keep an eye on all processes. 

If there are any recommendations improvement or problems please submit an issue and I will do my best during my
free time to address them.

# General Information
* using the script as-is will disable capslock entirely
* use ctrl-f inside the script to find the portions of the script which may or may not need to be modified depending on your setup

### Requirements
* the main screen (aka launchpoint) needs to be set at 75%, otherwise, many of the commands on that screen may not work
* the main screen toolbar must be set by unchecking all options under View > Toolbar > Navigation Toolbar and enabling the "Patient Toolbar" under View > Toolbar >
* all code listed below that is labeled REQUIRED
* knowledge on how to edit Autohotkey (use google)

### Included Files
* Autohotkey executable with stable macros
* Macros.ahk file with macros currently being tested and some personal extras for use with other programs

# Overview
A running list of the keyboard shortcuts and *hotstrings* (words which trigger a command) contained in the default script file.

## General Tools
### Capslock to Hyper Key (REQUIRED)
* **Description:** Changes the capslock key to act as ctrl + win + shift + alt key combination
* **Key Combination:** `capslock`

<details>
<summary>
<b>Code:</b>
</summary> 

```autohotkey
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
```
</details>

### Reload AHK (REQUIRED)
* **Description:** Reloads the program to either stop a haywire script or to reload and implement any newly added script
* **Key Combination:** `win + x`

<details> 
<summary>
 <b>Code:</b>
</summary> 

```autohotkey
#x::Reload
```
</details>

### Scrap Note
* **Description:** Opens a blank notepad if notepad is open, the key combination will bring the notepad into focus
* **Key Combination:** `capslock + n`

<details>
<summary>
<b>Code:</b>
</summary> 

```autohotkey
~Capslock & n::
IfWinExist Untitled - Notepad
   WinActivate
else
   Run Notepad
return
```
</details>

### Mouse Location
* **Description:** Grabs the current mouse location (x and y coordinates)
* **Key Combination:** `capslock + m`
* **Caveat(s):** 
    - Make sure to close the window or the commands and keyboard will begin to behave incorrectly

<details>
<summary>
 <b>Code:</b>
</summary>

```autohotkey
~Capslock & m::
MouseGetPos, xpos, ypos
MsgBox, The cursor is at X%xpos% Y%ypos%.
return
```
</details>

### Cerner Login
* **Description:** Opens the login page for Cerner
* **Key Combination:** `alt + ctrl + win + F1`
* **Caveat(s):** 
    - Does not work while documenting remotely
    
 <details>
 <summary>
 <b>Code:</b>
</summary>

```autohotkey
#!^F1::Run http://cernerm/
```
</details>

## Launchpoint Commands

### Assign Scribe and Doctor
* **Description:** Assigns the doctor and scribe to the patient under the mouse
* **Key Combination:** `alt + ctrl + a`
* **Caveat(s):** 
    - You must click on the patient and hover your mouse (more-or-less) at the vertical center of the patient "rectangle". The horizontal positioning does not matter
    - The Launchpoint *must* be set at 75%   

<details>
 
 <summary>
 <b>Code:</b>
</summary> 

```autohotkey
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
Sleep 300
Click, left
SetTitleMatchMode, 2
WinWait, Providers for
Sleep 300
Click, 155, 178 ; CHANGE based on site, staff selection varies
Sleep 200
Send ngu ; CHANGE based on doctors last name
Sleep 100
Send {Enter}
Sleep 100
Send {Enter}
return
```

</details>

### Assign Doctor Only
* **Description:** Assigns only the doctor to the patient under the mouse
* **Key Combination:** `alt + a`
* **Caveat(s):** 
    - You *must* click on the patient and hover your mouse (more-or-less) at the vertical center of the patient "rectangle". The horizontal positioning does not matter
    - The Launchpoint *must* be set at 75%

<details>
 <summary>
 <b>Code:</b>
</summary>

```autohotkey
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
Send DOC ; CHANGE based on doctors last name
Sleep 100
Send {Enter}
Sleep 100
Send {Enter}
return
```
</details>

### Open New Chart and Insert Chart Template
* **Description:** Opens a new patient chart and inserts a general chart template
* **Key Combination:** `capslock + o`
* **Caveat(s):** 
    - May not work correctly if the system is slow (use win + x if the system is slow)
    - Must edit the script to insert your own autotexts

<details>
<summary>
<b>Code:</b>
</summary>

```autohotkey
~Capslock & o::
MouseGetPos x, y
Send {Alt}
Sleep 100
MouseMove 1163, 585
Sleep 100
Send !p
Sleep 100
Send {Enter}
Sleep 100
Send n
Sleep 50
Send d
Sleep 50
Send {Enter}
MouseMove %x%, %y%
SetTitleMatchMode, 2
WinWait, Opened by
Sleep 4000
Click 1080, 455, 2
SetTitleMatchMode, 2
WinWait, Opened by
Sleep 2500
Loop, 2 {
    Sleep 50
    Send {Tab}
    Sleep 50
}
Send [hgen ; CHANGE hpi autotext
Sleep 1200
Send {Enter}
Sleep 50
Send {Tab}
Sleep 50
Send [rgen ; CHANGE ros autotext
Sleep 1200
Send {Enter}
Loop, 1 {
    Sleep 50
    Send {Tab}
    Sleep 50
}
Send [pgen ; CHANGE pe autotext
Sleep 1200
Send {Enter}
Loop, 3 {
    Sleep 50
    Send {Tab}
    Sleep 50
}
Send [mdm_per ; CHANGE mdm autotext
Sleep 1200
Send {Enter}
Loop, 6 {
    Sleep 50
    Send {Tab}
    Sleep 50
}
Send {Enter}
Sleep 50
Send [attest ; CHANGE attestation autotext
Sleep 1200
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
```
</details>

## Bolding Text

### Bold Whole Line
* **Description:** Bolds the entire current line 
* **Key Combination:** `alt + b`
* **Caveat(s):** 
    - Only bolds 1 line at a time
    - Does not bold the line if there is an already existing bolded word

<details>
<summary>
<b>Code:</b>
</summary>

```autohotkey
!b::
Send {Home}
Sleep 100
Send +{Down}
Sleep 100
Send ^b
Sleep 100
Send {Right}
return
```
</details>

### Bold Right of Caret
* **Description:** Bolds right of where you currently are in the text
* **Key Combination:** `capslock + l`

<details>
<summary>
<b>Code:</b>
</summary> 
 
```autohotkey

```
</details>


### Bold Left of Caret
* **Description:** Bolds left of where you currently are in the text
* **Key Combination:** `capslock + j`
<details>
<summary>
<b>Code:</b>
</summary> 
 
```autohotkey

```
</details>

## List Item Shortcuts

### Change Up and Bold
* **Description:** Changes the list item to 1 option up and bolds that item
* **Key Combination:** `capslock + i`
* **Caveat(s):**
    - Requires to create list items inside autotexts

<details>
<summary>
<b>Code:</b>
</summary> 
 
```autohotkey

```
</details>

### Change Down and Bold
* **Description:** Changes the list item to 1 option down and bolds that item
* **Key Combination:** `capslock + k`
* **Caveat(s):**
    - Requires to create list items inside autotexts

<details>
<summary>
<b>Code:</b>
</summary> 
 
```autohotkey

```
</details>

### Bold Title (currently testing)
* **Description:** Bolds the title subsection in each part of the chart
* **Key Combination:** `alt + t`

<details>
<summary>
<b>Code:</b>
</summary> 
 
```autohotkey

```
</details>


## Printing

### Print Document
* **Description:** Prints the selected document when inside the chart under the *Documentation* section
* **Key Combination:** `alt + p`

<details>
<summary>
<b>Code:</b>
</summary> 
 
```autohotkey

```
</details>

## Navigation

### Go to Launchpoint
* **Description:** Goes to the Launchpoint
* **Key Combination:** `ctrl + 1`

<details>
<summary>
<b>Code:</b>
</summary> 
 
```autohotkey

```
</details>

### Go to Tracking List
* **Description:** Goes to the Tracking List
* **Key Combination:** `ctrl + 2`

<details>
<summary>
<b>Code:</b>
</summary> 
 
```autohotkey

```
</details>

### Go to Workflow 
* **Description:** Opens the workflow
* **Key Combination:** `alt + ctrl + w`

<details>
<summary>
<b>Code:</b>
</summary> 
 
```autohotkey

```
</details>

### Open Documentation
* **Description:** Opens the patient to the Documentation section
* **Key Combination:** `ctrl + d`

<details>
<summary>
<b>Code:</b>
</summary> 
 
```autohotkey

```
</details>

### Save Chart
* **Description:** Saves the current chart that is open
* **Key Combination:** `capslock + s`

<details>
<summary>
<b>Code:</b>
</summary> 
 
```autohotkey

```
</details>

## Discharge Navigation
* TODO: currently needs a prelude description to ensure user setup is correct
