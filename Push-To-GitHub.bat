@echo off
REM ============================================================
REM   CTI Financial Agents - one-click GitHub publish
REM   Creates the repo at github.com/Robert-Upchurch/cti-financial-agents
REM   and pushes the plugin contents.
REM ============================================================

setlocal
cd /d "%~dp0"

echo.
echo ============================================================
echo   Publishing cti-financial-agents to GitHub
echo ============================================================
echo.

REM --- Check prerequisites ---
where git >nul 2>nul
if errorlevel 1 (
    echo [ERROR] git is not installed or not on PATH.
    echo         Install Git for Windows: https://git-scm.com/download/win
    pause
    exit /b 1
)

where gh >nul 2>nul
if errorlevel 1 (
    echo [ERROR] GitHub CLI ^(gh^) is not installed or not on PATH.
    echo         Install: https://cli.github.com/
    pause
    exit /b 1
)

gh auth status >nul 2>nul
if errorlevel 1 (
    echo [ERROR] gh CLI is not authenticated. Run: gh auth login
    pause
    exit /b 1
)

REM --- Init repo if needed ---
if not exist ".git" (
    echo [1/5] Initializing git repository...
    git init -b main
    if errorlevel 1 goto :fail
) else (
    echo [1/5] Git repo already initialized - skipping init.
)

REM --- Stage files ---
echo [2/5] Staging files...
git add .claude-plugin skills README.md FINANCIAL-AGENTS-INDEX.md .gitignore Push-To-GitHub.bat
if errorlevel 1 goto :fail

REM --- Commit (skip if nothing to commit) ---
echo [3/5] Committing...
git diff --cached --quiet
if errorlevel 1 (
    git commit -m "Initial release: 5 financial-agent skills (pitch-builder, model-builder, earnings-reviewer, kyc-screener, valuation-reviewer)"
    if errorlevel 1 goto :fail
) else (
    echo       Nothing new to commit.
)

REM --- Create remote repo if missing, then push ---
echo [4/5] Checking GitHub remote...
gh repo view Robert-Upchurch/cti-financial-agents >nul 2>nul
if errorlevel 1 (
    echo       Remote repo does not exist - creating it now ^(public^)...
    gh repo create Robert-Upchurch/cti-financial-agents --public --source=. --remote=origin --description "Five investment-grade finance skills for Claude Code and Claude.ai - complements Anthropic's Financial Agent Templates" --push
    if errorlevel 1 goto :fail
) else (
    echo       Remote exists.
    git remote get-url origin >nul 2>nul
    if errorlevel 1 (
        echo       Adding origin remote...
        git remote add origin https://github.com/Robert-Upchurch/cti-financial-agents.git
    )
    echo [5/5] Pushing to origin/main...
    git push -u origin main
    if errorlevel 1 goto :fail
)

echo.
echo ============================================================
echo   SUCCESS
echo ============================================================
echo.
echo   Repo:  https://github.com/Robert-Upchurch/cti-financial-agents
echo.
echo   To install in Claude Code:
echo       /plugin install Robert-Upchurch/cti-financial-agents
echo.
echo   To install in Claude.ai (Max):
echo       Settings -^> Plugins -^> Add from GitHub
echo       URL: https://github.com/Robert-Upchurch/cti-financial-agents
echo.
pause
exit /b 0

:fail
echo.
echo [FAILED] Last command exited with an error. See output above.
pause
exit /b 1
