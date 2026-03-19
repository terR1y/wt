@echo off
set /p repo_url="Enter Remote Repository URL: "
set /p commit_msg="Enter Commit Message (default 'Initial commit'): "

if "%commit_msg%"=="" set commit_msg=Initial commit

git init
git add .
git commit -m "%commit_msg%"
git branch -M master
git remote add origin %repo_url%
git push -u origin master

pause