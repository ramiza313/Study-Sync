@echo off
cd /d "%~dp0"
if not exist .venv (
  py -3 -m venv .venv
)
call .venv\Scripts\activate.bat
python -m pip install --upgrade pip
pip install -r requirements.txt
if not exist .env copy .env.example .env
echo.
echo Setup complete. Edit .env and add your Gemma API key/model ID, then run this file again.
echo Open http://127.0.0.1:5000 after the server starts.
echo.
python -m flask --app app run --debug
pause
