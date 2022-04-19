pipeline {
        agent any
        stages {
        	stage("build & SonarQube analysis") {
            	steps {
              		withSonarQubeEnv('Sonarqube') {
                	sh 'mvn clean package sonar:sonar'
              						}
            				}			
          		}
        	stage("Quality Gate") {
 	    		steps{
       	    		waitForQualityGate abortPipeline: true
    					}
				} 
	  		stage("Nexus Repository"){
	    		steps{
	      			nexusArtifactUploader artifacts: [
						[
					  	artifactId:'WebAppCal',
					  	classifier:'',
					  	file: 'target/WebAppCal-1.3.5.war',
					  	type: 'war'
				  	]
				], 
	      				credentialsId: 'nexus3', 
	      				groupId: 'com.web.cal', 
	      				nexusUrl: '54.166.85.41:8081', 
	     				nexusVersion: 'nexus3', 
	      				protocol: 'http', 
	      				repository: 'http://54.166.85.41:8081/nexus/content/repositories/releases', 
	      				version: '2.14.18-01'
						
			}
		}	
	}
	
}

