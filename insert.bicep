
@description('Generated from /subscriptions/48ce6ed5-007a-4e11-99b1-3a59047b0b1e/resourceGroups/bicep-cdn-df-global/providers/Microsoft.Cdn/profiles/bicep-cdn-df')
resource bicepcdndf 'Microsoft.Cdn/profiles@2021-06-01' = {
  name: 'bicep-cdn-df'
  location: 'Global'
  tags: {
  }
  sku: {
    name: 'Standard_Microsoft'
  }
  properties: {
  }
}


@description('Generated from /subscriptions/48ce6ed5-007a-4e11-99b1-3a59047b0b1e/resourceGroups/bicep-cdn-df-global/providers/Microsoft.Cdn/profiles/bicep-cdn-df/endpoints/bicep-api-df')
resource bicepapidf 'Microsoft.Cdn/profiles/endpoints@2021-06-01' = {
  name: 'bicep-cdn-df/bicep-api-df'
  location: 'Global'
  tags: {
  }
  properties: {
    originHostHeader: 'api.github.com'
    originPath: '/repos/Azure/bicep/releases'
    contentTypesToCompress: []
    isCompressionEnabled: false
    isHttpAllowed: false
    isHttpsAllowed: true
    queryStringCachingBehavior: 'IgnoreQueryString'
    optimizationType: 'GeneralWebDelivery'
    origins: [
      {
        name: 'api-github-com'
        properties: {
          hostName: 'api.github.com'
          originHostHeader: 'api.github.com'
          priority: 1
          weight: 1000
          enabled: true
        }
      }
    ]
    originGroups: []
    geoFilters: []
    deliveryPolicy: {
      description: 'Path based Cache Override'
      rules: [
        {
          name: 'Pathmatchcondition'
          order: 1
          conditions: [
            {
              name: 'UrlPath'
              parameters: {
                typeName: 'DeliveryRuleUrlPathMatchConditionParameters'
                operator: 'BeginsWith'
                negateCondition: false
                matchValues: [
                  '/images/'
                ]
                transforms: []
              }
            }
          ]
          actions: [
            {
              name: 'CacheExpiration'
              parameters: {
                typeName: 'DeliveryRuleCacheExpirationActionParameters'
                cacheBehavior: 'Override'
                cacheType: 'All'
                cacheDuration: '00:00:30'
              }
            }
          ]
        }
      ]
    }
  }
}
