param SfAppCertificateSubjectNames array

module SfAppCertificates './certificate/certificate-generation.bicep' = [for cert in SfAppCertificateSubjectNames: {
  name: 'sfdsf'
  params: {
    
  }
}]

var nodeTypes = []

resource SFNodeTypes 'Microsoft.ServiceFabric/managedClusters/nodeTypes@2022-02-01-preview' = [for node in nodeTypes: if (node.instanceCount > 0) {
  name: node.name
  parent: SF
  properties: {
    //...
    vmSecrets: [for (subjectName, i) in SfAppCertificateSubjectNames: if (contains(SfAppCertificateSubjectNames[i].targetNodeTypes, node.name)) {
      sourceVault: {
        id: resourceId('Microsoft.KeyVault/vaults', SfAppCertificates[i].outputs.KeyVaultName)
      }
      vaultCertificates: [
        {
          certificateStore: 'My'
          certificateUrl: SfAppCertificates[i].outputs.PublicCertificateUrl
        }
      ]
    }]
  }
}]
