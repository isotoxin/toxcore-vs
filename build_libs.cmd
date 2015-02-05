SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

if "aa%VS120COMNTOOLS%" == "aa" goto novs120
if "aa%GARBAGE%" == "aa" goto nogarb

set vsc="%VS120COMNTOOLS%..\..\vc\bin"
set msb="C:\Program Files (x86)\MSBuild\12.0\Bin\MSBuild.exe"



%msb% toxcore\vs\toxcore.vcxproj /fl1 /clp:ErrorsOnly /m:3 /t:Rebuild /p:Configuration=Debug
%msb% toxcore\vs\toxcore.vcxproj /fl1 /clp:ErrorsOnly /m:3 /t:Rebuild /p:Configuration=Release

%msb% opus\win32\vs2013\opus.vcxproj /fl1 /clp:ErrorsOnly /m:3 /t:Rebuild /p:Configuration=Release
%msb% libsodium\libsodium.vcxproj /fl1 /clp:ErrorsOnly /m:3 /t:Rebuild /p:Configuration=Release
%msb% libvpx\libvpx.vcxproj /fl1 /clp:ErrorsOnly /m:3 /t:Rebuild /p:Configuration=Release

goto oka
:novs120
echo error: Visual Studio 2013 not found (install Visual Studio 2013 Express for free)
goto oka
:nogarb
echo error: no ^"GARBAGE^" variable defined (path to temp compile files, must not be inside %TEMP%)
:oka
