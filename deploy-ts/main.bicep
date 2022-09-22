
resource ts 'Microsoft.Resources/templateSpecs@2022-02-01' = {
  name: 'hello'
  location: resourceGroup().location
  properties: {
    displayName: 'Hello'
    description: 'My template spec'
  }
}

resource version 'Microsoft.Resources/templateSpecs/versions@2022-02-01' = {
  parent: ts
  name: 'v1'
  location: resourceGroup().location 
  properties: {
    description: 'The very first version'
    mainTemplate: {
      '$schema': 'https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#'
      contentVersion: '1.0.0.0'
      parameters: {}
      functions: []
      variables: {}
      resources: []
      outputs: {}
    }
  }
}
