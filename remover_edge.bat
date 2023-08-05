@echo off
title - https://github.com/OtaconEvil

REM Script para mejorar la privacidad y desinstalar Microsoft Edge Chromium

REM Comprobar si se tienen privilegios de administrador
fltmc >nul 2>&1 || (
    echo Privilegios de administrador requeridos.
    PowerShell Start -Verb RunAs "%0" 2>nul || (
        echo Haz clic derecho en el script y selecciona "Ejecutar como administrador".
        pause & exit 1
    )
    exit 0
)

REM Función para actualizar el registro con un valor DWORD en una ruta específica
:ActualizarRegistro
reg add "%~1" /v "%~2" /t REG_DWORD /d %~3 /f
goto :eof

REM ----------------------------------------------------------
REM -------------------Desactivar seguimiento------------------
REM ----------------------------------------------------------
echo --- Desactivar seguimiento
call :ActualizarRegistro "HKCU\Software\Policies\Microsoft\Windows\EdgeUI" "DisableMFUTracking" 1
call :ActualizarRegistro "HKCU\Software\Policies\Microsoft\MicrosoftEdge\Main" "PreventLiveTileDataCollection" 1
call :ActualizarRegistro "HKCU\Software\Policies\Microsoft\Windows\EdgeUI" "DisableRecentApps" 1
call :ActualizarRegistro "HKCU\Software\Policies\Microsoft\Windows\EdgeUI" "TurnOffBackstack" 1
goto :eof

REM ----------------------------------------------------------
REM --------Desactivar sugerencias de búsqueda en Edge--------
REM ----------------------------------------------------------
echo --- Desactivar sugerencias de búsqueda en Edge
call :ActualizarRegistro "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\SearchScopes" "ShowSearchSuggestionsGlobal" 0
goto :eof

REM Desactivar la recopilación de datos relacionados con el uso y los bloqueos de Edge
echo --- Desactivar la recopilación de datos relacionados con el uso y los bloqueos de Edge
call :ActualizarRegistro "HKLM\SOFTWARE\Policies\Microsoft\Edge" "MetricsReportingEnabled" 0
call :ActualizarRegistro "HKLM\SOFTWARE\Policies\Microsoft\Edge" "SendSiteInfoToImproveServices" 0
goto :eof

REM ----------------------------------------------------------
REM ------Desactivar instalación automática de Edge----------
REM ----------------------------------------------------------
echo --- Desactivar instalación automática de Edge
call :ActualizarRegistro "HKLM\SOFTWARE\Microsoft\EdgeUpdate" "DoNotUpdateToEdgeWithChromium" 1
goto :eof

REM Desactivar SmartScreen en Edge
echo --- Desactivar SmartScreen en Edge
call :ActualizarRegistro "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter" "EnabledV9" 0
call :ActualizarRegistro "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter" "PreventOverride" 0
call :ActualizarRegistro "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\PhishingFilter" "EnabledV9" 0
call :ActualizarRegistro "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\PhishingFilter" "PreventOverride" 0
goto :eof

REM ----------------------------------------------------------
REM ----------------------Desinstalar Edge---------------------
REM ----------------------------------------------------------
echo --- Desinstalar Edge (chromium-based)
PowerShell -ExecutionPolicy Unrestricted -Command "$installer = (Get-ChildItem '^"%ProgramFiles%*\Microsoft\Edge\Application\*\Installer\setup.exe'^'); if (!$installer) { Write-Host 'No se pudo encontrar el instalador'; } else { & $installer.FullName -Uninstall -System-Level -Verbose-Logging -Force-Uninstall; }"
goto :eof

pause

