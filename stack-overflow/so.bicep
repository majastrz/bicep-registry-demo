
var sfAppCertificates = [
  {
    subjectName: 'mydomain.com'
    targetNodeTypes: [
      'web'
    ]
  }
]

var deployments = []

module SubscriptionDeployment './sub.bicep' = [for dp in deployments: {
  name: 'foo'
  params: {
    SfAppCertificateSubjectNames: sfAppCertificates
  }  
}]
