@echo off
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION



rem <None Include="vp8\common\x86\idctllm_sse2.asm" />

rem sh egrep -o "<None Include=\"[a-z0-9_\\]\.asm" libvpx.vcxproj
sh egrep -o "<None Include=.[a-z0-9_\\]+\.asm" libvpx.vcxproj > %TEMP%\$$$.$$$

echo. > asms.txt

for /f %%i in ('"sh egrep -o "[a-z0-9_\\]+\.asm" %TEMP%\$$$.$$$"') do ( 

echo    ^<CustomBuild Include="%%i"^> >>asms.txt
copy asms.txt+asms_part.txt asms.txt

)


del %TEMP%\$$$.$$$

rem | gawk '{print $2 " equ " $3}' > vpx_config.asm
