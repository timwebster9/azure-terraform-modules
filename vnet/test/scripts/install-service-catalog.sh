# https://github.com/Azure/open-service-broker-azure/blob/master/docs/quickstart-aks.md



# tiller RBAC
kubectl create -f https://raw.githubusercontent.com/Azure/helm-charts/master/docs/prerequisities/helm-rbac-config.yaml

# Tiller
helm init --service-account tiller


# Deploy Service Catalog
helm repo add svc-cat https://svc-catalog-charts.storage.googleapis.com
helm install svc-cat/catalog --name catalog --namespace catalog \
   --set apiserver.storage.etcd.persistence.enabled=true

#### WAIT A FEW MINUTES UNTIL IT'S UP !!! ###


