@echo off

rem Удаляет запущенный процесс mshta.exe для окна slech-заставки

rem Имя процесса окна slech-заставки
set filename=mshta.exe

rem Ищет среди списка процессов нужный процесс, имя которого мы указали
rem Если процесс найден, переходит на строку (ALREADY_RUN), иначе - переходит на (:END)
:CHECK
if "%1" neq "" set filename=%1
for /f %%a in ('tasklist /nh /fi "imagename eq %filename%" ^| find /c "%filename%"') do set /a quantity=%%a
if %quantity% geq 1 goto ALREADY_RUN
goto END

rem Удаляем принудительно текущий процесс, если он был найден в списке запущенных
rem Иногда процесс не завершается с первого раза, поэтому проверяем, запущен ли процесс до сих пор
:ALREADY_RUN
TASKKILL /f /t /im mshta.exe
goto CHECK

:END