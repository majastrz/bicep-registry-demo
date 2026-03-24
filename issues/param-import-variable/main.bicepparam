using 'main.bicep'

import { getKeyVaultFullAccessPermissions } from 'import.bicep'

var principals = externalInput('t', 'c')

param foo = [
  ...map(principals, objectId => {
    objectId: objectId
    permissions: getKeyVaultFullAccessPermissions()
  })
]
