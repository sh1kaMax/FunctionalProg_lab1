# lab1
команды для проекта:
brittany --write-mode=inplace файл
stack exec brittany -- --check-mode --verbose $(find . -name "*.hs") - Linux
stack exec brittany -- --check-mode --verbose (Get-ChildItem -Recurse -Filter *.hs | ForEach-Object { $_.FullName }) - windows
stack exec hlint -- . 