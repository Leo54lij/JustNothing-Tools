@echo off
if "%1"=="log_collector" (
	goto �ռ���־
)
if "%1"=="random_string_generator" (
	goto ����ַ�����
)
goto exit
:�ռ���־
title ��һ����������-�ռ���־
if "%2"=="" (
	echo ��ָ������·��......
	goto exit
)
echo �����Ĺ��ܣ���־�ռ���
echo ����·����%2
if "%3"=="-t" (
	title ��һ����������-�ռ���־
	if "%4"=="" (
		echo ��ָ������·��......
	)
	exit
)
echo �ռ�������/ʱ�䣺%4
echo �ȴ��豸����......
adb wait-for-device devices > nul
echo ��ʼ�ռ���־���ռ���ϻ��Զ��˳����벻Ҫ�ر�......
adb logcat %3 %4 %5 %6 %7 %8 %9 >> %2
echo ��ɣ�
exit
:����ַ�����
setlocal enabledelayedexpansion
set /a length=8
if not "%2"==""  set /a length=%2
set string=%3
if "%3"=="" set string=1234567890abcdef
if not "!string!"=="" for /f "usebackq delims=" %%i in (`busybox expr length !string!`) do set strlength=%%i
set /a output_length=0
:����ַ�ѭ��
set /a output_length+=1
set /a output_bit=!random!%%!strlength!
set output_bit_true=%string:~!output_bit!,1%
if %output_length% == 1 set output=!%output_bit_true%!
if not %output_length% == 1 set output=%output%!%output_bit_true%!
if not %output_length% GEQ %length% goto ����ַ�ѭ��
echo %output%
:exit
goto :eof