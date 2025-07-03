param kubeConfig string

provider kubernetes with {
  kubeConfig: kubeConfig
  namespace: 'demo'
}

resource namespace 'core/Namespace@v1' = {
  metadata: {
    name: 'myNamespace'
  }
}

resource storage 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'myStorage'
  location: resourceGroup().location
  sku: {
    name: 'Premium_LRS'
  }
  kind: 'StorageV2'
  dependsOn: [
    namespace
  ]
}
