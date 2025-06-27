resource msi 'Microsoft.ManagedIdentity/userAssignedIdentities@2024-11-30' = {
  name: 'majastrz-script-reader'
  location: resourceGroup().location
}

output principalId string = msi.properties.principalId
