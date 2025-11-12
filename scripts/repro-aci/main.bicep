resource msi 'Microsoft.ManagedIdentity/userAssignedIdentities@2024-11-30' existing = {
  scope: resourceGroup('majastrz-script-msi')
  name: 'majastrz-script-reader'
}

resource aci 'Microsoft.ContainerInstance/containerGroups@2023-05-01' = {
  name: 'majastrz-repro'
  location: resourceGroup().location
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${msi.id}': {}
    }
  }
  properties: {
    sku: 'Standard'
    containers: [
      {
        name: 'az-scripts-fjmz3e64brupiazscripts'
        properties: {
          image: 'mcr.microsoft.com/azure-cli:2.74.0'
          command: [
            'bash'
            '-c'
            'sleep 1h'
          ]
          ports: []
          environmentVariables: [
            {
              name: 'AZ_SCRIPTS_PATH_INPUT_DIRECTORY'
              value: '/mnt/azscripts/azscriptinput'
            }
            {
              name: 'AZ_SCRIPTS_PATH_OUTPUT_DIRECTORY'
              value: '/mnt/azscripts/azscriptoutput'
            }
            {
              name: 'AZ_SCRIPTS_PATH_USER_SCRIPT_FILE_NAME'
              value: 'userscript.sh'
            }
            {
              name: 'AZ_SCRIPTS_PATH_PRIMARY_SCRIPT_URI_FILE_NAME'
              value: 'primaryscripturi.config'
            }
            {
              name: 'AZ_SCRIPTS_PATH_SUPPORTING_SCRIPT_URI_FILE_NAME'
              value: 'supportingscripturi.config'
            }
            {
              name: 'AZ_SCRIPTS_PATH_SCRIPT_OUTPUT_FILE_NAME'
              value: 'scriptoutputs.json'
            }
            {
              name: 'AZ_SCRIPTS_PATH_CLOUD_SUFFIX'
              value: 'sovcloud-api.de'
            }
            {
              name: 'AZ_SCRIPTS_PATH_CLOUD_DNS_SUFFIX'
              value: 'core.sovcloud-api.de'
            }
            {
              name: 'AZ_SCRIPTS_PATH_EXECUTION_RESULTS_FILE_NAME'
              value: 'executionresult.json'
            }
            {
              name: 'AZ_SCRIPTS_ARM_CLOUD_METADATA_URL'
              value: 'https://management.sovcloud-api.de/metadata/endpoints?api-version=2020-06-01'
            }
            {
              name: 'AZ_SCRIPTS_AZURE_ENVIRONMENT'
              value: 'AzureGermanyCloud'
            }
            {
              name: 'AZ_SCRIPTS_CLEANUP_PREFERENCE'
              value: 'Always'
            }
          ]
          resources: {
            requests: {
              memoryInGB: json('1')
              cpu: json('1')
            }
          }
          // volumeMounts: [
          //   {
          //     name: 'azscripts'
          //     mountPath: '/mnt/azscripts/'
          //   }
          // ]
        }
      }
    ]
    initContainers: []
    restartPolicy: 'Never'
    osType: 'Linux'
    // volumes: [
    //   {
    //     name: 'azscripts'
    //     azureFile: {
    //       shareName: 'yufur4gr2kefeazscripts'
    //       storageAccountName: 'czmxnc672ljj2azscripts'
    //     }
    //   }
    // ]
  }
}
