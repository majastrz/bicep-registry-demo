targetScope = 'resourceGroup'

resource sg 'Microsoft.Consumption/budgets@2024-08-01' existing = {
  scope: tenant()
  name: 'foo'
}

resource ra 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: 'foo'
  properties: {
    principalId: ''
    roleDefinitionId: ''
  }
  scope: sg
}
