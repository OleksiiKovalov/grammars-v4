powershell.exe -ExecutionPolicy RemoteSigned -File  !Runtests.ps1
echo Starting Compare
rem powershell.exe -ExecutionPolicy RemoteSigned -File  !CompareTestResults.ps1 %1 %2 %3 %4 %5