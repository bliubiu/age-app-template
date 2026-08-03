# AGE Template Init Script
# Usage:
#   Interactive:  .\init.ps1
#   Non-interactive: .\init.ps1 -ProjectName "my-app" -RepoUrl "git@github.com:user/my-app.git" -Description "My App"
#   Auto-confirm:  .\init.ps1 -ProjectName "my-app" -Yes

param(
    [string]$ProjectName,
    [string]$RepoUrl,
    [string]$Description,
    [switch]$Yes,
    [switch]$InitGit
)

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  AGE App Template - Project Init" -ForegroundColor Cyan
Write-Host "  Attractor-Guided Engineering" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

# -- Collect values --
if (-not $ProjectName) {
    Write-Host ""
    Write-Host "Enter project info (press Enter for default):" -ForegroundColor Green
    $ProjectName = Read-Host "  Project name (e.g. my-app)"
}
if (-not $ProjectName) { $ProjectName = "my-project" }

if (-not $RepoUrl) {
    $RepoUrl = Read-Host "  Repo URL (e.g. git@github.com:user/my-app.git)"
}

if (-not $Description) {
    $Description = Read-Host "  One-line description"
}
if (-not $Description) { $Description = "An AGE-driven application" }

Write-Host ""
Write-Host "[Config] Will use:" -ForegroundColor Green
Write-Host "  Project: $ProjectName"
Write-Host "  Repo:    $RepoUrl"
Write-Host "  Desc:    $Description"

if (-not $Yes) {
    $confirm = Read-Host "`nConfirm? (y/n)"
    if ($confirm -ne "y" -and $confirm -ne "Y") {
        Write-Host "Cancelled." -ForegroundColor Red
        exit 0
    }
}

# -- Replace function --
function Replace-Placeholders($content) {
    $c = $content -replace '\{\{PROJECT_NAME\}\}', $ProjectName
    $c = $c -replace '\{\{REPO_URL\}\}', $RepoUrl
    $c = $c -replace '\{\{project\}\}', $ProjectName
    # Replace remaining {{...}} with TODO markers
    $c = [regex]::Replace($c, '\{\{([^}]+)\}\}', '<!-- TODO: $1 -->')
    return $c
}

# -- Execute replacement --
Write-Host "`n[Exec] Replacing placeholders..." -ForegroundColor Yellow

$fileCount = 0
Get-ChildItem -Path $scriptDir -Recurse -Include "*.md", "*.json" | ForEach-Object {
    # Skip .git directory
    if ($_.FullName -match '\\\.git\\') { return }
    
    $relativePath = $_.FullName.Substring($scriptDir.Length + 1)
    $original = Get-Content $_.FullName -Raw -Encoding UTF8
    $replaced = Replace-Placeholders $original
    
    if ($original -ne $replaced) {
        [System.IO.File]::WriteAllText($_.FullName, $replaced, [System.Text.UTF8Encoding]::new($false))
        Write-Host "  OK $relativePath" -ForegroundColor Gray
        $fileCount++
    }
}

Write-Host "`n[Done] $fileCount files processed" -ForegroundColor Green

# -- Cleanup --
Write-Host "`n[Clean] Removing init scripts..." -ForegroundColor Yellow
@("init.ps1", "init.sh", "init.config.json") | ForEach-Object {
    $f = Join-Path $scriptDir $_
    if (Test-Path $f) {
        Remove-Item $f -Force
        Write-Host "  OK removed $_" -ForegroundColor Gray
    }
}

# -- Git init --
$initGit = "n"
if ($InitGit) {
    $initGit = "y"
} elseif (-not $Yes) {
    $initGit = Read-Host "`nInitialize Git repo? (y/n)"
}
if ($initGit -eq "y" -or $initGit -eq "Y") {
    Write-Host "[Git] Initializing..." -ForegroundColor Yellow
    $gitDir = Join-Path $scriptDir ".git"
    if (Test-Path $gitDir) { Remove-Item $gitDir -Recurse -Force }
    git -C $scriptDir init
    git -C $scriptDir add -A
    git -C $scriptDir commit -m "Init from AGE template: $ProjectName"
    
    if ($RepoUrl) {
        $addRemote = Read-Host "  Add remote origin = $RepoUrl? (y/n)"
        if ($addRemote -eq "y" -or $addRemote -eq "Y") {
            git -C $scriptDir remote add origin $RepoUrl
            Write-Host "  OK remote added" -ForegroundColor Green
        }
    }
    Write-Host "[Git] Done" -ForegroundColor Green
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Init Complete!" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Next steps:" -ForegroundColor Cyan
Write-Host "  1. Search <!-- TODO to fill remaining content"
Write-Host "  2. Fill docs/backlog/ first work item"
Write-Host "  3. Fill real verification commands"
Write-Host "  4. Start coding!"
Write-Host "========================================" -ForegroundColor Cyan