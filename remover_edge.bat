@echo off
title - https://github.com/OtaconEvil

:: Comprobar si se está ejecutando con permisos de administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Este script requiere permisos de administrador para funcionar correctamente.
    echo Por favor, ejecuta el script como administrador.
    pause
    exit /b 1
)

:: Función para desinstalar Microsoft Edge
:desinstalar_edge
echo Desinstalando Microsoft Edge...
start /wait "" cmd /c "C:\Windows\System32\cmd.exe" /c "C:\Program Files (x86)\Microsoft\Edge\Application\setup.exe" --uninstall --system-level --force-uninstall
timeout 2 >nul
exit /b

:: Función para desinstalar WebView de Edge
:desinstalar_webview
echo Desinstalando WebView de Edge...
start /wait "" cmd /c "C:\Windows\System32\cmd.exe" /c "C:\Program Files (x86)\Microsoft\EdgeWebView\Application\setup.exe" --uninstall --msedgewebview --system-level --force-uninstall
timeout 2 >nul
exit /b

:: Desinstalar Microsoft Edge y WebView
if exist "C:\Program Files (x86)\Microsoft\Edge\Application" (
    call :desinstalar_edge
) else (
    echo Microsoft Edge no encontrado.
)

if exist "C:\Program Files (x86)\Microsoft\EdgeWebView\Application" (
    call :desinstalar_webview
) else (
    echo WebView de Edge no encontrado.
)

pause
