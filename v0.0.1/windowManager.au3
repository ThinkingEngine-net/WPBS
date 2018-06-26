#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         ThinkingEngine.net

 Script Function:
	Installer GUI

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here


#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>
#include "helpers\specialFolders.au3"
#include "helpers\colorsEX.au3"
#include "helpers\log.au3"


;showGUI("");

func showGUI($path)

	local $page=1

	if ($path="") Then

		$path=_ReturnSpecialFolderPath("#Documents#")&"\WPBS\"

	EndIf

	#Region ### START Koda GUI section ### Form=
	$WPBS = GUICreate("WPBS Installer", 614, 455, 192, 124,$WS_EX_DLGMODALFRAME)
	GUISetIcon("D:\My Documents\thinkingEngine\favicon.ico", -1)
	$Graphic1 = GUICtrlCreateGraphic(19, 42, 576, 2)
	GUICtrlSetColor(-1, 0xA0A0A0)
	$Label1 = GUICtrlCreateLabel("Windows PHP / Behat /Selenium Installer", 53, 5, 483, 33)
	GUICtrlSetFont(-1, 18, 800, 0, "MS Sans Serif")
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	$Graphic2 = GUICtrlCreateGraphic(19, 384, 576, 2)
	GUICtrlSetColor(-1, 0xA0A0A0)
	global $cmdNext = GUICtrlCreateButton("Next", 24, 390, 75, 25)
	$Pic1 = GUICtrlCreatePic("D:\My Documents\thinkingEngine\Logo-small.jpg", 18, 4, 25, 33)
	$Graphic3 = GUICtrlCreateGraphic(0, 0, 739, 41)
	GUICtrlSetColor(-1, 0xFFFFFF)
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	GUICtrlSetGraphic(-1, $GUI_GR_COLOR, 0xFFFFFF, 0xFFFFFF)
	GUICtrlSetGraphic(-1, $GUI_GR_RECT, -2, 1, 736, 58)

	global $cmdInstall = GUICtrlCreateButton("Install", 104, 390, 75, 25)
	GUICtrlSetState(-1, $GUI_DISABLE)
	global $cmdCancel = GUICtrlCreateButton("Cancel", 512, 392, 75, 25)

	; ----- Page controls

	global $gui_title = GUICtrlCreateLabel("WPBS Installer",20,65, 550, 20)
	GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
	global $gui_text = GUICtrlCreateLabel("This installer will configure your PC for running automated tsting using Behat.  To do this it will install (if required) PHP and composer.",20,95, 560,40)
	GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")


	global $gui_Instr = GUICtrlCreateLabel("Press 'next' to continue.",20,355, 513, 20)
	GUICtrlSetFont(-1, 10, 600, 0, "MS Sans Serif")

	;----- Directory Management
	global $gui_2_label = GUICtrlCreateLabel("Folder:",20,150, 60,20)
	GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
	GUICtrlSetState($gui_2_label, $GUI_HIDE)

	global $gui_2_dir = GUICtrlCreateInput($path,90,150, 400,20, $ES_READONLY)
	GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
	GUICtrlSetState($gui_2_dir, $GUI_HIDE)

	global $gui_2_cmd = GUICtrlCreateButton("...",500,150, 40,20)
	GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
	GUICtrlSetState($gui_2_cmd, $GUI_HIDE)

	;-------------------- Installer.

	global $gui_3_label = GUICtrlCreateLabel("Installing...",20,150, 560,20,$SS_CENTER)
	GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
	GUICtrlSetState($gui_3_label, $GUI_HIDE)

	global $gui_3_progress = GUICtrlCreateProgress(20, 180, 560, 25)
	GUICtrlSetState($gui_3_progress, $GUI_HIDE)


	;---------------------  Report/Results

	global $gui_3_Summary = GUICtrlCreateEdit("",20,150, 560,170, $ES_READONLY+$ES_MULTILINE+$ES_AUTOVSCROLL)
	GUICtrlSetFont(-1, 10, 400, 0, "Courier New")
	GUICtrlSetState($gui_3_Summary, $GUI_HIDE)

	GUISetState(@SW_SHOW)
	#EndRegion ### END Koda GUI section ###

	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				ExitInstaller($page);
			case $cmdCancel
				ExitInstaller($page);
			Case $cmdNext
				$page=NextPage($page,$path);
			Case $cmdInstall
				$page=NextPage($page, $path);
			Case $gui_2_cmd
				local $newPath = FileSelectFolder ( "Select installation path", "",7, $path, $WPBS)
				if (@error <> 1) Then
					$path = $newPath;
					GUICtrlSetData($gui_2_dir,$path)
				EndIf



		EndSwitch
	WEnd
EndFunc

Func NextPage($page,$path="")
	$page+=1

	if ($page=2) then

		GUICtrlSetData($gui_text,"Please select the folder where the tools and project samples will be created.")
		GUICtrlSetData($gui_title,"Select Installation Folder.")
		GUICtrlSetData($gui_Instr,"Click 'Install' to start installation.")

		GUICtrlSetState($gui_2_label, $GUI_SHOW)
		GUICtrlSetState($gui_2_dir, $GUI_SHOW)
		GUICtrlSetState($gui_2_cmd, $GUI_SHOW)
;		GUICtrlSetState($gui_3_label, $GUI_DISABLE)
		GUICtrlSetState($cmdInstall, $GUI_ENABLE)
		GUICtrlSetState($cmdNext, $GUI_DISABLE)

	EndIf
	if ($page=3) then
		GUICtrlSetData($gui_text,"")
		GUICtrlSetData($gui_title,"Installing WPBS....")
		GUICtrlSetData($gui_Instr,"Please wait for the installaiton complete.")

		GUICtrlSetState($gui_2_label, $GUI_HIDE)
		GUICtrlSetState($gui_2_dir, $GUI_HIDE)
		GUICtrlSetState($gui_2_cmd, $GUI_HIDE)
		GUICtrlSetState($cmdNext, $GUI_DISABLE)
		GUICtrlSetState($cmdInstall, $GUI_DISABLE)
		GUICtrlSetState($cmdCancel, $GUI_DISABLE)
		GUICtrlSetState($gui_3_label, $GUI_SHOW)
		GUICtrlSetState($gui_3_progress, $GUI_SHOW)

		if (install_createFolder($path)) then
			if (install_PHP($path)) then;
				if (install_composer($path)) then;
					install_others($path);
				EndIf
			EndIf
		EndIf

		if (not _log_HasErrors()) Then
			UpdateProgress("Completed",100);
		Else
			UpdateProgress("Completed (errors).",100);
		EndIf

		GUICtrlSetData($gui_Instr,"Press 'next' to continue.")
		GUICtrlSetState($cmdNext, $GUI_Enable)
	EndIf
	if ($page=4) then

		if (_log_HasErrors()) Then
			GUICtrlSetData($gui_text,"There were issues with the installation.  Review the information below to find out what may have gone wrong.")
			GUICtrlSetData($gui_title,"Install failed.")
			GUICtrlSetColor ( $gui_title, $RAL_SIGNALRED )
			GUICtrlSetData($gui_Instr,"Click 'close' to exit")
		Else
			GUICtrlSetData($gui_text,"The installation is complete.")
			GUICtrlSetData($gui_title,"Installed.")
			GUICtrlSetColor ( $gui_title,$RAL_GRASSGREEN)
			GUICtrlSetData($gui_Instr,"Click 'close' to exit")
		EndIf

		GUICtrlSetData($cmdCancel,"Close")
		GUICtrlSetState($cmdCancel, $GUI_ENABLE)
		GUICtrlSetState($gui_3_label, $GUI_HIDE)
		GUICtrlSetState($gui_3_progress, $GUI_HIDE)
		GUICtrlSetState($gui_3_Summary, $GUI_SHOW)
		GUICtrlSetData($gui_3_Summary, _log_get())


	EndIf
	return $page
EndFunc

Func UpdateProgress($message,$perc)
	  GUICtrlSetData($gui_3_progress, $perc)
	  GUICtrlSetData($gui_3_label, $message)
	  $nMsg = GUIGetMsg()
EndFunc

Func ExitInstaller($page)
	if ($page=4) Then
		Exit
	EndIf

	if (MsgBox($MB_YESNO+$MB_ICONINFORMATION,"Exit Installer","Are you sure you want to exit the installer?")=$IDYES ) then
		Exit
	EndIf
EndFunc
