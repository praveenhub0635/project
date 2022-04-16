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
                sleep(60)
		timeout(time: 1, unit: 'MINUTES') {
    		   def qg = waitForQualityGate()
    		   print "Finished waiting"
    			if (qg.status != 'OK') {
        		error "Pipeline aborted due to quality gate failure: ${qg.status}"
             		}
		   }
		}
           }
        }
      }
      
