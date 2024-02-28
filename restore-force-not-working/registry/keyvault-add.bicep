param name string

resource kv 'Microsoft.KeyVault/vaults@2023-07-01' = {
  name: name
  location: resourceGroup().location
  properties: {
    sku: {
      family: 'A'
      name: 'premium'
    }
    tenantId: tenant().tenantId
  }
}
