	@echo off

	set HOME=N:\
	set EMACS_PROGRAM=N:\tool\gnupack\gnupack_devel-11.00\emacs.exe
	set EMACS_VERSION="GNU Emacs 24.2.1 (i386-mingw-nt6.1.7601) of 2012-12-08 on GNUPACK"
	set DEBUG_INIT=
	set EMACS_CUSTOM=custom-dn2

	if "%1"=="debug" set DEBUG_INIT=--debug-init

	set SELF_LOG_FILE=%~dp0\..\log\%~n0.log
	rem pushd %HOME%
	if exist .emacs (
		echo WARNING. exist .emacs
		pause
	)
	pushd %~dp0\..

	set TEMP_EMACS_DIR=c:\DOCUME~1\nakamura\LOCALS~1\Temp\Emacs
	echo "if TEMP_EMACS_DIR does not exist, error happens."
	echo "cf. N:/.emacs.d/memo/emacs-init-failure-history.org.txt"
	if not exist %TEMP_EMACS_DIR% mkdir %TEMP_EMACS_DIR%

	start %EMACS_PROGRAM% %DEBUG_INIT%
	echo %EMACS_PROGRAM% %EMACS_VERSION% >> %SELF_LOG_FILE%
	echo [%0] {DATE} %DATE% {TIME} %TIME% {ERRORLEVEL} %ERRORLEVEL% >> %SELF_LOG_FILE%
	
	rem pause PRESS ENTER THEN call daily-commit
	call ..\daily-commit.bat
	popd
