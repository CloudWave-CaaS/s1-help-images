@echo off
:: ===================================================================
:: SentinelOne Full Removal Script (Regini + Logging, Full Expansion)
:: ===================================================================
:: Run as Administrator
:: ===================================================================

set LOGFILE=C:\sentinelone_cleanup.log
echo === SentinelOne Removal Log - %DATE% %TIME% === > %LOGFILE%

echo.
echo === SentinelOne Full Removal Script ===
echo Using REGINI to reset registry ACLs...
echo Log file: %LOGFILE%
pause

:: ------------------------------------------------------
:: Create temporary ACL file to grant Administrators full control
:: ------------------------------------------------------
echo HKEY_CLASSES_ROOT [1 5 7] > %temp%\reset_acl.txt
echo HKEY_LOCAL_MACHINE\SOFTWARE [1 5 7] >> %temp%\reset_acl.txt
echo HKEY_LOCAL_MACHINE\SYSTEM [1 5 7] >> %temp%\reset_acl.txt
echo HKEY_CURRENT_USER\Software [1 5 7] >> %temp%\reset_acl.txt

regini %temp%\reset_acl.txt >nul 2>&1

:: ------------------------------------------------------
:: Function to delete registry key with logging
:: ------------------------------------------------------
:DelKey
echo [*] Deleting key: %~1
echo [*] Deleting key: %~1 >> %LOGFILE%
reg delete "%~1" /f >nul 2>&1
if %errorlevel%==0 (
    echo [+] SUCCESS: %~1
    echo [+] SUCCESS: %~1 >> %LOGFILE%
) else (
    echo [!] FAILED: %~1
    echo [!] FAILED: %~1 >> %LOGFILE%
)
goto :eof

:: ------------------------------------------------------
:: Function to delete registry value with logging
:: ------------------------------------------------------
:DelVal
echo [*] Deleting value: %~1 [%~2]
echo [*] Deleting value: %~1 [%~2] >> %LOGFILE%
reg delete "%~1" /v "%~2" /f >nul 2>&1
if %errorlevel%==0 (
    echo [+] SUCCESS: %~1 [%~2]
    echo [+] SUCCESS: %~1 [%~2] >> %LOGFILE%
) else (
    echo [!] FAILED: %~1 [%~2]
    echo [!] FAILED: %~1 [%~2] >> %LOGFILE%
)
goto :eof

:: ------------------------------------------------------
:: HKEY_CLASSES_ROOT
:: ------------------------------------------------------
call :DelKey "HKCR\AppID\{1ECB7470-7BA4-4F64-A41D-BDF1B38DEED8}"
call :DelKey "HKCR\AppID\{4F58E51B-3F2B-4807-AB8C-2A7F143E9C3F}"
call :DelKey "HKCR\AppID\SentinelHelperService"
call :DelKey "HKCR\CLSID\{28B58EFD-EED3-49D0-9AC3-A7A9E39A6303}"
call :DelKey "HKCR\CLSID\{DFE127B0-F72C-40FB-BEF8-9F29CB996B9C}"
call :DelKey "HKCR\Interface\{0420773B-38C3-4300-AD2B-23652FEEE26C}"
call :DelKey "HKCR\Interface\{51821FE8-516B-4BE3-9578-31B2DFAD4042}"
call :DelKey "HKCR\Interface\{8E470FB5-6800-4FF6-8E0A-620F676C912E}"
call :DelKey "HKCR\SentinelAgent"
call :DelKey "HKCR\SentinelHelper"
call :DelKey "HKCR\SentinelOneLog"
call :DelKey "HKCR\TypeLib\{667D5A92-7C14-4687-B20E-A5CF06FEF1AF}"
call :DelKey "HKCR\TypeLib\{BED0DAEE-A8DC-40E6-AAD6-DCA5532B746C}"

:: WOW6432Node under HKCR
call :DelKey "HKCR\WOW6432Node\AppID\{1ECB7470-7BA4-4F64-A41D-BDF1B38DEED8}"
call :DelKey "HKCR\WOW6432Node\AppID\{4F58E51B-3F2B-4807-AB8C-2A7F143E9C3F}"
call :DelKey "HKCR\WOW6432Node\AppID\SentinelHelperService"
call :DelKey "HKCR\WOW6432Node\Interface\{0420773B-38C3-4300-AD2B-23652FEEE26C}"
call :DelKey "HKCR\WOW6432Node\Interface\{51821FE8-516B-4BE3-9578-31B2DFAD4042}"
call :DelKey "HKCR\WOW6432Node\Interface\{8E470FB5-6800-4FF6-8E0A-620F676C912E}"
call :DelKey "HKCR\WOW6432Node\TypeLib\{667D5A92-7C14-4687-B20E-A5CF06FEF1AF}"
call :DelKey "HKCR\WOW6432Node\TypeLib\{BED0DAEE-A8DC-40E6-AAD6-DCA5532B746C}"

:: ------------------------------------------------------
:: HKLM\SOFTWARE\Classes
:: ------------------------------------------------------
call :DelKey "HKLM\SOFTWARE\Classes\AppID\{1ECB7470-7BA4-4F64-A41D-BDF1B38DEED8}"
call :DelKey "HKLM\SOFTWARE\Classes\AppID\{4F58E51B-3F2B-4807-AB8C-2A7F143E9C3F}"
call :DelKey "HKLM\SOFTWARE\Classes\AppID\SentinelHelperService"
call :DelKey "HKLM\SOFTWARE\Classes\CLSID\{28B58EFD-EED3-49D0-9AC3-A7A9E39A6303}"
call :DelKey "HKLM\SOFTWARE\Classes\CLSID\{DFE127B0-F72C-40FB-BEF8-9F29CB996B9C}"
call :DelKey "HKLM\SOFTWARE\Classes\Interface\{0420773B-38C3-4300-AD2B-23652FEEE26C}"
call :DelKey "HKLM\SOFTWARE\Classes\Interface\{51821FE8-516B-4BE3-9578-31B2DFAD4042}"
call :DelKey "HKLM\SOFTWARE\Classes\Interface\{8E470FB5-6800-4FF6-8E0A-620F676C912E}"
call :DelKey "HKLM\SOFTWARE\Classes\SentinelAgent"
call :DelKey "HKLM\SOFTWARE\Classes\SentinelHelper"
call :DelKey "HKLM\SOFTWARE\Classes\SentinelOneLog"
call :DelKey "HKLM\SOFTWARE\Classes\TypeLib\{667D5A92-7C14-4687-B20E-A5CF06FEF1AF}"
call :DelKey "HKLM\SOFTWARE\Classes\TypeLib\{BED0DAEE-A8DC-40E6-AAD6-DCA5532B746C}"

:: WOW6432Node under HKLM\SOFTWARE\Classes
call :DelKey "HKLM\SOFTWARE\Classes\WOW6432Node\AppID\{1ECB7470-7BA4-4F64-A41D-BDF1B38DEED8}"
call :DelKey "HKLM\SOFTWARE\Classes\WOW6432Node\AppID\{4F58E51B-3F2B-4807-AB8C-2A7F143E9C3F}"
call :DelKey "HKLM\SOFTWARE\Classes\WOW6432Node\AppID\SentinelHelperService"
call :DelKey "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{0420773B-38C3-4300-AD2B-23652FEEE26C}"
call :DelKey "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{51821FE8-516B-4BE3-9578-31B2DFAD4042}"
call :DelKey "HKLM\SOFTWARE\Classes\WOW6432Node\Interface\{8E470FB5-6800-4FF6-8E0A-620F676C912E}"
call :DelKey "HKLM\SOFTWARE\Classes\WOW6432Node\TypeLib\{667D5A92-7C14-4687-B20E-A5CF06FEF1AF}"
call :DelKey "HKLM\SOFTWARE\Classes\WOW6432Node\TypeLib\{BED0DAEE-A8DC-40E6-AAD6-DCA5532B746C}"

:: ------------------------------------------------------
:: HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion
:: ------------------------------------------------------
call :DelKey "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Sentinel Agent"
call :DelKey "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelAgent.exe"
call :DelKey "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelCtl.exe"
call :DelKey "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelHelperService.exe"
call :DelKey "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelRemediation.exe"
call :DelKey "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelServiceHost.exe"
call :DelKey "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelStaticEngine.exe"
call :DelKey "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelStaticEngineScanner.exe"
call :DelKey "HKLM\SOFTWARE\SentinelOneLog"

:: WOW6432Node under HKLM\SOFTWARE
call :DelKey "HKLM\SOFTWARE\WOW6432Node\Classes\AppID\{1ECB7470-7BA4-4F64-A41D-BDF1B38DEED8}"
call :DelKey "HKLM\SOFTWARE\WOW6432Node\Classes\AppID\{4F58E51B-3F2B-4807-AB8C-2A7F143E9C3F}"
call :DelKey "HKLM\SOFTWARE\WOW6432Node\Classes\AppID\SentinelHelperService"
call :DelKey "HKLM\SOFTWARE\WOW6432Node\Classes\Interface\{0420773B-38C3-4300-AD2B-23652FEEE26C}"
call :DelKey "HKLM\SOFTWARE\WOW6432Node\Classes\Interface\{51821FE8-516B-4BE3-9578-31B2DFAD4042}"
call :DelKey "HKLM\SOFTWARE\WOW6432Node\Classes\Interface\{8E470FB5-6800-4FF6-8E0A-620F676C912E}"
call :DelKey "HKLM\SOFTWARE\WOW6432Node\Classes\TypeLib\{667D5A92-7C14-4687-B20E-A5CF06FEF1AF}"
call :DelKey "HKLM\SOFTWARE\WOW6432Node\Classes\TypeLib\{BED0DAEE-A8DC-40E6-AAD6-DCA5532B746C}"
call :DelKey "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelAgent.exe"
call :DelKey "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelCtl.exe"
call :DelKey "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelHelperService.exe"
call :DelKey "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelRemediation.exe"
call :DelKey "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelServiceHost.exe"
call :DelKey "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelStaticEngine.exe"
call :DelKey "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelStaticEngineScanner.exe"

:: ------------------------------------------------------
:: HKLM\SYSTEM
:: ------------------------------------------------------
call :DelKey "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\SentinelLogger"
call :DelKey "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\SentinelLogSession0"
call :DelKey "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\SentinelStatic"
call :DelKey "HKLM\SYSTEM\ControlSet001\Services\LogProcessorService"
call :DelKey "HKLM\SYSTEM\ControlSet001\Services\SentinelAgent"
call :DelKey "HKLM\SYSTEM\ControlSet001\Services\SentinelHelperService"
call :DelKey "HKLM\SYSTEM\ControlSet001\Services\SentinelMonitor"
call :DelKey "HKLM\SYSTEM\ControlSet001\Services\SentinelStaticEngine"
call :DelKey "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SentinelLogger"
call :DelKey "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SentinelLogSession0"
call :DelKey "HKLM\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SentinelStatic"
call :DelKey "HKLM\SYSTEM\CurrentControlSet\Services\LogProcessorService"
call :DelKey "HKLM\SYSTEM\CurrentControlSet\Services\SentinelAgent"
call :DelKey "HKLM\SYSTEM\CurrentControlSet\Services\SentinelHelperService"
call :DelKey "HKLM\SYSTEM\CurrentControlSet\Services\SentinelMonitor"
call :DelKey "HKLM\SYSTEM\CurrentControlSet\Services\SentinelStaticEngine"
call :DelKey "HKLM\SYSTEM\Setup\FirstBoot\Services\LogProcessorService"
call :DelKey "HKLM\SYSTEM\Setup\FirstBoot\Services\SentinelAgent"
call :DelKey "HKLM\SYSTEM\Setup\FirstBoot\Services\SentinelHelperService"
call :DelKey "HKLM\SYSTEM\Setup\FirstBoot\Services\SentinelMonitor"
call :DelKey "HKLM\SYSTEM\Setup\FirstBoot\Services\SentinelStaticEngine"

:: ------------------------------------------------------
:: Specific values
:: ------------------------------------------------------
call :DelVal "HKCU\Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" "SentinelOneLog_.binlog"
call :DelVal "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" "Sentinel Agent"
call :DelVal "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" "Sentinel Agent"

:: ------------------------------------------------------
:: Delete SentinelOne program directories
:: ------------------------------------------------------
echo [*] Deleting directories...
echo [*] Deleting directories... >> %LOGFILE%

rmdir /s /q "C:\ProgramData\Sentinel" && (
    echo [+] SUCCESS: C:\ProgramData\Sentinel >> %LOGFILE%
    echo [+] SUCCESS: C:\ProgramData\Sentinel
) || (
    echo [!] FAILED: C:\ProgramData\Sentinel >> %LOGFILE%
    echo [!] FAILED: C:\ProgramData\Sentinel
)

rmdir /s /q "C:\Program Files\SentinelOne" && (
    echo [+] SUCCESS: C:\Program Files\SentinelOne >> %LOGFILE%
    echo [+] SUCCESS: C:\Program Files\SentinelOne
) || (
    echo [!] FAILED: C:\Program Files\SentinelOne >> %LOGFILE%
    echo [!] FAILED: C:\Program Files\SentinelOne
)

:: Cleanup
del %temp%\reset_acl.txt >nul 2>&1

echo.
echo === SentinelOne removal complete. ===
echo See log file for details: %LOGFILE%
pause
exit /b
