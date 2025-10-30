#!/usr/bin/env pwsh
Write-Host "Create or update virtual environment (.venv) and install requirements"

if (-not (Test-Path .\.venv)) {
    Write-Host "Creating virtual environment .venv..."
    python -m venv .venv
}
else {
    Write-Host ".venv already exists"
}

Write-Host "Activating venv and installing requirements..."
& .\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
if (Test-Path .\requirements.txt) {
    python -m pip install -r .\requirements.txt
}
else {
    python -m pip install Flask
    pip freeze > requirements.txt
}

Write-Host "Done. To activate the venv in your session: .\\.venv\\Scripts\\Activate.ps1"
