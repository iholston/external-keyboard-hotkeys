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
loginPath = %A_ScriptDir%\config\login.txt ; unencrypted because i do not care lul
soundMute = "C:\Program Files\SoundVolumeView.exe"
mspaint = "C:\Windows\system32\mspaint.exe"
valorant = "C:\Riot Games\Riot Client\RiotClientServices.exe" --launch-product=valorant --launch-patchline=live
league = "C:\Riot Games\League of Legends\LeagueClient.exe"
battlenet = "L:\Games\Battle.net\Battle.net.exe"
cmd = "C:\Windows\System32\cmd.exe"

; Row 0 => Default numpad keys

; Row 1 => Open league of legends and Valorant
; Key 1x0 - Numlock: This key has not changed. Should be off though for this script to work.

; Key 1x1 - NumpadDiv => Opens league of legends
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

; Key 1x2 - NumpadMult => Opens league of legends
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

; Key 1x3 - Backspace => Default backspace

; ROW 2 => Logins.
; Key 2x0 - NumpadHome => Login #1
numpadhome::
Run, %pyscripts%\login.pyw %loginPath% 1, ; %loginPath% gets passed as 2 parameters because I have a space in the directory name...
return

; Key 2x1 - Numpadup => Login #2
numpadup::
Run, %pyscripts%\login.pyw %loginPath% 2,
return

; Key 2x2 - NumpadPgUp => Login #3
numpadpgup::
Run, %pyscripts%\login.pyw %loginPath% 3,
return

; Key 2x3 - NumpadSub => Login #4
numpadsub::
Run, %pyscripts%\login.pyw %loginPath% 4,
return

; Key 3x0 - NumpadLeft => Pulls up lastest video in video folder
numpadleft::
run %pyscripts%\playlatestreplay.pyw
return

; Key 3x1 - NumpadClear => Deletes last replay in video folder
numpadclear::
msgbox, 1, Delete Video, Delete latest video?, 3
ifmsgbox, ok
  run %pyscripts%\deletelatestreplay.pyw
return

; Key 3x2 - NumpadRight => Open file location of last replay
numpadright::
run %pyscripts%\olrfl.pyw
return

; Key 3x3 - NumpadAdd => Opens webbrowser to url for mp4 compression
numpadadd::
msgbox, 1, Open webbrowser for compression?, 3
ifmsgbox, ok
  run %pyscripts%\compressandmovelr.pyw
return

; Key 4x0 - NumpadEnd: Toggles Mic mute via soundvolumeview since my mic does not have mute button
numpadend::
Run, %soundMute% /Switch "{0.0.1.00000000}.{4c0c1999-4145-4005-96dc-ae8ef6e667a2}",
msgbox, 1, MIC MUTED, Click OK to open soundviewer`nMic will UNMUTE when this window is closed,
ifmsgbox, ok
  Run %soundMute%
Run, %soundMute% /Switch "{0.0.1.00000000}.{4c0c1999-4145-4005-96dc-ae8ef6e667a2}",
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

; Key 4x3 - Upper half of enter => see Key 5x3

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

; Key (4x3, 5x3) - NumpadEnter: Used to answer msgbox popups. Will eventually use it to add more buttons ie numpadenter + numpadup

; The numlocked versions of these keys Numpad1-9 do not work consistently because games and other apps will take them as input instead of autohotkey
; i have no idea why. So I just have them output a message stating to turn off numlock.
numpad1::
numpad2::
numpad3::
numpad4::
numpad5::
numpad6::
numpad7::
numpad8::
numpad9::
numpad0::
numpaddot::
msgbox, 1, NUMLOCK ON, TURN OFF NUMLOCK THANKS TEAM, 3
return
