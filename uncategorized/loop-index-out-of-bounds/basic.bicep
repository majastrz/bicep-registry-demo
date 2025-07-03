
resource vnet 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: 'vnet'
}

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2021-05-01' = {
  parent: vnet
  name: 'subnet'
}

resource thing 'Microsoft.Network/virtualNetworks/subnets/things@2021-05-01' = {
  parent: subnet
  name: 'thing'
}
