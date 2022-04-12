pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'mvn package'
		java -jar target/*.jar 10 20
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
    }
}
