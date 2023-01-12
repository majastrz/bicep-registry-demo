targetScope = 'subscription'

param ResourceGroupName string

resource bp 'Microsoft.Blueprint/blueprints@2018-11-01-preview' = {
  name: 'majastrz-bp'
  properties: {
    targetScope: 'subscription'
    description: 'My blueprint'
    resourceGroups: {
      ResourceGroup: {
        name: ResourceGroupName
        location: 'westus'
        metadata: {
          displayName: 'Blueprint RG'
        }
      }
    }
  }
}

resource artifact 'Microsoft.Blueprint/blueprints/artifacts@2018-11-01-preview' = {
  name: 'identity'
  parent: bp
  kind: 'template'
  properties: {
    parameters: {
      identityName: {
        value: '[parameters(\'identityName\')]'
      }
    }
    template: loadJsonContent('identity.json')
    resourceGroup: ResourceGroupName
  }
}
