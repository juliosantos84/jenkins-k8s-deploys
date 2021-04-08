pipeline {
    agent none
    stages {
        stage('Deploy') {
            agent {
                dockerfile {
                    filename 'Dockerfile.build'
                    // image 'bitnami/kubectl:latest'
                }
            }
            environment {
                KUBECONFIG = credentials('jenkins-kubeconfig')
            }
            steps {
                echo 'Using kubeconfig $KUBECONFIG to get kube-system'
                sh("kubectl get pods -n kube-system")
            }
        }
    }
}