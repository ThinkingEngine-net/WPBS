#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         ThinkingEngine.net

 Script Function:
	Composer Functions for Installation

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
;_DebugSetup("",true,2)
;_DebugOut(WPBS_CheckComposer(1,1,99))
;_DebugOut(WPBS_CheckComposer(1,2,0))
;_DebugOut(WPBS_CheckComposer(1,3,0))
;_DebugOut(WPBS_CheckComposer(1,2,1))
;_DebugOut(WPBS_CheckComposer(0,9,99))
;_DebugOut(WPBS_CheckComposer(2,1,00))
;_DebugOut(WPBS_CheckComposer(2,2,2))
;_DebugOut(WPBS_CheckComposer(9,9,9))

;WPBS_DeployComposer("D:\temp\")


func WPBS_CheckComposer($major, $minor, $point)

	$output=WPBS_Common_RunDOSCommand(@ComSpec &" /c  composer --no-ansi -V", "")

;	MsgBox(0,"","["&$output&"]")

	$vers= StringRegExp ( $output, "Composer\sversion\s(.*?)\s" , $STR_REGEXPARRAYMATCH )

	if (@error=0) then

;		MsgBox(1,"Output",$vers[0])

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

func WPBS_DeployComposer($parentPath)
	; --- Create Tools Folder
	DirCreate($parentPath&"\tools")

	;---Extract Composer Installer
	FileInstall("installs\composer-setup.exe",$parentPath&"tools\composer-setup.exe",$FC_OVERWRITE);

	$cmd=$parentPath&'tools\composer-setup.exe'
;	_DebugOut($cmd)
	$output=WPBS_Common_RunDOSCommand($cmd,$parentPath&"tools\")
;	_DebugOut($output)

	return true;

EndFunc

