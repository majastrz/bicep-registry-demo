resource storage 'Microsoft.Storage/storageAccounts@2021-08-01' = {
  name: 'majastrzdep'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

resource blobSvc 'Microsoft.Storage/storageAccounts/blobServices@2021-08-01' = {
  parent: storage
  name: 'default'
}

resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-08-01' = {
  parent: blobSvc
  name: 'container'
  properties: {
    publicAccess: 'None'
  }
}
