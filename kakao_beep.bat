@echo off
:: UTF-8 코드로 터미널 모드 전환
chcp 65001 >nul

:MENU
cls
echo ========================================
echo    윈도우 기본 경고음 설정 매니저
echo ========================================
echo  1. 기본 경고음 제거 (소리 없음)
echo  2. 기본 경고음 복구 (기본값)
echo  3. 종료
echo ========================================
set /p select="번호를 입력하고 엔터를 누르세요: "

if "%select%"=="1" goto DISABLE
if "%select%"=="2" goto ENABLE
if "%select%"=="3" goto EXIT

:DISABLE
reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\.Default\.Current" /ve /t REG_SZ /d "" /f
echo.
echo [결과] 경고음이 제거되었습니다.
timeout /t 2 >nul
goto MENU

:ENABLE
reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\.Default\.Current" /ve /t REG_SZ /d "%SystemRoot%\media\Windows Background.wav" /f
echo.
echo [결과] 경고음이 기본값으로 복구되었습니다.
timeout /t 2 >nul
goto MENU

:EXIT
exit