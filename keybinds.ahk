#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Make sure to add script shortcut to windows startup folder. Win+R -> shell:startup
; I replaced each all keys on the numpad with blank keys so I refer to them on a grid starting 0x0 [Max:5x3]
; Row 0. Related to gameplay recordings.
; Row 1. Opens specific apps.
; Row 2. Closes apps on row 1.
; Row 3. ...

; Test Key.
^q::
Run "C:\Users\Isaac Holston\AppData\Local\Discord\Update.exe" --processStart Discord.exe
MsgBox Exiting
ExitApp
return

;----------------------------------------------------------------------------------------
; Key 0x0
; Records last 3 minutes of gameplay with nvidia shadowplay. Specifically, sends alt-f10.
^w::
Send !{F10}
return

; Key 0x1
; Opens a python script that auto-opens the latest video from the videos folder.
^e::
Run %A_ScriptDir%/subscripts/latest_replay.py
return

; Key 0x2
; Opens python script that compresses latest video in video folder if larger than 100MB and puts it on desktop. (So I can upload to discord easily).
^r::
Run %A_ScriptDir%/subscripts/video_manipulation.py
return

; Key 0x3
; Opens python script that deletes latest video in video folder.
^t::
Run %A_ScriptDir%/subscripts/delete_latest_video.py
return

; Key 1x0
; Opens Discord
^a::
Run "C:\Users\Isaac Holston\AppData\Local\Discord\Update.exe" --processStart Discord.exe
return

; Key 1x1
; Opens Valorant
^s::

return


