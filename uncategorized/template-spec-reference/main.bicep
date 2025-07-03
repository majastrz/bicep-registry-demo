
module ts 'ts:996a2f3f-ee01-4ffd-9765-d2c3fc98f30a/majastrz-oci/łupać:łupanie-pierwsze' = {
  name: 'hello'
}

module oci 'br:majastrzoci.azurecr.io/publish/empty:v4' = {
  name: 'hello2'
  params: {
    foo: 'hi'
  }
}
