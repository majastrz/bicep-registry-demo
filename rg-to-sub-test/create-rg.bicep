targetScope = 'subscription'

param rgname string

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgname
  location: deployment().location
}
