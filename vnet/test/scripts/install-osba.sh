if [ "$#" -ne 4 ]; then
    echo "Usage: ./create-aks.sh <AZURE_SUBSCRIPTION_ID> <AZURE_TENANT_ID> <AZURE_CLIENT_ID> <AZURE_CLIENT_SECRET>"
    exit 1
fi

AZURE_SUBSCRIPTION_ID=$1
AZURE_TENANT_ID=$2
AZURE_CLIENT_ID=$3
AZURE_CLIENT_SECRET=$4

# Deploy OSBA
helm repo add azure https://kubernetescharts.blob.core.windows.net/azure
helm install azure/open-service-broker-azure --name osba --namespace osba \
  --set azure.subscriptionId=$AZURE_SUBSCRIPTION_ID \
  --set azure.tenantId=$AZURE_TENANT_ID \
  --set azure.clientId=$AZURE_CLIENT_ID \
  --set azure.clientSecret=$AZURE_CLIENT_SECRET