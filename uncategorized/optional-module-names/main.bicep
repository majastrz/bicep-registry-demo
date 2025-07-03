
module mod 'mod.bicep' = {
  
  params: {
    
  }
}

module mods 'mod.bicep' = [for item in []: {
  
}]

module superLongName012345678901234567890123456789012345678901234567890123456789 'mod.bicep' = {
  
}

module superLongNames012345678901234567890123456789012345678901234567890123456789 'mod.bicep' = [for item in []: {
  
}]
