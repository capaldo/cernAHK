# cernAHK

## Purpose
To save time on charting, increase charting accuracy, and reduce burnout.

## Updates
*This section is to provide in easy-to-read area for users to read up on what changes have been made and what is being worked on.*

## Warnings
All scripts have been tested to prevent any errors which may have clinical implications. Several safeguards have been put in place to prevent any
ramifications on patient care. Although this is the case, as always, **use at your own risk** and make sure to test all commands on a test patient. It is generally recommended to keep an eye on all processes. 

If there are any recommendations improvement or problems please submit an issue and I will do my best during my
free time to address them.

## General Information
* using the script as-is will disable capslock entirely
* use ctrl-f inside the script to find the portions of the script which may or may not need to be modified depending on your setup

### Requirements
* the main screen (aka launchpoint) needs to be set at 75%, otherwise, many of the commands on that screen may not work

### Included Files
* Autohotkey executable with stable macros
* Macros.ahk file with macros currently being tested and some personal extras for use with other programs

## Overview

### General Tools

#### Capslock to Hyper Key
* **Description:** Changes the capslock key to act as ctrl + win + shift + alt key combination
* **Key Combination:** `capslock`

#### Reload AHK
* **Description:** Reloads the program to either stop a haywire script or to reload and implement any newly added script
* **Key Combination:** `win + x`

#### Scrap Note
* **Description:** Opens a blank notepad if no notepad is open, the key combination will bring the notepad into focus
* **Key Combination:** `capslock + n`

#### Mouse Location
* **Description:** Grabs the current mouse location (x and y coordinates)
* **Key Combination:** `capslock + m`
* **Caveat(s):** 
    - Make sure to close the window or the commands and keyboard will begin to behave incorrectly

#### Cerner Login
* **Description:** Opens the login page for Cerner
* **Key Combination:** `alt + ctrl + win + F1`
* **Caveat(s):** 
    - Does not work while documenting remotely


### Launchpoint Commands

#### Assign Scribe and Doctor
* **Description:** Assigns the doctor and scribe to the patient under the mouse
* **Key Combination:** `alt + ctrl + a`
* **Caveat(s):** 
    - You must click on the patient and hover your mouse (more-or-less) at the vertical center of the patient "rectangle". The horizontal positioning does not matter
    - The Launchpoint *must* be set at 75%

#### Assign Doctor Only
* **Description:** Assigns only the doctor to the patient under the mouse
* **Key Combination:** `alt + a`
* **Caveat(s):** 
    - You *must* click on the patient and hover your mouse (more-or-less) at the vertical center of the patient "rectangle". The horizontal positioning does not matter
    - The Launchpoint *must* be set at 75%

#### Open New Chart and Insert Chart Template
* **Description:** Opens a new patient chart and inserts a general chart template
* **Key Combination:** `capslock + o`
* **Caveat(s):** 
    - May not work correctly if the system is slow (use win + x if the system is slow)
    - Must edit the script to insert your own autotexts

### Bolding Text

#### Bold Whole Line
* **Description:** Bolds the entire current line 
* **Key Combination:** `alt + b`
* **Caveat(s):** 
    - Only bolds 1 line at a time
    - Does not bold the line if there is an already existing bolded word

#### Bold Right of Caret
* **Description:** Bolds right of where you currently are in the text
* **Key Combination:** `capslock + l`

#### Bold Left of Caret
* **Description:** Bolds left of where you currently are in the text
* **Key Combination:** `capslock + j`

### List Item Shortcuts

#### Change Up and Bold
* **Description:** Changes the list item to 1 option up and bolds that item
* **Key Combination:** `capslock + i`
* **Caveat(s):**
    - Requires to create list items inside autotexts

#### Change Down and Bold
* **Description:** Changes the list item to 1 option down and bolds that item
* **Key Combination:** `capslock + k`
* **Caveat(s):**
    - Requires to create list items inside autotexts

#### Bold Title (currently testing)
* **Description:** Bolds the title subsection in each part of the chart
* **Key Combination:** `alt + t`


### Printing

#### Print Document
* **Description:** Prints the selected document when inside the chart
* **Key Combination:** `alt + p`

### Navigation

#### Go to Launchpoint
* **Description:** Goes to the Launchpoint
* **Key Combination:** `ctrl + 1`

#### Go to Tracking List
* **Description:** Goes to the Tracking List
* **Key Combination:** `ctrl + 2`

#### Go to Workflow 
* **Description:** Opens the workflow
* **Key Combination:** `alt + ctrl + w`

#### Open Documentation
* **Description:** Opens the patient to the Documentation section
* **Key Combination:** `ctrl + d`

#### Save Chart
* **Description:** Saves the current chart that is open
* **Key Combination:** `capslock + s`

### Discharge Navigation
* TODO: currently needs a prelude description to ensure user setup is correct
