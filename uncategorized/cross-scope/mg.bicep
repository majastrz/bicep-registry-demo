targetScope = 'managementGroup'

param subId string
param otherSubId string

module submod 'sub.bicep' = {
  scope: subscription(subId)
  name: 'submod'
  params: {
    otherSubId: otherSubId
  }
}

module mgmod 'mg2.bicep' = {
  name: 's'
  scope: managementGroup('otherrg')
}
