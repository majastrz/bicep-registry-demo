param one string = 'majastrzdep'

resource first 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: one
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
