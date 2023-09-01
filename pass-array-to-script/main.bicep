var providers = [ 'Microsoft.SecurityInsights', 'GitHub.Network' ]

var formatted = replace(string(providers),'"', '\\"')

resource script 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
  name: 'myScript'
  location: 'centraluseuap'
  kind: 'AzurePowerShell'
  properties: {
    azPowerShellVersion: '9.7'
    retentionInterval: 'PT1H'
    scriptContent: loadTextContent('script.ps1')
    arguments: '-resourceProviders \'${formatted}\''
  }
}

output formatted string = formatted
