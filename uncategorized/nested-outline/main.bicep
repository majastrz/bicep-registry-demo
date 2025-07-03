

resource vnet 'Microsoft.Network/virtualNetworks@2022-01-01' = {
  name: 'hello'

  resource sub 'subnets' = {
    name: 's'
  }
}
