#!/bin/bash

RG_NAME=timw-aks-rg
LOCATION=uksouth
AKS_CLUSTER_NAME=timw-aks-cluster
NODE_COUNT=3
NODE_VM_SIZE=Standard_D2s_v3
KUBERNETES_VERSION=1.10.5
SUBNET_NAME=aks-subnet
VNET_NAME=test-vnet
VNET_SUBNET_ID="$(az network vnet subnet show --name $SUBNET_NAME --resource-group $RG_NAME --vnet-name $VNET_NAME --output json | jq -r .id)"

# create AKS cluster
az aks create --resource-group $RG_NAME \
              --name $AKS_CLUSTER_NAME \
              --node-count $NODE_COUNT \
              --node-vm-size $NODE_VM_SIZE \
              --kubernetes-version $KUBERNETES_VERSION \
              --location $LOCATION \
              --network-plugin azure \
              --vnet-subnet-id $VNET_SUBNET_ID \
              --ssh-key-value ~/.ssh/id_rsa.pub