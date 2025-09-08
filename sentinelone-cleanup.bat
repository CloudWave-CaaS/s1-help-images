@echo off
:: ===================================================================
:: SentinelOne Full Removal Script (All Keys, reg.exe only)
:: ===================================================================
:: Run as Administrator (Safe Mode recommended)
:: ===================================================================

set LOGFILE=C:\sentinelone_cleanup.log
echo === SentinelOne Removal Log - %DATE% %TIME% === > "%LOGFILE%"

echo.
echo === SentinelOne Full Removal Script ===
echo Log file: %LOGFILE%
pause

:: ------------------------------------------------------
:: HKCR\AppID
:: ------------------------------------------------------
reg delete "HKCR\AppID\{1ECB7470-7BA4-4F64-A41D-BDF1B38DEED8}" /f >> "%LOGFILE%" 2>&1
reg delete "HKCR\AppID\{4F58E51B-3F2B-4807-AB8C-2A7F143E9C3F}" /f >> "%LOGFILE%" 2>&1
reg delete "HKCR\AppID\SentinelHelperService" /f >> "%LOGFILE%" 2>&1

:: HKCR\CLSID
reg delete "HKCR\CLSID\{28B58EFD-EED3-49D0-9AC3-A7A9E39A6303}" /f >> "%LOGFILE%" 2>&1
reg delete "HKCR\CLSID\{DFE127B0-F72C-40FB-BEF8-9F29CB996B9C}" /f >> "%LOGFILE%" 2>&1

:: HKCR\Interface
reg delete "HKCR\Interface\{0420773B-38C3-4300-AD2B-23652FEEE26C}" /f >> "%LOGFILE%" 2>&1
reg delete "HKCR\Interface\{51821FE8-516B-4BE3-9578-31B2DFAD4042}" /f >> "%LOGFILE%" 2>&1
reg delete "HKCR\Interface\{8E470FB5-6800-4FF6-8E0A-620F676C912E}" /f >> "%LOGFILE%" 2>&1

:: HKCR - Direct
reg delete "HKCR\SentinelAgent" /f >> "%LOGFILE%" 2>&1
reg delete "HKCR\SentinelHelper" /f >> "%LOGFILE%" 2>&1
reg delete "HKCR\SentinelOneLog" /f >> "%LOGFILE%" 2>&1

:: HKCR\TypeLib
reg delete "HKCR\TypeLib\{667D5A92-7C14-4687-B20E-A5CF06FEF1AF}" /f >> "%LOGFILE%" 2>&1
reg delete "HKCR\TypeLib\{BED0DAEE-A8DC-40E6-AAD6-DCA5532B746C}" /f >> "%LOGFILE%" 2>&1

:: ------------------------------------------------------
:: HKCR\WOW6432Node
:: ------------------------------------------------------
reg delete "HKCR\WOW6432Node\AppID\{1ECB7470-7BA4-4F64-A41D-BDF1B38DEED8}" /f >> "%LOGFILE%" 2>&1
reg delete "HKCR\WOW6432Node\AppID\{4F58E51B-3F2B-4807-AB8C-2A7F143E9C3F}" /f >> "%LOGFILE%" 2>&1
reg delete "HKCR\WOW6432Node\AppID\SentinelHelperService" /f >> "%LOGFILE%" 2>&1
reg delete "HKCR\WOW6432Node\Interface\{0420773B-38C3-4300-AD2B-23652FEEE26C}" /f >> "%LOGFILE%" 2>&1
reg delete "HKCR\WOW6432Node\Interface\{51821FE8-516B-4BE3-9578-31B2DFAD4042}" /f >> "%LOGFILE%" 2>&1
reg delete "HKCR\WOW6432Node\Interface\{8E470FB5-6800-4FF6-8E0A-620F676C912E}" /f >> "%LOGFILE%" 2>&1
reg delete "HKCR\WOW6432Node\TypeLib\{667D5A92-7C14-4687-B20E-A5CF06FEF1AF}" /f >> "%LOGFILE%" 2>&1
reg delete "HKCR\WOW6432Node\TypeLib\{BED0DAEE-A8DC-40E6-AAD6-DCA5532B746C}" /f >> "%LOGFILE%" 2>&1

:: ------------------------------------------------------
:: HKLM\SOFTWARE\Classes
:: ------------------------------------------------------
reg delete "HKLM\SOFTWARE\Classes\AppID\{1ECB7470-7BA4-4F64-A41D-BDF1B38DEED8}" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\Classes\AppID\{4F58E51B-3F2B-4807-AB8C-2A7F143E9C3F}" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\Classes\AppID\SentinelHelperService" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\Classes\CLSID\{28B58EFD-EED3-49D0-9AC3-A7A9E39A6303}" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\Classes\CLSID\{DFE127B0-F72C-40FB-BEF8-9F29CB996B9C}" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\Classes\Interface\{0420773B-38C3-4300-AD2B-23652FEEE26C}" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\Classes\Interface\{51821FE8-516B-4BE3-9578-31B2DFAD4042}" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\Classes\Interface\{8E470FB5-6800-4FF6-8E0A-620F676C912E}" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\Classes\SentinelAgent" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\Classes\SentinelHelper" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\Classes\SentinelOneLog" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\Classes\TypeLib\{667D5A92-7C14-4687-B20E-A5CF06FEF1AF}" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\Classes\TypeLib\{BED0DAEE-A8DC-40E6-AAD6-DCA5532B746C}" /f >> "%LOGFILE%" 2>&1

:: HKLM\SOFTWARE\Classes\WOW6432Node
reg delete "HKLM\SOFTWARE\Classes\WOW6432Node\AppID\{1ECB7470-7BA4-4F64-A41D-BDF1B38DEED8}" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\Classes\WOW6432Node\AppID\{4F58E51B-3F2B-4807-AB8C-2A7F143E9C3F}" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\Classes\WOW6432Node\AppID\SentinelHelperService" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{0420773B-38C3-4300-AD2B-23652FEEE26C}" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{51821FE8-516B-4BE3-9578-31B2DFAD4042}" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{8E470FB5-6800-4FF6-8E0A-620F676C912E}" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\Classes\WOW6432Node\TypeLib\{667D5A92-7C14-4687-B20E-A5CF06FEF1AF}" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\Classes\WOW6432Node\TypeLib\{BED0DAEE-A8DC-40E6-AAD6-DCA5532B746C}" /f >> "%LOGFILE%" 2>&1

:: ------------------------------------------------------
:: HKLM\SOFTWARE\Microsoft
:: ------------------------------------------------------
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Sentinel Agent" /f >> "%LOGFILE%" 2>&1

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelAgent.exe" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelCtl.exe" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelHelperService.exe" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelRemediation.exe" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelServiceHost.exe" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelStaticEngine.exe" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelStaticEngineScanner.exe" /f >> "%LOGFILE%" 2>&1

reg delete "HKLM\SOFTWARE\SentinelOneLog" /f >> "%LOGFILE%" 2>&1

:: WOW6432Node IFEO
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelAgent.exe" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelCtl.exe" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelHelperService.exe" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelRemediation.exe" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelServiceHost.exe" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelStaticEngine.exe" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelStaticEngineScanner.exe" /f >> "%LOGFILE%" 2>&1

:: ------------------------------------------------------
:: HKLM\SYSTEM
:: ------------------------------------------------------
reg delete "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\SentinelLogger" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\SentinelLogSession0" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\SentinelStatic" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SYSTEM\ControlSet001\Services\LogProcessorService" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SYSTEM\ControlSet001\Services\SentinelAgent" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SYSTEM\ControlSet001\Services\SentinelHelperService" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SYSTEM\ControlSet001\Services\SentinelMonitor" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SYSTEM\ControlSet001\Services\SentinelStaticEngine" /f >> "%LOGFILE%" 2>&1

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SentinelLogger" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SentinelLogSession0" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SentinelStatic" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\LogProcessorService" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\SentinelAgent" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\SentinelHelperService" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\SentinelMonitor" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\SentinelStaticEngine" /f >> "%LOGFILE%" 2>&1

reg delete "HKLM\SYSTEM\Setup\FirstBoot\Services\LogProcessorService" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SYSTEM\Setup\FirstBoot\Services\SentinelAgent" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SYSTEM\Setup\FirstBoot\Services\SentinelHelperService" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SYSTEM\Setup\FirstBoot\Services\SentinelMonitor" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SYSTEM\Setup\FirstBoot\Services\SentinelStaticEngine" /f >> "%LOGFILE%" 2>&1

:: ------------------------------------------------------
:: Specific Values
:: ------------------------------------------------------
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /v "SentinelOneLog_.binlog" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "Sentinel Agent" /f >> "%LOGFILE%" 2>&1
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Sentinel Agent" /f >> "%LOGFILE%" 2>&1

:: ------------------------------------------------------
:: SentinelOne directories
:: ------------------------------------------------------
rmdir /s /q "C:\ProgramData\Sentinel" >> "%LOGFILE%" 2>&1
rmdir /s /q "C:\Program Files\SentinelOne" >> "%LOGFILE%" 2>&1

echo.
echo === SentinelOne removal attempted. Check %LOGFILE% for details. ===
pause
exit /b
