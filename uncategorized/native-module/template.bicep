param storageName string

resource storage 'Microsoft.Storage/storageAccounts@2022-05-01' = {
  name: storageName
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
