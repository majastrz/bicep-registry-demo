
resource foo 'Microsoft.Storage/storageAccounts@2025-08-01' = {
  name: uniqueString(resourceGroup().id, 'repro')
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    networkAcls: {
      defaultAction: 'Deny'
      ipRules: [for item in []: {
        value: item
        action: 'Allow'
      }]
    }
    ...{}
  }
}

