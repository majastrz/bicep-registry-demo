
targetScope = 'managementGroup'


resource mg 'Microsoft.Management/managementGroups@2023-04-01' = {
  scope: tenant()
  name: 'foo'
}

module policyMod 'mod.bicep' = {
  scope: managementGroup(mg.name)
}
