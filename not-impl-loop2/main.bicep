var entries = []
var vars = []

module myModules 'module.bicep' = [for entry in entries: {
  name: entry.name
}]
var _tmp = [for idx in range(0, length(vars)): myModules[idx].outputs.foo]
output myModuleOutputs object = reduce(
  _tmp,
  {},
  (acc, output) => union(
    acc,
    {
      '${foo.name}': foo
    }
  )
)
