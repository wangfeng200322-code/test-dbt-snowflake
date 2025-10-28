@echo off
echo Installing dbt with Snowflake adapter...

:: Check if Python is installed
python --version 2>nul
if errorlevel 1 (
    echo Python is not installed. Please install Python first.
    exit /b 1
)

:: Create virtual environment if it doesn't exist
if not exist "venv" (
    echo Creating virtual environment...
    python -m venv venv
)

:: Activate virtual environment
call venv\Scripts\activate.bat

:: Install or upgrade pip
python -m pip install --upgrade pip

:: Install dbt-snowflake
pip install dbt-snowflake

:: Initialize dbt project if not already initialized
if not exist "dbt_project.yml" (
    echo Initializing dbt project...
    dbt init dbt_snowflake
)

echo.
echo Setup complete! You can now:
echo 1. Configure your Snowflake credentials in profiles.yml
echo 2. Start developing your dbt models
echo.
echo To begin, ensure you're in the virtual environment:
echo     venv\Scripts\activate.bat
echo.