targetScope = 'managementGroup'

resource policy 'Microsoft.Authorization/policyDefinitions@2025-03-01' = {
  name: 'foo'
}
