pipeline {
    agent none
    // agent {
    //     docker {
    //         image 'bitnami/kubectl:latest'
    //         args  '-v /tmp:/tmp'
    //     }
    // }
    stages {
        stage('Deploy') {
            agent {
                docker {
                    image 'bitnami/kubectl:latest'
                    args '--entrypoint='
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