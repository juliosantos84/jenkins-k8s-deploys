# Jenkins

A jenkins project for my non-cloud kubernetes deployments.

# Prerequisites
- A k8s cluster to manage
- A jenkins installation with Docker plugins and access to the admin console

# Configuring
1. Configure your KUBECONFIG to point to the cluster you want to manage.
1. Configure and run kubernetes/add-jenkins-credentials.sh
1. Create the `jenkins-kubeconfig` secret file in jenkins using the `/tmp/kube-jenkins-generated.yaml` file generated in the previous step.
