#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         ThinkingEngine.net

 Script Function:
	PHP Functions for Installation

#ce ----------------------------------------------------------------------------
#include <Constants.au3>
#include <MsgBoxConstants.au3>
#include <StringConstants.au3>
#include <Debug.au3>
#include "common.au3"
#include <File.au3>
#cs -------------------------------------------
	Check PHP Version Installed
	-1 = Not Installed/Not in Path
	0 = Does not meet min version
	1 =  Meets Min Verison
#ce -------------------------------------------
;_DebugSetup("",true,2)
;_DebugOut(WPBS_CheckPHP(5,6,24))
;_DebugOut(WPBS_CheckPHP(5,6,23))
;_DebugOut(WPBS_CheckPHP(5,6,22))
;_DebugOut(WPBS_CheckPHP(5,5,24))
;_DebugOut(WPBS_CheckPHP(5,6,24))
;_DebugOut(WPBS_CheckPHP(4,6,24))
;_DebugOut(WPBS_CheckPHP(6,1,0))
;_DebugOut(WPBS_CheckPHP(5,7,0))

;WPBS_DeployPHP("D:\temp\")


func WPBS_CheckPHP($major, $minor, $point)

	$output=WPBS_Common_RunDOSCommand("php -v", "")

	$vers= StringRegExp ( $output, "PHP\s(.*?)\s" , $STR_REGEXPARRAYMATCH )

	if (@error=0) then

		;MsgBox(1,"Output",$vers[0])

		$verData = StringSplit($vers[0],".");
		if (@error = 1 or $verData[0]<>3) then ; Could not establish version
			return 0
		EndIf


		$php_maj = Number($verData[1])
		$php_min = Number($verData[2])
		$php_p = Number($verData[3])

		if ($major<$php_maj) then return 1 ; Version is greater of equlew too

		if ($major=$php_maj) then
			if ($minor<$php_min) then return 1 ; Version is greater of equlew too

			if ($minor=$php_min) Then

				if ($point<=$php_p) Then return 1 ; Version is greater of equlew too

			EndIf


		EndIf

		return 0 ; Current Veriso ins less than;

	Else
		return -1 ;No version/PHP string found.
	endif

EndFunc

func WPBS_DeployPHP($parentPath)
	; --- Create Tools Folder
	DirCreate($parentPath&"\tools")

	;---Extratct 7 Zip
	DirCreate($parentPath&"\tools\7zip")
	FileInstall("installs\7zip\7za.dll",$parentPath&"tools\7zip\7za.dll",$FC_OVERWRITE)
	FileInstall("installs\7zip\7za.exe",$parentPath&"tools\7zip\7za.exe",$FC_OVERWRITE)
	FileInstall("installs\7zip\7zxa.dll",$parentPath&"tools\7zip\7zxa.dll",$FC_OVERWRITE)

	;---Extract PHP
	FileInstall("installs\php-5.6.29-Win32-VC11-x86.zip",$parentPath&"tools\php-5.6.29-Win32-VC11-x86.zip",$FC_OVERWRITE);

	;---Extract PHP
	DirCreate($parentPath&"\php")

	$cmd=$parentPath&'tools\7zip\7za.exe x -y -o"'&$parentPath&'php\" "'&$parentPath&'tools\php-5.6.29-Win32-VC11-x86.zip"'
	;_DebugOut($cmd)
	$output=WPBS_Common_RunDOSCommand($cmd,$parentPath&"tools\7zip\")
	;_DebugOut($output)
	if (StringInStr($output,"Everything is Ok",0)<1) Then
		return false ; --- Failed to demploy php.
	EndIf
	;--- Create dfeault php.ini using provided
	FileInstall("installs\php.ini",$parentPath&"php\php.ini",$FC_OVERWRITE)
	_ReplaceStringInFile ( $parentPath&"php\php.ini", "%instfolder%", $parentPath&"php" )

	; -- Update Path for PHP
	WPBS_Common_SetPath($parentPath&'php\')

	return true;

EndFunc

