
var symbolicName = 'hello'

output uniqueString string = uniqueString(symbolicName, deployment().name)
output guid string = guid(symbolicName, deployment().name)
