@echo off
rem cl.exe /D_USRDLL /D_WINDLL xtea.c /MT /link /DLL /OUT:xtea.dll

rem to use VCRuntime
rem cl.exe /D_USRDLL /D_WINDLL xtea.c /MD /link /DLL /OUT:xtea.dll
rem this can reduce the dll size
@echo on

rem Remember you are using the correct Visual Studio bit version (x86/x64)!
cl /LD xtea.c
