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
					  	artifactId:'maven-compiler-plugin',
					  	classifier:'',
					  	file: 'target/WebAppCal-1.3.5.war',
					  	type: 'war'
				  	]
				], 
	      				credentialsId: 'nexus2', 
	      				groupId: 'com.web.cal', 
	      				nexusUrl: 'http://3.87.23.126:8081/nexus', 
	     				nexusVersion: 'nexus2', 
	      				protocol: 'http', 
	      				repository: 'releases', 
	      				version: '2.14.18-01'
						
			}
		}
			
	}
	
}

