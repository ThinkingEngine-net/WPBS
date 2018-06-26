#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         ThinkingEngine.net

 Script Function:
	Logging Functions

#ce ----------------------------------------------------------------------------
#include-once
#include <Debug.au3>

global $_log_cache_string="Windows PHP/Behat/Selemium Installer"&@CRLF&"------------------------------------"&@CRLF&@CRLF;
global $_log_isInit=false;
global $_log_ErrorCount=0;

func _log_start($filename)

	if ($_log_isInit) Then
		return;
	endif


	$_log_isInit=true;
	$logfile=$filename
	FileDelete($logfile)
	_DebugSetup("Windows PHP/Behat/Selemium Installer",true,4,$logfile)
	_DebugBugReportEnv();
	_DebugOut(@CRLF);

EndFunc

func _log_info($message)

	_DebugOut($message);

	$_log_cache_string&=$message&@CRLF

EndFunc

func _log_error($message)
	$_log_ErrorCount+=1;
	$message="[Error] "&$message
	_DebugOut($message);

	$_log_cache_string&=$message&@CRLF

EndFunc

func _log_get()

	return $_log_cache_string

EndFunc

func _log_HasErrors()
	return ($_log_ErrorCount>0)
EndFunc

func _log_ErrorCount()
	return _log_ErrorCount
EndFunc

