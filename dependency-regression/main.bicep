param storageAccountName string

@allowed([
  'Standard_GRS'
  'Standard_ZRS'
])
@description('Storage account SKU.  Standard_ZRS should be used if region supports, else Standard_GRS.')
param storageAccountSku string

resource storageAccountName_resource 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageAccountName
  #disable-next-line no-loc-expr-outside-params
  location: resourceGroup().location
  sku: {
    name: storageAccountSku
    #disable-next-line BCP073
    tier: 'Standard'
  }
  kind: 'StorageV2'
  properties: {
    allowBlobPublicAccess: true // Ibiza requires anonymous access to the container
    minimumTlsVersion: 'TLS1_2'
    supportsHttpsTrafficOnly: true
    encryption: {
      services: {
        file: {
          enabled: true
        }
        blob: {
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: 'Hot'
  }

  resource blobs 'blobServices' existing = {
    name: 'default'

    resource containers 'containers' = {
      name: 'extension'
      properties: {
        publicAccess: 'Container'
      }
    }
  }
}
