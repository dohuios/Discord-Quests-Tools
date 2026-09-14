@echo off
title Discord Quest Auto-Completer
:: Kiểm tra xem Python đã được cài đặt chưa
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [LOI] Khong tim thay Python. Vui long cai dat Python va thu lai.
    pause
    exit
)

:: Di chuyển vào thư mục chứa file .bat này
cd /d "%~dp0"

:: Chạy tool
echo Dang khoi dong Discord Quest Auto-Completer...
python main.py
pause