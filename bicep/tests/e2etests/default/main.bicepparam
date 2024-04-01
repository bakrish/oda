using '../../../bootstrap/single_instance/main.bicep'

param resourceGroupName = 'odarg'

param location = 'centralindia  '

param virtualNetworks = [
  {
    virtualNetworkName: 'odavnet'
    addressPrefixes: [
      '10.0.0.0/16'
    ]
    subnets: [
      {
        subnetName: 'client'
        addressPrefix: '10.0.0.0/24'
      }
      {
        subnetName: 'database'
        addressPrefix: '10.0.1.0/24'
        delegatedToOracleService: true
      }
    ]
  }
]

param routeTables = [
  {
    routeTableName: 'odavrt'
    routes: [
      {
        routeName: 'odavrt'
        addressPrefix: '0.0.0.0/0'
        nextHopType: 'VirtualAppliance'
        nextHopIpAddress: '10.1.0.25'
      }
    ]
  }
]
