#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance Force ; Skips the dialog box and replaces the old instance automatically.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#InstallKeybdHook

; Paths. Mostly copied out of shortcut menus' target fields.
subscripts = %A_ScriptDir%\subscripts
mspaint = C:\Windows\system32\mspaint.exe
discord = "C:\Users\Isaac Holston\AppData\Local\Discord\Update.exe" --processStart Discord.exe
valorant = "C:\Riot Games\Riot Client\RiotClientServices.exe" --launch-product=valorant --launch-patchline=live
league = "C:\Riot Games\League of Legends\LeagueClient.exe"
battlenet = "L:\Games\Battle.net\Battle.net.exe"


; Test Key
^q::
run %mspaint%
MsgBox exiting
ExitApp
return

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


; Key 4x0 - NumpadEnd: Opens/Closes Discord.
numpadend::
if winexist("ahk_exe Discord.exe")
{
  msgbox, 1, Discord, Close Discord?, 60
  ifmsgbox, ok
    winclose
}
else
  run %discord%
return

; Key 4x1 - NumpadDown: Toggles discord mute.
numpaddown::
if winexist("ahk_exe Discord.exe")
{
  blockinput, on
  winactivate, ahk_exe Discord.exe
  send ^+m
  blockinput, off
}
return

; Key 4x2 - NumpadPgDn: Toggles discord deafen
numpaddown::
if winexist("ahk_exe Discord.exe")
{
  blockinput, on
  winactivate, ahk_exe Discord.exe
  send ^+d
  blockinput, off
}
return

; Key (5x0, 5x1) - NumpadIns: Activates nvidia shadowplay by sending alt-f10.
numpadins::
send !{f10}
return

; Key 5x2 - NumpadDel: Runs a python script that finds that latest video with current date in video folder and deletes it.
numpaddel::
run %subscripts%\delete_latest_video.py
return

; Key (4x4, 5x4) - NumpadEnter: Screenshots the screen, opens mspaint, and pastes it.
numpadenter::
critical, on
blockinput, on
send {printscreen}
blockinput, off
sleep 500
run %mspaint%
blockinput, On
winwait, Paint ahk_class MSPaintApp, , 5
if errorlevel
{
  msgBox winwait for mspaint timed out.
  return
}
winactivate, ahk_class MSPaintApp
send ^v
blockinput, off
return
