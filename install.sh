#!/usr/bin/env bash

set -x
#install git
apt-get update && apt-get install -y git

#install docker
curl -fsSL https://get.docker.com -o get-docker.sh
chmod +x get-docker.sh
./get-docker.sh
sleep 20
service docker start

#install helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
#######################################################################################################
#install terraform
sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform

#install terragrunt
wget https://github.com/gruntwork-io/terragrunt/releases/download/v0.38.5/terragrunt_linux_amd64
mv terragrunt_linux_amd64 /usr/local/bin/

#########################################################################################################

#install eks anywhere
#Install the latest release of eksctl
curl "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" \
    --silent --location \
    | tar xz -C /tmp
 mv /tmp/eksctl /usr/local/bin/

#Install the eksctl-anywhere plugin
export EKSA_RELEASE="0.10.1" OS="$(uname -s | tr A-Z a-z)" RELEASE_NUMBER=15
curl "https://anywhere-assets.eks.amazonaws.com/releases/eks-a/${RELEASE_NUMBER}/artifacts/eks-a/v${EKSA_RELEASE}/${OS}/amd64/eksctl-anywhere-v${EKSA_RELEASE}-${OS}-amd64.tar.gz" \
    --silent --location \
    | tar xz ./eksctl-anywhere
mv ./eksctl-anywhere /usr/local/bin/

##################################################################################################################
#create eks anywhere cluster
CLUSTER_NAME=aiq-demo
eksctl anywhere generate clusterconfig $CLUSTER_NAME \
   --provider docker > $CLUSTER_NAME.yaml

eksctl anywhere create cluster -f $CLUSTER_NAME.yaml

export KUBECONFIG=${PWD}/${CLUSTER_NAME}/${CLUSTER_NAME}-eks-a-cluster.kubeconfig
