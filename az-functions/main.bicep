
var subscriptionId = subscription().subscriptionId
var location = 'westus2'

/*
Returns the physical AZ corresponding to the specified logical AZ in the specified subscription and location.

For westus2 location, this will be one of 'westus2-az1', 'westus2-az2', 'westus2-az3' depending on the subscription.
*/
output singlePhysicalZone string = toPhysicalZone(subscriptionId, location, '1')

/*
Returns an array of physical AZs corresponding to the specified logical AZs in the specified subscription and location.
*/
output physicalZones string[] = toPhysicalZones(subscriptionId, location, ['1', '2'])

/*
Returns the logical AZ corresponding to the specified physical AZ in the specified subscription and location.

Returns '1', '2', or '3' depending on the subscription.
*/
output singleLogicalZone string = toLogicalZone(subscriptionId, location, 'westus2-az2')

/*
Returns an array of logical AZs corresponding to the specified physical AZs in the specified subscription and location.
*/
output logicalZones string[] = toLogicalZones(subscriptionId, location, [
  'westus2-az1'
  'westus2-az2'
])
