extension './test.tgz' as ev2

resource test 'Microsoft.KeyVault.DataPlane/GenerateSshKeyPair@2020-03-01' = {
  name: 
  additionalHeaders: {}
  connectionProperties: {
    authentication: {
      properties: {
        applicationId: 
      }
      reference: {
        parameters: {
          secretId: 
        }
        provider: 'AzureKeyVault'
      }
      type: 'AadApplicationAuthentication'
    }
    maxExecutionTime: 
  }
  payloadProperties: {
    keyLength: {
      value: 
    }
    privateKeySecretName: {
      value: 
    }
    publicKeySecretName: {
      value: 
    }
    vaultBaseUrl: {
      value: 
    }
  }
  rolloutId: 
  stepName: 
}
