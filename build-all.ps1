#powershell version 7

Get-ChildItem -Path ./ -File -Recurse -Filter "*.ahk" | ForEach-Object {
  $inputFile = $_.FullName;
  $outputFile = (Join-Path -Path $_.Directory.FullName -ChildPath $_.Basename) + ".exe";
  "Compile $inputFile -> $outputFile";
  . "C:/Program Files/AutoHotkey/Compiler/Ahk2Exe.exe" /in "$inputFile" /out "$outputFile"
}