;                 _______________________________________________
;               _-'    .-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.  --- `-_
;            _-'.-.-. .---.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.--.  .-.-.`-_
;         _-'.-.-.-. .---.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-`__`. .-.-.-.`-_
;      _-'.-.-.-.-. .-----.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-----. .-.-.-.-.`-_
;   _-'.-.-.-.-.-. .---.-. .-----------------------------. .-.---. .---.-.-.-.`-_
;  :-----------------------------------------------------------------------------:
;  `---._.-----------------------------------------------------------------._.---'

#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance Force ; Skips the dialog box and replaces the old instance automatically.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
pyscripts = %A_ScriptDir%\pyscripts
mspaint = C:\Windows\system32\mspaint.exe
discord = "C:\Users\Isaac Holston\AppData\Local\Discord\Update.exe" --processStart Discord.exe
valorant = "C:\Riot Games\Riot Client\RiotClientServices.exe" --launch-product=valorant --launch-patchline=live
league = "C:\Riot Games\League of Legends\LeagueClient.exe"
battlenet = "L:\Games\Battle.net\Battle.net.exe"
cmd = "C:\Windows\System32\cmd.exe"

; Keys on row 0 are still default numberpad keys.
; Key 1x0 - Numlock: This key has not changed. Should be off though for this script to work.
; Key 1x1 - NumpadDiv: Opens league of legends
numpaddiv::
if winexist("ahk_exe LeagueClientUx.exe")
{
  msgbox, 1, League, Close league of legends?, 3
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
  msgbox, 1, Valorant, Close valval?, 3
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
msgbox, 1, Sleep, Sleep computer?, 3
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

; Key 3x0 - NumpadLeft: Pulls up last replay in video folder
numpadleft::
run %pyscripts%\playlatestreplay.pyw
return

; Key 3x1 - NumpadClear: Deletes last replay in video folder
numpadclear::
msgbox, 1, Delete Video, Delete latest video?, 3
ifmsgbox, ok
  run %pyscripts%\deletelatestreplay.pyw
return

; Key 3x2 - NumpadRight: Open file location of last replay
numpadright::
run %pyscripts%\olrfl.pyw
return

; Key 3x3 - NumpadAdd: Opens webbrowser to url for mp4 compression
numpadadd::
msgbox, 1, Compress/Move Video, Compress and move latest video?, 3
ifmsgbox, ok
  run %pyscripts%\compressandmovelr.pyw
return

; Key 4x0 - NumpadEnd: Opens/Closes Discord.
numpadend::
if winexist("ahk_exe Discord.exe")
{
  msgbox, 1, Discord, Close Discord?, 3
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

; Key 5x2 - NumpadDel: Screenshots the screen, opens mspaint, and pastes it.
numpaddel::
critical, on
blockinput, on
send {printscreen}
blockinput, off
sleep 500
run %mspaint%
blockinput, On
winwait, Paint ahk_class MSPaintApp, , 3
if errorlevel
{
  msgBox winwait for mspaint timed out.
  return
}
winactivate, ahk_class MSPaintApp
send ^v
blockinput, off
return

; Key (4x4, 5x4) - NumpadEnter: Used to answer msgbox popups. Will eventually use it to add more buttons ie numpadenter + numpadup
