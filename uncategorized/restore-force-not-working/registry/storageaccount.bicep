param name string

resource storage 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: name
  location: resourceGroup().location
  sku: {
    name: 'Standard_ZRS'
  }
  kind: 'StorageV2'
}
