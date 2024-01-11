@echo off
color b
chcp 65001
set "interfgraf= echo. && echo                        ██╗  ██████╗    ██╗   ██╗   ███████╗ ████████╗ && echo                        ██║ ██╔════╝    ██║   ██║   ██╔════╝ ╚══██╔══╝ && echo                        ██║ ██║  ███╗   ██║   ██║   ███████╗    ██║ && echo                        ██║ ██║   ██║   ██║   ██║   ╚════██║    ██║ && echo                        ██║ ╚██████╔╝   ██████╔╝    ███████║    ██║ && echo.                      [Info] Made by worbadillitics for iGust comunnity"
mode con: cols=100 lines=30
cls
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
cls
echo Rodando em : %0
echo Aguarde até o programa executar...
timeout -t 2 /nobreak >nul
set "t=iGust Optimizer"
set "v=10/01/2024"
set "rstatus=Nao encontrada!"
title %t% %v%
cls
%interfgraf%
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Bem-vindo ao iGust Optimizer e resaltamos que ele foi feito por worbadillitics e teve partes do código retirado do Microsoft Learn! Desfrute de uma melhor performance para o seu computador, aplicativos e menos inputlag em seus jogos favoritos.', 'iGust Optimizer - Made by worb', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
goto :TEMP
:TEMP
taskkill /f /im explorer.exe
takeown /f %temp% /r /d y
cleanmgr /sagerun:1
goto :GAMEMODE
:GAMEMODE
echo.
echo                                     [+] Ativando o Game Mode
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f
echo.
echo                         [+] Adicionando o plano de energia de alto desempenho
echo.
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
powercfg /setactive e9a42b02-d5df-448d-aa00-03f14749eb61
powercfg /setactive 2861d4d1-0f62-4f9a-9192-563292322246
powercfg /hibernate off
goto :updates
:updates
cls
%interfgraf%
echo.
echo.
echo                                 [+] Desativando o Windows Update
echo                             Para reativar, veja um video no youtube!
echo.
echo                    Se voce utilizar a Microsoft Store, ative os updates novamente.
echo.
taskkill -F -FI "IMAGENAME eq SystemSettings.exe"
net stop wuauserv
net stop UsoSvc
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DoNotConnectToWindowsUpdateInternetLocations" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "SetDisableUXWUAccess" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "1" /f
gpupdate /force
rd s q "C:\Windows\SoftwareDistribution"
md "C:\Windows\SoftwareDistribution"
net start wuauserv
goto :GPU
:GPU
cls
%interfgraf%
echo.
echo.
echo                                       [+] Otimizando a GPU
echo.
powershell -command "reg query 'HKLM\System\CurrentControlSet\Control\GraphicsDrivers' /v 'HwSchMode'; reg add 'HKLM\System\CurrentControlSet\Control\GraphicsDrivers' /v 'HwSchMode' /t Reg_DWORD /d '2' /f"
for /f %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class" /v "VgaCompatible" /s ^| findstr "HKEY"') do powershell -command "reg add '%%a' /v 'KMD_EnableGDIAcceleration' /t Reg_DWORD /d '1' /f"
powershell -command "reg add 'HKCU\Software\Microsoft\GameBar' /v 'AllowAutoGameMode' /t Reg_DWORD /d '1' /f"
powershell -command "reg add 'HKCU\Software\Microsoft\GameBar' /v 'AutoGameModeEnabled' /t Reg_DWORD /d '1' /f"
powershell -command "reg add 'HKCU\System\GameConfigStore' /v 'GameDVR_Enabled' /t REG_DWORD /d '0' /f"
powershell -command "reg add 'HKCU\System\GameConfigStore' /v 'GameDVR_FSEBehaviorMode' /t REG_DWORD /d '2' /f"
powershell -command "reg add 'HKCU\System\GameConfigStore' /v 'GameDVR_FSEBehavior' /t REG_DWORD /d '2' /f"
powershell -command "reg add 'HKCU\System\GameConfigStore' /v 'GameDVR_HonorUserFSEBehaviorMode' /t REG_DWORD /d '1' /f"
powershell -command "reg add 'HKCU\System\GameConfigStore' /v 'GameDVR_DXGIHonorFSEWindowsCompatible' /t REG_DWORD /d '1' /f"
powershell -command "reg add 'HKCU\System\GameConfigStore' /v 'GameDVR_EFSEFeatureFlags' /t REG_DWORD /d '0' /f"
powershell -command "reg add 'HKCU\System\GameConfigStore' /v 'GameDVR_DSEBehavior' /t REG_DWORD /d '2' /f"
powershell -command "reg add 'HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDrv' /v 'Start' /t Reg_DWORD /d '4' /f"
powershell -command "reg add 'HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDr' /v 'Start' /t Reg_DWORD /d '4' /f"
powershell -command "reg add 'HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler' /v 'EnablePreemption' /t Reg_DWORD /d '0' /f"
goto :REG
:REG
cls
%interfgraf%
echo.
echo.
echo                                  [+] Ativando o modo de Low Ram!
echo.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "68764420" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingCombining" /t REG_DWORD /d "1" /f
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f
echo                                    [+] Otimizando o registro
echo               [Dica] Se acontecer qualquer problema com teu pc, restaure o registro
echo                           [-] O nome da ferramenta se chama (RefreshPc)
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync" /v "SyncPolicy" /t REG_DWORD /d 00000005 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization" /v "Enabled" /t REG_DWORD /d 00000000 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\BrowserSettings" /v "Enabled" /t REG_DWORD /d 00000000 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials" /v "Enabled" /t REG_DWORD /d 00000000 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Accessibility" /v "Enabled" /t REG_DWORD /d 00000000 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Windows" /v "Enabled" /t REG_DWORD /d 00000000 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 00000000 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_DWORD /d 00000000 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d 00000000 /f
reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 00000000 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 00000000 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d 00000001 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d 00000001 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d 00000002 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "VRROptimizeEnable=0;" /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\MouseKeys" /v "Flags" /t REG_SZ /d "0" /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "0" /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_SZ /d "0" /f
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\ToggleKeys" /v "Flags" /t REG_SZ /d "0" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 00000000 /f
reg add "HKEY_CURRENT_USER\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d 00000001 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d 00000000 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d 00000000 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d 00000000 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t REG_DWORD /d 00000000 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t REG_DWORD /d 00000000 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d 00000000 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d 00000001 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d 00000001 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d 00000000 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "ShowedToastAtLevel" /t REG_DWORD /d 00000001 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 00000000 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d 00000000 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\EventTranscriptKey" /v "EnableEventTranscript" /t REG_DWORD /d 00000000 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d 00000000 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Siuf\Rules" /v "PeriodInNanoSeconds" /t REG_BINARY /d "-" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d 00000000 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d 00000000 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d 00000001 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t REG_DWORD /d 00000000 /f
goto :PREFERENCIAS
:PREFERENCIAS
cls
%interfgraf%
echo.
echo.
echo                              [+] Removendo Aplicativos Pre-Instalados
echo                          Esta etapa demora mais que as outras, entao espere!
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "AltTabSettings" /t REG_DWORD /d 1 /f
echo.
powershell -Command "Get-AppxPackage -Name Microsoft.PPIProjection | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.BingNews | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.GetHelp | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.Getstarted | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.Messaging | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.Microsoft3DViewer | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.MicrosoftOfficeHub | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.MicrosoftSolitaireCollection | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.NetworkSpeedTest | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.News | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.Office.Lens | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.Office.OneNote | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.Office.Sway | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.OneConnect | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.People | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.Print3D | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.RemoteDesktop | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.SkypeApp | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.Office.Todo.List | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.Whiteboard | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.WindowsAlarms | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name microsoft.windowscommunicationsapps | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.WindowsFeedbackHub | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.WindowsMaps | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.WindowsSoundRecorder | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.Xbox.TCUI | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.XboxApp | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.XboxGameOverlay | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.XboxGamingOverlay | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.XboxIdentityProvider | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.XboxSpeechToTextOverlay | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.ZuneMusic | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.ZuneVideo | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name EclipseManager | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name ActiproSoftwareLLC | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name AdobeSystemsIncorporated.AdobePhotoshopExpress | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Duolingo-LearnLanguagesforFree | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name PandoraMediaInc | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name CandyCrush | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name BubbleWitch3Saga | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Wunderlist | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Flipboard | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Twitter | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Facebook | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Spotify | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Minecraft | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Royal Revolt | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Sway | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Dolby | Remove-AppxPackage"
powershell -Command "Get-AppxPackage -Name Microsoft.YourPhone | Remove-AppxPackage"
goto :Services
:Services
cls
%interfgraf%
echo.
echo.
echo                                 [+] Desativando Servicos Inuteis
echo.
echo                             [Obs] Essa parte modifica seu registro!
echo.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\TapiSrv" /v "Start" /t REG_DWORD /d "3" /f 
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\FontCache3.0.0.0" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WpcMonSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SEMgrSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\PNRPsvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\LanmanWorkstation" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WEPHOSTSVC" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\p2psvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\p2pimsvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\PhoneSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\wuauserv" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Wecsvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SensorDataService" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SensrSvc" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\perceptionsimulation" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\StiSvc" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\OneSyncSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ConsentUxUserSvc" /v Start /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DevicePickerUserSvc" /v Start /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UnistoreSvc" /v Start /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DevicesFlowUserSvc" /v Start /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WMPNetworkSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\icssvc" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\DusmSvc" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\MapsBroker" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\edgeupdate" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SensorService" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\shpamsvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\svsvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SysMain" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\MSiSCSI" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Netlogon" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\CscService" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\ssh-agent" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\AppReadiness" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\tzautoupdate" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\NfsClnt" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\wisvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\defragsvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\TapiSrv" /v "Start" /t REG_DWORD /d "3" /f 
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\FontCache3.0.0.0" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WpcMonSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SEMgrSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\PNRPsvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\LanmanWorkstation" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WEPHOSTSVC" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\p2psvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\p2pimsvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\PhoneSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\wuauserv" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Wecsvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SensorDataService" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SensrSvc" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\perceptionsimulation" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\StiSvc" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\OneSyncSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ConsentUxUserSvc" /v Start /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DevicePickerUserSvc" /v Start /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UnistoreSvc" /v Start /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DevicesFlowUserSvc" /v Start /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WMPNetworkSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\autotimesvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CaptureService" /v Start /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MessagingService" /v Start /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CDPUserSvc" /v Start /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PimIndexMaintenanceSvc" /v Start /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BcastDVRUserService" /v Start /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UserDataSvc" /v Start /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DeviceAssociationBrokerSvc" /v Start /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\cbdhsvc" /v Start /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\edgeupdatem" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\MicrosoftEdgeElevationService" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\ALG" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\QWAVE" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\IpxlatCfgSvc" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\icssvc" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\DusmSvc" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\MapsBroker" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\edgeupdate" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SensorService" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\shpamsvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\svsvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SysMain" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\MSiSCSI" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Netlogon" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\CscService" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\ssh-agent" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\AppReadiness" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\tzautoupdate" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\NfsClnt" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\wisvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\defragsvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SharedRealitySvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\RetailDemo" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\lltdsvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\TrkWks" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\CryptSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d 1 /f 
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d 0 /f 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /v "DoSvc" /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d 1 /f
reg add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocationScripting" /t REG_DWORD /d 1 /f 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableSensors" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableWindowsLocationProvider" /t REG_DWORD /d 1 /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lfsvc" /v "Start" /t REG_DWORD /d 4 /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" /v "Status" /t REG_DWORD /d 0 /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Permissions\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "SensorPermissionState" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "SensorPermissionState" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\DiagTrack" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\diagsvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\DPS" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WdiServiceHost" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\WdiSystemHost" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 00000000 /f
reg add "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 00000000 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\dmwappushsvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\diagnosticshub.standardcollector.service" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\TroubleshootingSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\DsSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\dmwappushservice" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d 1 /f 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f 
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient" /v "CorporateSQMURL" /t REG_SZ /d "0.0.0.0" /f 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableSoftLanding" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Assistance\Client\1.0" /v "NoActiveHelp" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\ControlSet001\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\FileHistory" /v "Disabled" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d 0 /f 
reg add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "PeriodInNanoSeconds" /t REG_DWORD /d 0 /f 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Assistance\Client\1.0" /v "NoExplicitFeedback" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\MediaPlayer\Preferences" /v "UsageTracking" /t REG_DWORD /d 0 /f 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "NoUseStoreOpenWith" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\FrameServer" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FontCache" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\InstallService" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\OSRSS" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\sedsvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SENS" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TabletInputService" /v "Start" /t REG_DWORD /d "3" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Themes" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\EpicOnlineServices" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\GoogleChromeElevationService" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\gupdate" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Origin Client Service" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Origin Web Helper Service" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\gupdatem" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Steam Client Service" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v DontOfferThroughWUAU /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\dmwappushservice" /v "Start" /t REG_DWORD /d "00000004" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\diagsvc" /v "Start" /t REG_DWORD /d "00000004" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DPS" /v "Start" /t REG_DWORD /d "00000004" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\diagnosticshub.standardcollector.service" /v "Start" /t REG_DWORD /d "00000004" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdiServiceHost" /v "Start" /t REG_DWORD /d "00000004" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WdiSystemHost" /v "Start" /t REG_DWORD /d "00000004" /f
echo.
echo                                        [+] Alterando BCEDIT
bcdedit /set disabledynamictick yes
bcdedit /deletevalue useplatformclock
bcdedit /set useplatformtick yes
goto :periferi
:Periferi
cls
%interfgraf%
echo.
echo                                    [+] Otimizando Mouse e Teclado
echo.
powershell -command "Reg.exe add 'HKU\.DEFAULT\Control Panel\Desktop' /v 'ForegroundLockTimeout' /t REG_DWORD /d '0' /f"
powershell -command "Reg.exe add 'HKU\.DEFAULT\Control Panel\Desktop' /v 'MenuShowDelay' /t REG_SZ /d '0' /f"
powershell -command "Reg.exe add 'HKU\.DEFAULT\Control Panel\Desktop' /v 'MouseWheelRouting' /t REG_DWORD /d '0' /f"
powershell -command "Reg.exe add 'HKU\.DEFAULT\Control Panel\Mouse' /v 'Beep' /t REG_SZ /d 'No' /f"
powershell -command "Reg.exe add 'HKU\.DEFAULT\Control Panel\Mouse' /v 'ExtendedSounds' /t REG_SZ /d 'No' /f"
powershell -command "Reg.exe add 'HKU\.DEFAULT\Control Panel\Sound' /v 'Beep' /t REG_SZ /d 'no' /f"
powershell -command "Reg.exe add 'HKU\.DEFAULT\Control Panel\Sound' /v 'ExtendedSounds' /t REG_SZ /d 'no' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Mouse' /v 'ActiveWindowTracking' /t REG_DWORD /d '0' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Mouse' /v 'Beep' /t REG_SZ /d 'No' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Mouse' /v 'DoubleClickHeight' /t REG_SZ /d '4' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Mouse' /v 'DoubleClickSpeed' /t REG_SZ /d '500' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Mouse' /v 'DoubleClickWidth' /t REG_SZ /d '4' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Mouse' /v 'ExtendedSounds' /t REG_SZ /d 'No' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Mouse' /v 'MouseHoverHeight' /t REG_SZ /d '4' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Mouse' /v 'MouseHoverWidth' /t REG_SZ /d '4' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Mouse' /v 'MouseSensitivity' /t REG_SZ /d '10' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Mouse' /v 'MouseSpeed' /t REG_SZ /d '0' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Mouse' /v 'MouseThreshold1' /t REG_SZ /d '0' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Mouse' /v 'MouseThreshold2' /t REG_SZ /d '0' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Mouse' /v 'MouseTrails' /t REG_SZ /d '0' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Mouse' /v 'SmoothMouseXCurve' /t REG_BINARY /d '0000000000000000c0cc0c0000000000809919000000000040662600000000000033330000000000' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Mouse' /v 'SmoothMouseYCurve' /t REG_BINARY /d '0000000000000000000038000000000000007000000000000000a800000000000000e00000000000' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Mouse' /v 'SnapToDefaultButton' /t REG_SZ /d '0' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Mouse' /v 'SwapMouseButtons' /t REG_SZ /d '0' /f"
powershell -command "Reg.exe add 'HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed' /v 'CursorSensitivity' /t REG_DWORD /d '10000' /f"
powershell -command "Reg.exe add 'HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed' /v 'CursorUpdateInterval' /t REG_DWORD /d '1' /f"
powershell -command "Reg.exe add 'HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorSpeed' /v 'IRRemoteNavigationDelta' /t REG_DWORD /d '1' /f"
powershell -command "Reg.exe add 'HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism' /v 'AttractionRectInsetInDIPS' /t REG_DWORD /d '5' /f"
powershell -command "Reg.exe add 'HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism' /v 'DistanceThresholdInDIPS' /t REG_DWORD /d '40' /f"
powershell -command "Reg.exe add 'HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism' /v 'MagnetismDelayInMilliseconds' /t REG_DWORD /d '50' /f"
powershell -command "Reg.exe add 'HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism' /v 'MagnetismUpdateIntervalInMilliseconds' /t REG_DWORD /d '16' /f"
powershell -command "Reg.exe add 'HKLM\SOFTWARE\Microsoft\Input\Settings\ControllerProcessor\CursorMagnetism' /v 'VelocityInDIPSPerSecond' /t REG_DWORD /d '360' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Mouse' /v 'MouseHoverTime' /t REG_SZ /d '8' /f"
powershell -command "Reg.exe add 'HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters' /v 'ThreadPriority' /t REG_DWORD /d '31' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Accessibility\MouseKeys' /v 'Flags' /t REG_SZ /d '0' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Accessibility\StickyKeys' /v 'Flags' /t REG_SZ /d '0' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Accessibility\Keyboard Response' /v 'Flags' /t REG_SZ /d '0' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Accessibility\ToggleKeys' /v 'Flags' /t REG_SZ /d '0' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Accessibility\Keyboard Response' /v 'Flags' /t REG_DWORD /d '0' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Keyboard' /v 'KeyboardDelay' /t REG_SZ /d '0' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Keyboard' /v 'InitialKeyboardIndicators' /t REG_SZ /d '0' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Keyboard' /v 'KeyboardSpeed' /t REG_SZ /d '31' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Accessibility\Keyboard Response' /v 'DelayBeforeAcceptance' /t REG_SZ /d '0' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Accessibility\Keyboard Response' /v 'Last BounceKey Setting' /t REG_DWORD /d '0' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Accessibility\Keyboard Response' /v 'Last Valid Delay' /t REG_DWORD /d '0' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Accessibility\Keyboard Response' /v 'Last Valid Repeat' /t REG_DWORD /d '0' /f"
powershell -command "Reg.exe add 'HKCU\Control Panel\Accessibility\Keyboard Response' /v 'Last Valid Wait' /t REG_DWORD /d '0' /f"
powershell -command "Reg.exe add 'HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters' /v 'ThreadPriority' /t REG_DWORD /d '31' /f"
goto :win32
:win32
cls
%interfgraf%
echo.
echo.
echo                                [+] Aplicando tweaks de inputlag
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "16" /f
cls
%interfgraf%
echo                                    [+] Otimizando internet
ipconfig /flushdns
echo               [+] Atualizando Drivers de Rede (Sua conexao podera ser desativada)...
pnputil -e > drivers.txt
findstr /i /c:"Net" drivers.txt > netdrivers.txt
for /f "tokens=1,2* delims= " %%a in (netdrivers.txt) do pnputil -f -d "%%b"
echo                             Drivers de Rede Atualizados com Sucesso!
goto :lixofinal
:lixofinal
cls
echo.
%interfgraf%
echo.
echo                                     [+] Limpando Lixo do PC
echo.
del *.log /a /s /q /f
del /s /f /q c:\windows\temp\*.*
del /s /f /q C:\WINDOWS\Prefetch
del /s /f /q %temp%\*.*
ipconfig /flushdns
net stop wuauserv
net stop UsoSvc
rd /s /q C:\Windows\SoftwareDistribution
md C:\Windows\SoftwareDistribution
RD /S /Q %temp%
MKDIR %temp%
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('A otimização foi finalizada com sucesso! Aproveite o seu computador com mais FPS e uma das menores latencias possíveis!', 'MathOptimizer', 'Ok', [System.Windows.Forms.MessageBoxIcon]::Information);}"
shutdown -r -t 10
pause >nul