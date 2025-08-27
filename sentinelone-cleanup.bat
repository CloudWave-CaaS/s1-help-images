@echo off
:: ===================================================================
:: SentinelOne Full Removal Script
:: ===================================================================
:: Run as Administrator
:: ===================================================================

echo.
echo === SentinelOne Removal Script ===
echo You must run this as Administrator!
pause

:: ----------------------
:: Delete Registry Keys
:: ----------------------
echo Deleting registry keys...

:: HKCR (HKEY_CLASSES_ROOT)
reg delete "HKCR\AppID\{1ECB7470-7BA4-4F64-A41D-BDF1B38DEED8}" /f
reg delete "HKCR\AppID\{4F58E51B-3F2B-4807-AB8C-2A7F143E9C3F}" /f
reg delete "HKCR\AppID\SentinelHelperService" /f

reg delete "HKCR\CLSID\{28B58EFD-EED3-49D0-9AC3-A7A9E39A6303}" /f
reg delete "HKCR\CLSID\{DFE127B0-F72C-40FB-BEF8-9F29CB996B9C}" /f

reg delete "HKCR\Interface\{0420773B-38C3-4300-AD2B-23652FEEE26C}" /f
reg delete "HKCR\Interface\{51821FE8-516B-4BE3-9578-31B2DFAD4042}" /f
reg delete "HKCR\Interface\{8E470FB5-6800-4FF6-8E0A-620F676C912E}" /f

reg delete "HKCR\SentinelAgent" /f
reg delete "HKCR\SentinelHelper" /f
reg delete "HKCR\SentinelOneLog" /f

reg delete "HKCR\TypeLib\{667D5A92-7C14-4687-B20E-A5CF06FEF1AF}" /f
reg delete "HKCR\TypeLib\{BED0DAEE-A8DC-40E6-AAD6-DCA5532B746C}" /f

:: WOW6432Node under HKCR
reg delete "HKCR\WOW6432Node\AppID\{1ECB7470-7BA4-4F64-A41D-BDF1B38DEED8}" /f
reg delete "HKCR\WOW6432Node\AppID\{4F58E51B-3F2B-4807-AB8C-2A7F143E9C3F}" /f
reg delete "HKCR\WOW6432Node\AppID\SentinelHelperService" /f
reg delete "HKCR\WOW6432Node\Interface\{0420773B-38C3-4300-AD2B-23652FEEE26C}" /f
reg delete "HKCR\WOW6432Node\Interface\{51821FE8-516B-4BE3-9578-31B2DFAD4042}" /f
reg delete "HKCR\WOW6432Node\Interface\{8E470FB5-6800-4FF6-8E0A-620F676C912E}" /f
reg delete "HKCR\WOW6432Node\TypeLib\{667D5A92-7C14-4687-B20E-A5CF06FEF1AF}" /f
reg delete "HKCR\WOW6432Node\TypeLib\{BED0DAEE-A8DC-40E6-AAD6-DCA5532B746C}" /f

:: HKLM SOFTWARE\Classes
reg delete "HKLM\SOFTWARE\Classes\AppID\{1ECB7470-7BA4-4F64-A41D-BDF1B38DEED8}" /f
reg delete "HKLM\SOFTWARE\Classes\AppID\{4F58E51B-3F2B-4807-AB8C-2A7F143E9C3F}" /f
reg delete "HKLM\SOFTWARE\Classes\AppID\SentinelHelperService" /f

reg delete "HKLM\SOFTWARE\Classes\CLSID\{28B58EFD-EED3-49D0-9AC3-A7A9E39A6303}" /f
reg delete "HKLM\SOFTWARE\Classes\CLSID\{DFE127B0-F72C-40FB-BEF8-9F29CB996B9C}" /f
reg delete "HKLM\SOFTWARE\Classes\Interface\{0420773B-38C3-4300-AD2B-23652FEEE26C}" /f
reg delete "HKLM\SOFTWARE\Classes\Interface\{51821FE8-516B-4BE3-9578-31B2DFAD4042}" /f
reg delete "HKLM\SOFTWARE\Classes\Interface\{8E470FB5-6800-4FF6-8E0A-620F676C912E}" /f

reg delete "HKLM\SOFTWARE\Classes\SentinelAgent" /f
reg delete "HKLM\SOFTWARE\Classes\SentinelHelper" /f
reg delete "HKLM\SOFTWARE\Classes\SentinelOneLog" /f

reg delete "HKLM\SOFTWARE\Classes\TypeLib\{667D5A92-7C14-4687-B20E-A5CF06FEF1AF}" /f
reg delete "HKLM\SOFTWARE\Classes\TypeLib\{BED0DAEE-A8DC-40E6-AAD6-DCA5532B746C}" /f

:: (Add all other HKLM\SOFTWARE\WOW6432Node\Classes entries here as listed...)

:: ----------------------
:: Delete Registry Values Only
:: ----------------------
echo Deleting specific values...

:: Delete DWORD SentinelOneLog_.binlog
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" /v "SentinelOneLog_.binlog" /f

:: Delete Binary "Sentinel Agent"
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run" /v "Sentinel Agent" /f

:: Delete REG_SZ "Sentinel Agent"
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Sentinel Agent" /f

:: ----------------------
:: Delete Program Files
:: ----------------------
echo Deleting Sentinel directories...

rmdir /s /q "C:\ProgramData\Sentinel"
rmdir /s /q "C:\Program Files\SentinelOne"

echo.
echo === SentinelOne removal complete. ===
pause
exit
