pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'mvn package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                echo 'wget'
		echo 'Deploying....'
	    }
	}
	stage('Output') {
		steps {
		echo 'the output is'
		java -jar target/*.jar 10 20		    
            }
        }
    }
}
