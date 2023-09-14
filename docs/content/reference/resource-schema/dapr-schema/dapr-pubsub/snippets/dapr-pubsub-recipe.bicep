import radius as radius

@description('The ID of your Radius environment. Automatically injected by the rad CLI.')
param environment string

resource app 'Applications.Core/applications@2022-03-15-privatepreview' = {
  name: 'dapr-pubsub'
  properties: {
    environment: environment
  }
}

//SAMPLE
resource pubsub 'Applications.Dapr/pubSubBrokers@2022-03-15-privatepreview' = {
  name: 'pubsub'
  properties: {
    environment: environment
    application: app.id
    recipe: {
      // Name a specific recipe to use
      name: 'azure-servicebus'
      // Set optional/required parameters (specific to the Recipe)
      parameters: {
        size: 'large'
      }
    }
  }
}
//SAMPLE