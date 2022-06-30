param SfAppCertificateSubjectNames array


module ResourceGroupDeployment './rg.bicep' = {
  name: 'foo'
  params: {
    SfAppCertificateSubjectNames: SfAppCertificateSubjectNames  
  }  
}
