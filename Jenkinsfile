pipeline {
        agent any
        stages {
        	stage("build & SonarQube analysis") {
            	steps {
              		withSonarQubeEnv('Sonarqube') {
                	sh 'mvn sonar:sonar'
              						}
            				}			
          		}
			stage("Build Artifact"){
				steps{
					sh 'mvn clean package'
				}
			}
			stage('publish Artifact to Nexus'){
				steps{
					sh 'mvn deploy'
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
	      				nexusUrl: 'http://18.207.221.95:8081', 
	     				nexusVersion: 'nexus3', 
	      				protocol: 'http', 
	      				repository: 'http://18.207.221.95:8081/nexus/content/repositories/releases', 
	      				version: '2.14.18-01'
						
			}
		}
			
	}
	
}

