#!/bin/bash

if [ "$#" -ne 4 ]; then
    echo "Usage: ./create-aks.sh <SP APP ID> <SP SECRET> <SP CLIENT ID> <SP TENANT ID>"
    exit 1
fi

RG_NAME=timw-aks-rg
LOCATION=uksouth
AKS_CLUSTER_NAME=timw-aks-cluster
NODE_COUNT=3
NODE_VM_SIZE=Standard_D2s_v3
KUBERNETES_VERSION=1.10.5
SUBNET_NAME=aks-subnet
VNET_NAME=test-vnet
VNET_SUBNET_ID="$(az network vnet subnet show --name $SUBNET_NAME --resource-group $RG_NAME --vnet-name $VNET_NAME --output json | jq -r .id)"
SP_APP_ID=$1
SP_SECRET=$2
SP_CLIENT_ID=$3
SP_TENANT_ID=$4

# create AKS cluster
az aks create --resource-group $RG_NAME \
              --name $AKS_CLUSTER_NAME \
              --node-count $NODE_COUNT \
              --node-vm-size $NODE_VM_SIZE \
              --kubernetes-version $KUBERNETES_VERSION \
              --location $LOCATION \
              --network-plugin azure \
              --vnet-subnet-id $VNET_SUBNET_ID \
              --generate-ssh-keys \
              --aad-server-app-id $SP_APP_ID \
              --aad-server-app-secret $SP_SECRET \
              --aad-client-app-id $SP_CLIENT_ID \
              --aad-tenant-id $SP_TENANT_ID \
              --debug