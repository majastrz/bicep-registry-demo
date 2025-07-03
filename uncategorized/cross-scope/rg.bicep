targetScope = 'resourceGroup'

resource ts 'Microsoft.Resources/templateSpecs@2022-02-01' = {
  name: 'a'
  location: resourceGroup().location 
}

module cross 'rg2.bicep' = {
  scope: resourceGroup('another-rg')
  name: 'foo'
}
