targetScope = 'subscription'
module hello './nested_hello.bicep' = {
  name: 'hello'
  scope: resourceGroup('test')
  params: {}
}