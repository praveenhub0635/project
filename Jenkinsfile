 pipeline {
        agent any {
			node {
 	 		stage('SCM') {
    			git 'https://github.com/foo/bar.git'
					}
				}
        	stages {
	          	stage("build & SonarQube analysis") {
            	agent any
            		steps {

              		withSonarQubeEnv('sonarqube') {
			echo 'testing sonarqube analysis'
                	sh "mvn sonar:sonar"
              			}
            		}
          	}
         	stage("Quality Gate") {
            	steps {
              		timeout(time: 1, unit: 'HOURS') {
                	waitForQualityGate abortPipeline: true
              				}
           		 	}
          		}
        	}
      }
