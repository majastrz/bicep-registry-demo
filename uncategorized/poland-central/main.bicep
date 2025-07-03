
var location = 'Poland Central'

resource ts 'Microsoft.Resources/templateSpecs@2022-02-01' = {
  name: 'test'
  location: location

  resource v1 'versions' = {
    name: 'v1'
    location: location
    properties: {
      description: 'The very first template spec in Poland!'
      mainTemplate: loadJsonContent('empty.json')
    }
  }
}
