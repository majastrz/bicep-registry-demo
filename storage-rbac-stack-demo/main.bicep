param storageName string
param containers array

var enabledContainers = filter(containers, c => c.enabled)

resource storage 'Microsoft.Storage/storageAccounts@2022-05-01' = {
  name: storageName
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'

  resource blobServices 'blobServices' existing = {
    name: 'default'

    resource containers 'containers' = [for container in enabledContainers: {
      name: container.name
    }]
  }
}

// Storage Blob Data Reader role
resource blobDataReaderRole 'Microsoft.Authorization/roleDefinitions@2022-04-01' existing = {
  name: '2a2b9908-6ea1-4ae2-8e65-a410df84e7d1'
  scope: tenant()
}

resource roleAssignments 'Microsoft.Authorization/roleAssignments@2022-04-01' = [for (container, i) in enabledContainers: {
  scope: storage::blobServices::containers[i]
  name: guid(blobDataReaderRole.name, container.reader)
  properties: {
    principalId: container.reader
    roleDefinitionId: blobDataReaderRole.id
    principalType: 'User'
  }
}]
