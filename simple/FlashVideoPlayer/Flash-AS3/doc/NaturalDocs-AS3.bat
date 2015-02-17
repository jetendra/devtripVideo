@echo off

set NaturalDocsParams= -i F:\Pro\VIDEO-PLAYER\simple\FlashVideoPlayer\Flash-AS3\src\com -o FramedHTML F:\Pro\VIDEO-PLAYER\simple\FlashVideoPlayer\Flash-AS3\naturalDoc -p F:\Pro\VIDEO-PLAYER\simple\FlashVideoPlayer\Flash-AS3\naturalDoc\projectDoc

rem Shift and loop so we can get more than nine parameters.
rem This is especially important if we have spaces in file names.

:MORE
if "%1"=="" goto NOMORE
set NaturalDocsParams=%NaturalDocsParams% %1
shift
goto MORE
:NOMORE

C:\Perl\bin\perl.exe NaturalDocs %NaturalDocsParams%
