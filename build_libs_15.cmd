@echo off
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

if "aa%VS140COMNTOOLS%" == "aa" goto novs140
if NOT "aa%GARBAGE%" == "aa" goto garbok
echo warning: no ^"GARBAGE^" variable defined (path to temp compile files, must not be inside %TEMP%)
set GARBAGE="%cd%\~garbage"
if not exist %GARBAGE% md %GARBAGE%
:garbok
echo ^"GARBAGE^" is %GARBAGE%
set vsc="%VS140COMNTOOLS%..\..\vc\bin"
set msb="C:\Program Files (x86)\MSBuild\14.0\Bin\MSBuild.exe"

%msb% toxcore\vs\toxcore_2015.vcxproj /fl1 /clp:ErrorsOnly /m:3 /t:Rebuild /p:Configuration=Debug;GARBAGE=%GARBAGE%;SolutionDir=..\..\
%msb% toxcore\vs\toxcore_2015.vcxproj /fl1 /clp:ErrorsOnly /m:3 /t:Rebuild /p:Configuration=Release;GARBAGE=%GARBAGE%;SolutionDir=..\..\

%msb% opus\opus_15.vcxproj /fl1 /clp:ErrorsOnly /m:3 /t:Rebuild /p:Configuration=Release;GARBAGE=%GARBAGE%;SolutionDir=..\
%msb% libsodium\libsodium_2015.vcxproj /fl1 /clp:ErrorsOnly /m:3 /t:Rebuild /p:Configuration=Release;GARBAGE=%GARBAGE%;SolutionDir=..\
%msb% libvpx\libvpx_2015.vcxproj /fl1 /clp:ErrorsOnly /m:3 /t:Rebuild /p:Configuration=Release;GARBAGE=%GARBAGE%;SolutionDir=..\

goto oka
:novs140
echo error: Visual Studio 2015 not found (install Visual Studio 2015 Express for free)
:oka
