pipeline {
    agent any
    stages {
        stage('SCM') {
            steps {
                git url: 'https://github.com/praveenhub0635/project'
            }
        }
        stage('build && SonarQube analysis') {
            steps {
                withSonarQubeEnv('sonarqube') {
			 script {
                    def sonarScanner = tool name: 'SonarQube Scanner', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
                    sh "${sonarScanner}/bin/sonar-scanner " +
                    "-Dsonar.projectKey=ProjectName-${GIT_BRANCHi} " +
                    "-Dsonar.projectName=ProjectName-${GIT_BRANCH} " +
                    "-Dsonar.projectVersion=0.0.0 " +
                    "-Dsonar.sources=**/src " +
                    "-Dsonar.java.binaries=**/build " +
                    "-Dsonar.exclusions=excluded_dirs/** " +
                    "-Dsonar.sourceEncoding=UTF-8"
                    // Optionally use a Maven environment you've configured already
                    withMaven(maven:'Maven 3.1') {
                        sh 'mvn clean package sonar:sonar'
                    }
                }
            }
        }
        stage("Quality Gate") {
            steps {
                timeout(time: 1, unit: 'HOURS') {
                    // Parameter indicates whether to set pipeline to UNSTABLE if Quality Gate fails
                    // true = set pipeline to UNSTABLE, false = don't
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }
}
