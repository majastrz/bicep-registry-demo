resource hi 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'hi'
  location: resourceGroup().location
  sku: {
    name: 'Premium_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: reference(Microsoft_Resources_deployments_hi.id, '2022-09-01').outputs.accessTier.value
  }
}

module Microsoft_Resources_deployments_hi './nested_Microsoft_Resources_deployments_hi.bicep' = {
  name: 'hi'
  params: {}
}