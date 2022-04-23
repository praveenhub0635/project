pipeline{
    agent any
    stages{
        stage("pull Docker image"){
            step{
                echo "create docker image of hello world"
                sh 'docker pull hello-world'
            }
        }
    }
}