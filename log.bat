@echo off
if not exist data\log\%2 echo [��¼����       ��¼ʱ��     ]  ��¼��               [PID]  ���ͣ� ����> %cd%\data\log\%2
if "%6"=="true" (
	if %3 GEQ 2 (
		if "%1"=="-1" (
			echo [%date:~0,10%_%time%]  %4[%5] ��ϸ���ԣ� %7 %8 %9 >>data\log\%2
		)
	)
	if %3 GEQ 1 (
		if "%1"=="0" (
			echo [%date:~0,10%_%time%]  %4[%5] ���ԣ�%7 %8 %9>>data\log\%2
		) 
	)
	if %3 GEQ 0 (
		if "%1"=="1" (
			echo [%date:~0,10%_%time%]  %4[%5] ��Ϣ��%7 %8 %9>>data\log\%2
		)
	)
	if %3 GEQ -1 (
		if "%1"=="2" (
			echo [%date:~0,10%_%time%]  %4[%5] ���棺%7 %8 %9>>data\log\%2
		)
	)
	if %3 GEQ -2 (	
		if "%1"=="3" (
			ech  [%date:~0,10%_%time%]  %4[%5] ����%7 %8 %9>>data\log\%2
		)
	)		
	if %4 GEQ -3 (	
		if "%1"=="4" (
			echo --------------------------------�����ˣ�-------------------------------->>data\log\%2
			echo ʱ�� ��[%date:~0,10%_%time%]  >> data\log\%2
			echo ����ĳ���>> data\log\%2
			echo ��ϸ��%4[%5] >> data\log\%2
			echo 	���ش��� %7 %8 %9>> data\log\%2
			echo ------------------------------------------------------------------------>> data\log\%2
		)
	)
)
	