
module storage 'br/test:bicepmodules/storageaccount:default' = {
  name: 'hello'
  params: {
    name: 'hello'
  }
}

module kv 'br/test:bicepmodules/keyvault-add:default' = {
  name: 'kv'
  params: {
    name: 'kv'
  }
}

module plan 'br/test:bicepmodules/auto-serviceplan:default' = {
  name: 'plan'
  params: {
    something: 'plan'
  }
}

module function 'function.bicep' = {
  name: 'func'
}
