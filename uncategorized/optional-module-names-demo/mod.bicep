param templateSpecName string

resource ts 'Microsoft.Resources/templateSpecs@2022-02-01' = {
  name: templateSpecName
  location: resourceGroup().location
}
