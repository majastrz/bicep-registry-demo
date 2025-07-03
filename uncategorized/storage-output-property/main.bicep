
resource storage 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'foo'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

output storageResId string = storage.id

output someOtherStorageProperty string = storage.properties.accessTier
