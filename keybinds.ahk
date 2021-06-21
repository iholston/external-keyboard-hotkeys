#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance Force ; Skips the dialog box and replaces the old instance automatically.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.


; Test Key
^q::
process, close, wallpaper32.exe
MsgBox exiting
ExitApp
return

; Paths
subscripts = %A_ScriptDir%\subscripts
mspaint = C:\Windows\system32\mspaint.exe

; Commands. Mostly copied out of shortcut menus' target fields.
open_discord = "C:\Users\Isaac Holston\AppData\Local\Discord\Update.exe" --processStart Discord.exe
open_val = "C:\Riot Games\Riot Client\RiotClientServices.exe" --launch-product=valorant --launch-patchline=live
open_league = "C:\Riot Games\League of Legends\LeagueClient.exe"
open_battlenet = "L:\Games\Battle.net\Battle.net.exe"


;----------------------------------------------------------------------------------------
; Key 0x0 - Regular Esc Button

; Key 0x1 - Screenshots screen and opens Microsoft Paint.
^i::
send prtsc
sleep 1000
run %mspaint%
return

; Key 0x2 - Used as a YES Button
; Key 0x3 - Used as a NO Button

; Key 0x0 - Records last 3 minutes of gameplay with nvidia shadowplay. Specifically, sends alt-f10.
^w::
send !{f10}
return

; Key 0x1 - Opens a python script that auto-opens the latest video from the videos folder.
^e::
Run %subscripts%\latest_replay.py
return

; Key 0x2 - Opens python script that compresses latest video in video folder if larger than 100MB and puts it on desktop. (So I can upload to discord easily).
^r::
Run %subscripts%\video_manipulation.py
return

; Key 0x3 - Opens python script that deletes latest video in video folder.
^t::
Run %subscripts%\delete_latest_video.py
return

; Key 1x0 - Opens Discord
^a::
Run %open_discord%
return

; Key 1x1 - Opens Valorant
^p::
Run %open_val%
return

; Key 1x2 - Opens League
^d::
Run %open_league%
return

; Key 1x3 - Opens Battle.net client
^f::
Run %open_battlenet%
return
