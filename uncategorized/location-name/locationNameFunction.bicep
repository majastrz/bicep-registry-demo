func toShortName(longLocation string) string => toLower(replace(longLocation, ' ', ''))

output weu string = toShortName('West Europe')
output wus2 string = toShortName('West US 2')
