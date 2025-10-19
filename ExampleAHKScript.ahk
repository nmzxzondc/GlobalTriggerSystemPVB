#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent
#Include JSON.ahk
#Include simple-http.ahk
#SingleInstance, force


Loop {
	http := new SimpleHTTP()
	checkStocked := http.POST("http://127.0.0.1:8000/stocked")
	parsed := JSON.Load(checkStocked)
	MsgBox % parsed[1]
	Sleep, 1000
}

Esc::ExitApp
