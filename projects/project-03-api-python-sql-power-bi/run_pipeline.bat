REM ============================================================
REM 1. ZÁKLADNÍ NASTAVENÍ BAT SOUBORU
REM
REM Cíl:
REM Zjednodušit výstup skriptu a omezit platnost pomocných
REM proměnných pouze na tento běh pipeline.
REM ============================================================

@echo off
setlocal


REM ============================================================
REM 2. NASTAVENI PRACOVNI SLOZKY
REM
REM Cíl:
REM Zajistit, aby se pipeline vždy spouštěla z hl. složky projektu.
REM
REM Díky tomu fungují relativní cesty k:
REM - .venv,
REM - Python skriptům,
REM - logs,
REM i při spuštění přes Windows Task Scheduler.
REM ============================================================

cd /d "%~dp0"


REM ============================================================
REM 3. UTF-8 ENCODING
REM
REM Cíl:
REM Používat UTF-8 pro výstup Python skriptů a log soubor.
REM Díky tomu se správně zapisují české znaky.
REM ============================================================

chcp 65001 > nul
set PYTHONIOENCODING=utf-8
set PYTHONUTF8=1


REM ============================================================
REM 4. NASTAVENI LOG SOUBORU
REM
REM Cíl:
REM Vytvořit pro každý běh pipeline samostatný log soubor
REM ve složce logs/.
REM
REM Datum a čas získáváme přes PowerShell,
REM aby formát nebyl závislý na regionálním nastavení Windows.
REM
REM Log obsahuje:
REM - čas spuštění,
REM - výstup jednotlivých py skriptů,
REM - případné chyby,
REM - informaci o úspěšném nebo neúspěšném dokončení.
REM ============================================================

set LOG_DIR=logs

if not exist "%LOG_DIR%" (
    mkdir "%LOG_DIR%"
)

for /f "delims=" %%a in ('powershell -NoProfile -Command "Get-Date -Format 'yyyy-MM-dd'"') do (
    set RUN_DATE=%%a
)

for /f "delims=" %%a in ('powershell -NoProfile -Command "Get-Date -Format 'HHmmss'"') do (
    set RUN_TIME=%%a
)

for /f "delims=" %%a in ('powershell -NoProfile -Command "Get-Date -Format 'HH:mm:ss'"') do (
    set RUN_TIME_DISPLAY=%%a
)

set LOG_FILE=%LOG_DIR%\pipeline_%RUN_DATE%_%RUN_TIME%.log


REM ============================================================
REM 5. ZACATEK PIPELINE
REM ============================================================

echo ============================================ >> "%LOG_FILE%"
echo FONDY DATA PIPELINE >> "%LOG_FILE%"
echo Start: %RUN_DATE% %RUN_TIME_DISPLAY% >> "%LOG_FILE%"
echo ============================================ >> "%LOG_FILE%"
echo. >> "%LOG_FILE%"


REM ============================================================
REM 6. NAČTENÍ DAT
REM ============================================================

echo NACTENI DAT >> "%LOG_FILE%"

.venv\Scripts\python.exe python\02_acquire_fund_prices.py >> "%LOG_FILE%" 2>&1

IF ERRORLEVEL 1 (

    echo. >> "%LOG_FILE%"
    echo CHYBA PRI NACTENI DAT. >> "%LOG_FILE%"

    for /f "delims=" %%a in ('powershell -NoProfile -Command "Get-Date -Format 'yyyy-MM-dd HH:mm:ss'"') do (
        echo End: %%a >> "%LOG_FILE%"
    )

    exit /b 1
)


REM ============================================================
REM 7. VALIDACE DAT
REM ============================================================

echo. >> "%LOG_FILE%"
echo VALIDACE DAT >> "%LOG_FILE%"

.venv\Scripts\python.exe python\03_validate_clean_fund_prices.py >> "%LOG_FILE%" 2>&1

IF ERRORLEVEL 1 (

    echo. >> "%LOG_FILE%"
    echo VALIDACE SELHALA - SQL LOAD SE NESPUSTI. >> "%LOG_FILE%"

    for /f "delims=" %%a in ('powershell -NoProfile -Command "Get-Date -Format 'yyyy-MM-dd HH:mm:ss'"') do (
        echo End: %%a >> "%LOG_FILE%"
    )

    exit /b 1
)


REM ============================================================
REM 8. INCREMENTAL SQL LOAD
REM ============================================================

echo. >> "%LOG_FILE%"
echo INCREMENTAL SQL LOAD >> "%LOG_FILE%"

.venv\Scripts\python.exe python\05_load_fund_prices_to_sql.py >> "%LOG_FILE%" 2>&1

IF ERRORLEVEL 1 (

    echo. >> "%LOG_FILE%"
    echo CHYBA PRI SQL LOADU. >> "%LOG_FILE%"

    for /f "delims=" %%a in ('powershell -NoProfile -Command "Get-Date -Format 'yyyy-MM-dd HH:mm:ss'"') do (
        echo End: %%a >> "%LOG_FILE%"
    )

    exit /b 1
)


REM ============================================================
REM 9. ANALÝZA A LOAD ANALYTICKÝCH VÝSTUPŮ
REM ============================================================

echo. >> "%LOG_FILE%"
echo ANALYZA A LOAD ANALYTICKYCH VYSTUPU >> "%LOG_FILE%"

.venv\Scripts\python.exe python\06_analyze_fund_performance.py >> "%LOG_FILE%" 2>&1

IF ERRORLEVEL 1 (

    echo. >> "%LOG_FILE%"
    echo CHYBA PRI ANALYZE NEBO LOADU ANALYTICKYCH VYSTUPU. >> "%LOG_FILE%"

    for /f "delims=" %%a in ('powershell -NoProfile -Command "Get-Date -Format 'yyyy-MM-dd HH:mm:ss'"') do (
        echo End: %%a >> "%LOG_FILE%"
    )

    exit /b 1
)


REM ============================================================
REM 10. ÚSPĚCH
REM ============================================================

echo. >> "%LOG_FILE%"
echo ============================================ >> "%LOG_FILE%"
echo PIPELINE DOKONCENA USPESNE. >> "%LOG_FILE%"

for /f "delims=" %%a in ('powershell -NoProfile -Command "Get-Date -Format 'yyyy-MM-dd HH:mm:ss'"') do (
    echo End: %%a >> "%LOG_FILE%"
)

echo ============================================ >> "%LOG_FILE%"

exit /b 0