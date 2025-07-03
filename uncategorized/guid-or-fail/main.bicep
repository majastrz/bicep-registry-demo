
param guidEnabled int

param theGuid string = (guidEnabled == 1) ? newGuid() : fail('Don\'t guid the guid.')

output theGuid string = theGuid
