var arrayWithNullThings = [
  {
    id: 'subnet0'
  }
  {
    id: 'subnet1'
  }
  {
    id: null
  }
  {
    id: null
  }
  {
    id: 'subnet2'
  }
  {
    id: 'subnet3'
  }
  {
    id: null
  }
  {
    id: null
  }
  {
    id: 'subnet4'
  }
  {
    id: 'subnet5'
  }
  {
    id: null
  }
  {
    id: null
  }
]

output arrayWithoutNullThings array = filter(arrayWithNullThings, x => x.id != null)
