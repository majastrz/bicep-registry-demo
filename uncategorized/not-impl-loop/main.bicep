var seq = range(0, 2)
module modules 'module.bicep' = [for i in seq: {
  name: 'module${i}'
}]

var items = [for (item, index) in seq: {
  key: string(item)
  value: modules[index].outputs.out
}]

output obj object = toObject(items, item => item.key, item => item.value)
