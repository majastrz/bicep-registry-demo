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

0 | storage0 | container0
1 | storage1 | container1
2 | storage0 | container2
3 | storage1 | container0
4 | storage0 | container1
5 | storage1 | container2


*/
