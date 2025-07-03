module mod 'mod.bicep' = {
  name: 'hi'
}

resource storage 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'hi'
  location: resourceGroup().location
  sku: {
    name: 'Premium_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: mod.outputs.accessTier
  }
}
