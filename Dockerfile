pipeline{
    agentany
    stages{
        stage("Sonarqube using Dockerfile"){
            step{
                echo "create docker image of hello world"
                sh 'docker pull hello-world'
            }
        }
    }
}