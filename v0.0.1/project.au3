#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         ThinkingEngine.net

 Script Function:
	Project Functions and Installation

#ce ----------------------------------------------------------------------------
#include <Constants.au3>
#include <MsgBoxConstants.au3>
#include <StringConstants.au3>
#include <Debug.au3>
#include "common.au3"
#cs -------------------------------------------
	Check PHP Version Installed
	-1 = Not Installed/Not in Path
	0 = Does not meet min version
	1 =  Meets Min Verison
#ce -------------------------------------------
; _DebugSetup("",true,2)

; WPBS_DeployProjectStructure("D:\temp\")


func WPBS_DeployProjectStructure($parentPath)
	; --- Create Tools Folder
	DirCreate($parentPath&"\testScripts")
	DirCreate($parentPath&"\testScripts\_template")

	;---Extratct 7 Zip
	DirCreate($parentPath&"\tools\7zip")
	FileInstall("installs\7zip\7za.dll",$parentPath&"tools\7zip\7za.dll",$FC_OVERWRITE)
	FileInstall("installs\7zip\7za.exe",$parentPath&"tools\7zip\7za.exe",$FC_OVERWRITE)
	FileInstall("installs\7zip\7zxa.dll",$parentPath&"tools\7zip\7zxa.dll",$FC_OVERWRITE)

	;---Extract
	FileInstall("installs\_template.7z",$parentPath&"tools\_template.7z",$FC_OVERWRITE);


	$cmd=$parentPath&'tools\7zip\7za.exe x -y -o"'&$parentPath&'testScripts\_template\" "'&$parentPath&'tools\_template.7z"'
;	_DebugOut($cmd)
	$output=WPBS_Common_RunDOSCommand($cmd,$parentPath&"tools\7zip\")
;	_DebugOut($output)
	if (StringInStr($output,"Everything is Ok",0)<1) Then
		return false ; --- Failed to demploy php.
	EndIf

	return true;


EndFunc