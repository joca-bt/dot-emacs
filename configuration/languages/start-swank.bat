@echo off


if "%1"=="" (
	echo USAGE: start-swank.bat /path/to/lisp
	echo   This command will read a line of Lisp forms, from the stdin,
	echo   to start the swank server and start a Lisp that runs these forms.

	exit 1
) else (
	set /p swank_command=

	%1 +B +m -e "%swank_command%"
)
