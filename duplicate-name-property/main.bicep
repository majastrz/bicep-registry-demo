param cosmosDBDatabaseName string
param cosmosDBDatabaseThroughput int
param cosmosDBContainerName string
param cosmosDBContainerPartitionKey string

resource cosmosDBAccount 'Microsoft.DocumentDB/databaseAccounts@2021-11-15-preview' = {
  name: 'foo'
  properties: {
    databaseAccountOfferType: 'Standard'
    locations: [
      
    ]
  }
}

resource cosmosDBDatabase 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases@2020-04-01' = {
  parent: cosmosDBAccount
  name: cosmosDBDatabaseName  // "The property \"name\" is declared multiple times in this object. Remove or rename the duplicate properties.","
  properties: {               // The property "properties" is declared multiple times in this object. Remove or rename the duplicate properties.
    resource: {
      id: cosmosDBDatabaseName
    }
    options: {
      throughput: cosmosDBDatabaseThroughput
    }
  }

  resource container 'containers' = {
    name: cosmosDBContainerName    // "The property \"name\" is declared multiple times in this object. Remove or rename the duplicate properties.","
    properties: {                  // The property "properties" is declared multiple times in this object. Remove or rename the duplicate properties.
      resource: {
        id: cosmosDBContainerName
        partitionKey: {
          kind: 'Hash'
          paths: [
            cosmosDBContainerPartitionKey
          ]
        }
      }
      options: {}
    }
  }  
}

