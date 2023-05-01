

resource ts 'Microsoft.Resources/templateSpecs@2022-02-01' existing = {
  name: 'myts'
}

resource version 'Microsoft.Resources/templateSpecs/versions@2022-02-01' = {
  parent: ts
  name: 'v1'
  location: resourceGroup().location
  properties: {
  }
}

