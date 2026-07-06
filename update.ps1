param([string]$Message = "Update personal homepage")

git status
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

git add .
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

git diff --cached --quiet
if ($LASTEXITCODE -eq 0) {
    Write-Host "没有需要提交的修改。"
    exit 0
}

git commit -m $Message
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

git push origin main