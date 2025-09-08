# Requires Administrator privileges to run.
function Test-RegistryKeyExists {
    param (
        [string]$Path
    )
    try {
        # Split the path into root and subkey
        $rootKey = $Path.Split('\')[0]
        $subKey = $Path.Substring($Path.IndexOf('\') + 1)
        # Map common root key names to their full names
        switch ($rootKey) {
            "HKEY_CLASSES_ROOT" { $root = [Microsoft.Win32.Registry]::ClassesRoot }
            "HKEY_CURRENT_USER" { $root = [Microsoft.Win32.Registry]::CurrentUser }
            "HKEY_LOCAL_MACHINE" { $root = [Microsoft.Win32.Registry]::LocalMachine }
            "HKEY_USERS" { $root = [Microsoft.Win32.Registry]::Users }
            "HKEY_CURRENT_CONFIG" { $root = [Microsoft.Win32.Registry]::CurrentConfig }
            default { Write-Error "Invalid registry root key specified: $rootKey"; return $false }
        }
        # Check if the subkey exists
        $regKey = $root.OpenSubKey($subKey)
        if ($regKey) {
            $regKey.Close()
            return $true
        } else {
            return $false
        }
    } catch {
        Write-Warning "Error checking registry key '$Path': $($_.Exception.Message)"
        return $false
    }
}
function Remove-RegistryKey {
    param (
        [string]$Path
    )
    try {
        # Split the path into root and subkey
        $rootKey = $Path.Split('\')[0]
        $subKey = $Path.Substring($Path.IndexOf('\') + 1)
        # Map common root key names to their full names
        switch ($rootKey) {
            "HKEY_CLASSES_ROOT" { $root = [Microsoft.Win32.Registry]::ClassesRoot }
            "HKEY_CURRENT_USER" { $root = [Microsoft.Win32.Registry]::CurrentUser }
            "HKEY_LOCAL_MACHINE" { $root = [Microsoft.Win32.Registry]::LocalMachine }
            "HKEY_USERS" { $root = [Microsoft.Win32.Registry]::Users }
            "HKEY_CURRENT_CONFIG" { $root = [Microsoft.Win32.Registry]::CurrentConfig }
            default { Write-Error "Invalid registry root key specified for deletion: $rootKey"; return $false }
        }
        # Delete the subkey
        $root.DeleteSubKeyTree($subKey, $false) # $false to not throw an exception if the subkey doesn't exist
        Write-Host "Successfully deleted registry key: $Path" -ForegroundColor Green
        return $true
    } catch {
        Write-Error "Error deleting registry key '$Path': $($_.Exception.Message)"
        return $false
    }
}
# List of registry paths to check and potentially delete
$registryPaths = @(
    "HKEY_CLASSES_ROOT\AppID\SentinelHelperService",
    "HKEY_CLASSES_ROOT\SentinelAgent",
    "HKEY_CLASSES_ROOT\SentinelHelper",
    "HKEY_CLASSES_ROOT\SentinelOneLog",
    "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\AppID\SentinelHelperService",
    "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\SentinelAgent",
    "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\SentinelHelper",
    "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\SentinelOneLog",
    "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\WOW6432Node\AppID\SentinelHelperService",
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Sentinel Agent",
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelAgent.exe",
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelCtl.exe",
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelHelperService.exe",
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelRemediation.exe",
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelServiceHost.exe",
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelStaticEngine.exe",
    "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelStaticEngineScanner.exe",
    "HKEY_LOCAL_MACHINE\SOFTWARE\SentinelOneLog",
    "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelAgent.exe",
    "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelCtl.exe",
    "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelHelperService.exe",
    "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelRemediation.exe",
    "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelServiceHost.exe",
    "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelStaticEngine.exe",
    "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SentinelStaticEngineScanner.exe",
    "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\WMI\Autologger\SentinelLogger",
    "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\WMI\Autologger\SentinelLogSession0",
    "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\WMI\Autologger\SentinelStatic",
    "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\LogProcessorService",
    "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SentinelAgent",
    "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SentinelHelperService",
    "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SentinelMonitor",
    "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SentinelStaticEngine",
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SentinelLogger",
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SentinelLogSession0",
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\SentinelStatic",
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LogProcessorService",
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SentinelAgent",
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SentinelHelperService",
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SentinelMonitor",
    "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SentinelStaticEngine",
    "HKEY_LOCAL_MACHINE\SYSTEM\Setup\FirstBoot\Services\LogProcessorService",
    "HKEY_LOCAL_MACHINE\SYSTEM\Setup\FirstBoot\Services\SentinelAgent",
    "HKEY_LOCAL_MACHINE\SYSTEM\Setup\FirstBoot\Services\SentinelHelperService",
    "HKEY_LOCAL_MACHINE\SYSTEM\Setup\FirstBoot\Services\SentinelMonitor",
    "HKEY_LOCAL_MACHINE\SYSTEM\Setup\FirstBoot\Services\SentinelStaticEngine"
)
$foundKeys = @()
Write-Host "Checking for SentinelOne related registry keys..."
foreach ($path in $registryPaths) {
    # Remove "Computer\" prefix if present for consistent processing
    $cleanPath = $path.Replace("Computer\", "")
    if (Test-RegistryKeyExists -Path $cleanPath) {
        $foundKeys += $cleanPath
    }
}
if ($foundKeys.Count -gt 0) {
    Write-Host "`nThe following SentinelOne related registry keys were found:`n" -ForegroundColor Yellow
    $foundKeys | ForEach-Object { Write-Host "  $_" }
    $confirmDelete = Read-Host "`nDo you want to delete these registry keys? (Yes/No)"
    if ($confirmDelete -eq "Yes") {
        Write-Host "`nDeleting registry keys..."
        $deletedAny = $false
        foreach ($path in $foundKeys) {
            if (Remove-RegistryKey -Path $path) {
                $deletedAny = $true
            }
        }
        if ($deletedAny) {
            $confirmReboot = Read-Host "`nRegistry keys deleted. A reboot is highly recommended for changes to take full effect. Do you want to reboot now? (Yes/No)"
            if ($confirmReboot -eq "Yes") {
                Write-Host "Initiating reboot..."
                Restart-Computer -Force
            } else {
                Write-Host "Reboot declined. Please remember to reboot your system manually at your earliest convenience." -ForegroundColor Cyan
            }
        } else {
            Write-Host "No registry keys were deleted." -ForegroundColor Yellow
        }
    } else {
        Write-Host "Registry key deletion cancelled by user." -ForegroundColor Cyan
    }
} else {
    Write-Host "`nNo SentinelOne related registry keys were found." -ForegroundColor Green
}



# Remove DWORD value from HKCU
$regPath1 = "HKCU:\Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts"
if (Test-Path $regPath1) {
    if (Get-ItemProperty -Path $regPath1 -Name "SentinelOneLog_.binlog" -ErrorAction SilentlyContinue) {
        Remove-ItemProperty -Path $regPath1 -Name "SentinelOneLog_.binlog" -ErrorAction SilentlyContinue
        Write-Output "Removed DWORD SentinelOneLog_.binlog from HKCU"
    }
}
# Remove Binary value from HKLM (StartupApproved)
$regPath2 = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run"
if (Test-Path $regPath2) {
    if (Get-ItemProperty -Path $regPath2 -Name "Sentinel Agent" -ErrorAction SilentlyContinue) {
        Remove-ItemProperty -Path $regPath2 -Name "Sentinel Agent" -ErrorAction SilentlyContinue
        Write-Output "Removed Binary Sentinel Agent from StartupApproved"
    }
}
# Remove REG_SZ value from HKLM (Run)
$regPath3 = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
if (Test-Path $regPath3) {
    if (Get-ItemProperty -Path $regPath3 -Name "Sentinel Agent" -ErrorAction SilentlyContinue) {
        Remove-ItemProperty -Path $regPath3 -Name "Sentinel Agent" -ErrorAction SilentlyContinue
        Write-Output "Removed REG_SZ Sentinel Agent from Run"
    }
}
# Remove remaining installation folders
$folders = @(
    "C:\Windows\System32\drivers\SentinelOne\",
    "C:\ProgramData\Sentinel\",
    "C:\Program Files\SentinelOne\"
)
foreach ($folder in $folders) {
    if (Test-Path $folder) {
        Remove-Item -Path $folder -Recurse -Force -ErrorAction SilentlyContinue
        Write-Output "Deleted folder: $folder"
    }
}