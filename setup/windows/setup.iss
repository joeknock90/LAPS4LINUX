; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "LAPS4WINDOWS"
#define MyAppVersion "1.6.3"
#define MyAppPublisher "Sieber Systems"
#define MyAppURL "https://github.com/schorschii/LAPS4LINUX"
#define MyAppExeName "laps-gui.exe"
#define MyAppDir "C:\Program Files\"+MyAppName

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{D6992D04-3289-4F43-93EA-F84B0F5FC008}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
WizardSmallImageFile="installer-top-img.bmp"
UninstallDisplayName={#MyAppName}
UninstallDisplayIcon="{#MyAppDir}\\{#MyAppExeName},0"
DefaultDirName={#MyAppDir}
DisableDirPage=yes
DisableProgramGroupPage=yes
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputDir=.
OutputBaseFilename=laps4windows-client
Compression=lzma
SolidCompression=yes
WizardStyle=modern
SetupIconFile=..\..\assets\setup.ico

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Registry]
Root: HKCR; Subkey: "laps"; Flags: uninsdeletekey
Root: HKCR; Subkey: "laps"; ValueType: string; ValueName: ""; ValueData: "URL:Local Administrator Password Solution"
Root: HKCR; Subkey: "laps"; ValueType: string; ValueName: "URL Protocol"; ValueData: ""
Root: HKCR; Subkey: "laps\shell"; Flags: uninsdeletekey
Root: HKCR; Subkey: "laps\shell\open"; Flags: uninsdeletekey
Root: HKCR; Subkey: "laps\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """C:\Program Files\LAPS4WINDOWS\laps-gui.exe"" %1"

[Files]
Source: "..\..\dist\LAPS4WINDOWS\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\..\dist\LAPS4WINDOWS\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
