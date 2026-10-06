using '../../../main.bicep'

// The customerAcronym length should be minimum of 3 characters
param customerAcronym = 'test'

// The environment length should be minimum of 4 characters
param environment = 'production'

param location = 'westus2'

// ------- Management Resource Group Configuration - Start ----------------
param deployMgmtResources = false

param natGatewayPublicIpName = 'natpublicip-${customerAcronym}-${environment}'

param natGatewayName = 'nat-${customerAcronym}-${environment}'

param vNetCIDRMgmt = '10.0.23.0/24'

param snetCIDRVNETGatewayMgmt = '10.0.23.0/27'

param snetCIDRDNSPrivateResolverMgmt = '10.0.23.32/27'

param snetCIDRAppGW = '10.0.23.64/27'

param vNetGatewaysVPNClientAddressPoolMgmt = '172.16.23.0/24'

param deployAppGW = false

param appGWSKU = {
  name: 'WAF_v2'
  tier: 'WAF_v2'
}

param deployDNSPrivateResolverMgmt = true

param deployVPNMgmt = true

param vNetGatewaysSkuMgmt = 'VpnGw1'

param vNetGatewaysVPNTypeMgmt = 'RouteBased'

param keyVaultNameMgmt = 'kv-${customerAcronym}-management'

param rsvRedundancyMgmt = 'GeoRedundant'

param dailyCapInGB = '0.5'

// ------- Management Resource Group Configuration - End ----------------

param vnetCIDR = '10.1.39.0/24'

param snetCIDRSQL = '10.1.39.0/27'

param snetCIDRSSRS = '10.1.39.32/27'

param snetCIDRAVD = '10.1.39.64/27'

param snetCIDRPvtEndpoint = '10.1.39.96/27'

param snetCIDRAppSrvAptify = '10.1.39.128/27'

param snetCIDRAppSrvEBiz = '10.1.39.160/27'

param snetCIDRRedisCache = '10.1.39.192/29'

param primaryRegion = 'westus2'

param secondaryRegion = 'westcentralus'


param deployAptifyAppSrv = true

param deployEBizAppSrv = true
param deployWebJobsVM = true

param deployAVD = true

param deploySSRS = true

param deploySQLMI = true

param aspSKUAptify = 'P0v3'

param aspSKUEBiz = 'P0v3'

param asTimeZone = 'Pacific Standard Time'

param redisCacheName = 'cache-${customerAcronym}-${environment}'

param redisCacheSKU = {
  name: 'Standard'
  family: 'C'
  capacity: 2
}

// Storage account names must be between 3 and 24 characters in length and may contain numbers and lowercase letters only
param storageAccountName = '${customerAcronym}prodmqg2lvbey'

param storageAccountType = 'Standard_LRS'

param storageAccountAccessTier = 'Cool'

param principalType = 'Group'

// Unique for each customer
param principalIdAptifyCustomer = '5ce42e67-f792-4d83-99fd-4b2a9ac532b5'

param domainServicesName = 'cbcloudprod.com'

param domainServicesSubscriptionId = 'f719bf19-2686-4eba-8075-57329a42ea29'

param domainServicesKeyVaultName = 'aptify-deployment'

param domainServicesITOpsRG = 'IT-Ops'

param localAdminName = 'cloudadmin'

param licenseType = 'Windows_Server'

param avdVMSize = 'Standard_B1ms'
param webJobsVMSize = 'Standard_B4ms'

param ssrsVMSize = 'Standard_B1ms'

param sqlMISku = {
  name: 'GP_Gen5'
  capacity: 4
  family: 'Gen5'
  tier: 'GeneralPurpose'
}

param sqlMIRedundancy = 'Zone'

param sqlMIZoneRedundant = true

// Do not use th following characters:  & > < ' "
param sqlMIAdministratorLoginPassword = az.getSecret('${domainServicesSubscriptionId}', '${domainServicesITOpsRG}', '${domainServicesKeyVaultName}', 'sql-${customerAcronym}')

param sqlMIVCores = 4

param sqlMIStorageSizeInGB = 160

param sqlMISQLCollation = 'SQL_Latin1_General_CP1_CI_AS'

param sqlMITimeZone = 'Pacific Standard Time'
