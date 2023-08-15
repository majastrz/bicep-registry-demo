param location string
param storagePrefixes array

param myBool bool = 42

var storageNames = map(storagePrefixes, arg => '${arg}${uniqueString(arg)}')
assert hi = length(storageNames) == length(storagePrefixes)

resource storage 'Microsoft.Storage/storageAccounts@2022-09-01' = [for storageName in storageNames: {
  name: storageName
}]

assert blah = length(storageNames) >= 2
assert foo = contains(location, 'europe')

var tierIsCool = storage[0].properties.accessTier == 'Cool'



// "assert" <expression>
// "assert" <symbolic name> <some token> <expression>
assert a = 42

