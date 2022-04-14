 pipeline {
        agent any {
			node {
 	 		stage('SCM') {
    			git 'https://github.com/foo/bar.git'
					}
				}
		
		steps{
                      script{
                      withSonarQubeEnv('sonarqube') { 
                      sh "mvn sonar:sonar"
                       }
                      timeout(time: 1, unit: 'HOURS') {
                      def qg = waitForQualityGate()
                      if (qg.status != 'OK') {
                           error "Pipeline aborted due to quality gate failure: ${qg.status}"
                      }
                    }
		    sh "mvn clean install"
                  }
                }  
              }

