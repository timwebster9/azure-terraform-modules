#!/bin/bash

RG_NAME=timw-aks-rg
LOCATION=uksouth
ZONE_NAME=deggymacets.com
ZONE_TYPE=Private
RESOLUTION_VNETS=test-vnet

az network dns zone create --name $ZONE_NAME \
                           --resource-group $RG_NAME \
                           --zone-type $ZONE_TYPE \
                           --resolution-vnets $RESOLUTION_VNETS