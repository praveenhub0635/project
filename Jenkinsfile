pipeline {
    agent any

    stages {
        stage('Build'& SonarQube analysis) {
            steps {
                echo 'Building..'
		Sonar exec :- mvn sonar:sonar \
		-Dsonar.host.url=http://44.202.166.182:9000 
  		-Dsonar.login=babcf236ab38e89cdf8b8f3a56dd1c8bdac5de6a
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
