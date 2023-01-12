targetScope = 'resourceGroup'

param identityName string

resource identity 'Microsoft.ManagedIdentity/userAssignedIdentities@2022-01-31-preview' = {
  name: identityName
  location: resourceGroup().location
}
