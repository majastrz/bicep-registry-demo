targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2024-11-01' = {
  name: 'majastrz-script-msi'
  location: deployment().location
}

module msi 'msi.bicep' = {
  scope: rg
}

module ra 'ra.bicep' = {
  params: {
    principalId: msi.outputs.principalId
  }
}
