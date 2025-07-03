targetScope = 'subscription'

param rg1name string
param rg2name string

resource rg1 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rg1name
  location: deployment().location
}

resource rg2 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rg2name
  location: deployment().location
}

module ts1 'rg.bicep' = {
  scope: rg1
  name: 'module-${rg1name}'
  params: {
    tsname: 'one'
  }
}

module ts2 'rg.bicep' = {
  scope: rg2
  name: 'module-${rg2name}'
  params: {
    tsname: 'two'
  }
}

