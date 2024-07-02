@echo off
if not exist data\log\%2 echo [记录日期       记录时间     ]  记录者               [PID]  类型： 内容> %cd%\data\log\%2
if "%6"=="true" (
	if %3 GEQ 2 (
		if "%1"=="-1" (
			echo [%date:~0,10%_%time%]  %4[%5] 详细调试： %7 %8 %9 >>data\log\%2
		)
	)
	if %3 GEQ 1 (
		if "%1"=="0" (
			echo [%date:~0,10%_%time%]  %4[%5] 调试：%7 %8 %9>>data\log\%2
		) 
	)
	if %3 GEQ 0 (
		if "%1"=="1" (
			echo [%date:~0,10%_%time%]  %4[%5] 信息：%7 %8 %9>>data\log\%2
		)
	)
	if %3 GEQ -1 (
		if "%1"=="2" (
			echo [%date:~0,10%_%time%]  %4[%5] 警告：%7 %8 %9>>data\log\%2
		)
	)
	if %3 GEQ -2 (	
		if "%1"=="3" (
			ech  [%date:~0,10%_%time%]  %4[%5] 错误：%7 %8 %9>>data\log\%2
		)
	)		
	if %4 GEQ -3 (	
		if "%1"=="4" (
			echo --------------------------------出错了！-------------------------------->>data\log\%2
			echo 时间 ：[%date:~0,10%_%time%]  >> data\log\%2
			echo 错误的程序：>> data\log\%2
			echo 详细：%4[%5] >> data\log\%2
			echo 	严重错误： %7 %8 %9>> data\log\%2
			echo ------------------------------------------------------------------------>> data\log\%2
		)
	)
)
	