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
					sh 'mvn clean deploy'
				}
			} 
	  		stage("Deploying war on Tomcat"){
	    		steps{
	      			script{
						  deploy adapters:[tomcat7(credentialsId:'centos',path:'',url:'http://54.196.182.98:8080/')],contextPath:'/pipelineCI',onFailure:false,war:'**/*.war'
					  }
						
			}
		}
			
	}
	
}

