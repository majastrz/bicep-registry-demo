resource storage 'Microsoft.Storage/storageAccounts@2024-01-01' = {
  name: 'foo'
  location: resourceGroup().location
  sku: {
    name: 'Premium_LRS'
  }
  kind: 'BlobStorage'
}

var x = 'foo'

module mod 'mod.bicep' = {
  params: {
    blah: '${x}${storage.properties.accessTier}'
  }
}
