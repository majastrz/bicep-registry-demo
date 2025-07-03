targetScope = 'subscription'

var accounts = [
  {
    name: 'majastrzcri'
    rg: 'majastrz-cri'
  }
  {
    name: 'majastrzcri2'
    rg: 'majastrz-cri2'
  }
]

resource storage 'Microsoft.Storage/storageAccounts@2021-08-01' existing = [for account in accounts: {
  name: account.name
  scope: resourceGroup(account.rg)
}]

#disable-next-line outputs-should-not-contain-secrets
output keys array = [for (account, i) in accounts: storage[i].listKeys().keys[0].value]
output tiers array = [for (account, i) in accounts: storage[i].properties.accessTier]
