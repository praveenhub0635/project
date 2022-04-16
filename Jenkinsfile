pipeline {
        agent any
        stages {
          stage("build & SonarQube analysis") {
            steps {
              withSonarQubeEnv('sonarqube') {
                sh 'mvn clean package sonar:sonar'
              }
            }
          }
        stage("Quality Gate") {
	  sleep(10)
	  waitForQualityGate abortPipeline: true
	
	    }
  }
} 
