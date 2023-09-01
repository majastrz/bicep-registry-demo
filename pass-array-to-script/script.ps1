param(
  [string]$resourceProviders
)

$jsonArray = $resourceProviders | ConvertFrom-Json

foreach ($item in $jsonArray) {
  Write-Output $item
}