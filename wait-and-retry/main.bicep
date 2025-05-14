

@waitUntil(r=>r.foo, '')
resource dns 'Microsoft.Network/dnsZones@2018-05-01' = {
  name: ''
  location: ''
}
