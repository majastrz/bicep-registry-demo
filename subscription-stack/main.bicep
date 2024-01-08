targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: 'majastrz-substack'
  location: deployment().location
}

module tsmod 'rg.bicep' = {
  scope: rg
  params: {
    tsName: 'majastrz-ts'
  }
}
