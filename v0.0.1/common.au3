#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         ThinkingEngine.net

 Script Function:
	Common Functions

#ce ----------------------------------------------------------------------------

#include-once
#include <Constants.au3>
#include <Debug.au3>



#cs --------------------------------------------------------------
		Run DOS command and retuir results
#ce --------------------------------------------------------------
func WPBS_Common_RunDOSCommand($target,$path)

	local $foo = Run($target, $path, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)

	ProcessWaitClose($foo,5000)

	Local $line
	local $output=""

	local $std = StdoutRead($foo)
	local $err = StderrRead($foo)

;	_DebugOut("Std:: "&$std);
;	_DebugOut("Err:: "&$err);

	$output=$std&@CRLF&$err


	#cs While 1

		If @error Then ExitLoop
		$output&=$line
	Wend

	While 1
		$line = StderrRead($foo)
		If @error Then ExitLoop
		$output&=$line
	Wend
	#ce
	return $output

EndFunc

#cs --------------------------------------------------------------
		Update Path Env Variable
#ce --------------------------------------------------------------




func WPBS_Common_SetPath($target)

	local $key = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"
	local $val = "PATH"
	local $PATH = RegRead($key, $val)
	if (StringInStr(";"&$path&";",";"&$target&";",0) >0) Then
			return;
	EndIf

	$PATH = $PATH & ";" & $target

;	_DebugOut($PATH)

	if (RegWrite($key,$val,"REG_EXPAND_SZ",$PATH)=0) Then
		_DebugOut("Could not set path:: "&@error)
	EndIf

	EnvUpdate()
EndFunc

