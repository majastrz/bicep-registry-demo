@description('Location to deploy resources to. Eg. westus2, eastus, central us')
param location string = resourceGroup().location

@description('Name of the ACR managed identity')
param acrManagedIdentityName string

@description('Create managed identity to be used by AKS to pull images from ACR')
resource acrMI 'Microsoft.ManagedIdentity/userAssignedIdentities@2022-01-31-preview' = {
  name: acrManagedIdentityName
  location: location
}
