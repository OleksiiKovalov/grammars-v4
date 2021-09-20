$curtime=Get-Date -Format "yyyy-MM-dd-HH-mm-ss"
$fname = "{0}.trx" -F $curtime
$logger="trx;logfilename={0}" -F $fname
Start-Process -FilePath "dotnet" -Wait -ArgumentList "test","-l", "$logger", "--filter ParserTests", "--verbosity m" -NoNewWindow
#test   -l "trx;logfilename=xtest.trx"  --verbosity m

