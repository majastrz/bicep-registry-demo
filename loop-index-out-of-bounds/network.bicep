// TODO: Make this work with loop item vars also
resource vnet 'Microsoft.Network/virtualNetworks@2021-05-01' = [for (ii, i) in range(0, 2): {
  name: string(i)
}]

resource subnet 'Microsoft.Network/virtualNetworks/subnets@2021-05-01' = [for (jj, j) in range(0, 6): {
  parent: vnet[j % 2]
  name: string(j)
}]

resource thing 'Microsoft.Network/virtualNetworks/subnets/things@2021-05-01' = [for (kk, k) in range(0, 24): {
  parent: subnet[k % 6]
  name: string(k)
}]
