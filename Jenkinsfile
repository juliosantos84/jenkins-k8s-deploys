pipeline {
    agent none
    stages {
        stage('Deploy') {
            // agent {
            //     docker {
            //         image 'bitnami/kubectl:latest'
            //         args '-it --entrypoint=/bin/bash'
            //     }
            // }
            environment {
                KUBECONFIG = credentials('jenkins-kubeconfig')
            }
            steps {
                // echo 'Using kubeconfig $KUBECONFIG to get kube-system'
                // sh("kubectl get pods -n kube-system")
                script {
                    img = docker.build("bitnami/kubectl:latest")
                    
                    img.inside('--entrypoint= -it') {
                        sh 'kubectl get pods -n kube-system'
                    }
                }
            }
        }
    }
}