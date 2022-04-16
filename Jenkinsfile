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
          timeout(time: 1, unit: 'HOURS') { // Just in case something goes wrong, pipeline will be killed after a timeout
    	    def qg = waitForQualityGate() // Reuse taskId previously collected by withSonarQubeEnv
    	    if (qg.status != 'OK') {
      	  	error "Pipeline aborted due to quality gate failure: ${qg.status}"
    }
  }
} 
