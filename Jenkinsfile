pipeline {
    agent {
        docker {
            image 'bitnami/kubectl:latest'
            args  '-v /tmp:/tmp'
        }
    }
    stages {
        stage('Deploy') {
            environment {
                KUBECONFIG = credentials('jenkins-kubeconfig')
            }
            steps {
                echo 'Using kubeconfig $KUBECONFIG to get kube-system pods'
                sh("kubectl get pods -n kube-system")
            }
        }
    }
}