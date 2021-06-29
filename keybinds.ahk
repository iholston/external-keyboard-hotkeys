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
cmd = "C:\Windows\System32\cmd.exe"


;----------------------------------------------------------------------------------------
; Keys on row 0 are still default numberpad keys.
; Key 1x0 - Numlock: This key has not changed. Should be off though for this script to work.

; Key 1x1 - NumpadDiv: Opens league of legends
numpaddiv::
if winexist("ahk_exe LeagueClientUx.exe")
{
  msgbox, 1, League, Close league of legends?, 60
  ifmsgbox, ok
    winclose
    sleep 500
    winclose
}
else
  run %league%
return

; Key 1x2 - NumpadMult: Opens league of legends
numpadmult::
if winexist("ahk_exe VALORANT-Win64-Shipping.exe")
{
  msgbox, 1, Valorant, Close valval?, 60
  ifmsgbox, ok
    winclose
    sleep 500
    winclose
}
else
  run %valorant%
return

; Key 1x3 - Backspace. Default backspace

; Key 2x0 - NumpadHome: Sleeps Computer
numpadhome::
command = rundll32.exe powrprof.dll,SetSuspendState 0,1,0
msgbox, 1, Sleep, Sleep computer?, 60
if msgbox, ok
  run %cmd% /c %command%
return

; Key 2x1 - Numpadup: Toggle Mute
numpadup::
send {volume_mute}
return

; Key 2x2 - NumpadPgUp: Volume down
numpadpgup::
send {volume_down}
return

; Key 2x3 - NumpadSub: Volume Up
numpadsub::
send {volume_up}
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
numpadpgdn::
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

; Key 5x2 - NumpadDel: Runs a python script that finds that latest video and opens it.
numpaddel::
run %subscripts%\latest_replay.py
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
