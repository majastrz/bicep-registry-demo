targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2020-06-01' = {
  name: 'adotfrank-rg'
  location: deployment().location
}

// private 'br:majastrzoci.azurecr.io/demo/plan:v2'
// public 'br:majastrzpublic.azurecr.io/demo/plan:v2'
module appPlanDeploy 'br:majastrzpublic.azurecr.io/demo/plan:v2' = {
  name: 'planDeploy'
  scope: rg
  params: {
    namePrefix: 'hello'
  }
}

var websites = [
  {
    name: 'fancy'
    tag: 'latest'
  }
  {
    name: 'plain'
    tag: 'plain-text'
  }
]

// private 'br:majastrzoci.azurecr.io/demo/site:v2' 
// public 'br:majastrzpublic.azurecr.io/demo/site:v2' 
module siteDeploy 'br:majastrzpublic.azurecr.io/demo/site:v2' = [for site in websites: {
  name: '${site.name}siteDeploy'
  scope: rg
  params: {
    appPlanId: appPlanDeploy.outputs.planId
    namePrefix: site.name
    dockerImage: 'nginxdemos/hello'
    dockerImageTag: site.tag
  }
}]

// module empty 'ts:996a2f3f-ee01-4ffd-9765-d2c3fc98f30a/majastrz-oci/empty-template:v1' = {
//   scope: rg
//   name: 'empty'
// }

// module empty2 'br:majastrzoci.azurecr.io/publish/empty@sha256:4aea1793a7ae4883972fb25443524817c51a457a7303b4f9966aca540199aece' = {
//   scope: rg
//   name: 'empty2'
// }

output siteUrls array = [for (site, i) in websites: siteDeploy[i].outputs.siteUrl]
