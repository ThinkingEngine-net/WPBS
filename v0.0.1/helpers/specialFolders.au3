#include <WinAPISys.au3>
#include <WinAPIShellEx.au3>
#include <APIShellExConstants.au3>
#include <WinAPI.au3>
#include <Array.au3>
#include-once

; #FUNCTION# ====================================================================================================================
; Name ..........: _ReturnSpecialFolderPath
; Description ...: Return a Special Folders full path dependant on OS version
; Syntax ........: _ReturnSpecialFolderPath($sFolder)
; Parameters ....: $sFolder - A string containing the Special Folder Member name
; Return values .: Success - Returns the full path of the specified Special Folder
;                  Failure - Sets @error to 1 and returns a string for logging
; Example .......: _ReturnSpecialFolderPath('CommonStartMenu')
; ===============================================================================================================================
Func _ReturnSpecialFolderPath($sFolder)
    If $sFolder = 'Script' Then Return @ScriptDir

    $sFolder = _String_GetMemberName($sFolder)
    If @error Then Return SetError(1, '', $sFolder)

    Local $sFolderPath

    ; Windows XP and lower
    If _WinAPI_GetVersion() < '6.0' Then
        ; Run the XP version of folder finder
        $sFolderPath = _XP_GetSpecialFolder($sFolder)
    Else ; Windows Vista and higher
        ; Run other OS version of folder finder
        $sFolderPath = _Win7_GetKnownFolder($sFolder)
    EndIf

    If @error Then Return SetError(1, 0, $sFolderPath)
    Return $sFolderPath
EndFunc   ;==>_ReturnSpecialFolderPath

; #FUNCTION# ====================================================================================================================
; Name ..........: _String_GetMemberName
; Description ...: Retrieves Special Folder Member names from a # enclosed string
; Syntax ........: _String_GetMemberName($sFolderPath)
; Parameters ....: $sFolderPath - A string to check
; Return values .: Success - Returns first matched string
;                  Failure - Sets @error to 1 and returns a string for logging
; Example .......: _String_GetMemberName('#StartMenu#\7-Zip')
; ===============================================================================================================================
Func _String_GetMemberName($sFolderPath)
    ; get array of matches between the # chars (should be only one)
    Local $aArray = StringRegExp($sFolderPath, '\Q#\E(.*?)(?=\Q#\E)', 1)
    If Not IsArray($aArray) Then Return SetError(1, 0, 'Unable to retrieve Member name from ' & $sFolderPath)

    ; return first found member name
    Return $aArray[0]
EndFunc

; #FUNCTION# ====================================================================================================================
; Name ..........: _XP_GetSpecialFolder
; Description ...: Rerieves the full path of a Windows special folder
; Syntax ........: _XP_GetSpecialFolder($sFolder)
; Parameters ....: $sFolder - A string containing the Member name
; Return values .: Success - Returns folders full path
;                  Failure - Sets @error to 1 and returns a string for logging
; Example .......: _XP_GetSpecialFolder('CommonStartMenu')
; ===============================================================================================================================
Func _XP_GetSpecialFolder($sFolder)
    Local $aConstants[31][2] = [['CommonFavorites', $CSIDL_COMMON_FAVORITES], _ ; %ALLUSERSPROFILE%\Favorites
            ['CommonPrograms', $CSIDL_COMMON_PROGRAMS], _ ; %ALLUSERSPROFILE%\Start Menu\Programs
            ['CommonStartup', $CSIDL_COMMON_STARTUP], _ ; %ALLUSERSPROFILE%\Start Menu\Programs\Startup
            ['CommonStartMenu', $CSIDL_COMMON_STARTMENU], _ ; %ALLUSERSPROFILE%\Start Menu
            ['CommonTemplates', $CSIDL_COMMON_TEMPLATES], _ ; %ALLUSERSPROFILE%\Templates
            ['Desktop', $CSIDL_DESKTOPDIRECTORY], _ ; %USERPROFILE%\Desktop
            ['Documents', $CSIDL_PERSONAL], _ ; %USERPROFILE%\My Documents
            ['Favorites', $CSIDL_FAVORITES], _ ; %USERPROFILE%\Favorites
            ['Fonts', $CSIDL_FONTS], _ ;    %SystemRoot%\Fonts
            ['LocalAppData', $CSIDL_LOCAL_APPDATA], _ ; %USERPROFILE%\Local Settings\Application Data
            ['Music', $CSIDL_MYMUSIC], _ ; %USERPROFILE%\My Documents\My Music
            ['Pictures', $CSIDL_MYPICTURES], _ ; %USERPROFILE%\My Documents\My Pictures
            ['Profile', $CSIDL_PROFILE], _ ; %USERPROFILE%
            ['ProgramData', $CSIDL_COMMON_APPDATA], _ ; %ALLUSERSPROFILE%\Application Data
            ['ProgramFiles', $CSIDL_PROGRAM_FILES], _ ; %ProgramFiles%
            ['ProgramFilesCommon', $CSIDL_PROGRAM_FILES_COMMON], _ ; %ProgramFiles%\Common Files
            ['Programs', $CSIDL_PROGRAMS], _ ; %USERPROFILE%\Start Menu\Programs
            ['PublicDesktop', $CSIDL_COMMON_DESKTOPDIRECTORY], _ ; %ALLUSERSPROFILE%\Desktop
            ['PublicDocuments', $CSIDL_COMMON_DOCUMENTS], _ ; %ALLUSERSPROFILE%\Documents
            ['PublicMusic', $CSIDL_COMMON_MUSIC], _ ; %ALLUSERSPROFILE%\Documents\My Music
            ['PublicPictures', $CSIDL_COMMON_PICTURES], _ ; %ALLUSERSPROFILE%\Documents\My Pictures
            ['PublicVideos', $CSIDL_COMMON_VIDEO], _ ; %ALLUSERSPROFILE%\Documents\My Videos
            ['RoamingAppData', $CSIDL_APPDATA], _ ; %APPDATA%
            ['SendTo', $CSIDL_SENDTO], _ ; %USERPROFILE%\SendTo
            ['StartMenu', $CSIDL_STARTMENU], _ ; %USERPROFILE%\Start Menu
            ['Startup', $CSIDL_STARTUP], _ ; %USERPROFILE%\Start Menu\Programs\Startup
            ['System', $CSIDL_SYSTEM], _ ; %SystemRoot%\system32
            ['Templates', $CSIDL_TEMPLATES], _ ; %USERPROFILE%\Templates
            ['Videos', $CSIDL_MYVIDEO], _ ; %USERPROFILE%\My Documents\My Videos
            ['Windows', $CSIDL_WINDOWS]] ; %SystemRoot%

    ; search the array for the folder name
    Local $iIndex = _ArraySearch($aConstants, $sFolder)
    If @error Then Return SetError(1, 0, '"' & $sFolder & '" ' & ' is not listed in the Known Folder list')

    ; get the special folder path
    Local $sRet = _WinAPI_ShellGetSpecialFolderPath($aConstants[$iIndex][1])
    If @error Then Return SetError(1, 0, _WinAPI_GetLastErrorMessage())

    ; return the folder path
    Return $sRet
EndFunc   ;==>_XP_GetSpecialFolder

; #FUNCTION# ====================================================================================================================
; Name ..........: _Win7_GetKnownFolder
; Description ...: Retrieves the full path of a known folder
; Syntax ........: _Win7_GetKnownFolder($sFolder)
; Parameters ....: $sFolder  - A string value denoting the known folder
; Return values .: Success - Returns the full folder path
;                  Failure - Sets @error to 1 and returns a string for logging
; Remarks .......: Only for Windows Vista and above
; Related .......: _XP_GetSpecialFolder (for XP and lower)
; Link ..........: link http://msdn.microsoft.com/en-us/library/dd378457.aspx
; Example .......: _Win7_GetKnownFolder('CommonPrograms')
; ===============================================================================================================================
Func _Win7_GetKnownFolder($sFolder)
    ; trimmed list of KnownFolder constants
    Local $sConstants = 'CommonPrograms|' & _ ;%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs
            'CommonStartMenu|' & _ ; %ALLUSERSPROFILE%\Microsoft\Windows\Start Menu
            'CommonStartup|' & _ ; %ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\StartUp
            'CommonTemplates|' & _ ; %ALLUSERSPROFILE%\Microsoft\Windows\Templates
            'Desktop|' & _ ; %USERPROFILE%\Desktop
            'Documents|' & _ ; %USERPROFILE%\Documents
            'DocumentsLibrary|' & _ ; %APPDATA%\Microsoft\Windows\Libraries\Documents.library-ms
            'Favorites|' & _ ; %USERPROFILE%\Favorites
            'Fonts|' & _ ; %windir%\Fonts
            'Libraries|' & _ ; %APPDATA%\Microsoft\Windows\Libraries
            'LocalAppData|' & _ ; %LOCALAPPDATA% (%USERPROFILE%\AppData\Local)
            'LocalAppDataLow|' & _ ; %USERPROFILE%\AppData\LocalLow
            'Music|' & _ ; %USERPROFILE%\Music
            'MusicLibrary|' & _ ; %APPDATA%\Microsoft\Windows\Libraries\Music.library-ms
            'PhotoAlbums|' & _ ; %USERPROFILE%\Pictures\Slide Shows
            'PicturesLibrary|' & _ ; %APPDATA%\Microsoft\Windows\Libraries\Pictures.library-ms
            'Pictures|' & _ ; %USERPROFILE%\Pictures
            'Playlists|' & _ ; %USERPROFILE%\Music\Playlists
            'Profile|' & _ ; %USERPROFILE% (%SystemDrive%\Users\%USERNAME%)
            'ProgramData|' & _ ; %ALLUSERSPROFILE% (%ProgramData%, %SystemDrive%\ProgramData)
            'ProgramFiles|' & _ ; %ProgramFiles% (%SystemDrive%\Program Files)
            'ProgramFilesX64|' & _ ; %ProgramFiles% (%SystemDrive%\Program Files)
            'ProgramFilesX86|' & _ ; %ProgramFiles% (%SystemDrive%\Program Files)
            'ProgramFilesCommon|' & _ ; %ProgramFiles%\Common Files
            'ProgramFilesCommonX64|' & _ ; %ProgramFiles%\Common Files
            'ProgramFilesCommonX86|' & _ ; %ProgramFiles%\Common Files
            'Programs|' & _ ; %APPDATA%\Microsoft\Windows\Start Menu\Programs
            'Public|' & _ ; %PUBLIC% (%SystemDrive%\Users\Public)
            'PublicDesktop|' & _ ; %PUBLIC%\Desktop
            'PublicDocuments|' & _ ; %PUBLIC%\Documents
            'PublicLibraries|' & _ ; %ALLUSERSPROFILE%\Microsoft\Windows\Libraries
            'PublicMusic|' & _ ; %PUBLIC%\Music
            'PublicPictures|' & _ ; %PUBLIC%\Pictures
            'PublicVideos|' & _ ; %PUBLIC%\Videos
            'QuickLaunch|' & _ ; %APPDATA%\Microsoft\Internet Explorer\Quick Launch
            'ResourceDir|' & _ ; %windir%\Resources
            'RoamingAppData|' & _ ; %APPDATA% (%USERPROFILE%\AppData\Roaming)
            'SendTo|' & _ ; %APPDATA%\Microsoft\Windows\SendTo
            'StartMenu|' & _ ; %APPDATA%\Microsoft\Windows\Start Menu
            'Startup|' & _ ; %APPDATA%\Microsoft\Windows\Start Menu\Programs\StartUp
            'System|' & _ ; %windir%\system32
            'SystemX86|' & _ ; %windir%\system32
            'Templates|' & _ ; %APPDATA%\Microsoft\Windows\Templates
            'UserPinned|' & _ ; %APPDATA%\Microsoft\Internet Explorer\Quick Launch\User Pinned
            'UserProfiles|' & _ ; %SystemDrive%\Users
            'UserProgramFiles|' & _ ; %LOCALAPPDATA%\Programs
            'UserProgramFilesCommon|' & _ ; %LOCALAPPDATA%\Programs\Common
            'Videos|' & _ ; %USERPROFILE%\Videos
            'VideosLibrary|' & _ ; %APPDATA%\Microsoft\Windows\Libraries\Videos.library-ms
            'Windows' ; %windir%

    ; check the passed folder name is listed
    If Not _String_SearchForWords('', $sConstants, $sFolder) Then Return SetError(1, 0, '"' & $sFolder & '" ' & ' is not listed in the Known Folder list')

    ; return the value of the variable
    Local $sGUID = Eval('FOLDERID_' & $sFolder)

    ; get the known folder path
    Local $sFolderPath = _WinAPI_ShellGetKnownFolderPath($sGUID)
    If @error Then Return SetError(1, 0, _WinAPI_GetLastErrorMessage())
    Return $sFolderPath
EndFunc   ;==>_Win7_GetKnownFolder

Func _String_SearchForWords($sCallingFunc, $sTest, $sSearch)
    Local $sRunningFunc = '_String_SearchForWords'
    Local $sPattern = '(?i)^(?=.*\b' & StringReplace($sSearch, '|', '\b)(?=.*\b') & '\b)'
    Local $iLineNumber = 191
    Local $iRet = StringRegExp($sTest, $sPattern)
;~  If @error Then Return SetError(_LogError($hLogFile, $sCallingFunc, $iLineNumber, $sRunningFunc, 'StringRegExp', $sTest & '|' & $sSearch & '|' & $sPattern, @error, @extended))
    Return $iRet
EndFunc   ;==>_String_SearchForWords
