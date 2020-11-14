#NoEnv
#SingleInstance force
#IfWinActive ahk_exe discord.exe

; Init
FileRead, StartupMessage, fileread.txt
MsgBox, %StartupMessage%

convertMessage(message)
{
  ; _phrase_pairs := { "oo": "ew", "lol": "uwu", "lmao": "uwu", "lmfao": "uwu", "l": "w", "na": "nya", "ne": "nye", "ni": "nyi", "no": "nyo", "nu": "nyu", "ove": "uv", "r": "w", "that": "dat", "tion": "shun", "wha": "wa", "whe": "we", "whi": "wi", "you": "nyu" }
  _phrase_pairs := [ [ "oo", "ew" ], [ "lol", "uwu" ], [ "lmfao", "uwu" ], [ "l", "w" ], [ "na", "nya" ], [ "ne", "nye" ], [ "ni", "nyi" ], [ "no", "nyo" ], [ "nu", "nyu" ], [ "ove", "uv" ], [ "r", "w" ], [ "that", "dat" ], [ "tion", "shun" ], [ "wha", "wa" ], [ "whe", "we" ], [ "whi", "wi" ], [ "you", "nyu" ] ]
  _phrase_appends := [ " \^w\^", " :3", " :3c", " \;\;w\;\;", " x3", " owo", " nya~", " uwu", "~" ]

  owoMessage := message
  
  for _, item in _phrase_pairs
  {
    oldStr := item[1]
    newStr := item[2]

    owoMessage := StrReplace(owoMessage, oldStr, newStr)
  }

  Random, rand, 1, _phrase_appends.MaxIndex()
  owoMessage := owoMessage . _phrase_appends[rand]

  Return %owoMessage%
}

; Hotkey Declaration
!o::
Send, ^a
Sleep, 10
Send, ^c
Sleep, 10
Clipboard := convertMessage(Clipboard)
Send, ^v
Return

; ----------------------------------------------
; ; Owoifier for Discord Version 0.3 (Revamp)
; ; What is the revamp? The script doesn't check every word, rather checks the clipboard!
; ; This Version actually functions, and it isn't limited by typing limit!
; ; A big thank you to the CFC Community Discord for assistance in thinking like a programmer lol
; #NoEnv
; #SingleInstance Force
; #IfWinActive ; ahk_exe discord.exe

; MsgBox, AutoHotKey Owoifier Version revamp-0.2.1 by Major#4091 `n`n Help from the CFC Community as well as Radiator Springs on Discord.

; owoDict := {"oo": "ew", "lol": "uwu", "lmao": "uwu", "lmfao": "uwu", "l": "w", "na": "nya", "ne": "nye", "ni": "nyi", "no": "nyo", "nu": "nyu", "ove": "uv", "r": "w", "that": "dat", "tion": "shun", "wha": "wa", "whe": "we", "whi": "wi", "you": "nyu"}
; global owoPhrases := [" \^w\^", " :3", " :3c", " \;\;w\;\;", " x3", " owo", " nya~", " uwu", "~"]

; convertString(String, Array) ; Converts an input string using provided array
; {
;   For Key, Value in Array
;   {
;     String := StrReplace(String, Key, Value)
;   }
;   Random, randInd, 1, 9
;   randString := % owoPhrases[randInd]
;   String := String . randString
; Return %String%
; }

; !o::
; Send, ^a
; Sleep, 10
; Send, ^c
; Sleep, 10
; Clipboard := convertString(Clipboard, owoDict)
; Send, ^v
; Return
