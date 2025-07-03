
module single 'mod.bicep' = {
  params: {
    templateSpecName: 'hello'
  }
}

module loop 'mod.bicep' = [for i in range(0,3): {
  params: {
    templateSpecName: 'hello-${i}'
  }
}]
