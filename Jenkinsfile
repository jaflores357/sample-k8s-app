node {
    def kubeconfig = "834f02d9-7651-4189-8dfd-f044ea3972ae"
  
    stages {
        stage("Checkout code") {
            steps {
                checkout scm
            }
        }
        stage("Build image") {
        }
        stage("Push image") {
        }       
        stage('Deploy to EKS dev cluster') {
            steps{
                step([
                    $class: 'kubernetesDeploy', 
                    kubeconfigId: ${kubeconfig}, 
                    configs: '**/k8s/*'
                )
            }
        }
        //stage('Deploy to EKS production cluster') {
        //    steps{
        //        input message:"Proceed with final deployment?"
        //        
        //    }
        //}   
    }    
}