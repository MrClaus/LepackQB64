@echo off

rem ������� ���������� ������� mshta.exe ��� ���� slech-��������

rem ��� �������� ���� slech-��������
set filename=mshta.exe

rem ���� ����� ������ ��������� ������ �������, ��� �������� �� �������
rem ���� ������� ������, ��������� �� ������ (ALREADY_RUN), ����� - ��������� �� (:END)
:CHECK
if "%1" neq "" set filename=%1
for /f %%a in ('tasklist /nh /fi "imagename eq %filename%" ^| find /c "%filename%"') do set /a quantity=%%a
if %quantity% geq 1 goto ALREADY_RUN
goto END

rem ������� ������������� ������� �������, ���� �� ��� ������ � ������ ����������
rem ������ ������� �� ����������� � ������� ����, ������� ���������, ������� �� ������� �� ��� ���
:ALREADY_RUN
TASKKILL /f /t /im mshta.exe
goto CHECK

:END