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
GroupAdd, ASCII,  Sublime Text
GroupAdd, ASCII,  Windows Powershell
GroupAdd, ASCII,  Windows Terminal
GroupAdd, ASCII,  WinEdt

GroupAdd, Acrobat, Adobe Acrobat Pro DC

GroupAdd, Chat, Slack
GroupAdd, Chat, Chat | Workplace
GroupAdd, Chat, Workplace
GroupAdd, Chat, Workplace Chat
GroupAdd, Chat, ahk_pid 24980  ; dedicated non-web Chat app

GroupAdd, Eclipse, Eclipse Platform
GroupAdd, Eclipse, eclipse-workspace
GroupAdd, Eclipse, StatET

GroupAdd, Gmail,  Gmail
GroupAdd, GoogleDocs, Google Docs
GroupAdd, GoogleSlides, - Google Slides - 

GroupAdd, LaTeX, Overleaf
GroupAdd, LaTeX, WinEdt

GroupAdd, Outlook, ahk_exe OUTLOOK.EXE
GroupAdd, Outlook, johnbullock@meta.com - Outlook                   
GroupAdd, Outlook, Microsoft Outlook

GroupAdd, R, Eclipse Platform
GroupAdd, R, eclipse-workspace
GroupAdd, R, StatET

GroupAdd, RStudio, ahk_exe rstudio.exe
GroupAdd, RStudio, RStudio ; for RStudio in the browser
GroupAdd, RStudio, Sunday alerts ; for RStudio in the browser
GroupAdd, SQL,    John Bullock's ad hoc workspace - Google Chrome
GroupAdd, Stata,  Do-file Editor - 
GroupAdd, Thunderbird, Write:
GroupAdd, WinEdt, WinEdt
GroupAdd, Word,   ahk_exe WINWORD.exe
GroupAdd, Workplace, Workplace - 
GroupAdd, WorkplaceChat, ahk_exe Workplace Chat.exe



; #####################################################################
; OUTLOOK SHORTCUTS
; #####################################################################

/* 
This code block does two things. First, when Outlook starts in 
Tasks view, it switches to Calendar view. This is a workaround for a
bug in Outlook whereby multiple calendars won't be shown if one 
starts directly in Calendar view.
  Second, when revising a calendar invite, this code block changes
the default option to "Save changes but don't send." This change 
makes it  easier to save private notes. For details on the 
implementation of this particular feature, see 
https://www.autohotkey.com/boards/viewtopic.php?f=76&t=107579.

For details about the looping, see https://www.autohotkey.com/boards/viewtopic.php?f=76&t=109255.
In particular, note: 
  * A challenge is to run the loop while making it recognize that 
    commands shouldn't be run twice on the same Outlook instance.
    I've accomplished this by tracking the unique IDs for each 
    windows.
  * To compare variables, use "if(var1 = var2)", not "if(%var1%=%var2%)".


Unlike hotkey and hotstring definitions, this code block won't be 
executed unless it is in the "auto-execute" section at the start of
the script. See the URL above and the "auto-execute" entry in the
the AutoHotkey help file for more details.  [2022 08 25]
*/

Loop {
  WinWaitActive, ahk_group Outlook
  Sleep, 450   ; 400 is a bit too short  [2022 11 25]

  if WinActive("Inbox - johngbullock@outlook.com - Outlook") {
    Send ^2
  }

  if WinActive("Microsoft Outlook", "Save changes &but don't send") {
    Control, Check,, Button2
  }

  WinWaitNotActive
      
}
      




; **************************************************************************
; END THE AUTO-EXECUTE SECTION ####
; **************************************************************************
; See https://www.autohotkey.com/boards/viewtopic.php?f=76&t=107579 and 
; the "auto-execute" entry in the AutoHotkey help file for more details.
; In short, it's probably best if everything after this point is either 
; a hotkey or a hotstring.  [2022 08 25]
return





; #####################################################################
; NOTES THAT CAME WITH AUTOHOTKEY
; #####################################################################
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


; CHECK WHETHER PROCESS EXISTS
; https://www.autohotkey.com/board/topic/146913-run-command-only-if-specific-program-is-running/
ProcessExist(i) {
  Process, Exist, % i
  return ErrorLevel
}



; SEND DATE IN FORM YYYY-MM-DD (CTRL-ALT-D)
; Except for the log in OneNote, we use ordinary hyphens rather than
; non-breaking hyphens. It is awkward to break a string like 
; "2022‑09‑24" across lines, but we need to use the soft hyphens 
; because the date string will sometimes be used in filenames, and 
; non-breaking hyphens cause problems in filenames.  [2022 09 24]
#IfWinActive Daily log - OneNote
  ^!d::
    ; Send %A_DDDD%{Space}  ; for example, "Sunday". But how to capitalize it?
    Send %A_YYYY%
    Sleep 35
    Send {U+2011}
    Sleep 25
    Send %A_MM%
    Sleep 25
    Send {U+2011}
    Sleep 25
    Send %A_DD%
    return
#IfWinActive ahk_exe chrome.exe
  ^!d::
    Send %A_YYYY%
    Sleep 150   ; 75 seems to cause problems for Google Docs
    Send -
    Send %A_MM%
    Sleep 150
    Send -
    Send %A_DD%
    return
#IfWinActive
  ^!d::
    Sleep 50   ; 2023-08-09: will this keep the "show desktop one monitor" shortcut from being triggered?
    Send %A_YYYY%
    Sleep 125  ; 100 may be too little in OneNote
    Send -
    Send %A_MM%
    Sleep 75
    Send -
    Send %A_DD%
    return




; SEND DATE IN BRACKETS (CTRL-ALT-SHIFT-D)
; Eclipse:  use spaces
; RStudio:  use spaces
; WinEdt:   use tildes
; All else: use Unicode non-breaking spaces
#IfWinActive, ahk_group Eclipse
  ^!+d::
  Sleep 35  ; Will this help me to avoid triggering Ctrl-Shift-D, which shows the desktop?
  Send [%A_YYYY% 
  Sleep 100
  Send %A_MM% 
  Sleep 100 
  Send %A_DD%]
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
    ; inserting Sleep commands doesn't make the spaces more likely to appear.  [2020 01 29]
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
^+d::Return  ; helps Ctrl-Alt-Shift-D to be a date shortcut, without triggering "Show Desktop"

; Insert on the numeric keypad will still work when NumLock is off
; I haven't managed to set NumLock to an always-on state.  [2021 04 14]
;
; SetNumLockState, AlwaysOn
; $NumLock::Return



; MAKE CODE HEADINGS
; Shortcut for Ctrl-Shift-#.
; The version below, with four hash marks in the middle line, 
; allows the headings to appear in the RStudio outline pane.
; [2020 03 27]
#IfWinActive, ahk_group ASCII
  ^+#::
  SendInput {#}{Space}{* 74}
  SendInput {Enter}
  SendInput {#}{Space}{space}{# 4}
  SendInput {Enter}
  Sleep 250
  SendInput {#}{Space}{* 74}
  SendInput {Up}{Left 5}
  return
#IfWinActive


; CREATE NON-BREAKING SPACE WITH CTRL-SHIFT-SPACE
; By default, Word inserts a non-breaking space when you type 
; Ctrl-Shift-Space. This shortcut does the same for 
; all other programs. Again, #IfWinActive on a line by itself
; means that there is no context sensitivity.
#IfWinActive
  ^+space::
  Send {U+00A0}
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


; Use the functions twice: once for the "R" group, and once for the 
; "RStudio" group. For reasons that I don't understand, using a 
; single call that is headed by 
;
;   if WinActive("ahk_group R") or WinActive("ahk_group RStudio")
;
; doesn't work. It also disables pasting in all applications and 
; leads to rapid repetition of hotkeys, which in turn generates a
; warning.  [2021Â 07Â 09]
#IfWinActive, ahk_group R
  ^v::
  if (DllCall("IsClipboardFormatAvailable", "Uint", 1) OR DllCall("IsClipboardFormatAvailable", "Uint", 13)) ; if text was copied
  {
    clean_path_in_clipboard()
  }
  Send ^v
  return	

#IfWinActive, ahk_group RStudio
  ^v::
  if (DllCall("IsClipboardFormatAvailable", "Uint", 1) OR DllCall("IsClipboardFormatAvailable", "Uint", 13)) ; if text was copied
  {
    clean_path_in_clipboard()
  }
  Send ^v
  return	



; PASTE PLAIN TEXT WITH CTRL-SHIFT-V
; Unfortunately, this doesn't work when pasting into 
; Word comment notes. [2021 04 24]
#IfWinActive
^+v::                            ; Text–only paste from ClipBoard
   Clip0 = %ClipBoardAll%
   ClipBoard = %ClipBoard%       ; Convert to text
   Send ^v                       ; For best compatibility: SendPlay
   Sleep 50                      ; Don't change clipboard while it is pasted! (Sleep > 0)
   ClipBoard = %Clip0%           ; Restore original ClipBoard
   VarSetCapacity(Clip0, 0)      ; Free memory
Return



; INSERT TYPOGRAPHIC RIGHT SINGLE QUOTE
:c?*:\rsquo::{U+2019}


; ABBREVIATIONS
::opzd::operationalized
::opze::operationalize
::opzing::operationalizing
::opzs::operationalizations
::opzn::operationalization
::pzn::personalization 
:c:statSig::statistically significant




; #####################################################################
; ACCENTED WORDS
; #####################################################################
; These are "hotstrings." See https://www.autohotkey.com/docs/Hotstrings.htm.
;
; The "c" inside the first pair of colons means "case sensitive"
; The "?" inside the first pair of colons means "convert even when the preceding character is alphanumeric"
; The "*" inside the first pair of colons means "convert immediately; don't wait for an ending character"
;
#IfWinActive
  ::a la::{U+00E0} la
  :c:Aaroe::Aar{U+00F8}e
  :c:Anais::Ana{U+00EF}s
  :c:Apres::Apr{U+00E8}s
  :c:apres::apr{U+00E8}s
  ::brulee::br{U+00FB}l{U+00E9}e
  ::cafe::caf{U+00E9}
  ::cafes::caf{U+00E9}s
  :c:Castaneda::Casta{U+00F1}eda
  :c:Chimayo::Chimay{U+00F3}
  :*:cliche::clich{U+00E9}
  :c:Comte::Comt{U+00E9}
  :*:consomme::consomm{U+00E9}
  ::Cortazar::Cort{U+00E1}zar
  :*:crepe::cr{U+00E9}pe
  :*:divorcee::divorc{U+00E9}e
  :c:Espanol::Espa{U+00F1}ol
  :c:Espanola::Espa{U+00F1}ola
  ::fiance::fianc{U+00E9}
  ::Fjallraven::Fj{U+00E4}llr{U+00E4}ven
  ::Guantanamo::Guant{U+00E1}namo
  ::gruyere::gruy{U+00E8}re
  :c:Haagen-Dasz::H{U+00E4}agen-Dasz 
  :c:Hrbkova::Hrbkov{U+00E1} 
  :c:Jorg::J{U+00F6}rg 
  ::Jose::Jos{U+00E9}
  :*:naivete::naivet{U+00E9}
  :c:nee::n{U+00E9}e
  :c:Oe::{U+00D6}e  ; Kenzaburo Öe
  ::pinon::pi{U+00F1}on
  ::puree::pur{U+00E9}e
  ::revee::r{U+00EA}v{U+00E9}e
  ::Rocio::Roc{U+00ED}o
  ::saute::saut{U+00E9}
  ::sauteed::saut{U+00E9}ed
  ::sauteing::saut{U+00E9}ing
  ::soiree::soir{U+00E9}e



; #####################################################################
; DUAL MONITORS
; #####################################################################
; I want to use ShowDesktopOneMonitor to change the behavior of 
; Win+D so that it minimizes windows on only the main monitor.
;
; In the future, I may need to modify this shortcut so that it works
; only when ShowDesktopOneMonitor is running.  [2023 05 26]
;
#If ProcessExist("ShowDesktopOneMonitor.exe")
  #d::#+d



; #####################################################################
; FRACTIONS
; #####################################################################
#If !WinActive("ahk_exe WindowsTerminal.exe") && !WinActive("ahk_group Eclipse") && !WinActive("ahk_group RStudio")  
  ::1/2::{U+00BD}
  ::1/3::{U+2153}
  ::1/4::{U+00BC}
  ::1/8::{U+215B}
  ::2/3::{U+2154}   
  ::3/4::{U+00BE}



; #####################################################################
; HYPHENS AND DASHES
; #####################################################################

; CTRL-ALT-HYPHEN SENDS NON-BREAKING HYPHEN
^!-::
Send {U+2011}
return


; NUMERIC KEYPAD SENDS TYPOGRAPHIC MINUS SIGN
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



; ##################################################################
; CHAT SHORTCUTS
; ##################################################################
; Replace Enter with Alt-Enter so that Enter creates a new line 
; rather than submitting a message.
#IfWinActive ahk_group Chat
  Enter::
  Send !{Enter}
  return

  ^Enter::
  Send {Enter}
  return
#IfWinActive




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
  Send https://northwestern.zoom.us/my/jgbullock
  return



; #####################################################################
; GOOGLE DOCS SHORTCUTS / VIRTUAL DESKTOP SHORTCUTS
; #####################################################################
; I used Peach's Ctrl-Alt-1, Ctrl-Alt-2, etc. to move across virtual 
; desktops. But Google Docs pre-empts those shortcuts and instead uses
; them to apply heading styles. As a result, when I am editing a 
; Google Doc and then try to switch desktops, I end up just changing 
; the formatting of my document. Even worse, when I switch to a desktop
; in which a Google Doc is active, the formatting is automatically 
; applied.
;   This shortcut simply turns off Ctrl-Alt-1, Ctrl-Alt-2, etc. when I 
; am using Google Docs. An alternative would be to remap these 
; combinations to Ctrl-Alt-F1, Ctrl-Alt-F2, etc. Peach supports these 
; F-key combinations as well. But if I did this remapping, I wouldn't 
; be able to use the shortcuts for heading styles that Google Docs has.
; [2022 09 09]
#IfWinActive, ahk_group GoogleDocs
  ^!1::Return
  ^!2::Return
  ^!3::Return
  ^!4::Return
  ^!5::Return
  ^!6::Return
#IfWinActive


; Set up shortcut for adding 3 pts. space above each highlighted 
; paragraph
;
; TODO: Find a way to make this shortcut active only if a Google 
; Doc is loaded. Checking the window name isn't good enough, as I 
; change window names sometimes.  [2023 05 09]
#IfWinActive
^!+3::
  Send !/
  Sleep 200  ; 150 seems to cause problems for Google Docs
  Send Custom line
  Sleep 200
  Send {Enter}
  Sleep 75
  Send {Tab}{Tab}{Tab}
  Sleep 75
  Send 3
  Send {Enter}
  return
#IfWinActive


; Format inline code as I want
; 
; 2023-07-18: NOT YET WORKING. The problem is that the shortcut is
; Google's built-in shortcut for switching to comment-only mode. 
; Sleeping before sending the first keystrokes doesn't solve this 
; problem. How can I disable the Google default?  [2023 07 19]
; #IfWinActive
; ^!+c::
;   Send !/
;   Sleep 500
;   Roboto   ; it breaks at this point
;   Sleep 500 
;   Send Mono
;   Sleep 500
;   Send {Enter}
;   Sleep 500
;   Send ^+,  ; reduce font size by one point
;   return
; #IfWinActive





; [2022‑09‑09: not yet implemented. I will try to train myself to use 
;  the function keys (Ctrl-Alt-F1, etc.) instead of the numbers
;  (Ctrl-Alt-F1). Failing that, implement the function described--but 
;  also check AutoHotkey to see whether I can simply get Google to stop 
;  listening to Ctrl-Alt-1, etc., when I switch desktops.]






; **************************************************************************
; HTML SHORTCUTS ####
; **************************************************************************

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



; #####################################################################
; LATEX EQUIVALENTS
; #####################################################################

; These are "hotstrings." See https://www.autohotkey.com/docs/Hotstrings.htm.
;
; The "c" inside the first pair of colons means "case sensitive"
; The "?" inside the first pair of colons means "convert even when the preceding character is alphanumeric"
; The "*" inside the first pair of colons means "convert immediately; don't wait for an ending character"
;
; #if WinActive("ahk_group Word") or WinActive("ahk_group Gmail")
  #If !WinActive("ahk_group LaTeX") 
    :c*:\alpha::{U+0251}
    :c:\approx::{U+2248}
    :c?*:\beta::{U+03B2} 
    :c?*:\degree::{U+00B0}
    :c?*:\Delta::{U+0394}
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
    :c*?:\mu::{U+03BC}
    :c*:\neq::{U+2260}
    ; ::\notin::{U+2209}
    :c:\P::{U+00B6}  ; ¶, AKA "pilcrow" or "paragraph sign"
    :c*:\phi::{U+0278}
    :c*:\Phi::{U+03A6}
    :c*:\pi::{U+03C0}
    :c*:\pm::{U+00B1}
    :c*:\R::{U+211D}
    :c*:\rho::{U+03C1}
    :c*?:\rightarrow::{U+2192}
    :c*?:\sigma::{U+03C3}
    :c*:\sum::{U+03A3}
    :c*:\tau::{U+03C4}
    :c*:\theta::{U+03F4}
    :c*:\times::{U+00D7}

    ; ACCENTED CHARACTERS
    :c*?:\'a::{U+00E1}  
    :c*?:\"a::{U+00E4}
    :c*?:\'e::{U+00E9}
    :c*?:\'E::{U+00C9}
    :c*?:\'I::{U+00CD}
    :c*?:\'i::{U+00ED}
    :c*?:\~n::{U+00F1}
    :c*?:\'o::{U+00F3}
    :c*?:\"O::{U+00D6}
    :c*?:\"o::{U+00F6}   ;   o with diaeresis (umlaut)
  #IfWinActive

  

  ; HYPHENS AND DASHES
  ; The trick here is to have a shortcut or shortcuts
  ; that convert -- to an en dash *and* that convert
  ; --- to an em dash. See 
  ; https://www.autohotkey.com/boards/viewtopic.php?f=76&t=92474 
  ; for more on the problem and this solution.
  ;
  ; IfWinNotActive ahk_exe WindowsTerminal.exe
  #If !WinActive("ahk_exe WindowsTerminal.exe") && !WinActive("ahk_group Eclipse") && !WinActive("ahk_group LaTeX") && !WinActive("ahk_group RStudio") && !WinActive("ahk_group SQL") && !WinActive("ahk_exe WinEdt.exe") && !WinActive("ahk_group WorkplaceChat")
    #InstallKeybdHook                          ; permit AutoHotKey to look back at previous key presses
    :?*X:--::Send, {ASC 0150}                  ; send en dash
    #IF A_PriorHotKey A_PriorKey = ":?*X:---"
      :?*X:-::Send, {Bs}{ASC 0151}             ; send em dash
    #IF                                        ; end context sensitivity
  #IfWinActive
      ; Old attempts. Either works on its own, 
      ; but when both are enabled, the one for 
      ; the em dash doesn't work: 
        ; :?*:--::{ASC 0150}   ; en dash
        ; :?*:---::{ASC 0151}  ; em dash



  ; SUBSCRIPTS
  #If !WinActive("ahk_group LaTeX") 
    :?:_0::{U+2080}
    :?:_1::{U+2081}
    :?:_2::{U+2082}
    :?:_3::{U+2083}
    :?:_i::{U+1D62}
    :?:_t::{U+209C}

    ; SUPERSCRIPTS
    :?*:^2::{U+00B2}
    :?*:^3::{U+00B3}
  #IfWinActive



; #####################################################################
; ONENOTE SHORTCUTS
; #####################################################################
; See https://superuser.com/questions/1738995/ for a bit more on this 
; issue. I use the solution that another commenter offered, except that
; I'm not linking to specific paragraphs.  [2022 09 09]

; Launch "Assign" scratchpad.
^!+a::
  Run "C:\Users\johnbullock\Documents\config\Assign.url"
  return


; Launch daily log ("What I Did").  [2022 08 30]
^!+w::
  Run "C:\Users\jbullock\OneDrive\config\daily_log_OneNote.url"
  return
  



; **************************************************************************
; PEACH SHORTCUTS (VIRTUAL DESKTOPS)
; **************************************************************************
; For whatever reason, Ctrl-Shift-F8 doesn't work. This hotkey fixes
; the problem.  [2022 11 24]
^!F8::^!8

; Ctrl-Alt-F10 has never worked with Peach. This is a hacky 
; workaround
^!F10::
  SendInput ^!{F9}
  Sleep 200
  SendInput ^!{Right}  
  return
  


; #####################################################################
; RSTUDIO SHORTCUTS
; #####################################################################
; Redo commands to RStudio so I can use my Eclipse/StatET9 shortcuts


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



; #####################################################################
; WORD SHORTCUTS
; ##############################p#######################################
#IfWinActive, ahk_group Word

; For Word, the key seems to be to sleep a little as soon as the 
; hotkey is pressed. Without doing that, the shortcuts won't work.
; [2023 07 07]

  ; Strikethrough of highlighted text. 
  ^!+s::                    
    Sleep 500
    Send +{F10}
    Send f
    Send !k
    SendInput {Enter}
    return

  ; Extend margin to end of page
  ^!+x::                
    Sleep 500  
    Send +{F10}
    Send p
    Send !i
    Send !r
    SendInput -1
    SendInput {Enter}
    return



; #####################################################################
; WORKPLACE CHAT SHORTCUTS
; #####################################################################
; 
; For the non-web app.

#IfWinActive, ahk_group WorkplaceChat
  ^+a::Return  ; disable Ctrl-Shift-A (Archive Chat)




; #####################################################################
; SPECIFIC DOCUMENTS
; #####################################################################

#IfWinActive CSN5_personalizationAndPrivacy.docx
  ^!+m::           ; Shortcut to go to start of "meetings" section.
    Send ^+{F5}
    Sleep 300
    Send {Up}{Up}  ; select top option in the list
    Send !g
    SendInput {Enter}
    return
  ^!+s::           ; Shortcut to go to start of "studies" section.
    Send ^+{F5}
    Sleep 300
    Send {Up}{Up}  ; select top option in the list
    Send {Down}    ; select next option in the list
    Send !g
    SendInput {Enter}
    return
#IfWinActive
