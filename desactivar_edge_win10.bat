@echo off
title - https://github.com/OtaconEvil

REM -- Desactivar Microsoft Edge en Windows 10 --
cd C:\Windows\SystemApps
takeown /f Microsoft.MicrosoftEdge_8wekyb3d8bbwe
icacls Microsoft.MicrosoftEdge_8wekyb3d8bbwe /grant administrators:F
ren Microsoft.MicrosoftEdge_8wekyb3d8bbwe Microsoft.MicrosoftEdge_8wekyb3d8bbwe.old
