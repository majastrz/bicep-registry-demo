
resource ts 'Microsoft.Resources/templateSpecs@2022-02-01' = {
  name: resourceGroup().name
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
