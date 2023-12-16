param count int

module veryLongSymbolicNameThatExceedsTheMaximumPrefixLengthLimitSoICanTestMyAlgorithm 'mod.bicep' = [for i in range(0, count): {
  params: {
    templateSpecName: 'ts-${i}'
  }
}]
