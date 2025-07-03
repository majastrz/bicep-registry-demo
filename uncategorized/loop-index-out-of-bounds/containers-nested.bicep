resource storage 'Microsoft.Storage/storageAccounts@2021-08-01' = {
  name: 'majastrzdep2'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'

  resource blobSvc 'blobServices' = {
    name: 'default'

    resource container 'containers' = {
      name: 'container2'
      properties: {
        publicAccess: 'None'
      }
    }
  }
}




