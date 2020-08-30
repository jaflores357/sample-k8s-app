https://github.com/terraform-aws-modules/terraform-aws-vpc


aws iam create-open-id-connect-provider

aws eks describe-cluster --name dev-syntonic--query "cluster.identity.oidc.issuer" --output text --region us-east-2



 aws eks --region us-east-2 update-kubeconfig --name dev-syntonic
 aws eks --region us-east-2 get-token --name dev-syntonic



 kubectl apply -f https://raw.githubusercontent.com/kubernetes/examples/master/guestbook-go/redis-master-controller.json

kubectl apply -f https://raw.githubusercontent.com/kubernetes/examples/master/guestbook-go/redis-master-service.json

kubectl apply -f https://raw.githubusercontent.com/kubernetes/examples/master/guestbook-go/redis-slave-controller.json

kubectl apply -f https://raw.githubusercontent.com/kubernetes/examples/master/guestbook-go/redis-slave-service.json

kubectl apply -f https://raw.githubusercontent.com/kubernetes/examples/master/guestbook-go/guestbook-controller.json

kubectl apply -f https://raw.githubusercontent.com/kubernetes/examples/master/guestbook-go/guestbook-service.json 


apiVersion: v1
clusters:
- cluster:
    server: https://SOME-LONG-ID.yl4.us-west-2.eks.amazonaws.com
    certificate-authority-data: <ca cert goes here>
  name: eks-cluster
contexts:
- context:
    cluster: eks-cluster
    user: eks-user
  name: marcin
current-context: eks
kind: Config
preferences: {}
users:
- name: eks-user
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
      command: heptio-authenticator-aws
      args:
        - "token"
        - "-i"
        - "eks-cluster-name"



helm install cicd stable/jenkins --set rbac.create=true,master.servicePort=80,master.serviceType=LoadBalancer



NAME: cicd
LAST DEPLOYED: Sat Aug 29 22:08:32 2020
NAMESPACE: default
STATUS: deployed
REVISION: 1
NOTES:
1. Get your 'admin' user password by running:
  printf $(kubectl get secret --namespace default cicd-jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode);echo
2. Get the Jenkins URL to visit by running these commands in the same shell:
  export NODE_PORT=$(kubectl get --namespace default -o jsonpath="{.spec.ports[0].nodePort}" services cicd-jenkins)
  export NODE_IP=$(kubectl get nodes --namespace default -o jsonpath="{.items[0].status.addresses[0].address}")
  echo http://$NODE_IP:$NODE_PORT/login

3. Login with the password from step 1 and the username: admin

4. Use Jenkins Configuration as Code by specifying configScripts in your values.yaml file, see documentation: http:///configuration-as-code and examples: https://github.com/jenkinsci/configuration-as-code-plugin/tree/master/demos

For more information on running Jenkins on Kubernetes, visit:
https://cloud.google.com/solutions/jenkins-on-container-engine
For more information about Jenkins Configuration as Code, visit:
https://jenkins.io/projects/jcasc/



apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: "jenkins"
  namespace: "default"
  annotations:
    kubernetes.io/ingress.class: alb
    alb.ingress.kubernetes.io/scheme: internet-facing
  labels:
    app: jenkins-ingress
spec:
  rules:
    - http:
        paths:
          - path: /*
            backend:
              serviceName: "cicd-jenkins"
              servicePort: 80



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