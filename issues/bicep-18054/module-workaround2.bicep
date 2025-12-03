var developmentTenantId = '94430a9c-83e9-4f08-bbb0-64fccd0661fc'
var productionTenantId = '72f988bf-86f1-41af-91ab-2d7cd011db47'
var tenantId = tenant().tenantId

var configMap = {
  key1: {
    '${developmentTenantId}': 'dev value 1'
    '${productionTenantId}': 'prod value 1'
  }
  key2: {
    '${developmentTenantId}': 'dev value 2'
    '${productionTenantId}': 'prod value 2'
  }
}

@export()
func getConfig(key string) string => '${configMap[key][tenantId]}'
