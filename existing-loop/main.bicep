var agentPools = [
  {
    name: 'NodePool1'
    virtualNetwork: {
      virtualNetworkName: 'vnet1'
      subnetName: 'subnet1'
    }
  }
]

resource virtualNetworks 'Microsoft.Network/virtualNetworks@2021-02-01' existing = [for agentPool in agentPools: {
  name: agentPool.virtualNetwork.virtualNetworkName
}]

resource subnets 'Microsoft.Network/virtualNetworks/subnets@2021-02-01' existing = [for (agentPool, index) in agentPools: {
  name: agentPool.virtualNetwork.subnetName
  parent: virtualNetworks[index]
}]

var agentPoolProfiles = [for (agentPool, index) in agentPools: {
  name: agentPool.name
  vnetSubnetID: subnets[index].id
}]

output agentPoolProfiles array = agentPoolProfiles
