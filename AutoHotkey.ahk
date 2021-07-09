; this material must come first: only what is up to 
; the "return" line will be executed at startup
; [2009 12 12]
SetTitleMatchMode, 2

GroupAdd, ASCII,  Add Variable
GroupAdd, ASCII,  Administrator: Command Prompt 
GroupAdd, ASCII,  Command Prompt 
GroupAdd, ASCII,  Commit
GroupAdd, ASCII,  Console2
GroupAdd, ASCII,  Do-file Editor - 
GroupAdd, ASCII,  Eclipse
GroupAdd, ASCII,  Edit Variable Name or Expression
GroupAdd, ASCII,  EditPad
GroupAdd, ASCII,  Find Text
GroupAdd, ASCII,  jbullock@
GroupAdd, ASCII,  Knowledge of the Supreme Court
GroupAdd, ASCII,  Komodo
GroupAdd, ASCII,  MySQL
GroupAdd, ASCII,  Notepad
GroupAdd, ASCII,  pinentry-qt
GroupAdd, ASCII,  PowerShell
GroupAdd, ASCII,  R Console
GroupAdd, ASCII,  RGui
GroupAdd, ASCII,  root@
GroupAdd, ASCII,  RStudio
GroupAdd, ASCII,  Rx Toolkit
GroupAdd, ASCII,  Save As
GroupAdd, ASCII,  Save Attachment
GroupAdd, ASCII,  SecureCRT
GroupAdd, ASCII,  Statistical Modeling
GroupAdd, ASCII,  Windows Powershell
GroupAdd, ASCII,  Windows Terminal
GroupAdd, ASCII,  WinEdt

GroupAdd, Acrobat, Adobe Acrobat Pro DC

GroupAdd, Eclipse, Eclipse Platform
GroupAdd, Eclipse, eclipse-workspace
GroupAdd, Eclipse, StatET

GroupAdd, Gmail,  Gmail

GroupAdd, R, Eclipse Platform
GroupAdd, R, eclipse-workspace
GroupAdd, R, StatET

GroupAdd, RStudio, ahk_exe rstudio.exe
GroupAdd, Slack,  Slack
GroupAdd, Stata,  Do-file Editor - 
GroupAdd, Thunderbird, Write:
GroupAdd, WinEdt, WinEdt
GroupAdd, Word,   ahk_exe WINWORD.exe
return




; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one ahk file simultaneously and each will get its own tray icon.

; SAMPLE HOTKEYS: Below are two sample hotkeys.  The first is Win+Z and it
; launches a web site in the default browser.  The second is Control+Alt+N
; and it launches a new Notepad window (or activates an existing one).  To
; try out these hotkeys, run AutoHotkey again, which will load this file.

; #z::Run www.autohotkey.com

;^!n::
;IfWinExist Untitled - Notepad
;	WinActivate
;else
;	Run Notepad
;return


; Note: From now on whenever you run AutoHotkey directly, this script
; will be loaded.  So feel free to customize it to suit your needs.

; Please read the QUICK-START TUTORIAL near the top of the help file.
; It explains how to perform common automation tasks such as sending
; keystrokes and mouse clicks.  It also explains more about hotkeys.



; #####################################################################
; BULLOCK NOTES
; #####################################################################

; COMMAND PROMPT
; To make a hotkey for the command prompt, do something like this:
;;  Enable Ctrl-V to paste to command prompt
;;  #IfWinActive ahk_class ConsoleWindowClass
;;    ^V::
;;    SendInput {Raw}%clipboard%
;;    return
;;  #IfWinActive


; CONTEXT SENSITIVITY
; Create it with something like 
;   #IfWinActive, ahk_group Eclipse
; or 
;   if WinActive("ahk_group Word") or WinActive("ahk_group Gmail")
; and to turn it off, just use 
;   #IfWinActive 
; by itself.




; #####################################################################
; GENERAL ADDITIONS
; #####################################################################

; TOGGLE AUTOHOTKEY WITH CTRL-ALT-SHIFT-=
^!+=::Suspend



; SEND DATE IN BRACKETS (CTRL-ALT-SHIFT D)
; Eclipse:  use spaces
; RStudio:  use spaces
; WinEdt:   use tildes
; All else: use Unicode non-breaking spaces
#IfWinActive, ahk_group Eclipse
  ^!+d::
  Send [%A_YYYY% %A_MM% %A_DD%]
  return
#IfWinActive, ahk_group RStudio
  ^!+d::
  Send [%A_YYYY% %A_MM% %A_DD%]
  return
#IfWinActive, ahk_group WinEdt
  ^!+d::
  Send [%A_YYYY%{ASC 0126}%A_MM%{ASC 0126}%A_DD%:{ASC 0032}
  return
#IfWinActive
  ^!+d::
  Send [%A_YYYY%{U+00A0}%A_MM%{U+00A0}%A_DD%] 
    ; U+00A0 is a Unicode non-breaking space
    ; inserting Sleep commands doesn't make the spaces more likely to appear.  [2010 01 29]
  return


; CREATE ELLIPSIS WITH CTRL-.
^.::
Send {ASC 0133}
return


; DISABLE INSERT, CAPS LOCK, AND SCROLL LOCK
$Insert::Return
; Insert::Return
; !Insert::Return
; ^Insert::Return
; +Insert::Return
; ^+Insert::Return
CapsLock::SetCapsLockState, AlwaysOff
; CapsLock::Return
; !CapsLock::Return
; ^CapsLock::Return
; +CapsLock::Return
SetScrollLockState, AlwaysOff


; Insert on the numeric keypad will still work when NumLock is off
; I haven't managed to set NumLock to an always-on state.  [2021 04 14]
;
; SetNumLockState, AlwaysOn
; $NumLock::Return



; MAKE CODE HEADINGS
; Shortcut for Ctrl-Shift-#.
; The version below, with four hash marks in the middle line, 
; allows the headings to appear in the RStudio outline pane.
; [2020Â 03Â 27]
#IfWinActive, ahk_group ASCII
  ^+#::
  SendInput {#}{Space}{* 74}
  SendInput {Enter}
  SendInput {#}{Space}{space}{# 4}
  SendInput {Enter}
  SendInput {#}{Space}{* 74}
  SendInput {Up}{Left 5}
  return
; #IfWinActive, ahk_group ASCII
;   ^+#::
;   SendInput {# 76}
;   SendInput {Enter}
;   SendInput {#}{Space}
;   SendInput {Enter}
;   SendInput {# 76}
;   SendInput {Up}
;   return



; CREATE TRUE MULTIPLICATION SIGN WITH CTRL-ALT-SHIFT-X
; We use #IfWinActive by itself to turn off context sensitivity.
#IfWinActive
  ^+!x::
  Send {U+00D7}
  return



; LATEX EQUIVALENTS
; These are "hotstrings." See https://www.autohotkey.com/docs/Hotstrings.htm.
;
; The "c" inside the first pair of colons means "case sensitive"
; The "?" inside the first pair of colons means "convert even when the preceding character is alphanumeric"
; The "*" inside the first pair of colons means "convert immediately; don't wait for an ending character"
;
#if WinActive("ahk_group Word") or WinActive("ahk_group Gmail")
  :c*:\alpha::{U+0251}
  :c:\approx::{U+2248}
  :c?*:\beta::{U+03B2}
  :c*:\epsilon::{U+03B5}
  ; ::\in::{U2208}
  ; ::\ind::{U2AEB}
  ; ::\independent::{U2AEB}
  :c*:\gamma::{U+03B3}
  :c*:\geq::{U+2265}
  :c*?:\lambda::{U+019B}
  :c*?:\leftarrow::{U+2190}
  :c*?:\leftrightarrow::{U+2194}
  :c*:\leq::{U+2264}
  :c*:\neq::{U+2260}
  ; ::\notin::{U+2209}
  :c*:\phi::{U+0278}
  :c*:\Phi::{U+03A6}
  :c*:\pi::{U+03C0}
  :c*:\R::{U+211D}
  :c*:\rho::{U+03C1}
  :c*?:\rightarrow::{U+2192}
  :c*:\sigma::{U+03C3}
  :c*:\sum::{U+03A3}
  :c*:\tau::{U+03C4}
  :c*:\theta::{U+03F4}
  :c*:\times::{U+00D7}

  ; ACCENTED CHARACTERS
  :c*?:\``a::{U+00E0}
  :c*?:\"a::{U+00E4}
  :c*?:\'e::{U+00E9}
  :c*?:\'I::{U+00CD}
  :c*?:\'i::{U+00ED}
  :c*?:\"O::{U+00D6}
  :c*?:\"o::{U+00F6}   ;   o with diaeresis (umlaut)

  ; SUBSCRIPTS
  ::_0::{U+2080}
  ::_1 ::{U+2081}
  ::_2::{U+2082}
  ::_3::{U+2083}
  ::_i::{U+1D62}
  ::_t::{U+209C}

  ; SUPERSCRIPTS
  :?*:^2::{U+00B2}
  :?*:^3::{U+00B3}




; CREATE NON-BREAKING SPACE WITH CTRL-SHIFT-SPACE
; By default, Word inserts a non-breaking space when you type 
; Ctrl-Shift-Space. This shortcut does the same for 
; all other programs. Again, #IfWinActive on a line by itself
; means that there is no context sensitivity.
#IfWinActive
  ^+space::
  Send {U+00A0}
  return


; START SINGLE-CELL TABLE WITH CTRL-ALT-SHIFT-T
^!+t::
Send <table width="410"><tr><td>
return


; CLOSE SINGLE-CELL TABLE WITH CTRL-ALT-SHIFT-Y
^!+y::
Send </td></tr></table>
return


; START FANCY SINGLE-CELL TABLE WITH CTRL-ALT-SHIFT-U
^!+u::
Send <table width="410"><tr><td><span style="font-
Sleep 200
Send size: medium; font-
Sleep 200
Send family: 'Times New Roman';">
return


; CLOSE FANCY SINGLE-CELL TABLE WITH CTRL-ALT-SHIFT-I
^!+i::
Send </span></td></tr></table>
return


; SEND EMAIL ADDRESS WITH CTRL-ALT-SHIFT-J
^!+j::
Send john.bullock@gmail.com
return


; CONVERT BACKSLASHES TO SLASHES WHEN PASTING PATHS FROM EXPLORER
; See https://superuser.com/a/1381810/113083 for the function below.
RegExEsc(String, Options := "") {
    if (Options == "$") {
	;; To be used with "RegExReplace" third parameter! ("$$" represents one literal "$").
        string_with_re_meta_char_escaped := RegExReplace(String, "\$", "$$$$")
    } else {
	;; To be used with "RegExMatch" and "RegExReplace" second parameters! ("\\" represents one literal "\").
        string_with_re_meta_char_escaped := "\E\Q" RegExReplace(String, "\\E", "\E\\E\Q") "\E"
    }

    return string_with_re_meta_char_escaped
}
clean_path_in_clipboard() {
    EnvGet, home_dir_path, USERPROFILE
    Clipboard := RegExReplace(Clipboard, "^" RegExEsc(home_dir_path), "%USERPROFILE%")
    If (RegExMatch(Clipboard, "^(?i)(?:[a-z]:|%[^%]+%)?\\[^\\]")) {
        StringReplace, Clipboard, Clipboard,\,/, All
    }
    Return
}


#IfWinActive, ahk_group R
  ^v::
  if (DllCall("IsClipboardFormatAvailable", "Uint", 1) OR DllCall("IsClipboardFormatAvailable", "Uint", 13)) ; if text was copied
  {
    clean_path_in_clipboard()
  }
  Send ^v
  return	



; PASTE PLAIN TEXT WITH CTRL-SHIFT-V
; Unfortunately, this doesn't work when pasting into 
; Word comment notes. [2021 04 24]
^+v::                            ; Text–only paste from ClipBoard
   Clip0 = %ClipBoardAll%
   ClipBoard = %ClipBoard%       ; Convert to text
   Send ^v                       ; For best compatibility: SendPlay
   Sleep 50                      ; Don't change clipboard while it is pasted! (Sleep > 0)
   ClipBoard = %Clip0%           ; Restore original ClipBoard
   VarSetCapacity(Clip0, 0)      ; Free memory
Return


; #####################################################################
; HYPHENS AND DASHES
; #####################################################################
; {ASC 0032} space
; {ASC 0045} hyphen
; {ASC 0095} underscore
; {ASC 0126} tilde
; {ASC 0150] em dash
; {ASC 0151] em dash


; UNDERSCORE SENDS UNDERSCORE FOR ASCII PROGRAMS, EM DASH OTHERWISE
#IfWinActive, ahk_group ASCII
  _::
  Send {ASC 0095}
  return	
#IfWinActive, ahk_exe explorer.exe
  _::
  Send {ASC 0095}
  return	
#IfWinActive, ahk_exe ONENOTEM.EXE
  _::
  Send {ASC 0095}
  return	
#IfWinActive, ahk_group Thunderbird
  _::
  Send {ASC 0151}
  return	
#IfWinActive
  _::
  Send {ASC 0151}
  return	


; HYPHEN SENDS HYPHEN FOR ASCII PROGRAMS, EN DASH OTHERWISE
#IfWinActive, ahk_group ASCII
  -::
  Send {ASC 0045}
  return
#IfWinActive
  -::
  Send {ASC 0150}
  return


; TILDE SENDS TILDE FOR ASCII PROGRAMS, HYPHEN OTHERWISE
#IfWinActive, ahk_group ASCII
  +`::
  Send {ASC 0126}
  return
#IfWinActive
  +`::
  Send {ASC 0045}
  return


; CTRL-ALT-HYPHEN SENDS NON-BREAKING HYPHEN
^!-::
Send {U+2011}
return


; NUMERIC KEYPAD SENDS MINUS SIGN
NumpadSub::
  Send {U+02D7}
  return



; #####################################################################
; ACROBAT SHORTCUT
; #####################################################################
;
; CTRL-W MAPPED TO ALT-F-C
; I use Control-W to close a file. That is what it should do. But 
; -- apparently because of a bug -- it sometimes closes the entire 
; Acrobat Window, no matter how many files are open. This mapping
; should fix the problem.

; TOGGLE AutoHotkey WITH CTRL-ALT-SHIFT-=
#IfWinActive, ahk_group Acrobat
  ^w::
    Send !f
    Send c
    return



; #####################################################################
; ECLIPSE SHORTCUTS
; #####################################################################
; All of these shortcuts work the same way. In Eclipse, highlight the 
; name of an object, and then use the shortcut -- for example, 
; CTRL-SHIFT-C. The shortcut will then operate on the object that has 
; the highlighted name.  [2020 03 08]



; CTRL-ENTER SENDS THE CURRENT LINE
; I do this for compatibility with RStudio, which is a pain to configure
; on the ICPSR VDE.  [2020 12 08]
#IfWinActive, ahk_group Eclipse
  ^Enter::
  SendInput {Control down}{r}{Control up}
  return


; CTRL-SHIFT-C GETS CLASS OF OBJECT
#IfWinActive, ahk_group Eclipse
  ^+c::
  SendInput {Control down}{c}{0}{Control up}
  Sleep 300
  SendInput class(
  SendInput {Control down}{v}{Control up}
  SendInput )
  Sleep 100
  SendInput {Enter}{Control down}{0}{Control up}{Left}
  return


; CTRL-SHIFT-D GETS DIM OF OBJECT
#IfWinActive, ahk_group Eclipse
  ^+d::
  SendInput {Control down}{c}{0}{Control up}
  Sleep 300
  SendInput dim(
  SendInput {Control down}{v}{Control up}
  SendInput )
  Sleep 100
  SendInput {Enter}{Control down}{0}{Control up}{Left}
  return


; CTRL-SHIFT-H GETS HEAD OF OBJECT
#IfWinActive, ahk_group Eclipse
  ^+h::
  SendInput {Control down}{c}{0}{Control up}
  Sleep 300
  SendInput head(
  SendInput {Control down}{v}{Control up}
  SendInput )
  Sleep 100
  SendInput {Enter}{Control down}{0}{Control up}{Left}
  return


; CTRL-SHIFT-L GETS NOBS OR LENGTH OF OBJECT
#IfWinActive, ahk_group Eclipse
  ^+l::
  SendInput {Control down}{c}{0}{Control up}
  Sleep 300
  SendInput if (class(
  SendInput {Control down}{v}{Control up}
  SendInput )[1] `%in`% c('ivreg', 'lm', 'glm')) nobs(
  SendInput {Control down}{v}{Control up}
  SendInput ) else length(
  SendInput {Control down}{v}{Control up}
  SendInput )
  Sleep 100
  SendInput {Enter}{Control down}{0}{Control up}{Left}
  return


; CTRL-SHIFT-P PRINTS AN OBJECT WITH printAll()
#IfWinActive, ahk_group Eclipse
  ^+p::
  SendInput {Control down}{c}{0}{Control up}
  Sleep 300
  SendInput printAll(
  SendInput {Control down}{v}{Control up}
  SendInput )
  Sleep 100
  SendInput {Enter}{Control down}{0}{Control up}{Left}
  return



; CTRL-SHIFT-S GETS SUMMARY OF OBJECT
#IfWinActive, ahk_group Eclipse
  ^+s::
  SendInput {Control down}{c}{0}{Control up}
  Sleep 300
  SendInput summary(
  SendInput {Control down}{v}{Control up}
  SendInput )
  Sleep 100
  SendInput {Enter}{Control down}{0}{Control up}{Left}
  return


; CTRL-SHIFT-T TABLES THE OBJECT
#IfWinActive, ahk_group Eclipse
  ^+t::
  SendInput {Control down}{c}{0}{Control up}
  Sleep 300
  SendInput table(
  SendInput {Control down}{v}{Control up}
  SendInput )
  Sleep 100
  SendInput {Enter}{Control down}{0}{Control up}{Left}
  return


#IfWinActive, ahk_group Eclipse
  ; The RegExReplace command should make it possible 
  ; to use this macro on multiple lines of code at 
  ; once.  But it doesn't seem to be working yet.  
  ; Use MsgBox % varName to debug.  [2014 06 05]
  ; ^+d::
  ;SendInput {Control down}{c}{0}{Control up}
  ;varName := clipboard
  ;varName := RegExReplace(varName, "\R", " ") ; "\R" stands for any newline character
  ;clipboard := varName
  ;Sleep 200
  ;SendInput if ('lm' `%in`% class(
 ;SendInput {Control down}{v}{Control up}
 ; SendInput )) display(
  ;SendInput {Control down}{v}{Control up}
  ;SendInput ) else dim(
  ;SendInput {Control down}{v}{Control up}
  ;SendInput )
  ;SendInput {Enter}{Control down}{0}{Control up}{Left}
  ;return



; #####################################################################
; GMAIL SHORTCUT
; #####################################################################
;#IfWinActive, ahk_group Gmail
;if WinActive("ahk_group Gmail")
#IfWinActive
  ^+!z::
  Send https://northwestern.zoom.us/j/9431220423
  return



; #####################################################################
; RSTUDIO SHORTCUTS
; #####################################################################
; Redo commands to RStudio so I can use my Eclipse/StatET shortcuts


; CTRL-0 TOGGLES BETWEEN SOURCE AND CONSOLE
; Go to console. My Eclipse default, Ctrl+0, can't be bound to anything.
; It seems to be reserved for restoring the default font size. So I have
; bound Ctrl+3 to toggling between source and console in RStudio, and
; here, I map Ctrl+0 to Ctrl+3.
#IfWinActive, ahk_group RStudio
  ^0::
  Send ^3
  return


; CTRL-EQUAL SENDS " <- "
#IfWinActive, ahk_group RStudio
  ^=::
  Send {Space}<{ASC 0045}{Space}
  return


; CTRL-L SENDS CTRL-ENTER
#IfWinActive, ahk_group RStudio
  ^L::
  Send ^{Enter}
  return


; CTRL-R SENDS CTRL-ENTER
#IfWinActive, ahk_group RStudio
  ^r::
  Send ^{Enter}
  return


; CTRL-SHIFT-T TABLES THE OBJECT
#IfWinActive, ahk_group RStudio
  ^+t::
  SendInput {Control down}{c}{Control up}
  Send ^3
  SendInput table(
  SendInput {Control down}{v}{Control up}
  SendInput )
  SendInput {Enter}
  Sleep 300
  Send ^3
  return



; #####################################################################
; SLACK SHORTCUTS
; #####################################################################
; Replace Enter with Alt-Enter so that Enter creates a new line rather
; than submitting a message.
#IfWinActive, ahk_group Slack
  Enter::
  Send !{Enter}
  return




; #####################################################################
; THUNDERBIRD SHORTCUTS
; #####################################################################
#IfWinActive, ahk_group Thunderbird
  ^!+c::
  SendInput Cameron, Luis, Petr, Rosa,
  SendInput {Enter}{Enter}{Tab}{Tab}
  return



; #####################################################################
; WINEDT SHORTCUTS
; #####################################################################
; DISABLE CTRL-SHIFT-K IN WINEDT
; 2020 September: we no longer want to do this. 
; Ctrl-Shift-K knits Rnw documents, whether in 
; RStudio or WinEdt (after my modifications to 
; Winedt).
;
; #IfWinActive, ahk_group WinEdt
;   ^+k:: Return





---
