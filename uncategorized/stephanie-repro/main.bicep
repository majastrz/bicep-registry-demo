resource principalId 'Microsoft.ManagedIdentity/userAssignedIdentities@2018-11-30' existing = {
  name: 'stephmsi'
}

resource ts 'Microsoft.Resources/templateSpecs@2022-02-01' = {
  name: 'stephts'
  location: resourceGroup().location
}

resource roleassignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(ts.id, principalId.id, 'stuff') // This is where I would update the guid, I would add/remove another variable to the guid function
  scope: ts
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'ba92f5b4-2d11-453d-a403-e96b0029c9fe') // Storage Blob Data Contributor
    principalId: principalId.properties.principalId
    principalType: 'ServicePrincipal'
  }
}
