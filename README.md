# lab1
команды для проекта:
hlint .
Get-ChildItem app,src,test -Recurse -Filter *.hs | ForEach-Object { ormolu --mode check $_.FullName }