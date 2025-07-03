param tsName string = 'one'

resource ts 'Microsoft.Resources/templateSpecs@2022-02-01' = {
  name: tsName
  location: resourceGroup().location

  resource v1 'versions' = {
    name: 'v1'
    location: resourceGroup().location
    properties: {
      description: 'The first version'
      mainTemplate: loadJsonContent('ts.json')
    }
  }
}

resource storage 'Microsoft.Storage/storageAccounts@2022-05-01' = {
  name: 'majastrzstacktest3'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

resource vnet 'Microsoft.Network/virtualNetworks@2022-05-01' = {
  name: 'vnet'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
  }
}
