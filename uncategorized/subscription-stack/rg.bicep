param tsName string

resource ts 'Microsoft.Resources/templateSpecs@2022-02-01' = {
  name: tsName
  location: resourceGroup().location
}
