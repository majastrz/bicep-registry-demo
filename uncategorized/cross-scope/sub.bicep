targetScope = 'subscription'

param otherSubId string

module tsmod 'rg.bicep' = {
  scope: resourceGroup(otherSubId, 'myrg')
  name: 'tsmod'
}
