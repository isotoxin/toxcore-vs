@echo off
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

if "aa%VS120COMNTOOLS%" == "aa" goto novs120
if NOT "aa%GARBAGE%" == "aa" goto garbok
echo warning: no ^"GARBAGE^" variable defined (path to temp compile files, must not be inside %TEMP%)
set GARBAGE=%cd%\~garbage
md %GARBAGE%
:garbok
echo ^"GARBAGE^" is %GARBAGE%
set vsc="%VS120COMNTOOLS%..\..\vc\bin"
set msb="C:\Program Files (x86)\MSBuild\12.0\Bin\MSBuild.exe"

%msb% toxcore\vs\toxcore.vcxproj /fl1 /clp:ErrorsOnly /m:3 /t:Rebuild /p:Configuration=Debug;GARBAGE=%GARBAGE%
%msb% toxcore\vs\toxcore.vcxproj /fl1 /clp:ErrorsOnly /m:3 /t:Rebuild /p:Configuration=Release;GARBAGE=%GARBAGE%

%msb% opus\opus.vcxproj /fl1 /clp:ErrorsOnly /m:3 /t:Rebuild /p:Configuration=Release;GARBAGE=%GARBAGE%
%msb% libsodium\libsodium.vcxproj /fl1 /clp:ErrorsOnly /m:3 /t:Rebuild /p:Configuration=Release;GARBAGE=%GARBAGE%
%msb% libvpx\libvpx.vcxproj /fl1 /clp:ErrorsOnly /m:3 /t:Rebuild /p:Configuration=Release;GARBAGE=%GARBAGE%

goto oka
:novs120
echo error: Visual Studio 2013 not found (install Visual Studio 2013 Express for free)
:oka
