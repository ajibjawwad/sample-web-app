
pipeline {
    agent any
    environment{
      def mvnHome = tool name: 'maven3', type: 'maven'
      def mvnCMD = "${mvnHome}/bin/mvn"
    }

    stages {
        stage('Git Clone'){
            steps{
              git 'https://github.com/ajibjawwad/sample-web-app.git'
            }
        }

        stage('Build Package'){
            steps{
              def mvn_version =
              sh  "${mvnCMD} clean package"
            }
        }

        stage('Docker build'){
            step{
              sh 'docker build -t jebro/webapps:1.0'
            }
        }
    }
}
