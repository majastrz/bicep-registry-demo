targetScope = 'subscription'

param resourceGroupName string
param location string

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}

module item 'mod.bicep' = [for i in range(0, 5): {
  scope: rg
}]

output hello string = item[0].name
