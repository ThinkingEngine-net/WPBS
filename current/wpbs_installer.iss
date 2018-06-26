;(c) 2016 ThinkingMachine.Net
; Windows PHP Behat Selenium Installer
; Standard behat Starter Kit

[Setup]
AppName=Windows PHP, Behat and Selenium Installer
AppVersion=0.0.2.0
DefaultDirName={sd}\WPBS
DefaultGroupName=WPBS
UninstallDisplayIcon={app}\tools\check.exe
UninstallFilesDir={app}\tools\wpbs-uninstall\
Compression=lzma2
SolidCompression=yes
OutputDir=build
; "ArchitecturesInstallIn64BitMode=x64" requests that the install be
; done in "64-bit mode" on x64, meaning it should use the native
; 64-bit Program Files directory and the 64-bit view of the registry.
; On all other architectures it will install in "32-bit mode".
ArchitecturesInstallIn64BitMode=x64
; Note: We don't set ProcessorsAllowed because we want this
; installation to run on all architectures (including Itanium,
; since it's capable of running 32-bit code too).
AppCopyright=(c) 2017 ThinkingEngine.net
LicenseFile=D:\development\TestScripts\tool_code\WPBS\current\eula.rtf
MinVersion=0,6.1
VersionInfoVersion=0.0.2.0
VersionInfoCompany=ThinkingEngine.net
VersionInfoDescription=WPBS Installer
VersionInfoTextVersion=0.0.2
VersionInfoCopyright=(c) 2017 ThinkingEngine.net
VersionInfoProductName=Windows PHP, Behat and Selemiun Installer
VersionInfoProductVersion=0.0.2.0
VersionInfoProductTextVersion=0.0.2
AppPublisher=ThinginEngine.net
AppPublisherURL=http://thinkingengine.net/
AppSupportURL=http://thinkingengine.net/products/wpbs-installer/
SetupIconFile=userdocs:thinkingEngine\favicon.ico
OutputBaseFilename=wpbs-installer

[Types]
Name: "full"; Description: "Full installation"
Name: "custom"; Description: "Custom installation"; Flags: iscustom

[Components]
Name: "php"; Description: "Install PHP 5.6.x"; Types: full
Name: "composer"; Description: "Install Composer for PHP"; Types: full
Name: "project"; Description: "Create project  folder striucture (including selenium)"; Types: full custom; Flags: fixed

[Files]
; ******************************* Install 64 bit  **************************************************
; Install Apache
Source: "source\php\php-5.6.29-Win32-VC11-x64\deplister.exe"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php; Check: Is64BitInstallMode
Source: "source\php\php-5.6.29-Win32-VC11-x64\glib-2.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\gmodule-2.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\icudt57.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\icuin57.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\icuio57.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\icule57.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\iculx57.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\icutest57.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\icutu57.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\icuuc57.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\install.txt"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\libeay32.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\libenchant.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\libpq.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\libsasl.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\libssh2.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\license.txt"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\news.txt"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\phar.phar.bat"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\pharcommand.phar"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\php-cgi.exe"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\php-win.exe"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\php.exe"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\php.gif"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\php.ini-development"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\php.ini-production"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\php5apache2_4.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\php5embed.lib"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\php5phpdbg.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\php5ts.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\phpdbg.exe"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\readme-redist-bins.txt"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\snapshot.txt"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ssleay32.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\dev\php5ts.lib"; DestDir: "{app}\php\dev\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_bz2.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_com_dotnet.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_curl.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_enchant.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_exif.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_fileinfo.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_gd2.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_gettext.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_gmp.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_imap.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_interbase.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_intl.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_ldap.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_mbstring.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_mysql.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_mysqli.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_oci8_12c.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_opcache.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_openssl.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_pdo_firebird.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_pdo_mysql.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_pdo_oci.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_pdo_odbc.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_pdo_pgsql.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_pdo_sqlite.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_pgsql.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_shmop.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_snmp.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_soap.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_sockets.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_sqlite3.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_sybase_ct.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_tidy.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_xmlrpc.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\ext\php_xsl.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\extras\ssl\openssl.cnf"; DestDir: "{app}\php\extras\ssl\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\lib\enchant\libenchant_ispell.dll"; DestDir: "{app}\php\lib\enchant\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x64\lib\enchant\libenchant_myspell.dll"; DestDir: "{app}\php\lib\enchant\"; Flags: ignoreversion; Components: php
; ******************************* Install 64 bit  **************************************************
; Install Apache
Source: "source\php\php-5.6.29-Win32-VC11-x86\deplister.exe"; DestDir: "{app}\php\"; Flags: ignoreversion solidbreak; Components: php; Check: not Is64BitInstallMode
Source: "source\php\php-5.6.29-Win32-VC11-x86\glib-2.dll"; DestDir: "{app}\php\"; Flags: ignoreversion
Source: "source\php\php-5.6.29-Win32-VC11-x86\gmodule-2.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\icudt57.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\icuin57.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\icuio57.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\icule57.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\iculx57.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\icutest57.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\icutu57.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\icuuc57.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\install.txt"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\libeay32.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\libenchant.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\libpq.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\libsasl.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\libssh2.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\license.txt"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\news.txt"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\phar.phar.bat"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\pharcommand.phar"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\php-cgi.exe"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\php-win.exe"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\php.exe"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\php.gif"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\php.ini-development"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\php.ini-production"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\php5apache2_4.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\php5embed.lib"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\php5phpdbg.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\php5ts.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\phpdbg.exe"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\readme-redist-bins.txt"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\snapshot.txt"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ssleay32.dll"; DestDir: "{app}\php\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\dev\php5ts.lib"; DestDir: "{app}\php\dev\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_bz2.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_com_dotnet.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_curl.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_enchant.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_exif.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_fileinfo.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_gd2.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_gettext.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_gmp.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_imap.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_interbase.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_intl.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_ldap.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_mbstring.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_mysql.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_mysqli.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_oci8_12c.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_opcache.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_openssl.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_pdo_firebird.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_pdo_mysql.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_pdo_oci.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_pdo_odbc.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_pdo_pgsql.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_pdo_sqlite.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_pgsql.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_shmop.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_snmp.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_soap.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_sockets.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_sqlite3.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_sybase_ct.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_tidy.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_xmlrpc.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\ext\php_xsl.dll"; DestDir: "{app}\php\ext\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\extras\ssl\openssl.cnf"; DestDir: "{app}\php\extras\ssl\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\lib\enchant\libenchant_ispell.dll"; DestDir: "{app}\php\lib\enchant\"; Flags: ignoreversion; Components: php
Source: "source\php\php-5.6.29-Win32-VC11-x86\lib\enchant\libenchant_myspell.dll"; DestDir: "{app}\php\lib\enchant\"; Flags: ignoreversion; Components: php
; ******************************* Install Common Files  **************************************************
; Install Apache INI
Source: "source\php.ini"; DestDir: "{app}\php\"; Flags: ignoreversion solidbreak; Components: php
; Install Selenium for Chrome
Source: "source\selenium _chrome\chrome.bat"; DestDir: "{app}\projects\selenium _chrome\"; Flags: ignoreversion; Components: project
Source: "source\selenium _chrome\chromedriver.exe"; DestDir: "{app}\projects\selenium _chrome\"; Flags: ignoreversion; Components: project
; Install Project Template (Behat 2.x)
Source: "source\_template\.gitignore"; DestDir: "{app}\projects\_template-2-x\"; Flags: ignoreversion; Components: project
Source: "source\_template\behat.bat"; DestDir: "{app}\projects\_template-2-x\"; Flags: ignoreversion; Components: project
Source: "source\_template\behat.yml"; DestDir: "{app}\projects\_template-2-x\"; Flags: ignoreversion; Components: project
Source: "source\_template\composer.json"; DestDir: "{app}\projects\_template-2-x\"; Flags: ignoreversion; Components: project
Source: "source\_template\features\test.feature"; DestDir: "{app}\projects\_template-2-x\features\"; Flags: ignoreversion; Components: project
Source: "source\_template\features\bootstrap\FeatureContext.php"; DestDir: "{app}\projects\_template-2-x\features\bootstrap\"; Flags: ignoreversion; Components: project
; deploy Composer Installer
Source: "source\composer-setup.exe"; DestDir: "{app}\tools\"; Flags: ignoreversion; Components: composer; AfterInstall: RunComposerInstaller
; deploy Composer Custom Tools
Source: "tools\check.exe"; DestDir: "{app}\tools\"; Flags: ignoreversion; Components: composer

[Registry]
; Add PHP path if not already prsent.
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; \
    ValueType: expandsz; ValueName: "Path"; ValueData: "{olddata};{app}\php"; \
    Check: NeedsAddPath('{app}\php'); Components: php

[Icons]
Name: "{group}\Check Config"; Filename: "{app}\tools\check.exe"; Components: project
Name: "{group}\Uninstall WPBS"; Filename: "{uninstallexe}"; Components: project

[Dirs]
Name: "{app}\tools\"
Name: "{app}\php\"; Components: php
Name: "{app}\php\dev\"; Components: php
Name: "{app}\php\ext\" ; Components: php
Name: "{app}\php\extras\" ; Components: php
Name: "{app}\php\extras\ssl\" ; Components: php
Name: "{app}\php\lib\"; Components: php
Name: "{app}\php\lib\enchant\" ; Components: php
Name: "{app}\php\" ; Components: php
Name: "{app}\php\dev\"; Components: php
Name: "{app}\php\ext\"  ; Components: php
Name: "{app}\php\extras\" ; Components: php
Name: "{app}\php\extras\ssl\" ; Components: php
Name: "{app}\php\lib\" ; Components: php
Name: "{app}\php\lib\enchant\" ; Components: php
Name: "{app}\projects\selenium _chrome\" ; Components: project
Name: "{app}\projects\_template-2-x\" ; Components: project
Name: "{app}\projects\_template-2-x\features\" ; Components: project
Name: "{app}\projects\_template-2-x\features\bootstrap\"  ; Components: project


[Code]
// Add path for PHP
function NeedsAddPath(Param: string): boolean;
var
  OrigPath: string;
begin
  if not RegQueryStringValue(HKEY_LOCAL_MACHINE,
    'SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
    'Path', OrigPath)
  then begin
    Result := True;
    exit;
  end;
  { look for the path with leading and trailing semicolon }
  { Pos() returns 0 if not found }
  Result := Pos(';' + Param + ';', ';' + OrigPath + ';') = 0;
end;

//Run Composer Install
procedure RunComposerInstaller;
var
  ResultCode: Integer;
begin
  if not Exec(ExpandConstant('{app}\tools\composer-setup.exe'), '', '', SW_SHOWNORMAL,
    ewWaitUntilTerminated, ResultCode)
  then
    MsgBox('Other installer failed to run!' + #13#10 +
      SysErrorMessage(ResultCode), mbError, MB_OK);
end;