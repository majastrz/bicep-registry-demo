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

resource storage 'Microsoft.Storage/storageAccounts@2017-10-01' = {
  name: tsName
  #disable-next-line no-hardcoded-location
  location: 'westus'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    #disable-next-line BCP036
    accessTier: 'Freezing'
  }
}
