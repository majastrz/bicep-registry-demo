
var aksCluster = {
  agentPools: []
  network: {
    plugin: 'azure'
  }
}

var defaultAgentPoolObject = {}

// Get existing vnets
resource virtualNetworks 'Microsoft.Network/virtualNetworks@2021-02-01' existing = [for agentPool in aksCluster.agentPools: {
  name: union(defaultAgentPoolObject, agentPool).virtualNetwork.virtualNetworkName
  scope: resourceGroup(union(defaultAgentPoolObject, agentPool).virtualNetwork.subscriptionId, union(defaultAgentPoolObject, agentPool).virtualNetwork.resourceGroup)
}]

// Get existing subnets
resource subnets 'Microsoft.Network/virtualNetworks/subnets@2021-02-01' existing = [for (agentPool, i) in aksCluster.agentPools: {
  name: union(defaultAgentPoolObject, agentPool).virtualNetwork.subnetName
  parent: virtualNetworks[i]
}]

#disable-next-line no-unused-vars
var agentPoolProfiles = [for (agentPool, i) in aksCluster.agentPools: {
  name: agentPool.name
  vnetSubnetID: aksCluster.network.plugin =~ 'azure' ? subnets[i].id : null
}]
