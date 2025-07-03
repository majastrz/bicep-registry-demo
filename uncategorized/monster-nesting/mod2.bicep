param name string

resource ts 'Microsoft.Resources/templateSpecs@2022-02-01' = {
  name: name
  location: resourceGroup().location
}
