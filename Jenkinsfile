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
		echo 'Deploying..'
		}
	}
	stage('SonarQube analysis') {
    		def scannerHome = tool 'SonarScanner 4.0';
   		withSonarQubeEnv('My SonarQube Server') { // If you have configured more than one global server connection, you can specify its name
      		sh "${scannerHome}/bin/sonar-scanner"
   			

	}
    }
}
