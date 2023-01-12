targetScope = 'subscription'

module foo 'module.bicep' = {
  scope: resourceGroup('test')
  name: 'hello'
}
