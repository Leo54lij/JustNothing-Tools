@echo off
::��֪���������ף���Ȼ������Զ��庯��һ���������õò��ÿ��ܻ�ը
set arg0=%1
set arg1=%2
set arg2=%3
set arg3=%4
set arg4=%5
set arg5=%6
set arg6=%7
set arg7=%8
set arg8=%9
if "%arg0%"=="" (
	echo û��ָ��ģ������
	if "%logging%"=="true" (
		set date_time_raw=!date:~0,10!_!time! & set date_time=!date_time_raw: =!	
		call log.bat 2 log_%log_number%.log !date_time! %log_level% module.bat �Ѻ��� %logging% û��ָ��ģ������
	)
) else (
	if "%logging%"=="true" (
		set date_time_raw=!date:~0,10!_!time! & set date_time=!date_time_raw: =!	
		call log.bat -1 log_%log_number%.log !date_time! %log_level% module.bat �Ѻ��� %logging% ����ģ�飺[%arg0%.bat]......
	)
	if not exist "%~dp0modules\%arg0%.bat" (
		echo ģ�鲻���ڡ�
		if "%logging%"=="true" (
			set date_time_raw=!date:~0,10!_!time! & set date_time=!date_time_raw: =!	
			call log.bat 3 log_%log_number%.log !date_time! %log_level% module.bat �Ѻ��� %logging% ģ��[%arg0%.bat]�����ڡ�
		)
	
	) else (
		if  "%arg1%"=="outofwindow" (
			start modules\%arg0%.bat  %arg2% %arg3%  %arg4% %arg5% %arg6% %arg7% %arg8% 
			if "%logging%"=="true" (
				set date_time_raw=!date:~0,10!_!time! & set date_time=!date_time_raw: =!	
				call log.bat 0 log_%log_number%.log !date_time! %log_level% module.bat �Ѻ��� %logging% ����ģ�飨�����ڣ���ɡ�
			)
		) else (
			if  "%arg1%"=="inwindow" (
				call modules\%arg0%.bat  %arg2% %arg3%  %arg4% %arg5% %arg6% %arg7% %arg8% 
				if "%logging%"=="true" (
					set date_time_raw=!date:~0,10!_!time! & set date_time=!date_time_raw: =!	
					call log.bat 0 log_%log_number%.log !date_time! %log_level% module.bat �Ѻ��� %logging% ����ģ�飨�����⣩��ɡ�
				)
			) else (
				if  "%arg1%"=="" (
					echo δָ������������Ӧ��Ϊinwindow/outofwindow
				) else (
					echo δ֪������������%arg1%��Ӧ��Ϊinwindow/outofwindow
				)
			)
		)
	)
)
