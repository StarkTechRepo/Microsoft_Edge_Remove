@echo off
color 30
title - https://github.com/OtaconEvil

:: Script para mejorar la privacidad y desinstalar Microsoft Edge Chromium

:: Comprobar si se tienen privilegios de administrador
fltmc >nul 2>&1 || (
    echo Privilegios de administrador requeridos.
    PowerShell Start -Verb RunAs "%0" 2>nul || (
        echo Haz clic derecho en el script y selecciona "Ejecutar como administrador".
        pause & exit 1
    )
    exit 0
)

:: Función para actualizar el registro con un valor DWORD en una ruta específica
:ActualizarRegistro
reg add "%~1" /v "%~2" /t REG_DWORD /d %~3 /f
goto :eof

:: --------------------------------------------------------
:: ------------------- Mejorar la Privacidad ----------------
:: --------------------------------------------------------
echo.
echo ██████████████████ MEJORAR LA PRIVACIDAD ██████████████████
:: Desactivar seguimiento
call :ActualizarRegistro "HKCU\Software\Policies\Microsoft\Windows\EdgeUI" "DisableMFUTracking" 1
call :ActualizarRegistro "HKCU\Software\Policies\Microsoft\MicrosoftEdge\Main" "PreventLiveTileDataCollection" 1
call :ActualizarRegistro "HKCU\Software\Policies\Microsoft\Windows\EdgeUI" "DisableRecentApps" 1
call :ActualizarRegistro "HKCU\Software\Policies\Microsoft\Windows\EdgeUI" "TurnOffBackstack" 1

:: Desactivar sugerencias de búsqueda en Edge
call :ActualizarRegistro "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\SearchScopes" "ShowSearchSuggestionsGlobal" 0

:: Desactivar la recopilación de datos de Edge
call :ActualizarRegistro "HKLM\SOFTWARE\Policies\Microsoft\Edge" "MetricsReportingEnabled" 0
call :ActualizarRegistro "HKLM\SOFTWARE\Policies\Microsoft\Edge" "SendSiteInfoToImproveServices" 0

:: Desactivar SmartScreen en Edge
call :ActualizarRegistro "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter" "EnabledV9" 0
call :ActualizarRegistro "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter" "PreventOverride" 0
call :ActualizarRegistro "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\PhishingFilter" "EnabledV9" 0
call :ActualizarRegistro "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\PhishingFilter" "PreventOverride" 0

:: ----------------------------------------------------------
:: ------------------ Desinstalar Microsoft Edge --------------
:: ----------------------------------------------------------
echo.
echo ███████████████ DESINSTALAR MICROSOFT EDGE ███████████████
PowerShell -ExecutionPolicy Unrestricted -Command "$installer = (Get-ChildItem '^"%ProgramFiles%*\Microsoft\Edge\Application\*\Installer\setup.exe'^'); if (!$installer) { Write-Host 'No se pudo encontrar el instalador'; } else { & $installer.FullName -Uninstall -System-Level -Verbose-Logging -Force-Uninstall; }"

pause
exit /b 0

