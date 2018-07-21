#!/bin/bash

az aks show --resource-group timw-aks-rg  --name timw-aks-cluster --query "servicePrincipalProfile.clientId"

# Then give the SP 'Network Contributor' role to the VNET (or subnet) where AKS is deployed.
