@allowed([ 'NotSpecified', 'Enabled', 'Disabled' ])
param templateDeployment string

resource kv 'Microsoft.KeyVault/vaults@2022-07-01' = {
  name: 'my-kv'
  location: resourceGroup().location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: tenant().tenantId

    enabledForTemplateDeployment: templateDeployment == 'NotSpecified' ? null : (templateDeployment == 'Enabled' ? true : false)
  }
}
