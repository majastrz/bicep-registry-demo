resource storage 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageName
  location: location
  sku: {
    name: 'Standard_ZRS'
  }
  kind: 'StorageV2'
  tags: {
    myTag: '${storageName} ${myVar}'
  }
  properties: {
    
  }
}

param storageName string

param location string

param number int

@secure()
param password string

var myVar = 42 + 5

output uri string = storage.properties.primaryEndpoints.blob
