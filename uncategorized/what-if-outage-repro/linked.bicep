
#disable-next-line no-deployments-resources
resource linked 'Microsoft.Resources/deployments@2024-11-01' = {
  name: 'linked'
  properties: {
    mode: 'Incremental'
    templateLink: {
#disable-next-line no-hardcoded-env-urls
      uri: 'https://majastrzwhatifoutage.z1.web.core.windows.net/empty.json'
    }
  }
}
