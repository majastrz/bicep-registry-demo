
/* 
  ----- IPv4 -----
*/

// parse IPv4 CIDR string
output v4info object = parseCidr('10.144.0.0/20')
/* 
Returns:
{
  network: '10.144.0.0'
  netmask: '255.255.240.0'
  broadcast: '10.144.15.255'
  firstUsable: '10.144.0.1'
  lastUsable: '10.144.15.254'
  cidr: 20
}
*/

// calculate the first five /24 subnet ranges from the specified /20
output v4subnets array = [for i in range(0, 5): cidrSubnet('10.144.0.0/20', 24, i)]
/*
Returns:
[
  '10.144.0.0/24'
  '10.144.1.0/24'
  '10.144.2.0/24'
  '10.144.3.0/24'
  '10.144.4.0/24'
]
*/

// calculate the first five usable host IP addresses from the specified /24
output v4hosts array = [for i in range(0, 5): cidrHost('10.144.3.0/24', i)]
/*
Returns:
[
  '10.144.3.1'
  '10.144.3.2'
  '10.144.3.3'
  '10.144.3.4'
  '10.144.3.5'
]
*/

/* 
  ----- IPv6 -----
*/

// parse IPv6 CIDR string
output v6info object = parseCidr('fdad:3236:5555::/48')
/*
Returns:
{
  network: 'fdad:3236:5555::'
  netmask: 'ffff:ffff:ffff::'
  firstUsable: 'fdad:3236:5555::'
  lastUsable: 'fdad:3236:5555:ffff:ffff:ffff:ffff:ffff'
  cidr: 48
}
*/

// calculate the first five /52 subnet ranges from the specified /48
output v6subnets array = [for i in range(0, 5): cidrSubnet('fdad:3236:5555::/48', 52, i)]
/*
Returns:
[
  'fdad:3236:5555::/52'
  'fdad:3236:5555:1000::/52'
  'fdad:3236:5555:2000::/52'
  'fdad:3236:5555:3000::/52'
  'fdad:3236:5555:4000::/52'
]
*/

// calculate the first five usable host IP addresses from the specified /52
output v6hosts array = [for i in range(0, 5): cidrHost('fdad:3236:5555:3000::/52', i)]
/*
Returns:
[
  'fdad:3236:5555:3000::1'
  'fdad:3236:5555:3000::2'
  'fdad:3236:5555:3000::3'
  'fdad:3236:5555:3000::4'
  'fdad:3236:5555:3000::5'
]
*/
