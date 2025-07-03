targetScope = 'subscription'

var location = deployment().location

resource rg 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: 'majastrz-substack-${location}'
  location: location
}

module tsmod 'rg.bicep' = {
  scope: rg
  params: {
    tsName: 'majastrz-ts-${location}'
  }
}
