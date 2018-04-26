@echo off


:: -----------------------------------------------------------------------------
:: TIPS for the Personal Backup translators
::
:: Download wget.exe from https://eternallybored.org/misc/wget/ and place it in the %PATH%.
:: Download 7-Zip archiver from http://www.7-zip.org/ and place the 7z.exe file in the %PATH%.
:: Execute this BAT script.
:: Run Poedit and open the default.po file.
:: Select menu View -> Show references. A new window "Source file" should appear.
:: Now, when you select some string in the main Poedit window, in the "Source file" window
:: you should see DFM or PAS file content. If you click "Open in editor" button, the current
:: source file will be opened in the program associated with the DFM/PAS files.
::
:: Very useful is the DFM Editor: http://www.mitec.cz/dfm.html
:: It's best to create a DFM file association with the DFMEdit.exe file.
:: -----------------------------------------------------------------------------
:: Jacek Pazera, 18.01.2018


rem ----------------------------- VARIABLES ------------------------------------


for %%X in (wget.exe) do (set wget=%%~$PATH:X)
if not defined wget (
echo wget.exe not found!
echo Please download wget for Windows from https://eternallybored.org/misc/wget/
goto LBL_EXIT
)
echo wget.exe: %wget%

for %%X in (7z.exe) do (set SevenZip=%%~$PATH:X)
if not defined SevenZip (
echo 7z.exe not found!
echo Please download the 7-Zip archiver from http://www.7-zip.org/
goto LBL_EXIT
)
echo   7z.exe: %SevenZip%


set BinDir=_temp_bin_%RANDOM%
set ArchDir=archives
set SrcDir=_temp_src_%RANDOM%
set DialogsSrcDir=%SrcDir%\dialoge

set PersbackupExe=%BinDir%\Persbackup.exe
set PbPlanerExe=%BinDir%\PbPlaner.exe
set PbRestoreExe=%BinDir%\PbRestore.exe
set PbStarterExe=%BinDir%\PbStarter.exe
set PbTerminateExe=%BinDir%\PbTerminate.exe
set PbUninstallExe=%BinDir%\PbUninstall.exe
set TbBackupExe=%BinDir%\TbBackup.exe

set DfmExtractor=%BinDir%\DfmExtractor.exe

rem ----------------------------------------------------------------------------



mkdir %BinDir%
if not exist %ArchDir% mkdir %ArchDir%
mkdir %SrcDir%
mkdir %DialogsSrcDir%


%wget% http://personal-backup.rathlev-home.de/download/pb-update-5.zip -nc -O %ArchDir%\pb-update-5.zip
%SevenZip% e -o%BinDir% -y %ArchDir%\pb-update-5.zip *.exe > nul

%wget% http://www.pazera-software.com/files/DfmExtractor_win32.zip -nc -O %ArchDir%\DfmExtractor_win32.zip
%SevenZip% e -o%BinDir% -y %ArchDir%\DfmExtractor_win32.zip DfmExtractor.exe > nul

%wget% http://www.rathlev-home.de/sources/download/d10/dialoge.zip -nc -O %ArchDir%\dialoge.zip
%SevenZip% e -o%DialogsSrcDir% -y %ArchDir%\dialoge.zip *.dfm *.pas > nul

%wget% http://www.rathlev-home.de/sources/download/d10/kalender-s.zip -nc -O %ArchDir%\kalender-s.zip
%SevenZip% e -y %ArchDir%\kalender-s.zip Units\RandDlg.dfm > nul
%SevenZip% e -y %ArchDir%\kalender-s.zip Units\RandDlg.pas > nul
%SevenZip% e -y %ArchDir%\kalender-s.zip Units\EditHolidayDlg.dfm > nul
%SevenZip% e -y %ArchDir%\kalender-s.zip Units\EditHolidayDlg.pas > nul

%wget% http://www.rathlev-home.de/sources/download/d10/extfiletools.zip -nc -O %ArchDir%\extfiletools.zip
%SevenZip% e -y %ArchDir%\extfiletools.zip FileConsts.pas > nul 
%SevenZip% e -y %ArchDir%\extfiletools.zip FilePropConsts.pas > nul 
%SevenZip% e -y %ArchDir%\extfiletools.zip FtpConsts.pas > nul 
%SevenZip% e -y %ArchDir%\extfiletools.zip UnitConsts.pas > nul 

%wget% http://www.rathlev-home.de/sources/download/d10/vss-s.zip -nc -O %ArchDir%\vss-s.zip
%SevenZip% e -y %ArchDir%\vss-s.zip units\VssConsts.pas > nul

%wget% http://www.rathlev-home.de/sources/download/d10/wts2-s.zip -nc -O %ArchDir%\wts2-s.zip
%SevenZip% e -y %ArchDir%\wts2-s.zip units\WinTaskConsts.pas > nul




rem goto LBL_EXIT       


rem ----------------------------------------------------------------------------
:LBL_PREPARE_POEDIT_SOURCE_FILES

for %%f in (
SynEdPageDlg.dfm,SynEdPageDlg.pas,SynEdKeyDlg.dfm,SynEdKeyDlg.pas,ColumnDlg.dfm,CsvDialog.dfm,EditStringListDlg.dfm,
EtikettDlg.dfm,ExportDlg.dfm,FileFilterDlg.dfm,FileFilterDlg.pas,FilterDlg.dfm,FilterDlg.pas,FtpDirDlg.dfm,FtpDirDlg.pas,
HelpWin.dfm,HelpWin.pas,HttpProxyDlg.dfm,InpNumber.dfm,InpText.dfm,LanguageDlg.dfm,MoveListDlg.dfm,PrintPageDlg.dfm,
ProgWind.dfm,ProgWind.pas,PwdDlg.dfm,SearchPathDlg.dfm,SearchPathDlg.pas,SelectColorDlg.dfm,SelectFontDlg.dfm,
SelectFontDlg.pas,ShellFileDlg.dfm,ShellFileDlg.pas,ShowMemo.dfm,ShowMemo.pas,ShowText.dfm,ShowText.pas,TransferStat.dfm,
TransferStat.pas,WebBrowser.dfm,WebBrowser.pas,WebUpdateDlg.dfm,AccountDlg.dfm,AccountDlg.pas,ConfirmCheckDlg.pas,
FtpDlg.pas,MailDlg.pas,SelectFromListDlg.dfm,SelectFromListDlg.pas,ShellDirDlg.pas,Textdlg.dfm,Textdlg.pas
) do (
copy %DialogsSrcDir%\%%f .\ > nul
)


"%DfmExtractor%" -i "%PersbackupExe%" -n PrefsDialog -o SettingsDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n BackupForm -o Backup.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n AddProgramsDialog -o AddProgramsDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n AdvancedScheduleDialog -o AdvancedScheduleDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n ZeigFortschritt -o Anzeige.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n ScheduleDialog -o Schedule.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n SuffixDialog -o SuffixDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n FtpDialog -o BuFtpDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n BuMainForm -o BuMain.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n CleanBakDialog -o CleanBakDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n RestBakDialog -o RestBakDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n CleanUpDialog -o Cleanup.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n RestoreDialog -o Restore.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n VerifyDialog -o Verify.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n ConfirmDelDirDialog -o ConfirmDelDirDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n ConfirmDeleteDialog -o ConfirmDeleteDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n ConfirmFiles -o ConfirmFilesDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n ExternalViewerDialog -o ExtViewDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n ShowInfoDialog -o InfoDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n LogDialog -o LogDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n MailDialog -o MailDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n MailTestDialog -o MailTestDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n PlaceHolderDialog -o PhDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n ShowFilePreview -o PreviewDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n LogonDialog -o RestPwdDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n SelectSchedTaskDialog -o SelSchedTaskDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n StartImmDialog -o StartImmDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n SyncSuffixDialog -o SyncSuffixDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n TaskScheduleDialog -o TaskSchedDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n TimeCompareDialog -o TimeCompareDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n TimeSlotDialog -o TimeSlotDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n UpdateDialog -o UpdateDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n WizardDialog -o Wizard.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n AccountDialog -o AccountDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n CharTableDialog -o CharTableDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n SelectFromListDialog -o SelectFromListDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n ConfirmCheckDialog -o ConfirmCheckDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n Download -o DownloadProgress.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n EditHistListDialog -o EditHistListDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n SelectDateDialog -o SelectDateDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n FtpDialog -o FtpDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n FtpProxyDialog -o FtpProxyDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n LogonDialog -o LogonDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n PrintPageDialog -o PrintPageDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n StatusWindow -o StatWind.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n ShellDirDialog -o ShellDirDlg.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n frmShow -o Show.dfm
"%DfmExtractor%" -i "%PersbackupExe%" -n StartDialog -o StartDlg.dfm


"%DfmExtractor%" -i "%PbStarterExe%" -n ShortcutDialog -o ShortcutDlg.dfm
"%DfmExtractor%" -i "%PbStarterExe%" -n MainForm -o StarterMain.dfm
"%DfmExtractor%" -i "%PbStarterExe%" -n AppDialog -o AppDlg.dfm

"%DfmExtractor%" -i "%PbPlanerExe%" -n DesktopIconDialog -o DesktopIconDlg.dfm
"%DfmExtractor%" -i "%PbPlanerExe%" -n HauptForm -o PbPlanerMain.dfm

"%DfmExtractor%" -i "%PbRestoreExe%" -n MainForm -o RestoreMain.dfm

"%DfmExtractor%" -i "%TbBackupExe%" -n MainForm -o TbMain.dfm
"%DfmExtractor%" -i "%TbBackupExe%" -n SelectProfileDialog -o SelectProfileDlg.dfm

"%DfmExtractor%" -i "%PbUninstallExe%" -n MainForm -o UninstallMain.dfm




rem ----------------------------------------------------------------------------
:LBL_EXPORT_ALL_DFMS

:: If you want all DFMs from Personal Backup executables, remove the comments from the following lines.

::set DfmAllDir=.\DFM_ALL
::"%DfmExtractor%" -i "%PersbackupExe%" -a -d %DfmAllDir%\Persbackup 
::"%DfmExtractor%" -i "%PbPlanerExe%" -a -d %DfmAllDir%\PbPlaner
::"%DfmExtractor%" -i "%PbRestoreExe%" -a -d %DfmAllDir%\PbRestore  
::"%DfmExtractor%" -i "%PbStarterExe%" -a -d %DfmAllDir%\PbStarter 
::"%DfmExtractor%" -i "%PbTerminateExe%" -a -d %DfmAllDir%\PbTerminate
::"%DfmExtractor%" -i "%TbBackupExe%" -a -d %DfmAllDir%\TbBackup  
::"%DfmExtractor%" -i "%PbUninstallExe%" -a -d %DfmAllDir%\PbUninstall



rem ----------------------------------------------------------------------------
:LBL_CLEAN

del %BinDir%\* /f /q > nul
rmdir %BinDir%

del %SrcDir%\* /s /f /q > nul
rmdir %SrcDir% /s /q

echo ------------------------------------------------
echo.
echo Temporary files and folders has been removed.



rem ----------------------------------------------------------------------------
:LBL_EXIT

echo.
echo --------------------- END ----------------------
