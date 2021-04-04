#! /bin/bash

# This script configures the jenkins serviceaccount in the default KUBECONFIG.
# The script must be run with an account that is authorized to create service accounts
SOURCE_KUBECONFIG=~/.kube/k3s.yaml

CONTEXT=default
CLUSTER=default

# Configure the jenkins service account
kubectl apply -f kubernetes/ --wait=true

# Get the name of the service account's token
JENKINS_TOKEN=$(kubectl get serviceaccount jenkins -o custom-columns=Token:.secrets[].name --no-headers)

# Get and decode the service account's token
DECODED_TOKEN=$(kubectl get secret $JENKINS_TOKEN -o custom-columns=Token:.data.token --no-headers | base64 --decode)

cp $SOURCE_KUBECONFIG /tmp/kube-jenkins-generated.yaml

# Set the jenkins credential
kubectl config set-credentials jenkins --token=$DECODED_TOKEN --kubeconfig /tmp/kube-jenkins-generated.yaml

# Set the context to use the jenkins serviceaccount
kubectl config set-context $CONTEXT --cluster $CLUSTER --user jenkins --kubeconfig /tmp/kube-jenkins-generated.yaml