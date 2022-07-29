@description('Region to deploy to')
param Location string = resourceGroup().location

var Names = [
  'fruit-primary'
  'fruit-secondary'
]

var Service_Bus_Queues = [
  'apples'
  'oranges'
]

resource serviceBuses 'Microsoft.ServiceBus/namespaces@2021-11-01' = [for name in Names: {
  name: name
  location: Location
  sku: {
    name: 'Premium'
    tier: 'Premium'
  }
  properties: {
    zoneRedundant: false
  }
}]

resource queues 'Microsoft.ServiceBus/namespaces/queues@2021-11-01' = [for item in Service_Bus_Queues: {
  parent: serviceBuses[0]
  name: item
}]

resource queueAuthorizationRules 'Microsoft.ServiceBus/namespaces/queues/authorizationRules@2021-11-01' = [for (item, index) in Service_Bus_Queues: {
  parent: queues[index]
  name: 'Listen'
  properties: {
    rights: [
      'Listen'
    ]
  }
}]
