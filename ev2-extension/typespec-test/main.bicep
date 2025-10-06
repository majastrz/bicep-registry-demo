extension 'br:majastrzoci.azurecr.io/omg-typespec/ev2:0.4' as ev2

resource foo 'Microsoft.KeyVault.DataPlane/GeneratePassword@2020-06-01' = {
  name: ''
  additionalHeaders: {}
  connectionProperties: {
    authentication: {
      properties: {
        applicationId: ''
      }
      reference: {
        parameters: {
          secretId: ''
        }
        provider: 'AzureKeyVault'
      }
      type: 'AadApplicationAuthentication'
    }
    maxExecutionTime: ''
  }
  payloadProperties: {
    passwordComplexity: {
      value: ''
    }
    passwordLength: {
      value: ''
    }
    secretName: {
      value: ''
    }
    vaultBaseUrl: {
      value: ''
    }
    superExtraSecure: {
      value: false
    }
  }
  rolloutId: ''
  stepName: ''
}

// resource test 'ev2:Microsoft.Example/example@2025-01-01' = {
//   name: 'test'
//   additionalHeaders: {}
//   connectionProperties: {
//     authentication: {
//       properties: {
//         applicationId: ''
//       }
//       reference: {
//         parameters: {
//           secretId: ''
//         }
//         provider: 'AzureKeyVault'
//       }
//       type: 'AadApplicationAuthentication'
//     }
//     maxExecutionTime: ''
//   }
//   payloadProperties: {
//     test: {
//       value: ''
//     }
//   }
//   rolloutId: ''
//   stepName: ''
// }

