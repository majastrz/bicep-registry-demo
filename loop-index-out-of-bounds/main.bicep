var numberOfAccounts = 2
var blobsPerAccount = 3
var saprefix = uniqueString(resourceGroup().id)

resource sa 'Microsoft.Storage/storageAccounts@2021-08-01' = [for i in range(0, numberOfAccounts): {
  name: '${saprefix}${i}'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}]

resource blobSvc 'Microsoft.Storage/storageAccounts/blobServices@2021-08-01' = [for j in range(0, numberOfAccounts): {
  parent: sa[j]
  name: 'default'
}]

resource containers 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-08-01' = [for k in range(0, (numberOfAccounts * blobsPerAccount)): {
  parent: blobSvc[k % numberOfAccounts]
  name: 'container${k % blobsPerAccount}'
}]

/*
k = 0..5
k | parent | name

0 | 0 | 0
1 | 1 | 1
2 | 0 | 2
3 | 1 | 0
4 | 0 | 1
5 | 1 | 2


*/
