param(
    [Parameter(Mandatory = $true)]
    [int] $SuccessPercentage
)

$ErrorActionPreference = 'Stop';

Write-Output "Starting flaky script with success percentage: $successPercentage";

$random = Get-SecureRandom -Maximum 100;
Write-Output "Generated random number: $random";

if ($random -le $successPercentage) {
    Write-Output "Success!";
} else {
    Write-Error "Failure!";
}