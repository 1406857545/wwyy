#!/usr/bin/env pwsh
if (-not (Test-Path .\.venv)) {
    Write-Host "Virtual environment not found. Run start.ps1 first."
    exit 1
}

Write-Host "Activating venv and starting app..."
& .\.venv\Scripts\Activate.ps1
python .\app.py
