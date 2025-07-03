param one string = 'majastrzdep'
param two string = 'majastrzdep2'

resource first 'Microsoft.Storage/storageAccounts@2023-01-01' existing = {
  name: one
}

resource second 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: two
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'

  // This shouldn't be needed, but including it just in case it changes the repro
  properties: {
    accessTier: first.properties.accessTier
  }
}
