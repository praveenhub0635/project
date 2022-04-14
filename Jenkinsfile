pipeline {
    agent any
    environment{
	PATH="$PATH=/opt/Apache Maven 3.0.5/bin"
	}
    stages {
        stage('SCM') {
            steps {
                git url: 'https://github.com/praveenhub0635/project.git'
            }
        }
	stage('Build'){
		steps{
		    sh 'mvn clean package'
			}
		}
        stage('build && SonarQube analysis') {
            steps {
                withSonarQubeEnv('sonarqube-6.7') {
                        sh 'mvn clean package sonar:sonar'
            
                }
            }
        }
        stage("Quality Gate") {
            steps {
                timeout(time: 1, unit: 'HOURS') {
                    // Parameter indicates whether to set pipeline to UNSTABLE if Quality Gate fails
                    // true = set pipeline to UNSTABLE, false = don't
                    waitForQualityGate abortPipeline: true
                
            }
        }
    }
}
