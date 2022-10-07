targetScope = 'resourceGroup'

param rgname string
param tsname string

resource ts 'Microsoft.Resources/templateSpecs@2022-02-01' = {
  name: tsname
  location: resourceGroup().location
}

module rg 'create-rg.bicep' = {
  scope: subscription()
  name: 'deploy-rg'
  params: {
    rgname: rgname
  }
}
