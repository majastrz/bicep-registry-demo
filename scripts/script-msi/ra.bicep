targetScope = 'subscription'

param principalId string

resource readerRole 'Microsoft.Authorization/roleDefinitions@2022-04-01' existing = {
  scope: tenant()
  name: 'acdd72a7-3385-48ef-bd42-f606fba81ae7'
}

resource reader 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(subscription().subscriptionId, principalId, readerRole.id)
  properties: {
    principalId: principalId
    roleDefinitionId: readerRole.id
    principalType: 'ServicePrincipal'
  }
}
