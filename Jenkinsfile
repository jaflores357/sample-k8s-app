

pipeline {
    agent any
    environment {
        KUBECONFIG = 'jenkins-kubeconfig'
        ENDPOINT = " "
    }
    stages {
        stage("Checkout code") {
            steps {
                checkout scm
            }
        }
        stage("Build image") {
            steps{
                sh "echo 'Build image'"
            }    
        }
        stage("Push image") {
            steps{
                sh "echo 'Push image'"
            }    
        }       
        stage('Deploy to EKS dev cluster') {
            steps{
                script {
                    kubernetesDeploy(configs: "**/k8s/*", kubeconfigId: env.KUBECONFIG)
                }
            }
        }

        //stage('Deploy to EKS production cluster') {
        //   steps{
        //        input message:"Proceed with final deployment?"
        //        script {
        //            kubernetesDeploy(configs: "**/k8s/*", kubeconfigId: env.KUBECONFIG)
        //        }
        //
        //        
        //    }
        //}   

        stage('Test endpoint') {
            steps{
                sh "chmod +x ./check-endpoint.sh"
                sh "./check-endpoint.sh ${ENDPOINT}"
            }
        }
    }    
}