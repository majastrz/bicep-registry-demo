Write-Output "RG script start";

$rgs = Get-AzResourceGroup;

$output = @();
foreach ($rg in $rgs) 
{
  $id = [string]$rg.ResourceId;
  Write-Output $id;
  $output = $output + $id;
}

$DeploymentScriptOutputs = @{};
$DeploymentScriptOutputs["rgs"] = $output;

Write-Output "RG script completed";