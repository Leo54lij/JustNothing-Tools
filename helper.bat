@echo off
if "%1"=="log_collector" (
	goto 收集日志
)
if "%1"=="random_string_generator" (
	goto 随机字符生成
)
goto exit
:收集日志
title 另一个帮助程序-收集日志
if "%2"=="" (
	echo 请指定保存路径......
	goto exit
)
echo 启动的功能：日志收集器
echo 保存路径：%2
if "%3"=="-t" (
	title 另一个帮助程序-收集日志
	if "%4"=="" (
		echo 请指定保存路径......
	)
	exit
)
echo 收集的行数/时间：%4
echo 等待设备连接......
adb wait-for-device devices > nul
echo 开始收集日志，收集完毕会自动退出，请不要关闭......
adb logcat %3 %4 %5 %6 %7 %8 %9 >> %2
echo 完成！
exit
:随机字符生成
setlocal enabledelayedexpansion
set /a length=8
if not "%2"==""  set /a length=%2
set string=%3
if "%3"=="" set string=1234567890abcdef
if not "!string!"=="" for /f "usebackq delims=" %%i in (`busybox expr length !string!`) do set strlength=%%i
set /a output_length=0
:输出字符循环
set /a output_length+=1
set /a output_bit=!random!%%!strlength!
set output_bit_true=%string:~!output_bit!,1%
if %output_length% == 1 set output=!%output_bit_true%!
if not %output_length% == 1 set output=%output%!%output_bit_true%!
if not %output_length% GEQ %length% goto 输出字符循环
echo %output%
:exit
goto :eof