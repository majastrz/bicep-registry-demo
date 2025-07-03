
var x = 'something'


param blah string

resource storage 'Microsoft.Storage/storageAccounts@2024-01-01' = {
  name: '${blah}-${x}'
  location: resourceGroup().location
  sku: {
    name: 'Premium_ZRS'
  }
  kind: 'StorageV2'
}
