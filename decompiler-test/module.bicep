
resource dns 'Microsoft.Network/dnsZones@2018-05-01' = {
  name: 'lol'
  location: resourceGroup().location
}
