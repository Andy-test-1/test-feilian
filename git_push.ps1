# git_push.ps1
# 用途：提交并推送 D:\test 文件夹中的变更到 GitHub

$RepoPath = "D:\test"
$CommitMessage = "Update files"

Write-Host "进入仓库目录：$RepoPath"
cd $RepoPath

Write-Host "当前 Git 状态："
git status

Write-Host ""
Write-Host "即将添加所有变更文件..."
git add .

Write-Host ""
Write-Host "再次查看暂存区状态："
git status

Write-Host ""
$confirm = Read-Host "确认提交并 push 到 GitHub 吗？输入 yes 继续"

if ($confirm -ne "yes") {
    Write-Host "已取消操作。"
    exit
}

Write-Host ""
Write-Host "开始提交..."
git commit -m $CommitMessage

if ($LASTEXITCODE -ne 0) {
    Write-Host "没有可提交内容，或 commit 失败。"
    exit
}

Write-Host ""
Write-Host "开始 push..."
git push

if ($LASTEXITCODE -eq 0) {
    Write-Host "Push 成功。"
} else {
    Write-Host "Push 失败，请检查错误信息。"
}