param tsname string

resource ts 'Microsoft.Resources/templateSpecs@2022-02-01' = {
  name: tsname
  location: resourceGroup().location
}
