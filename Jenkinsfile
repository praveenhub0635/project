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
 	    steps {
       	      waitForQualityGate abortPipeline: true
    			}
		} 
	  stage("Nexus Repository"){
	    steps{
	      nexusArtifactUploader credentialsId: '', groupId: '', nexusUrl: '54.164.25.52:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'http://54.164.25.52:8081/nexus/content/repositories/releases', version: '2.14.18-01'
		sh 'mvn deploy' 	
	}
}


