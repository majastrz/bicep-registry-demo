param storageAccountSuffix string

resource resource 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'prefix${storageAccountSuffix}'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRSww'
    
  }
  kind: 'StorageV2'
  
}

