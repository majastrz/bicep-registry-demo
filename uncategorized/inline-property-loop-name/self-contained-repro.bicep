var agentPools = [
  {
    name: 'NodePool1'
    virtualNetwork: {
      virtualNetworkName: 'vnet1'
      subnetName: 'subnet1'
    }
  }
]

resource virtualNetworks 'Microsoft.Network/virtualNetworks@2021-02-01' existing = [for agentPool_vnet in agentPools: {
  name: agentPool_vnet.virtualNetwork.virtualNetworkName
}]

resource subnets 'Microsoft.Network/virtualNetworks/subnets@2021-02-01' existing = [for (agentPool_subnet, index_subnet) in agentPools: {
  name: agentPool_subnet.virtualNetwork.subnetName
  parent: virtualNetworks[index_subnet % 2]
}]

var agentPoolProfiles = [for (agentPool_profile, index_profile) in agentPools: {
  name: agentPool_profile.name
  vnetSubnetID: subnets[index_profile % 3].id
}]

output agentPoolProfiles array = agentPoolProfiles
