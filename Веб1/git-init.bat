@echo off
setlocal enabledelayedexpansion

:: 1. Запит URL репозиторію
set /p repo_url="Enter GitHub Repository URL: "
if "%repo_url%"=="" (
    echo Error: URL cannot be empty.
    pause
    exit /b
)

:: 2. Запит повідомлення коміту
set /p commit_msg="Enter Commit Message (default 'Initial commit'): "
if "%commit_msg%"=="" set commit_msg=Initial commit

:: 3. Процес Git
echo.
echo --- Initializing Git ---
git init

echo.
echo --- Adding files ---
git add .

echo.
echo --- Committing ---
git commit -m "%commit_msg%"

:: Змінюємо гілку на main (стандарт GitHub)
echo.
echo --- Setting branch to main ---
git branch -M main

:: Додаємо remote (видаляємо старий, якщо він був помилково доданий раніше)
git remote remove origin >nul 2>&1
git remote add origin %repo_url%

echo.
echo --- Pushing to GitHub ---
git push -u origin main

if %errorlevel% neq 0 (
    echo.
    echo [!] Something went wrong. Check your URL or internet connection.
) else (
    echo.
    echo [OK] Successfully uploaded to GitHub!
)

pause