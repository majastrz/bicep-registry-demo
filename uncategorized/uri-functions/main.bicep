/*
Returns
{
  scheme: 'https'
  host: 'example.com'
  port: 1234
  path: '/foo/bar'
}
*/
output parsedUri object = parseUri('https://example.com:1234/foo/bar')

/*
Returns:
'https://example.com:1234/foo/bar'
*/
output builtUri string = buildUri({
  scheme: 'https'
  host: 'example.com'
  port: 1234
  path: 'foo/bar'
})
