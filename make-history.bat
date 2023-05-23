@echo off
set LANG=ja_JP.UTF-8  
chcp 65001

type nul>update_record.txt

echo ^| 更新日時 ^| ハッシュ値 ^| コミットした人 ^| メッセージ ^| ファイル ^|>>update_record.txt
echo ^| :-- ^| :-- ^| :-- ^| :-- ^| :-- ^|>>update_record.txt

type nul>tmp.txt

setlocal enabledelayedexpansion
for /f "delims=" %%i in ('git ls-tree -r --name-only HEAD ^| sort') do (
  set filename=%%i
  for /f "delims=" %%j in ('git log -1 --date=iso --format^="%%ad | %%h | %%an | %%s" -- "!filename!"') do (
    echo ^| %%j ^| [!filename!]^(!filename!^) ^|>>tmp.txt
  )
)
endlocal

powershell -Command "Get-Content -Encoding UTF8 -Path './tmp.txt' | Sort-Object -Descending | Add-Content  -Encoding UTF8 './update_record.txt'"

del tmp.txt