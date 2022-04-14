pipeline {
    agent any
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
}
