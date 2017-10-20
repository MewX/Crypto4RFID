
cl /LD xtea.cpp

@echo off
rem cl.exe /D_USRDLL /D_WINDLL xtea.cpp /MT /link /DLL /OUT:xtea.dll

rem to use VCRuntime
rem cl.exe /D_USRDLL /D_WINDLL xtea.cpp /MD /link /DLL /OUT:xtea.dll
rem this can reduce the dll size
@echo on
