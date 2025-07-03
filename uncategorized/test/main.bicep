resource bp 'Microsoft.Blueprint/blueprintAssignments@2018-11-01-preview' = {
  name: 't'
  location: resourceGroup().location
  identity: {
    type: 'None'
  }
  properties: {
    parameters: {
      'foo': {
        reference: {
          keyVault: {
            id: 's'
          }
          secretName: 's'
        }
      }
    }
    resourceGroups: {
      'bar': {
        name: 's'
        location: 's'
      }
    }
  }
}

resource bp2 'Microsoft.Blueprint/blueprintAssignments@2018-11-01-preview' = {
  name: 't2'
  location: resourceGroup().location
  identity: {
    type: 'None'
  }
  properties: {
    // BUG: the type of RG does not match the property type - independent of "additionalProperties"
    locks: bp.properties.resourceGroups.bar
    parameters: {
      's': {
        // BUG: type of RG does not match KV reference
        reference: bp.properties.resourceGroups.bar
      }
    }
    resourceGroups: {
    }
  }
}
