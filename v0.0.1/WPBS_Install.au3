#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\..\..\My Documents\thinkingEngine\favicon.ico
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Change2CUI=y
#AutoIt3Wrapper_Res_Description=Windows PHP/Behat/Selemium Installer
#AutoIt3Wrapper_Res_Fileversion=0.0.1.28
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Res_LegalCopyright=(c) 2016 ThinkingEngine.net
#AutoIt3Wrapper_Res_requestedExecutionLevel=requireAdministrator
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#NoTrayIcon

#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         ThinkingEngine.net

 Script Function:
	WPBS Silent inatller.

#ce ----------------------------------------------------------------------------

#include <Constants.au3>
#include <MsgBoxConstants.au3>
#include <StringConstants.au3>
#include <Debug.au3>
#include "common.au3"
#include "php_support.au3"
#include "composer_support.au3"
#include "project.au3"
#include "selenium-chrome.au3"
#include "helpers\log.au3"
#include "windowManager.au3"

$installpath=""

if (not IsAdmin()) then
	Exit
EndIf

if ($CmdLine[0]=1) Then
	$installpath = $CmdLine[1];
EndIf


showGUI($installpath); --- Show Installer Interface


func install_createFolder($installpath)

	UpdateProgress("Creating Folder...",5);

	local $success=DirCreate($installpath);
	if ($success=0 and not FileExists($installpath)) then
		_log_error("Failed to create folder ('"&$installpath&"').");
		return false
	EndIf

	if (StringRight($installpath,1)<>"\") Then
		$installpath&="\"
	EndIf

	_log_start($installpath&"\WPBS_install.log")

	return true

EndFunc



; --------------------  PHP ----------------------------------
func install_PHP($installpath)
	UpdateProgress("Checking PHP Installed...",10);
	$phpStatus = WPBS_CheckPHP(5,6,0)

	if ($phpStatus<1) then ; -- Not installed/In Path or Too Old.
		_log_info("Installing PHP ->");
		UpdateProgress("Installing PHP...",15);
		WPBS_DeployPHP($installpath)
	;	$phpStatus = WPBS_CheckPHP(5,6,0)

	;	if ($phpStatus<1) Then
	;		_log_error("PHP Deployment failed.  Cannot Continue.");
	;		return false;
	;	EndIf

		_log_info("OK.");
	Else
		_log_info("PHP Already Configured.");
	EndIf

	return true
EndFunc

; --------------------  Composer  ----------------------------------
func install_composer($installpath)
	UpdateProgress("Checking composer version...",25);
	$composerstatus = WPBS_CheckComposer(1,2,4)

	if ($composerstatus<1) then ; -- Not installed/In Path or Too Old.
		_log_info("Installing Composer ->");
		UpdateProgress("Installing composer...",30);
		WPBS_DeployComposer($installpath)
	;	$composerstatus = WPBS_CheckComposer(1,2,4)

	;	if ($composerstatus<1) Then
	;		_log_info("Composer Deployemnt failed.  Cannot Continue.");
	;		Exit
	;	EndIf

		_log_info("OK.");
	Else
		_log_info("Composer Already Configured.");
	EndIf

	return true
EndFunc

; --------------------  Others  ----------------------------------
func install_others($installpath)
	UpdateProgress("Installing Templates...",50);
	_log_info("Deploying 'Test Project' Template ->");
	WPBS_DeployProjectStructure($installpath)
	_log_info("OK.");

	UpdateProgress("Deploying chrome Driver...",75);
	_log_info("Deploying Selenium Chrome Driver ->");
	WPBS_DeploySeleniumChrome($installpath)
	_log_info("OK.");
	_log_info(@crlf);
	_log_info("Deplyment to '"&$installpath&"' completed.");
	return true;
EndFunc


