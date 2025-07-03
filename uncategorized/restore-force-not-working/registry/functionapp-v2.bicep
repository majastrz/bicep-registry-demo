param funcName string

resource site 'Microsoft.Web/sites@2023-01-01' = {
  name: 'site'
  location: resourceGroup().location
}

resource func 'Microsoft.Web/sites/functions@2023-01-01' = {
  parent: site
  name: funcName
}
