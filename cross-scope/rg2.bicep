resource ts 'Microsoft.Resources/templateSpecs@2022-02-01' = {
  name: 'a'
  location: resourceGroup().location 
}
