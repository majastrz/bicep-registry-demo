param SfAppCertificateSubjectNames array

module ServiceFabric './serviceFabric.bicep' = {
  name: 'foo'
  params: {
    SfAppCertificateSubjectNames: SfAppCertificateSubjectNames
  }
}
