@echo off
::不知道靠不靠谱，虽然这个和自定义函数一样，但是用得不好可能会炸
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
	echo 没有指定模块名。
	if "%logging%"=="true" (
		set date_time_raw=!date:~0,10!_!time! & set date_time=!date_time_raw: =!	
		call log.bat 2 log_%log_number%.log !date_time! %log_level% module.bat 已忽略 %logging% 没有指定模块名。
	)
) else (
	if "%logging%"=="true" (
		set date_time_raw=!date:~0,10!_!time! & set date_time=!date_time_raw: =!	
		call log.bat -1 log_%log_number%.log !date_time! %log_level% module.bat 已忽略 %logging% 调用模块：[%arg0%.bat]......
	)
	if not exist "%~dp0modules\%arg0%.bat" (
		echo 模块不存在。
		if "%logging%"=="true" (
			set date_time_raw=!date:~0,10!_!time! & set date_time=!date_time_raw: =!	
			call log.bat 3 log_%log_number%.log !date_time! %log_level% module.bat 已忽略 %logging% 模块[%arg0%.bat]不存在。
		)
	
	) else (
		if  "%arg1%"=="outofwindow" (
			start modules\%arg0%.bat  %arg2% %arg3%  %arg4% %arg5% %arg6% %arg7% %arg8% 
			if "%logging%"=="true" (
				set date_time_raw=!date:~0,10!_!time! & set date_time=!date_time_raw: =!	
				call log.bat 0 log_%log_number%.log !date_time! %log_level% module.bat 已忽略 %logging% 调用模块（窗口内）完成。
			)
		) else (
			if  "%arg1%"=="inwindow" (
				call modules\%arg0%.bat  %arg2% %arg3%  %arg4% %arg5% %arg6% %arg7% %arg8% 
				if "%logging%"=="true" (
					set date_time_raw=!date:~0,10!_!time! & set date_time=!date_time_raw: =!	
					call log.bat 0 log_%log_number%.log !date_time! %log_level% module.bat 已忽略 %logging% 调用模块（窗口外）完成。
				)
			) else (
				if  "%arg1%"=="" (
					echo 未指定启动参数。应当为inwindow/outofwindow
				) else (
					echo 未知的启动参数：%arg1%。应当为inwindow/outofwindow
				)
			)
		)
	)
)
