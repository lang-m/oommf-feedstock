cd
dir
dir %PREFIX%

set OOMMF_TCL_CONFIG=%PREFIX%\Library\lib\tclConfig.sh
set OOMMF_TK_CONFIG=%PREFIX%\Library\lib\tkConfig.sh

set OOMMF_ROOT=%cd%\oommf
set OOMMFTCL=%OOMMF_ROOT%\oommf.tcl

cd %OOMMF_ROOT%

tclsh %OOMMFTCL% pimake distclean
if errorlevel 1 exit 1

tclsh %OOMMFTCL% pimake upgrade
if errorlevel 1 exit 1

tclsh %OOMMFTCL% pimake
if errorlevel 1 exit 1

tclsh %OOMMFTCL% pimake objclean
if errorlevel 1 exit 1

rem Copy all OOMMF sources and compiled files into %PREFIX%\opt\.
mkdir %PREFIX%\opt\oommf
xcopy %SRC_DIR%\oommf %PREFIX%\opt\oommf /e
