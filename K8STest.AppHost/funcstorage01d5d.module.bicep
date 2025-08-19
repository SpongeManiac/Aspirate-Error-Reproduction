@description('The location for the resource(s) to be deployed.')
param location string = resourceGroup().location

resource funcstorage01d5d 'Microsoft.Storage/storageAccounts@2024-01-01' = {
  name: take('funcstorage01d5d${uniqueString(resourceGroup().id)}', 24)
  kind: 'StorageV2'
  location: location
  sku: {
    name: 'Standard_GRS'
  }
  properties: {
    accessTier: 'Hot'
    allowSharedKeyAccess: false
    minimumTlsVersion: 'TLS1_2'
    networkAcls: {
      defaultAction: 'Allow'
    }
  }
  tags: {
    'aspire-resource-name': 'funcstorage01d5d'
  }
}

output blobEndpoint string = funcstorage01d5d.properties.primaryEndpoints.blob

output queueEndpoint string = funcstorage01d5d.properties.primaryEndpoints.queue

output tableEndpoint string = funcstorage01d5d.properties.primaryEndpoints.table

output name string = funcstorage01d5d.name