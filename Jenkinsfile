pipeline {
    agent none
    stages {
        stage('Deploy') {
            agent {
                docker {
                    image 'bitnami/kubectl:latest'
                    args '-t --entrypoint='
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