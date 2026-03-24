@export()
type KeyVaultAccessPolicyPermissions = {
  keys: string[]
  secrets: string[]
  certificates: string[]
  storage: string[]
}

@export()
func getKeyVaultFullAccessPermissions() KeyVaultAccessPolicyPermissions => {
  keys: [
    'get'
    'delete'
    'list'
    'create'
    'import'
    'update'
    'recover'
    'backup'
    'restore'
    'sign'
    'verify'
    'wrapKey'
    'unwrapKey'
    'encrypt'
    'decrypt'
    'purge'
  ]
  secrets: [
    'get'
    'delete'
    'list'
    'set'
    'recover'
    'backup'
    'restore'
    'purge'
  ]
  certificates: [
    'get'
    'delete'
    'list'
    'create'
    'import'
    'update'
    'deleteissuers'
    'getissuers'
    'listissuers'
    'managecontacts'
    'manageissuers'
    'setissuers'
    'recover'
    'purge'
  ]
  storage: [
    'delete'
    'deletesas'
    'get'
    'getsas'
    'list'
    'listsas'
    'regeneratekey'
    'set'
    'setsas'
    'update'
    'recover'
    'backup'
    'restore'
    'purge'
  ]
}
