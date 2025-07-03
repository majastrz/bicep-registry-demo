extension 'br:mcr.microsoft.com/bicep/extensions/microsoftgraph/v1.0:0.2.0-preview'

resource app 'Microsoft.Graph/applications@v1.0' = {
  displayName: 'Extensibility Host test'
  uniqueName: 'ExtensibilityHostTest'
}
