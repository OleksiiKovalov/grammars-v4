param([string]$BaseFile="")

$files = Get-ChildItem "testResults" -Attributes !Directory | Sort-Object -Descending -Property Name 

if($BaseFile -eq "")
{
	$leftName = "testResults\\"+$files[1].Name;
}
else
{
	 $leftName = "testResults\\"+$BaseFile;
}

$rightName = "testResults\\"+$files[0].Name;
Write-Host ("Comparing {0} with {1}" -F $leftName, $rightName)

[xml]$configLeft = Get-Content  $leftName
[xml]$configRight = Get-Content $rightName

$common=@{};
$left=@{};
foreach($node in $configLeft.TestRun.Results.UnitTestResult)
{
$left[$node.testName] = $node.outcome;
$common[$node.testName] = "";
}

$right=@{};
foreach($node in $configRight.TestRun.Results.UnitTestResult)
{
$right[$node.testName] = $node.outcome;
$common[$node.testName] = "";
}

$found = 0;
foreach($anode in $common.GetEnumerator() | sort -Property name)
{
 if ($left[$anode.name] -ne $right[$anode.name]) {Write-Host ("{0} {1} {2}" -F $anode.name,$left[$anode.name],$right[$anode.name]); $found=1;}
}
if ($found -eq 0)
{
 Write-Host "No diffs found";
}